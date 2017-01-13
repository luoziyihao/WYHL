package com.qilin.controller;

import com.qilin.framework.component.lock.ConcurrencyLock;
import com.qilin.framework.component.lock.RedisLock;
import com.qilin.framework.controller.BaseController;
import com.qilin.framework.dao.BaseRedisDao;
import com.qilin.framework.page.Page;
import com.qilin.service.GetTradeDataService;
import org.apache.commons.lang.time.DateFormatUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.data.redis.core.RedisOperations;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.core.SessionCallback;
import org.springframework.data.redis.core.ValueOperations;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.concurrent.*;

/**
 * Created by luoziyihao on 6/17/16.
 */
@Controller
@RequestMapping("/testlock")
public class RedisComponentTest extends BaseController {

    private Log log = LogFactory.getLog("RedisLock");
    @Autowired
    GetTradeDataService getTradeDataService;
    @Autowired
    RedisTemplate redisTemplate;
    @Autowired
    BaseRedisDao<String, String, String, String> baseRedisDao;
    @Autowired
    ConcurrencyLock lock;
    @RequestMapping("/testExecuteLock.do")
    public @ResponseBody Page testExecuteLock() throws Exception {
        long res = getTradeDataService.executeLock("/testExecuteLock.do", 30);
        return  httpComponent.successPage("success", res);
    }

    @RequestMapping("/testttl.do")
    public  @ResponseBody Page testttl() throws Exception {
        return httpComponent.successPage("success", baseRedisDao.ttl("i l it"));
    }

    @RequestMapping("/testExecuteUnLock.do")
    public @ResponseBody Page testExecuteUnLock() throws Exception {
        getTradeDataService.executeUnLock("/testExecuteLock.do");
        return  httpComponent.successPage("success", null);
    }

    @RequestMapping("/cas.do")
    public @ResponseBody Page cas() throws Exception {
        final String  key = "test-cas-1";
        final String  key2 = "test-cas-2";
        ValueOperations<String, String> strOps = redisTemplate.opsForValue();
        strOps.set(key, "hello");
        strOps.set(key2, "hello2");
        ExecutorService pool  = Executors.newCachedThreadPool();
        List<Callable<Object>> tasks = new ArrayList<Callable<Object>>();
        for(int i=0;i<10000;i++){
            final int idx = i;
            tasks.add(new Callable() {
                @Override
                public Object call() throws Exception {
                    return redisTemplate.execute(new SessionCallback() {
                        @Override
                        public Object execute(RedisOperations operations) {
                            operations.watch(key);
                            operations.watch(key2);
                            String origin = (String) operations.opsForValue().get(key);
                            operations.multi();
                            operations.opsForValue().set(key, origin + "_" + idx);
                            log.info("set:"+origin + "_" + idx);
                            operations.expire(key, idx, TimeUnit.SECONDS);
                            log.info("expire:"+origin + "_" + idx + ": " + idx + " s");
                            Object rs = operations.exec();
                            log.info("work:"+origin + "_" + idx+" rs:"+rs);

                            // key2
    //                            String origin2 = (String) operations.opsForValue().get(key2);
    //                            operations.multi();
    //                            operations.opsForValue().set(key2, origin2 + "_" + idx);
    //                            log.info("set:"+origin2 + "_" + idx);
    //                            operations.expire(key2, idx, TimeUnit.SECONDS);
    //                            log.info("expire:"+origin2 + "_" + idx + ": " + idx + " s");
    //                            Object rs2 = operations.exec();
    //                            log.info("work:"+origin2 + "_" + idx+" rs:"+rs2);
                            return rs;
                        }
                    });
                }
            });
        }
        List<Future<Object>> futures = pool.invokeAll(tasks);
        List <Object> list = new ArrayList<Object>();
        for(Future<Object> f:futures){
            log.info(f.get());
            list.add(f.get());
        }
        pool.shutdown();
        pool.awaitTermination(1000, TimeUnit.MILLISECONDS);
        return httpComponent.successPage("success", list);
    }

    @RequestMapping("/tstmultexecute.do")
    public @ResponseBody Page multi() throws  Exception {
        Object object = redisTemplate.execute(new SessionCallback() {
            @Override
            public Object execute(RedisOperations operations) throws DataAccessException {
                String key = "tstmulti";
                String key2 = "tstmulti2";
                operations.watch(key);
                operations.multi();
                Boolean bool = operations.opsForValue().setIfAbsent(key, "v1");
                if (bool) {
                    operations.opsForValue().set(key2, "v2");
                }
                operations.opsForValue().set("tstmulti3", "v3");
                return operations.exec();
            }
        });
        return httpComponent.successPage(object);
    }

    @RequestMapping("/tstsetIfAbsent.do")
    public @ResponseBody Page setIfAbsent() throws  Exception {
        Object object = redisTemplate.execute(new SessionCallback() {
            @Override
            public Object execute(RedisOperations operations) throws DataAccessException {
                String key = "tstmulti";
                String key2 = "tstmulti2";
                operations.watch(key);
                operations.multi();
                operations.opsForValue().setIfAbsent(key, "v1");
                operations.opsForValue().setIfAbsent(key, "v1");
                operations.opsForValue().setIfAbsent(key2, "v2");
                operations.opsForValue().setIfAbsent("tstmulti3", "v3");
                return operations.exec();
            }
        });
        return httpComponent.successPage(object);
    }

    @RequestMapping("/testFastLock.do")
    public @ResponseBody Page testFastLock() throws Exception {
        boolean rs = lock.fastLock("testFastLock", 10 * 1000);
        long expiretime = new Date().getTime() + 10 * 1000;
        log.info(expiretime + " | " + DateFormatUtils.ISO_DATETIME_FORMAT.format(expiretime) + " | " + rs );
        return successPage(rs);
    }

    @RequestMapping("/testRelease.do")
    public @ResponseBody Page testRelease() throws Exception {
        lock.release("testFastLock");
        long expiretime = new Date().getTime() + 10 * 1000;
        log.info(expiretime + " | " + DateFormatUtils.ISO_DATETIME_FORMAT.format(expiretime) + " | " + "release" );
        return successPage("ok");
    }

    @RequestMapping("/testLock.do")
    public @ResponseBody Page testLock() throws Exception {
        boolean rs = lock.lock("testFastLock", 10 * 1000, 1000);
        long expiretime = new Date().getTime() + 10 * 1000;
        log.info(expiretime + " | " + DateFormatUtils.ISO_DATETIME_FORMAT.format(expiretime) + " | " + rs );
        return successPage(rs);
    }


    @RequestMapping("/testConcurrencyFastLock.do")
    public @ResponseBody Page testConcurrencyFastLock() throws Exception {
        ExecutorService executorService = Executors.newCachedThreadPool();
        List <Callable<Object>> tasks = new ArrayList<Callable<Object>>();
        for (int i = 0; i < 1000; i++) {
            tasks.add(new Callable<Object>() {
                @Override
                public Object call() throws Exception {
                    return testFastLock();
                }
            });

        }
        List <Future<Object>> futures = executorService.invokeAll(tasks);
        List ansList = new ArrayList();
        for (Future future : futures) {
            ansList.add(future.get());
        }
        return successPage(null);
//        return successPage(ansList);
    }

    @RequestMapping("/testConcurrencyRelease.do")
    public @ResponseBody Page testConcurrencyRelease() throws Exception {
        ExecutorService executorService = Executors.newCachedThreadPool();
        List <Callable<Object>> tasks = new ArrayList<Callable<Object>>();
        for (int i = 0; i < 1000; i++) {
            tasks.add(new Callable<Object>() {
                @Override
                public Object call() throws Exception {
                    return testRelease();
                }
            });

        }
        List <Future<Object>> futures = executorService.invokeAll(tasks);
        List ansList = new ArrayList();
        for (Future future : futures) {
            ansList.add(future.get());
        }
//        return successPage(ansList);
        return successPage(null);

    }

    @RequestMapping("/testConcurrencyLock.do")
    public @ResponseBody Page testConcurrencyLock() throws Exception {
        ExecutorService executorService = Executors.newCachedThreadPool();
        List <Callable<Object>> tasks = new ArrayList<Callable<Object>>();
        for (int i = 0; i < 1000; i++) {
            tasks.add(new Callable<Object>() {
                @Override
                public Object call() throws Exception {
                    return testLock();
                }
            });

        }
        List <Future<Object>> futures = executorService.invokeAll(tasks);
        List ansList = new ArrayList();
        for (Future future : futures) {
            ansList.add(future.get());
        }
//        return successPage(ansList);
        return successPage(null);

    }

}
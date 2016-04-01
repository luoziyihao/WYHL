package com.qilin.entity.report;

import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.TimeUnit;

public class ScheduledExecutorTest {
    private ScheduledExecutorService scheduExec;
    public long start;

    ScheduledExecutorTest() {
        this.scheduExec = Executors.newScheduledThreadPool(3);
        this.start = System.currentTimeMillis();
    }

    public void timerOne() {
        scheduExec.scheduleWithFixedDelay(new Runnable() {
            public void run() {
                System.out.println("timerOne,the time:" + (System.currentTimeMillis() - start));
                try {
                    Thread.sleep(4000);
                } catch (InterruptedException e) {
                    e.printStackTrace();
                }
            }
        }, 0,10, TimeUnit.MILLISECONDS);
    }

    public void timerTwo() {
        scheduExec.schedule(new Runnable() {
            public void run() {
                System.out.println("timerTwo,the time:" + (System.currentTimeMillis() - start));
            }
        }, 2000, TimeUnit.MILLISECONDS);
    }

    public static void main(String[] args) {
        ScheduledExecutorTest test = new ScheduledExecutorTest();
        test.timerOne();
        //test.timerTwo();
    }
}

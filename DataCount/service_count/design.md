## 多看书 设计模式 代码2 effect code

### 可配置

### 可扩展

### awk优势

- 正则匹配
- 多维数组

### 劣势

- 编码不够灵活, 很难满足可扩展, 可配置

### awk -> python

- 代替正则匹配, 可以用查表法.

每一个新的统计节点代表一个新的流处理器, 根据分发表分发到具体的流处理器.会包装父亲节点的数据

- 代替多维数组的数据结构, 可以用树结构

servicename ua  userid  commodityid liveorderid amount

- 基于流的处理

每一个级别的统计处理后都会对应一个新的流, 封装了上一级的流处理数据. 数据在每个节点之间流动.

- 支持及时处理, 延时在1min内

### 处理流程

读入一行数据 -> 动态选择处理结果树 -> 选择配置的处理组件 -> 执行组件 -> 遍历数据树,转换成bean -> 输出

- 组件

数量处理组件

累加处理组件

记录保存处理组件

- 流程demo

统计登录:

根据login 定位到 login_tree -> ua_cmp -> uniqid_cmp -> print_cmp

### 类图设计

- Analysis

```
AnalysisContext statistics();   //调用各种behavior

```

- StatisticsBehavior

```
Analysiscontext count();

Analysiscontext acc();

```

- AnalysisContext

```
long getCount();

BigDecimal getAccV();

Map getLinkedData();    //该节点处的父节点统计信息组成的一个Map, 用于持久化

```
 
- AnalysisNode

```
long getCountV();
void setCountV(long v);

BigDecimal getAccV();
void setAccV(BigDecimal v);

```







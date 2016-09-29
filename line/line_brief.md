### [移动平均](https://zh.wikipedia.org/wiki/%E7%A7%BB%E5%8B%95%E5%B9%B3%E5%9D%87#.E6.8C.87.E6.95.B8.E7.A7.BB.E5.8B.95.E5.B9.B3.E5.9D.87)(英语:Moving Average, MA),又称"移动平均线"简称"均线".

N日均线(算术移动平均线),表示最近N个交易日的平均收盘价.

注: 如果当天未收盘,即取最新价.

注: 如果不存在n个交易日的数据,则取尽可能多的交易日数据计算
```
MA(n) = ( C(1) + C(2) + ... + C(n) ) / n   

```

MA(n)表示n日算术移动平均线,C(n)表示n日的收盘价.

```
EMA(n) = C(n) * k + EMA(n-1) * (1 - k)

k = 2 / (N + 1)

```
EMA(n)表示n日指数平滑移动平均线,C(n)表示n日的收盘价.

EMA是以指数式递减加权的移动平均。各数值的加权影响力随时间而指数式递减，越近期的数据加权影响力越重，但较旧的数据也给予一定的加权值。

注: 首个交易日, EMA取当天收盘价

### [随机指标](https://zh.wikipedia.org/wiki/%E9%9A%8F%E6%9C%BA%E6%8C%87%E6%A0%87)(KDJ）它综合了动量观念、强弱指标及移动平均线的优点，用来度量股价脱离价格正常范围的变异程度。

K值 = 2/3 * 前一日K值 + 1/3 * 当日RSV

D值 = 2/3 * 前一日D值 + 1/3 * 当日K值

无前一日K值与D值,用50代替

J值 = 3K - 2D

9日RSV = (C-L(9)) / (H(9)-L(9)) * 100

注:首个交易日的K值,D值,J值均等于当天的RSV

### [标准差(SD)](https://zh.wikipedia.org/wiki/%E6%A8%99%E6%BA%96%E5%B7%AE0)

![](https://wikimedia.org/api/rest_v1/media/math/render/svg/7b165a48481efe07c6c6430c8d2e86f8e723da9f) 

![](https://wikimedia.org/api/rest_v1/media/math/render/svg/9fd47b2a39f7a7856952afec1f1db72c67af6161) 为平均值![](https://wikimedia.org/api/rest_v1/media/math/render/svg/9fa4039bbc2a0048c3a3c02e5fd24390cab0dc97) 

###   

$$

\Gamma(z) = \int_0^\infty t^{z-1}e^{-t}dt\,.

$$

书写一个质能守恒公式

$$E=mc^2$$

可参考 Mathjax与LaTex公式简介。

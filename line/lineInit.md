## line算法tips

### ineAlgoritythm初始值计算

#### MA

day1 C1

day2 (C1 + C2) / 2

#### MACD
EMA 
```
N = 5
k = 2.0 / (N + 1)
Cn = 3574.0
EMAn_1 = 3574.0
EMAn = Cn * k + EMAn_1 * (1 - k)

EMAn_1 = EMAn
Cn = 3469.0
EMAn = Cn * k + EMAn_1 * (1 - k)

N = 9
k = 2.0 / (N + 1)
EMAn = Cn * k + EMAn_1 * (1 - k)
N = 12
k = 2.0 / (N + 1)
EMAn = Cn * k + EMAn_1 * (1 - k)

```
```
MACD

```

day1 -

day2
N = 9
EMA1 3574.0
EMA2 3553.0000000000005
N = 12
EMA2 3557.846153846154
N = 26
EMA2 3566.222222222222
DIF = SHORT - LONG

# セルオートマトン
Proseccing 3.3.6 を使用。

## 基本的な使い方
セルをクリックするとセルが生きます。
生存、死亡の条件については後述。

- Start ボタン  
  セルが条件に従って動きはじめる。
- Stop ボタン
  動きが止まる。
- 1 Step ボタン
  一気に動くのではなく、ワンステップづつ動く。
- Clear ボタン
  セルを初期化。

## 生存、死亡の条件の変更
プログラム中の15~20行目を変化させる事で、様々なものを試す事ができる。  

```java:Cellular_Automaton.pde
// You can change this value!-------
int live_condition_more = 2;
int live_condition_less = 3;
int born_condition = 3;
int rest_time = 1;
// ----------------------------------
```

- live_condition_more と　live_condition_less  
生存条件を現す。周囲の生存しているセルが  
live_condition_more <= 周囲の生存しているセルの数 <= live_condition_less  
である時にセルは生存しつずける。
- born_condition  
周囲の生きているセルの数がborn_conditionになった時にセルが誕生する。
- int rest_time
rest_time-1 だけ生きたあとに休眠する。

### ライフゲームの条件
```java:Cellular_Automaton.pde
// You can change this value!-------
int live_condition_more = 2;
int live_condition_less = 3;
int born_condition = 3;
int rest_time = 1;
// ----------------------------------
```

### 適当に条件を作ってみる　その1
```java:Cellular_Automaton.pde
// You can change this value!-------
int live_condition_more = 2;
int live_condition_less = 4;
int born_condition = 2;
int rest_time = 2;
// --
```

### 適当に条件を作ってみる　その2
```java:Cellular_Automaton.pde
// You can change this value!-------
int live_condition_more = 1;
int live_condition_less = 4;
int born_condition = 2;
int rest_time = 3;
// --
```

## 参考文献
- [Processing tutorial](https://processing.org/tutorials/2darray/)
- [Processing入門講座](http://ap.kakoku.net/)
- [ライフゲーム wikipedia](https://ja.wikipedia.org/wiki/%E3%83%A9%E3%82%A4%E3%83%95%E3%82%B2%E3%83%BC%E3%83%A0)

# セルオートマトン
Proseccing 3.3.6 を使用。

## 基本的な使い方
セルをクリックするとセルが生きます。
生存、死亡の条件については後述。

- Start , Stopボタン  
  セルが条件に従って動きはじめる。 再生中はStopボタンになり押すと停止する。
- 1 Step ボタン
  一気に動くのではなく、ワンステップづつ動く。
- Clear ボタン
  全てのセルを初期化。一つだけ消したい時はそのセルをクリックすれば良い。

## 生存、死亡の条件の変更
プログラム中の16~20行目を変化させる事で、様々なものを試す事ができる。  

```java
// You can change this value!-------
int live_condition_more = 2;
int live_condition_less = 3;
int born_condition_more = 3;
int born_condition_less = 3;
int rest_time = 1;
// ----------------------------------
```

- live_condition_more と　live_condition_less  
生存条件を現す。周囲の生存しているセルが  
live_condition_more <= 周囲の生存しているセルの数 <= live_condition_less  
である時にセルは生存し続ける。
- born_condition  
周囲の生きているセルの数がborn_conditionになった時にセルが誕生する。
- int rest_time
(少しややこしいが)rest_time　-1 だけ生きたあとに休眠する。ゆえに1以上でないといけない。

### ライフゲームの条件の時
```java
int live_condition_more = 2;
int live_condition_less = 3;
int born_condition_more = 3;
int born_condition_less = 3;
int rest_time = 1;
```
試してみる。
- グライダー  
動画の最初は 1 Step ボタンを使用し 1 Stepごとに進めているが、途中からStartボタンを押した。  
[![グライダーの動画](http://img.youtube.com/vi/gzTwzM-NQEg/0.jpg)](https://youtu.be/gzTwzM-NQEg)

- 銀河  
[![銀河の動画](http://img.youtube.com/vi/aDRhhhQwBis/0.jpg)](https://youtu.be/aDRhhhQwBis)

などなど


### 適当に条件を作ってみる　その1
```java
// You can change this value!-------
int live_condition_more = 2;
int live_condition_less = 2;
int born_condition_more = 2;
int born_condition_less = 3;
int rest_time = 2;
// ----------------------------------
```
前半は綺麗だけど、後半は混沌とする。

[![適当条件その1の動画](http://img.youtube.com/vi/Ie-jq8cOv_o/0.jpg)](https://youtu.be/Ie-jq8cOv_o)


### 適当に条件を作ってみる　その2
```java:Cellular_Automaton.pde
// You can change this value!-------
int live_condition_more = 2;
int live_condition_less = 4;
int born_condition_more = 2;
int born_condition_less = 2;
int rest_time = 3;
// ----------------------------------
```
最終的にほとんど動かなくなる。割と規則的に広がる。  
[![適当条件その2の動画](http://img.youtube.com/vi/aJBszbEL9pQ/0.jpg)](https://youtu.be/aJBszbEL9pQ)


## 参考文献
- [Processing tutorial](https://processing.org/tutorials/2darray/)
- [Processing入門講座](http://ap.kakoku.net/)
- [ライフゲーム wikipedia](https://ja.wikipedia.org/wiki/%E3%83%A9%E3%82%A4%E3%83%95%E3%82%B2%E3%83%BC%E3%83%A0)

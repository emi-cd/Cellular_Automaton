import javax.swing.*;
import java.awt.Color;


// Cell一つ一つのクラス
class Cell extends JButton {
    private STATE _state;
    private STATE _next_state;

    // Cellの状態
    public enum STATE{
	Dead, Living
    }

    Cell(int x, int y){
	this.setBounds(x, y, 10, 10);
	_state = STATE.Dead;
        _next_state = STATE.Dead;
	this.setBackground(Color.white);
    }
	
    private void go_live() {
	_state = STATE.Living;
	this.setBackground(Color.black);
    }
	
    private void go_dead() {
	_state = STATE.Dead;
	this.setBackground(Color.white);
    }
	
    public void swap_state() {
	if(_state == STATE.Living)
	    go_dead();
	else if(_state == STATE.Dead)
	    go_live();
    }	
}





public class LifeGame {  
  public static void main(String[] args) {
    //画面の作成
    JFrame frame = new JFrame();
    frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
    frame.setBounds(300, 100, 1000, 800);
    frame.setLayout(null);
    frame.setVisible(true);
    

    //ボタンの作成
    /*
    Cell btn = new Cell(10, 10);
    btn.swap_state();
    frame.add(btn);
    Cell btn2 = new Cell(20, 20);
    frame.add(btn2);
    */

    JButton button2 = new JButton();
    button2.setBounds(100, 100, 100, 100);
    button2.setBackground(Color.GREEN);
    frame.add(button2);

    frame.setVisible(true);
  }

 
}


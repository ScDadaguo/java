import javax.swing.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

public class  JBclick implements ActionListener{
    static  int [][]  SC=new int[3][3];
    static  int count =0;
    @Override
    public void actionPerformed(ActionEvent e) {
        for (int i = 0; i < 9; i++) {
            if(e.getSource()==TicTacToe_Main.jButtons[i]){
                if(++TicTacToe_Main.clicknum%2==0){
                    TicTacToe_Main.jButtons[i].setText("×");
                    SC[i/3][i%3]=1;
                    TicTacToe_Main.jTextField_Exchangeplayer.setText("正在布局的玩家是:O");
                    if(panduan.result()==true)
                        JOptionPane.showMessageDialog(TicTacToe_Main.jFrame,"恭喜×玩家获胜");
                    count++;
                    if(count==9)
                        System.out.println("平局");



                }
                else {
                    TicTacToe_Main.jButtons[i].setText("O");
                    SC[i/3][i%3]=2;
                    TicTacToe_Main.jTextField_Exchangeplayer.setText("正在布局的玩家是:×");
                    if(panduan.result2()==true){
                        JOptionPane.showMessageDialog(TicTacToe_Main.jFrame,"恭喜O玩家获胜");
                    continue;}

                    count++;
                    if(count==9)
                        JOptionPane.showMessageDialog(TicTacToe_Main.jFrame,"平局");




                }
                for (int j = 0; j < 3; j++) {
                    for (int k = 0; k <3 ; k++) {
                        System.out.println(SC[j][k]);

                    }
                    System.out.println();

                }
                TicTacToe_Main.jButtons[i].setEnabled(false);
            }

        }

    }





}

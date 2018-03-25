package 计算机;

import javax.swing.*;
import java.awt.*;
import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.util.Optional;


/**
 * Created by Administrator on 2018/3/19.
 */
public class Calculator extends JFrame{
    private JTextField jTextField;
    private JButton jButton1;
    private JButton jButton2;
    private JButton jButton3;
    private JButton jButton4;
    private JButton jButton5;
    private JButton jButton6;
    private JButton jButton7;
    private JButton jButton8;
    private JButton jButton9;
    private JButton jButton10;
    private JButton jButton11;
    private JButton jButton12;
    private JButton jButton13;
    private JButton jButton14;
    private JButton jButton15;
    private JButton jButton16;
    private JButton jButton17;
    public Calculator() throws HeadlessException {
        Panel p1=new Panel();
        Panel p2=new Panel();
        jTextField= new JTextField(18   );
        jButton1=new JButton("clear");
        jButton2=new JButton("7");
        jButton3=new JButton("8");
        jButton4=new JButton("9");
        jButton5=new JButton("/");
        jButton6=new JButton("4");
        jButton7=new JButton("5");
        jButton8=new JButton("6");
        jButton9=new JButton("*");
        jButton10=new JButton("1");
        jButton11=new JButton("2");
        jButton12=new JButton("3");
        jButton13=new JButton("-");
        jButton14=new JButton("0");
        jButton15=new JButton(".");
        jButton16=new JButton("=");
        jButton17=new JButton("+");
//        FlowLayout fl=new FlowLayout();
//        this.setLayout(fl);
//        GridBagLayout gridBagLayout=new GridBagLayout();

        this.setLayout(new BorderLayout());

        this.add(p1,BorderLayout.SOUTH);
        this.add(p2,BorderLayout.NORTH);
        p1.setLayout(new GridLayout(4,4,5,5));
        p2.add(jTextField);
        p2.add(jButton1);
        p1.add(jButton2);
        p1.add(jButton3);
        p1.add(jButton4);
        p1.add(jButton5);
        p1.add(jButton6);
        p1.add(jButton7);
        p1.add(jButton8);
        p1.add(jButton9);
        p1.add(jButton10);
        p1.add(jButton11);
        p1.add(jButton12);
        p1.add(jButton13);
        p1.add(jButton14);
        p1.add(jButton15);
        p1.add(jButton16);
        p1.add(jButton17);
        this.setResizable(false);
        this.setSize(300,200);
        this.setVisible(true);
        this.setTitle("Calculator");
        ActionListener actionListener =new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                jTextField.setText(jButton10.getText());
            }
        };
        jButton10.addActionListener( actionListener);


        ActionListener actionListener2 =new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                jTextField.setText(jTextField.getText()+jButton17.getText());
            }
        };
        jButton17.addActionListener(actionListener2);

        ActionListener actionListener3 =new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                jTextField.setText(jTextField.getText()+jButton11.getText());
            }
        };
        jButton11.addActionListener(actionListener3);





    }

    public static void main(String[] args) {
        new Calculator();
    }
}

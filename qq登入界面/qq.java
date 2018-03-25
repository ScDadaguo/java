package qq登入界面;

import javax.swing.*;
import java.awt.*;

/**
 * Created by Administrator on 2018/3/19.
 */
public class qq extends JFrame{
    private JTextField jTextField1;
    private  JLabel jLabel;
    private JTextField jTextField2;
    private JLabel jLabel2;
    private Checkbox checkbox1;
    private Checkbox checkbox2;
    private JButton jButton;
    public qq() throws HeadlessException {
        jTextField1=new JTextField("帐号",20);
        jLabel=new JLabel("注册帐号");
        jTextField2=new JTextField(20);
        jLabel2=new JLabel("找回密码");
        checkbox1=new Checkbox("记住密码");
        checkbox2=new Checkbox("自动登录           ");
        jButton=new JButton("   登录   ");
        FlowLayout fl=new FlowLayout();
        this.setLayout(fl);
        BorderLayout bl=new BorderLayout();
        this.add(jButton,BorderLayout.SOUTH);
        this.add(jTextField1);
        this.add(jLabel);
        this.add(jTextField2);
        this.add(jLabel2);
        this.add(checkbox1);
        this.add(checkbox2);
        this.add(jButton);
        this.setTitle("QQ登录界面");
        this.setResizable(false);
        this.setSize(300,200);
        this.setVisible(true);




    }

    public static void main(String[] args) {
         new qq();
    }
}

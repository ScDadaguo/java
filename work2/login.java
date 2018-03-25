package work2;

import javax.swing.*;
import java.awt.*;

/**
 * Created by Administrator on 2018/3/19.
 */
public class login extends JFrame{
    private JLabel jLabel1;
    private JTextField jTextField;
    private JLabel jLabel2;
    private JTextField jTextField2;
    private JButton jButton;


    public login() throws HeadlessException {

        jLabel1 =new JLabel("User:        ");
        jTextField=new JTextField(null,16);
        jLabel2=new JLabel("Password");
        jTextField2=new JTextField(null,16);
        jButton=new JButton("login");
        FlowLayout fl=new FlowLayout();
        this.setLayout(fl);
//        BorderLayout borderLayout =new BorderLayout();


        
        this.add(jLabel1);
        this.add(jTextField);
        this.add(jLabel2);
        this.add(jTextField2);
        this.add(jButton);
        this.setResizable(false);
        this.setSize(300,200);
        this.setVisible(true);
        this.setTitle("login example");



    }

    public static void main(String[] args) {
        new login();
    }
}



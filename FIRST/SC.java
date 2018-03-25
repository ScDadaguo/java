package FIRST;
import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.util.Optional;


/**
 * Created by Administrator on 2018/3/21.
 */
public class SC extends JFrame {
    public SC() throws HeadlessException {
        JLabel jLabel=new JLabel("用户名：  ");
        JTextField jTextField=new JTextField(16);
        JLabel jLabel2=new JLabel("输入密码：");
        JPasswordField jPasswordField=new JPasswordField(16);
        JLabel jLabel3=new JLabel("确认密码：");
        JPasswordField jPasswordField12=new JPasswordField(16);
        JButton jButton=new JButton("提交");
//        jPasswordField2.getPassword().length
        jButton.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                if(jPasswordField.getPassword().length<6){
                    JOptionPane.showMessageDialog(null, "密码不能小于6位", "",JOptionPane.WARNING_MESSAGE);
                }
                 else if(!jPasswordField.getText().equals(jPasswordField12.getText())){
                    JOptionPane.showMessageDialog(null, "密码不相同", "",JOptionPane.WARNING_MESSAGE);

                }
                else if(jPasswordField.getText().equals(jPasswordField12.getText())){
                    JOptionPane.showMessageDialog(null, "进入游戏请注意续费", "",JOptionPane.WARNING_MESSAGE);
                    new NEW(jTextField.getText());
                    dispose();


                }
//                 else if(jPasswordField.getText().equals(jPasswordField12.getText())){
//                    new NEW(jTextField.getText());
//
//                    dispose();
//
//                }




            }
        });


        this.add(jLabel);
        this.add(jTextField);
        this.add(jLabel2);
        this.add(jPasswordField);
        this.add(jLabel3);
        this.add(jPasswordField12);
        this.add(jButton);
        this.setLayout(new FlowLayout());
        this.setResizable(false);
        this.setSize(300,200);
        this.setVisible(true);
        this.setTitle("注册会员");



    }

    public static void main(String[] args) {
        new SC();
    }
}

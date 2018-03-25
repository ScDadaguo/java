package 改变字体大小颜色;

import javax.swing.*;
import java.awt.*;
import java.awt.event.MouseEvent;
import java.awt.event.MouseListener;

/**
 * Created by Administrator on 2018/3/21.
 */
public class TEXT extends JFrame{
    public TEXT() throws HeadlessException {
        JLabel jLabel=new JLabel("字体大小：");
        JRadioButton  jRadioButtonsmall=new JRadioButton ("小号");
        JRadioButton  jRadioButtonmid=new JRadioButton ("中号");
        JRadioButton  jRadioButtonlarge=new JRadioButton ("大号");
        JLabel jLabel1=new JLabel("Java Language");
        JRadioButton  jRadioButtonred=new JRadioButton ("红色");
        JRadioButton  jRadioButtonyellow=new JRadioButton ("黄色");
        JRadioButton  jRadioButtonblue=new JRadioButton ("蓝色");

//        ##把单选框放进盒子里
        ButtonGroup buttonGroup=new ButtonGroup();
        buttonGroup.add(jRadioButtonsmall);
        buttonGroup.add(jRadioButtonmid);
        buttonGroup.add(jRadioButtonlarge);
        buttonGroup.add(jRadioButtonred);
        buttonGroup.add(jRadioButtonyellow);
        buttonGroup.add(jRadioButtonblue);
//        --------------------------
//        布局排布--------
        JPanel jPanel2=new JPanel();
        JPanel jPanel3=new JPanel();
        jPanel2.add(jLabel);
        jPanel2.add(jRadioButtonsmall);
        jPanel2.add(jRadioButtonmid);
        jPanel2.add(jRadioButtonlarge);

        jPanel3.add(jRadioButtonred);
        jPanel3.add(jRadioButtonyellow);
        jPanel3.add(jRadioButtonblue);
        this.add(jPanel2,BorderLayout.NORTH);
        this.add(jPanel3,BorderLayout.SOUTH);
        this.add(jLabel1,BorderLayout.CENTER);

        this.setResizable(false);
        this.setSize(500,500);
        this.setVisible(true);
        this.setTitle("改变字体颜色大小");


        jLabel1.setFont(new Font("宋体",Font.BOLD,15));
//        功能实现-----------
        jRadioButtonsmall.addMouseListener(new MouseListener() {
            @Override
            public void mouseClicked(MouseEvent e) {
                jLabel1.setFont(new Font("微软雅黑",Font.BOLD,8));
            }

            @Override
            public void mousePressed(MouseEvent e) {

            }

            @Override
            public void mouseReleased(MouseEvent e) {

            }

            @Override
            public void mouseEntered(MouseEvent e) {

            }

            @Override
            public void mouseExited(MouseEvent e) {

            }
        });
        jRadioButtonmid.addMouseListener(new MouseListener(){
            @Override
            public void mouseClicked(MouseEvent e) {
                jLabel1.setFont(new Font("微软雅黑",Font.BOLD,25));
            }

            @Override
            public void mousePressed(MouseEvent e) {

            }

            @Override
            public void mouseReleased(MouseEvent e) {

            }

            @Override
            public void mouseEntered(MouseEvent e) {

            }

            @Override
            public void mouseExited(MouseEvent e) {

            }
        });
        jRadioButtonlarge.addMouseListener(new MouseListener(){
            @Override
            public void mouseClicked(MouseEvent e) {
                jLabel1.setFont(new Font("微软雅黑",Font.BOLD,50));
            }

            @Override
            public void mousePressed(MouseEvent e) {

            }

            @Override
            public void mouseReleased(MouseEvent e) {

            }

            @Override
            public void mouseEntered(MouseEvent e) {

            }

            @Override
            public void mouseExited(MouseEvent e) {

            }
        });
        jRadioButtonred.addMouseListener(new MouseListener(){
            @Override
            public void mouseClicked(MouseEvent e) {
                jLabel1.setForeground(Color.red);
            }

            @Override
            public void mousePressed(MouseEvent e) {

            }

            @Override
            public void mouseReleased(MouseEvent e) {

            }

            @Override
            public void mouseEntered(MouseEvent e) {

            }

            @Override
            public void mouseExited(MouseEvent e) {

            }
        });
        jRadioButtonyellow.addMouseListener(new MouseListener(){
            @Override
            public void mouseClicked(MouseEvent e) {
                jLabel1.setForeground(Color.yellow);
            }

            @Override
            public void mousePressed(MouseEvent e) {

            }

            @Override
            public void mouseReleased(MouseEvent e) {

            }

            @Override
            public void mouseEntered(MouseEvent e) {

            }

            @Override
            public void mouseExited(MouseEvent e) {

            }
        });
        jRadioButtonblue.addMouseListener(new MouseListener(){
            @Override
            public void mouseClicked(MouseEvent e) {
                jLabel1.setForeground(Color.blue);
            }

            @Override
            public void mousePressed(MouseEvent e) {

            }

            @Override
            public void mouseReleased(MouseEvent e) {

            }

            @Override
            public void mouseEntered(MouseEvent e) {

            }

            @Override
            public void mouseExited(MouseEvent e) {

            }
        });


    }

    public static void main(String[] args) {
        new TEXT();
    }
}

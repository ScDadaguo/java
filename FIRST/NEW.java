package FIRST;
import javax.swing.*;
import java.awt.*;

/**
 * Created by Administrator on 2018/3/21.
 */
public class NEW extends JFrame{
    public NEW(String title) throws HeadlessException {
                JFrame jFrame =new JFrame();
                jFrame.setTitle(title);
                JLabel jLabel=new JLabel("您登陆的账号是"+title);
                jFrame.add(jLabel);
                jFrame.setVisible(true);
                jFrame.setSize(500,500);



    }
//    public NEW(String id) throws HeadlessException {
//        this.setTitle(id);
//        setSize(500,500);
//        setVisible(true);
//        String content="WELCOME "+id;
//        JLabel jLabel=new JLabel(content);
//        add(jLabel);
//    }
}

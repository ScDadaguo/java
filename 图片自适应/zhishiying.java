package 图片自适应;

import javax.swing.*;
import java.awt.*;
import java.awt.event.ComponentAdapter;
import java.awt.event.ComponentEvent;

/**
 * Created by Administrator on 2018/3/21.
 */
public class zhishiying extends JFrame {
    public zhishiying() throws HeadlessException {
        JLabel jLabel=new JLabel();
        this.add(jLabel);
        this.setVisible(true);
        this.addComponentListener(new ComponentAdapter() {
            @Override
            public void componentResized(ComponentEvent e) {
                Dimension size=e.getComponent().getSize();
                jLabel.setSize(size);
                jLabel.setText("<html><img width=" +size.width+" height ="+size.height+" src=' "
                +this.getClass().getResource("/图片自适应/guohao.jpg")+"' ></html>");

            }
        });
    }

    public static void main(String[] args) {
        zhishiying s =new zhishiying();
    }
}

import javax.swing.*;
import java.awt.*;

/**
 * Created by Administrator on 2018/3/26.
 */
public class PicturePreview extends JPanel{
    @Override
    protected void paintComponent(Graphics g) {
        super.paintComponent(g);
        ImageIcon icon =new ImageIcon("src/"+PictureCanvas.pictureID+".jpg");
        Image image =icon.getImage();
        g.drawImage(image,20,20,450,600,this);

    }

}

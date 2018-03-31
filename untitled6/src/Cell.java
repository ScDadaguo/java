import javax.swing.*;

/**
 * Created by Administrator on 2018/3/26.
 */
public class Cell extends JButton{
    public Cell(Icon icon) {
        super(icon);
        this.setSize(150,150);
    }

    public Cell(String text, Icon icon) {
        super(text, icon);
        this.setSize(150,150);
        this.setHorizontalTextPosition(CENTER);
        this.setVerticalTextPosition(CENTER);
    }
//    空格子的移动
    public void move(String direction){
        switch (direction){
            case "UP":
                this.setLocation(this.getBounds().x,this.getBounds().y-150);
                break;
            case "DOWN":
                this.setLocation(this.getBounds().x,this.getBounds().y+150);
                break;
            case "LEFT":
                this.setLocation(this.getBounds().x-150,this.getBounds().y);
                break;
            case "RIGHT":
                this.setLocation(this.getBounds().x+150,this.getBounds().y);
                break;
            default:
                break;

        }
    }
}



import javax.swing.*;
import java.awt.*;
import java.awt.event.MouseEvent;
import java.awt.event.MouseListener;

/**
 * Created by Administrator on 2018/3/26.
 */
public class PictureCanvas extends JPanel implements MouseListener{
    @Override
    public void mouseClicked(MouseEvent e) {

    }

    @Override
    public void mousePressed(MouseEvent e) {
//        获得当前所点击的小方格
            Cell button =(Cell)e.getSource();
//            获取所点击的方格的x，y坐标
        int clickX =button.getBounds().x;
        int clickY=button.getBounds().y;
//        获取当前空方格的x，y坐标
        int  nullX=nullcell.getBounds().x;
        int nullY=nullcell.getBounds().y;
//        进行比较，如果满足条件进行交换位置
        if (clickX==nullX && clickY-nullY==150){
            button.move("UP");
            nullcell.setLocation(clickX,clickY);
        }
        else if (clickX==nullX && clickY-nullY==-150){
            button.move("DOWN");
            nullcell.setLocation(clickX,clickY);
        }
        else if (clickX-nullX==150 && clickY==nullY){
            button.move("LEFT");
            nullcell.setLocation(clickX,clickY);
        }
        else if (clickX-nullX==-150 && clickY==nullY){
            button.move("RIGHT");
            nullcell.setLocation(clickX,clickY);
        }
        else{
            return ;
//            不满足移动条件，就不进行任何处理
        }
//      更新空方格的位置
        nullcell.setLocation(clickX,clickY);
//        this.repaint();------------------------------！！！！！！
        stepNum++;
        PictureMainFrame.step.setText("当前步数："+stepNum);

        if (this.isFinish()){
            JOptionPane.showMessageDialog(this,"恭喜你完成拼图！！！\n所用步数"+stepNum);
            for (int i = 0; i <11 ; i++) {
                cell[i].removeMouseListener(this);
            }
            hasaddActonListener=false;

        }

    }
    private boolean isFinish(){
        for (int i = 0; i < 11; i++) {
            int x = cell[i].getBounds().x;
            int y = cell[i].getBounds().y;
            if(((y-20)/150*3 + (x-20)/150) != i){
                return false;
            }
        }
        return true;
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

    public  static int pictureID = 1;
    private Cell[] cell;
    private Rectangle nullcell;
    private  static  int stepNum=0;
    boolean hasaddActonListener=false;

    public PictureCanvas(){
        this.setLayout(null);
        cell = new Cell[12];

        for (int i = 0; i < 4; i++) {
            for (int j = 0; j < 3; j++) {
                ImageIcon icon = new ImageIcon("src/1_" + (i*3+j+1) + ".gif");
                cell[i*3+j] = new Cell(icon);
                cell[i*3+j].setLocation(j*150+20,i*150+20);
                this.add(cell[i*3+j]);
            }
        }

        this.remove(cell[11]);
        nullcell = new Rectangle(320,470,150,150);
    }

    public void reLoadPictureAddNumber(){
        for (int i = 0; i < 4; i++) {
            for (int j = 0; j < 3; j++) {
//                ImageIcon icon = new ImageIcon("src/" + pictureID + "_" + (i*3+j+1) + ".gif");
//                cell[i*3+j].setIcon(icon);
                cell[i*3+j].setText("" + (i*3+j+1));
                cell[i*3+j].setHorizontalTextPosition(this.getX()/2);
                cell[i*3+j].setVerticalTextPosition(this.getY()/2);
            }
        }
    }
    public void start(){
        if(!hasaddActonListener){}{
            for (int i = 0; i <11 ; i++) {
                cell[i].addMouseListener(this);
            }
            hasaddActonListener=true;
        }
        while (cell[0].getBounds().x<=170 &&cell[0].getBounds().y<=170){
            int nullX=nullcell.getBounds().x;
            int nulllY=nullcell.getBounds().y;
            int direction=(int)(Math.random()*4);
            switch (direction){
                case 0:
                    nullX-=150;
                    cellMove(nullX,nulllY,"RIGHT");
                    break;
                case 1:
                    nullX+=150;
                    cellMove(nullX,nulllY,"LEFT");
                    break;
                case 2:
                    nulllY-=150;
                    cellMove(nullX,nulllY,"DOWN");
                    break;
                case 3:
                    nulllY+=150;
                    cellMove(nullX,nulllY,"UP");
                    break;
            }
        }
    }
    private void cellMove(int nullX,int nullY,String directon){
        for (int i = 0; i <11 ; i++) {
            if (cell[i].getBounds().x==nullX && cell[i].getBounds().y==nullY){
                cell[i].move(directon);
                nullcell.setLocation(nullX,nullY);
                break;
            }
            
        }
    }

    public void reLoadPictureClearNumber(){
        for (int i = 0; i < 4; i++) {
            for (int j = 0; j < 3; j++) {
                ImageIcon icon = new ImageIcon("src/" + pictureID + "_" + (i*3+j+1) + ".gif");
                cell[i*3+j].setIcon(icon);
                cell[i*3+j].setText("");
//                cell[i*3+j].setHorizontalTextPosition(this.getX()/2);
//                cell[i*3+j].setVerticalTextPosition(this.getY()/2);
            }
        }
    }
}

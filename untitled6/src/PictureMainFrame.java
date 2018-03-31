/**
 * Created by Administrator on 2018/3/26.
 */






import javax.swing.*;
import javax.swing.border.TitledBorder;
import java.awt.*;
import java.awt.event.*;

public class PictureMainFrame extends JFrame{
    private  String[] items={"小女孩","女明星"};
    public static JTextField step;

    public PictureMainFrame() throws HeadlessException {
        init();
    }

    public void init(){
        JPanel down_BIG_jpanel =new JPanel();
        JPanel down_right_small_jpanel=new JPanel();
        JPanel down_left_small_jpanel=new JPanel();
        JButton jButton_re=new JButton("初始化");


        JLabel jLabela=new JLabel("选择图片");
        JButton jButton_Start=new JButton("Start");
        JComboBox<String> box=new JComboBox<String>(items);

        JPanel Big_jPanel=new JPanel();
        JPanel left_jPanel=new JPanel();
        left_jPanel.setBorder(new TitledBorder("按钮区"));
        JPanel right_jPanel=new JPanel();
        right_jPanel.setBorder(new TitledBorder("游戏状态"));
        Big_jPanel.setLayout(new GridLayout(1,2));
        Big_jPanel.add(left_jPanel);
        Big_jPanel.add(right_jPanel);
        Big_jPanel.add(right_jPanel,BorderLayout.EAST);
        Big_jPanel.add(right_jPanel,BorderLayout.WEST);
        left_jPanel.setBackground(Color.pink);
        right_jPanel.setBackground(Color.pink);
        JRadioButton jRadioButton_num=new JRadioButton("数字提示");
        JRadioButton jRadioButton_clear=new JRadioButton("清楚提示",true);
        ButtonGroup buttonGroup=new ButtonGroup();
        left_jPanel.add(jRadioButton_clear);
        left_jPanel.add(jRadioButton_num);
        left_jPanel.add(box);
        left_jPanel.add(jButton_Start);
        buttonGroup.add(jRadioButton_num);
        buttonGroup.add(jRadioButton_clear);
        left_jPanel.add(jButton_re);
        JTextField name=new JTextField("图片名称：小女孩儿"  );
        right_jPanel.setLayout(new GridLayout(1,2));
        name.setEditable(false);
          step=new JTextField("步数:0");
        step.setEditable(false);
        right_jPanel.add(name);
        right_jPanel.add(step);
        down_BIG_jpanel.setLayout(new GridLayout(1,2));


        PicturePreview picturePreview =new PicturePreview();
        picturePreview.setBorder(new TitledBorder("预览区"));
        PictureCanvas pictureCanvas=new PictureCanvas();
        pictureCanvas.setBorder(new TitledBorder("拼图区"));
        down_BIG_jpanel.add(picturePreview,BorderLayout.EAST);
        down_BIG_jpanel.add(pictureCanvas,BorderLayout.WEST);
        down_BIG_jpanel.add(picturePreview);

        jButton_re.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                new PictureCanvas();
            }
        });

//  如果把上面的一句代码写成下面这个  就会错   这句的意思是把图片放在右下panel下   但是不行
//down_BIG_jpanel.add(down_right_small_jpanel)#################################################
//
//
        jRadioButton_num.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                pictureCanvas.reLoadPictureAddNumber();
            }
        });
        jRadioButton_clear.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                pictureCanvas.reLoadPictureClearNumber();
            }
        });
        box.addItemListener(new ItemListener() {
            @Override
            public void itemStateChanged(ItemEvent e) {
                int num=box.getSelectedIndex();
                PictureCanvas.pictureID=num+1;
                picturePreview.repaint();
                pictureCanvas.reLoadPictureClearNumber();
//                pub new
                name.setText("图片名称：女明星");

                int stepNum=0;
                step.setText("步数："+stepNum);
//                jRadioButton_clear.setSelected(true);

            }
        });
        jButton_Start.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                step.setText("步数:"+0);
                pictureCanvas.start();

            }
        });


        this.setLayout(new BorderLayout());
        this.add(Big_jPanel,BorderLayout.NORTH);
        this.add(down_BIG_jpanel);
        this.setTitle("拼图游戏");
        this.setSize(1000,720);
        this.setLocation(150,10);

        this.setResizable(false);
        this.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);





        this.setVisible(true);

    }





    public static void main(String[] args) {
        new PictureMainFrame();
    }
}

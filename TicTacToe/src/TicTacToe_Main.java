import javax.swing.*;
import javax.swing.border.TitledBorder;
import java.awt.*;
import java.awt.event.*;


public class TicTacToe_Main extends JFrame {
    private JPanel big_panel;
    private JButton jButton_regame;
    static JTextField jTextField_Exchangeplayer;
    private JPanel jPanel_down_big;
    static JButton[] jButtons;
    static int clicknum = 0;
    static JFrame jFrame = new JFrame();

    public TicTacToe_Main() throws HeadlessException {
        init();

    }

    //    初始化页面布局
    public void init() {
        jButtons = new JButton[9];
        big_panel = new JPanel();
        big_panel.setPreferredSize(new Dimension(900, 100));
        jButton_regame = new JButton("重新开始");
        jButton_regame.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                for (int i = 0; i < 9; i++) {
                    jButtons[i].setText("");
                    TicTacToe_Main.jButtons[i].setEnabled(true);
                }
                for (int i = 0; i < 3; i++) {
                    for (int j = 0; j < 3; j++) {
                        JBclick.SC[i][j] = 0;
                    }
                }
            }
        });
        jButton_regame.setBackground(new Color(252, 157, 154));
        jButton_regame.setFont(new Font("书体坊米芾体", Font.BOLD, 40));
        jButton_regame.setSize(500, 50);
        jTextField_Exchangeplayer = new JTextField("规定O玩家启手");
        jTextField_Exchangeplayer.setHorizontalAlignment(JTextField.CENTER);
        jTextField_Exchangeplayer.setFont(new Font("方正字迹", Font.BOLD, 40));
        jTextField_Exchangeplayer.setBackground(new Color(249, 205, 173));

        big_panel.setLayout(new GridLayout(1, 2));
        big_panel.add(jButton_regame);
        big_panel.add(jTextField_Exchangeplayer);
        jPanel_down_big = new JPanel();
        jPanel_down_big.setLayout(new GridLayout(3, 3));
        for (int i = 0; i < 9; i++) {
            jButtons[i] = new JButton(" ");
            jPanel_down_big.add(jButtons[i]);
            jButtons[i].setFont(new Font("华文行楷", Font.BOLD, 80));
            jButtons[i].addActionListener(new JBclick());


            jButtons[i].setBackground(new Color(200, 200, 169));
        }
        jPanel_down_big.setBorder(new TitledBorder("操作区"));

        this.setLayout(new BorderLayout());
        this.add(big_panel, BorderLayout.NORTH);
        this.add(jPanel_down_big);
        this.setLocation(100, 100);
        this.setResizable(false);
        this.setSize(900, 1000);
        this.setTitle("井字棋");
        this.setVisible(true);


    }

}

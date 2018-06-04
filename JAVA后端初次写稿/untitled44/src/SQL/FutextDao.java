package SQL;

import Entity.Futext;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by Administrator on 2018/6/4.
 */
public class FutextDao extends SQLBean {
//    得到网页里的内容 包括标题和内容
    public List<Futext> getfutext(){
        String  sql="select text from mytext";
        Connection conn = getConnection();
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        List<Futext> futextList = new ArrayList<Futext>();
        try {
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();
            while (rs.next()){
                Futext futext = new Futext();
                futext.setText(rs.getString("text"));
                futextList.add(futext);
            }
        }catch (SQLException e){
            e.printStackTrace();
        }finally {
            closeConnection(conn,pstmt,rs);
        }
        return futextList;
    }
//    只得到标题
    public List<Futext> getBiaoTi(){
        String  sql="select title  from mytext";
        Connection conn = getConnection();
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        List<Futext> futextList = new ArrayList<Futext>();
        try {
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();
            while (rs.next()){
                Futext futext = new Futext();
                futext.setTitle(rs.getString("title"));
                futextList.add(futext);
            }
        }catch (SQLException e){
            e.printStackTrace();
        }finally {
            closeConnection(conn,pstmt,rs);
        }
        return futextList;
    }
    public int insert(Futext futext){
        String sql = "Insert mytext Values (?,?)";
        List<Object> pValues = new ArrayList<Object>();
        pValues.add(futext.getText());
        pValues.add(futext.getTitle());
        int rows = 0;

        try {
            rows = this.executeUpdate(sql,pValues);
        } catch (Exception e){
            e.printStackTrace();
        }

        return rows;
    }
}

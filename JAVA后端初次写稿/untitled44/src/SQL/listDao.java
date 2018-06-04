package SQL;

import Entity.Filename;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class listDao extends SQLBean_upload {
    public List<Filename> getfilename(){
        String  sql="select filename from list";
        Connection conn = getConnection();
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        List<Filename> filenameList = new ArrayList<Filename>();
        try {
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();
            while (rs.next()){
                Filename filename = new Filename();
                filename.setFilename(rs.getString("filename"));
                filenameList.add(filename);
            }
        }catch (SQLException e){
            e.printStackTrace();
        }finally {
            closeConnection(conn,pstmt,rs);
        }
        return filenameList;
    }
    public int insert(Filename objfilename){
        String sql = "Insert list Values (?)";
        List<Object> pValues = new ArrayList<Object>();
        pValues.add(objfilename.getFilename());
        int rows = 0;

        try {
            rows = this.executeUpdate(sql,pValues);
        } catch (Exception e){
            e.printStackTrace();
        }

        return rows;
    }

}

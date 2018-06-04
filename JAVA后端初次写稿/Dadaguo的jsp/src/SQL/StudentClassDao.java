package SQL;

import Entity.StudentClass;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by Administrator on 2018/5/23.
 */
public class StudentClassDao extends SQLBean {
    public List<StudentClass> getStudentClass() {
        String sql="Select *  FROM STUDENTCLASS" ;
        Connection conn = getConnection();
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        List<StudentClass> studentClassList=new ArrayList<StudentClass>();
        try {
            pstmt = conn.prepareStatement(sql);
            rs=pstmt.executeQuery();

            while (rs.next()){
                StudentClass studentClass=new StudentClass();
                studentClass.setClassid(rs.getInt("classid"));
                studentClass.setClassName(rs.getString("classname"));
                studentClassList.add(studentClass);

            }
        }catch (SQLException e){
            e.printStackTrace();
        }finally {
            closeConnection(conn,pstmt,rs);
        }
        return studentClassList;
    }



}


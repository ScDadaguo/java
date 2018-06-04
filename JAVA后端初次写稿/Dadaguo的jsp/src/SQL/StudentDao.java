package SQL;

import Entity.Student;
import Entity.StudentClass;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

//import sun.security.pkcs11.wrapper.CK_ATTRIBUTE;

/**
 * Created by Administrator on 2018/5/14.
 */
public class StudentDao extends SQLBean {
    public List<Student> getStudent(){
        String sql = "Select studentid,studentname,classname,student.classid From Student,studentclass WHERE student.classid=studentclass.classid";
        Connection conn = getConnection();
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        List<Student> studentList = new ArrayList<Student>();

        try {
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();
            while (rs.next()){
                Student objStu = new Student();
                objStu.setId(rs.getInt("studentid"));
                objStu.setName(rs.getString("studentname"));
                objStu.setStudentClass(new StudentClass());
                objStu.getStudentClass().setClassid(rs.getInt("Classid"));
                objStu.getStudentClass().setClassName(rs.getString("classname"));
                studentList.add(objStu);
            }
        }catch (SQLException e){
            e.printStackTrace();
        }finally {
            closeConnection(conn,pstmt,rs);
        }
        return studentList;
    }
    public Student getStudentById(int studentId) throws SQLException {
        String sql="Select studentid,studentname,classname,student.classid From Student,studentclass where studentid=?  and studentclass.classid=student.classid";
        Connection conn = getConnection();
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        Student objStu = new Student();
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1,Integer.parseInt(String.valueOf(studentId)));
            rs = pstmt.executeQuery();

            while (rs.next()){
                objStu.setId(rs.getInt("studentid"));
                objStu.setName(rs.getString("studentname"));
                objStu.setStudentClass(new StudentClass());
                objStu.getStudentClass().setClassid(rs.getInt("Classid"));
                objStu.getStudentClass().setClassName(rs.getString("classname"));
            }
        }catch (SQLException e){
            e.printStackTrace();
        }finally {
            closeConnection(conn,pstmt,rs);
        }
        return objStu;
    }

    public int insert(Student objStudent){
        String sql = "Insert Student Values (?,?,?)";
        List<Object> pValues = new ArrayList<Object>();
        pValues.add(objStudent.getName());
        pValues.add(objStudent.getPassword());
        pValues.add(objStudent.getClassid());
        int rows = 0;

        try {
            rows = this.executeUpdate(sql,pValues);
        } catch (Exception e){
            e.printStackTrace();
        }

        return rows;
    }

    public int update(Student objStudent){
        String sql = "Update Student set studentname=?,password=?,classid=? where studentid=?";
        List<Object> pValues = new ArrayList<Object>();
        pValues.add(objStudent.getName());
        pValues.add(objStudent.getPassword());
        pValues.add(objStudent.getClassid());
        pValues.add(objStudent.getId());
        int rows = 0;

        try {
            rows = this.executeUpdate(sql,pValues);
        } catch (Exception e){
            e.printStackTrace();
        }

        return rows;
    }

    public int delete(Student objStudent){
        String sql = "Delete Student where studentid=?";
        List<Object> pValues = new ArrayList<Object>();
        pValues.add(objStudent.getId());
        int rows = 0;

        try {
            rows = this.executeUpdate(sql,pValues);
        } catch (Exception e){
            e.printStackTrace();
        }

        return rows;
    }
}

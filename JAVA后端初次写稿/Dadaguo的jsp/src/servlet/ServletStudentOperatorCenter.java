package servlet;

import Entity.Student;
import SQL.StudentDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

/**
 * Created by Administrator on 2018/5/16.
 */
@WebServlet("/ServletStudentOperatorCenter")

public class ServletStudentOperatorCenter extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PrintWriter out=response.getWriter();
        request.setCharacterEncoding("utf-8");

        String id = request.getParameter("id");
        String name = request.getParameter("name");
        String password = request.getParameter("password");
        String classid = request.getParameter("classid");

        String method = request.getParameter("method");

        String DRIVER_CLASS = "com.microsoft.sqlserver.jdbc.SQLServerDriver";

        String DATABASE_URL = "jdbc:sqlserver://localhost:1433;DatabaseName=StudentManageDB";

        String USERNAME = "sa";

        String PASSWORD = "123456";

        Connection conn = null;

        try{
            Class.forName(DRIVER_CLASS);
            conn = DriverManager.getConnection(DATABASE_URL,USERNAME,PASSWORD);
        }catch(Exception e){
            e.getMessage();
        }

        int num = 0;
        PreparedStatement pstmt = null;
        String sql =null;

//    删除
        if(method.equals("3")){

            Student student = new Student();
            student.setId(Integer.parseInt(id));
            StudentDao studentDao = new StudentDao();
            num = studentDao.delete(student);
        }

//    插入
        if(method.equals("1")){

            Student student = new Student();
            student.setName(name);
            student.setPassword(password);
            student.setClassid(Integer.parseInt(classid));
//        int num = 0;
            StudentDao studentDao = new StudentDao();
            num = studentDao.insert(student);
        }

//    改
        if(method.equals("2")) {
            Student student = new Student();
            student.setName(name);
            student.setPassword(password);
            student.setClassid(Integer.parseInt(classid));
            student.setId(Integer.parseInt(id));
            StudentDao studentDao = new StudentDao();
            num = studentDao.update(student);
        }

            if (num>0){


                out.print("<script>alert('成功！');window.location='index.jsp'</script>");
    //            response.sendRedirect("index.jsp");
            }
            else {
                out.print("<script>alert('失败！');window.location='index.jsp'</script>");
            }
    }
}

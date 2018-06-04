package servlet;

import Entity.Student;
import SQL.StudentDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

/**
 * Created by Administrator on 2018/5/16.
 */
@WebServlet("/ServletUpdate")
public class ServletUpdate extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int studentId=Integer.parseInt(request.getParameter("id"));
        StudentDao studentDao=new StudentDao();
        Student student=null;
        try {
             student=studentDao.getStudentById(studentId);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        request.setAttribute("aaa",student);
        request.getRequestDispatcher("updateStudent.jsp").forward(request,response);

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            doPost(request,response);
    }
}

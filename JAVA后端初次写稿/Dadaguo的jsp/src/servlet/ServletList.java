package servlet;

import Entity.StudentClass;
import SQL.StudentClassDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

/**
 * Created by Administrator on 2018/5/23.
 */
@WebServlet("/ServletList")
public class ServletList extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
doGet(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        StudentClassDao studentClassDao=new StudentClassDao();
        List<StudentClass> studentClassList=studentClassDao.getStudentClass();
        if(studentClassList!=null&&studentClassList.size()>0){
            HttpSession session=request.getSession();
            session.setAttribute("studentClassList",studentClassList);
            request.getRequestDispatcher("list.jsp").forward(request,response);
        }else {
            request.getRequestDispatcher("login.jsp").forward(request,response);
        }
    }
}

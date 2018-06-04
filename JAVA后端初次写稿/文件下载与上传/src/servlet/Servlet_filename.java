package servlet;

import Entity.Filename;
import SQL.listDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/Servlet_filename")
public class Servlet_filename extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Filename> filenameList=null;
        listDao listDao=new listDao();
        filenameList=listDao.getfilename();
        request.setAttribute("filenameList",filenameList);
        request.getRequestDispatcher("index.jsp").forward(request,response);
    }
}

package servlet;

import Entity.Filename;
import Entity.Futext;
import SQL.FutextDao;
import SQL.listDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

/**
 * Created by Administrator on 2018/6/4.
 */
@WebServlet("/Servlet_printText")
public class Servlet_printText extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            doGet(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Futext> futextList=null;
        FutextDao futextDao=new FutextDao();
        futextList=futextDao.getfutext();
        Futext futext = futextList.get(futextList.size() - 1);
        System.out.println(futext.getText());
        request.setAttribute("futext",futext);
        request.getRequestDispatcher("index.jsp").forward(request,response);
    }
}

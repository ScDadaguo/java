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

/**
 * Created by Administrator on 2018/6/4.
 */
@WebServlet("/Servlet_fuText")
public class Servlet_fuText extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    doGet(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String biaoti = request.getParameter("h1");
        String text = request.getParameter("paras");
        System.out.println(biaoti);
        System.out.println(text);
        int num=0;
        Futext futext = new Futext();
        futext.setText(text);
        futext.setTitle(biaoti);
//        int num = 0;

        FutextDao futextDao = new FutextDao();
        num = futextDao.insert(futext);
        System.out.println("插入数据库成功");
        request.getRequestDispatcher("/Servlet_printText").forward(request,response);
    }
}

package servlet;

import Entity.Admin;
import SQL.AdminDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * Created by Administrator on 2018/5/21.
 */
@WebServlet( "/ServletLogin")
public class ServletLogin extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
doGet(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String LoginId=request.getParameter("LoginId");
        String LoginPwd=request.getParameter("LoginPwd");
        AdminDao adminDao=new AdminDao();
        Admin admin=new Admin();
        admin.setLoginPwd(LoginPwd);
        admin.setLoginId(Integer.parseInt(LoginId));
        Admin ad=adminDao.login(admin);

        if(ad!=null){
            HttpSession session=request.getSession();
            session.setAttribute("admin",ad);
            request.getRequestDispatcher("ServletList").forward(request,response);
        }else {
            request.setAttribute("loginError", "不存在该用户");          // 设置错误属性
            request.getRequestDispatcher("login.jsp").forward(request,response);
        }


    }
}

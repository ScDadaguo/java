package servlet;

import SQL.SQLBean;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;

/**
 * Created by Administrator on 2018/5/23.
 */
@WebServlet("/ServletDELETE")
public class ServletDELETE extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            String id =request.getParameter("Classid");
            CallableStatement cstmt=null;
            SQLBean sqlBean=new SQLBean();
            Connection conn=sqlBean.getConnection();
            int row=0;
            try {
                cstmt=conn.prepareCall("{call p1(?)}");
                cstmt.setInt(1,Integer.parseInt(id));
                cstmt.executeUpdate();
            } catch (SQLException e) {
                e.printStackTrace();
            }
            request.getRequestDispatcher("ServletList").forward(request,response);

    }
}

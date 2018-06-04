package Filter;//package Filter;
//
//import Entity.Admin;
//
//
//import javax.servlet.*;
//import javax.servlet.annotation.WebFilter;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpSession;
//import java.io.IOException;
//
///**
// * Created by Administrator on 2018/5/23.
// */
//@WebFilter(filterName = "FilterLogin")
//public class FilterLogin implements Filter {
//    public void destroy() {
//    }
//
//    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws ServletException, IOException {
//        HttpServletRequest request =(HttpServletRequest) req;
//        HttpServletRequest response=(HttpServletRequest) resp;
//        String uri=request.getRequestURI();
//        String path=uri.substring(uri.lastIndexOf("/")+1,uri.length());
//        System.out.println(path);
//        if(path.equals("login.jsp")||path.equals("ServletLogin")){
//            chain.doFilter(req,resp);
//        }else {
//            HttpSession session=request.getSession();
//            Admin ad=(Admin)session.getAttribute("user");
//            if(ad!=null){
//                chain.doFilter(req,resp);
//            }else{
//                request.getRequestDispatcher("login.jsp").forward(request,response);
//            }
//        }
//
//    }
//
//    public void init(FilterConfig config) throws ServletException {
//
//    }
//
//}

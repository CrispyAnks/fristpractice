package servlets;

import dao.UserDAO;
import dataobject.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(urlPatterns = {"/login","/logout"})
public class LoginServlet extends HttpServlet {
    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String servletPath = request.getServletPath();
        if("/login".equals(servletPath)){
            doLogin(request, response);
        }else if("/logout".equals(servletPath)){
            doLogout(request, response);
        }else {
            response.sendRedirect(request.getContextPath() + "/index");
        }
    }

    private void doLogout(HttpServletRequest request, HttpServletResponse response) throws IOException {
        HttpSession session = request.getSession(false);
        if(session != null){
            session.invalidate();
            response.sendRedirect(request.getContextPath() + "/index");
        }
    }

    protected void doLogin(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html; charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        String username = request.getParameter("uname");
        String password = request.getParameter("pswd");
        int user_id = UserDAO.getID(username, password);
        if(user_id != -1){
            HttpSession session = request.getSession();
            session.setAttribute("userid", user_id);
            response.sendRedirect(request.getContextPath() + "/mypage");
        }else{
            response.sendRedirect(request.getContextPath() + "/page/login.jsp");
        }
    }

}

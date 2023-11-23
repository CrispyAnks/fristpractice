package servlets;

import dao.UserDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(urlPatterns = {"/mypage","/signup"})
public class UserServlet extends HttpServlet {
    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String servletPath = request.getServletPath();
        HttpSession session = request.getSession(false);
        if(session != null && session.getAttribute("userid") != null){
            if("/mypage".equals(servletPath)){
                doList(request, response);
            } else{
                response.sendRedirect(request.getContextPath() + "/login");
            }
        }else {
            if("/signup".equals(servletPath)){
                doSignup(request, response);
            }else {
                response.sendRedirect(request.getContextPath() + "/login");
            }
        }

    }

    private void doSignup(HttpServletRequest request, HttpServletResponse response) {
        try {
            if(UserDAO.signUp(request.getParameter("gender"), request.getParameter("intro"),request.getParameter("username"),request.getParameter("pswd"))){
                request.setAttribute("check_signup", true);
                request.getRequestDispatcher("/page/signup.jsp").forward(request, response);
            }else {
                request.setAttribute("check_signup", false);
                request.getRequestDispatcher("/page/signup.jsp").forward(request, response);
            }
        } catch (Exception e) {
            request.setAttribute("check_signup", false);
            try {
                request.getRequestDispatcher("/page/signup.jsp").forward(request, response);
            } catch (ServletException ex) {
                throw new RuntimeException(ex);
            } catch (IOException ex) {
                throw new RuntimeException(ex);
            }
        }
    }

    private void doList(HttpServletRequest request, HttpServletResponse response) {
        int userId = (int)request.getSession().getAttribute("userid");
        try {
            ArrayList arrayList = UserDAO.myPage(userId);
            request.setAttribute("user", arrayList.get(0));
            request.setAttribute("bio", arrayList.get(1));
            request.setAttribute("mark", arrayList.get(2));
            request.getRequestDispatcher("/page/mypage.jsp").forward(request, response);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}

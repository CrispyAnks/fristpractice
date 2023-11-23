package servlets;

import dao.CataDAO;
import dao.NewsDAO;
import dataobject.Game;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(urlPatterns = {"/index","/search","/gosignup","/gologin","/news","/contact"})
public class IndexServlet extends HttpServlet {
    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String servletPath = request.getServletPath();
        if("/index".equals(servletPath)){
                doList(request, response);
        } else if ("/search".equals(servletPath)) {
            goSearch(request,response);
        }else if ("/gosignup".equals(servletPath)) {
            goSignUp(request, response);
        }else if ("/gologin".equals(servletPath)) {
            goLogIn(request, response);
        }else if ("/contact".equals(servletPath)) {
            goContact(request, response);
        }else if ("/news".equals(servletPath)) {
            goNews(request, response);
        } else{
            response.sendRedirect(request.getContextPath() + "/index");
        }

    }

    private void goNews(HttpServletRequest request, HttpServletResponse response){
        try {
            request.setAttribute("news", NewsDAO.news_select());
            request.getRequestDispatcher("/page/news.jsp").forward(request, response);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    private void goContact(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.sendRedirect(request.getContextPath() + "/page/contact.jsp");
    }


    private void goLogIn(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.sendRedirect(request.getContextPath() + "/page/login.jsp");
    }

    private void goSignUp(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.sendRedirect(request.getContextPath() + "/page/signup.jsp");
    }

    private void goSearch(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.sendRedirect(request.getContextPath() + "/page/search.jsp");
    }

    private void doList(HttpServletRequest request, HttpServletResponse response) {
        try {
            ArrayList<?> gameInfoList = CataDAO.ranking("rel_date");
            List<Game> newgames = (List<Game>) gameInfoList.get(0);
            ArrayList<String> intro = (ArrayList<String>) gameInfoList.get(1);
            List<Game> games = CataDAO.ranking();
            request.setAttribute("news_index", NewsDAO.news_select(3));
            request.setAttribute("gamelist", games);
            request.setAttribute("newgames", newgames);
            request.setAttribute("newintro", intro);
            request.getRequestDispatcher("/page/index.jsp").forward(request, response);
        }catch (Exception e){
            throw new RuntimeException(e);
        }
    }
}

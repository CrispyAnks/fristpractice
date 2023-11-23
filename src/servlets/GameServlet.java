package servlets;

import dao.GameDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(urlPatterns = {"/game", "/result"})
public class GameServlet extends HttpServlet {
    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String servletPath = request.getServletPath();
        if("/game".equals(servletPath)){
            doList(request, response);
        } else if ("/result".equals(servletPath)) {
            doSearch(request, response);
        } else if (request.getParameter("game_name") == null) {
            response.sendRedirect(request.getContextPath() + "/page/search.jsp");
        } else{
            response.sendRedirect(request.getContextPath() + "/index");
        }
    }

    private void doSearch(HttpServletRequest request, HttpServletResponse response) {
        try {
            ArrayList arrayList = GameDAO.searchByName(request.getParameter("game_name"));
            request.setAttribute("result_info", arrayList.get(1));
            request.setAttribute("result", arrayList.get(0));
            request.getRequestDispatcher("/page/search.jsp").forward(request, response);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    private void doList(HttpServletRequest request, HttpServletResponse response) {
        try {
            ArrayList arrayList = GameDAO.gamePage(request.getParameter("id"));
            request.setAttribute("game", arrayList.get(0));
            request.setAttribute("tag", arrayList.get(1));
            request.setAttribute("info", arrayList.get(2));
            request.setAttribute("comments", arrayList.get(3));
            request.getRequestDispatcher("/page/game.jsp").forward(request,response);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }

    }
}

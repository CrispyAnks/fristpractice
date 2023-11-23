package servlets;

import dao.CataDAO;
import dataobject.Game;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(urlPatterns = "/catalog")
public class CatalogServlet extends HttpServlet {
    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String servletPath = request.getServletPath();
        if(servletPath.equals("/catalog")){
            doCatalog(request, response);
        }else {
            response.sendRedirect(request.getContextPath() + "/index");
        }
    }

    private void doCatalog(HttpServletRequest request, HttpServletResponse response) {
        try {
            List<Game> gamesByPlat = CataDAO.ranking(1);
            if(gamesByPlat != null){
                request.setAttribute("switch", gamesByPlat);
                request.getRequestDispatcher("/page/catalogs.jsp").forward(request, response);
            }
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}

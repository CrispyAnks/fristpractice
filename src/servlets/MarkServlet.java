package servlets;

import org.apache.commons.dbutils.QueryRunner;
import utils.DBConnection;
import utils.SQLOperation;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

@WebServlet(urlPatterns = {"/mark/delete","/mark/manage","/mark/add"})
public class MarkServlet extends HttpServlet {
    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String servletPath = request.getServletPath();
        if("/mark/delete".equals(servletPath)){
            doDel(request, response);
        }else if("/mark/manage".equals(servletPath)){
            doManage(request, response);
        } else if ("/mark/add".equals(servletPath)) {
            doAdd(request, response);
        } else{
            response.sendRedirect(request.getContextPath() + "/index");
        }
    }

    private void doAdd(HttpServletRequest request, HttpServletResponse response) {
        String id = request.getParameter("com_id");
        String rating = request.getParameter("rating");
        String status = request.getParameter("status");
        String comment = request.getParameter("comment");
        String user_id = request.getParameter("user_id");
        String game_id = request.getParameter("game_id");
        String addMark = "insert into mark values (?, ?, ?, ?, date_format(now(), '%Y-%m-%d'), ?, ?)";
        try {
            SQLOperation.executeDAO(addMark, id, status, rating, comment, user_id, game_id);
            response.sendRedirect(request.getContextPath() + "/game?id=" + game_id);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    private void doManage(HttpServletRequest request, HttpServletResponse response) {
        String id = request.getParameter("com_id");
        String rating = request.getParameter("rating");
        String status = request.getParameter("status");
        String comment = request.getParameter("comment");
        String setMark = "update mark set rating = ?,status = ?, comment = ?, comment_date = date_format(now(), '%Y-%m-%d') where id = ?";
        try {
            SQLOperation.executeDAO(setMark, rating, status, comment, id);
            response.sendRedirect(request.getContextPath() + "/mypage");
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    private void doDel(HttpServletRequest request, HttpServletResponse response) {
        String id = request.getParameter("com_id");
        String delCom = "delete from mark where id=?";
        try {
            SQLOperation.executeDAO(delCom, id);
            response.sendRedirect(request.getContextPath() + "/mypage");
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}

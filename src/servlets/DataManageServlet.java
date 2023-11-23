package servlets;

import dao.CommonDAO;
import utils.SQLOperation;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(urlPatterns = {"/manage", "/update"})
public class DataManageServlet extends HttpServlet {
    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String servletPath = request.getServletPath();
        HttpSession session = request.getSession(false);
        if (servletPath.equals("/manage")) {
            if (session != null && (int)session.getAttribute("userid") == 1) {
                doManage(request, response);
            }else {
                response.sendRedirect(request.getContextPath() + "/login");
            }
        } else if (servletPath.equals("/update")) {
                doUpdate(request, response);
        } else {
            response.sendRedirect(request.getContextPath() + "/index");
        }
    }

    private void doUpdate(HttpServletRequest request, HttpServletResponse response) {
        String commit = request.getParameter("commit");
        String condition = request.getParameter("condition");
        String conditionColumn = request.getParameter("condition_column");
        String updateValue = request.getParameter("update_value");
        String updateColumn = request.getParameter("update_column");
        String insertValue = request.getParameter("insert_value");
        String table = request.getParameter("table");
        boolean manage_result;
        try {
            if(commit.equals("add")){
                manage_result = CommonDAO.dataManage_add(table, insertValue);
            } else if (commit.equals("update")) {
                manage_result = CommonDAO.dataManage_update(table, updateColumn, updateValue, condition, conditionColumn);
            } else if (commit.equals("delete")) {
                manage_result = CommonDAO.dataManage_delete(table, condition, conditionColumn);
            }else {
                manage_result = false;
            }
            if(manage_result){
                response.sendRedirect(request.getContextPath() + "/page/data_manage.jsp");
            }else {
                request.setAttribute("data_manage_result", false);
                request.getRequestDispatcher("/page/data_manage.jsp").forward(request, response);
            }
        }catch (SQLException e) {
            request.setAttribute("data_manage_result", false);
            try {
                request.getRequestDispatcher("/page/data_manage.jsp").forward(request, response);
            } catch (ServletException ex) {
                throw new RuntimeException(ex);
            } catch (IOException ex) {
                throw new RuntimeException(ex);
            }
        }catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }

    }

    private void doManage(HttpServletRequest request, HttpServletResponse response) {
        String table_name = request.getParameter("table");
        try {
            Class<?> aClass = Class.forName("dataobject." + table_name);
            String get = "select * from " + table_name;
            List<?> tableList = SQLOperation.getDAOList(aClass, get);
            request.setAttribute("tableName", table_name);
            request.setAttribute("tableList", tableList);
            request.getRequestDispatcher("/page/data_manage.jsp").forward(request, response);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }


}

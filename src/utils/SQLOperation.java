package utils;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

public class SQLOperation {
    static private QueryRunner queryRunner = null;

    public static QueryRunner getQueryrunner(){
        queryRunner = new QueryRunner();
        return queryRunner;
    }

    public static <T>T getDAObject(Class<T> type, String sql, Object... paras){
        Connection dbConnection = DBConnection.getDBConnection();
        QueryRunner queryrunner = SQLOperation.getQueryrunner();
        try {
            return queryrunner.query(dbConnection, sql, new BeanHandler<>(type), paras);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }finally {
            DBConnection.close(dbConnection, null, null);
        }
    }

    public static <T> List<T>  getDAOList(Class<T> type, String sql, Object... paras){
        Connection dbConnection = DBConnection.getDBConnection();
        QueryRunner queryrunner = SQLOperation.getQueryrunner();
        try {
            return queryrunner.query(dbConnection, sql, new BeanListHandler<>(type), paras);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }finally {
            DBConnection.close(dbConnection, null, null);
        }
    }

    public static <T>T getDAOsingle(String sql, Object... paras){
        Connection dbConnection = DBConnection.getDBConnection();
        QueryRunner queryrunner = SQLOperation.getQueryrunner();
        try {
            return queryrunner.query(dbConnection, sql, new ScalarHandler<>(), paras);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }finally {
            DBConnection.close(dbConnection, null, null);
        }
    }

    public static int executeDAO(String sql, Object... paras) throws SQLException{
        Connection dbConnection = DBConnection.getDBConnection();
        QueryRunner queryrunner = SQLOperation.getQueryrunner();
        int i = queryrunner.execute(dbConnection, sql, paras);
        DBConnection.close(dbConnection, null, null);
        return i;
    }
}

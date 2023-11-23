package utils;

import com.alibaba.druid.pool.DruidDataSourceFactory;

import javax.sql.DataSource;
import java.io.FileInputStream;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Properties;

public class DBConnection {
    static private Connection connection = null;
    static private Statement statement = null;
    static private ResultSet resultSet = null;

    public static Connection getDBConnection(){
        try{
            Properties properties = new Properties();
            properties.load(new FileInputStream("/Users/makoto.choel/IdeaProjects/gamerk/src/utils/druid.properties"));
            DataSource dataSource = DruidDataSourceFactory.createDataSource(properties);
            connection = dataSource.getConnection();
        }catch (Exception e){
            throw new RuntimeException();
        }
        return connection;
    }

    public static void close(Connection connection, Statement statement, ResultSet resultSet) {
        try {
            if (connection != null) {
                connection.close();
            }
            if (statement != null) {
                statement.close();
            }
            if (resultSet != null) {
                resultSet.close();
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

}

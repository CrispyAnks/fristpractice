package dao;

import utils.SQLOperation;

import java.sql.SQLException;

public class CommonDAO {

    public static boolean dataManage_add(String table, String insertValue) throws SQLException {
        String exec = "insert into " + table + " values ( " + insertValue + " )";
        int i = SQLOperation.executeDAO(exec);
        if(i == 1){
            return true;
        }else {
            return false;
        }
    }

    public static boolean dataManage_update(String table, String updateColumn, String updateValue, String condition, String conditionColumn) throws SQLException {
        String exec = "update " + table + " set " + updateColumn + " = ? where " + conditionColumn + " = ?";
        int i = SQLOperation.executeDAO(exec, updateValue, condition);
        if(i == 1){
            return true;
        }else {
            return false;
        }
    }

    public static boolean dataManage_delete(String table, String condition, String conditionColumn) throws SQLException {
        String exec = "delete from " + table + " where "+ conditionColumn + " = ?";
        int i = SQLOperation.executeDAO(exec, condition);
        if(i == 1){
            return true;
        }else {
            return false;
        }
    }

}

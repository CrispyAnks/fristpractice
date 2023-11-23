package dao;

import dataobject.Bio;
import dataobject.Mark;
import dataobject.User;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import utils.DBConnection;
import utils.SQLOperation;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

public class UserDAO {

    public static Integer getID(String username, String password) {
        Connection connection = null;
        QueryRunner queryrunner = SQLOperation.getQueryrunner();
        String check = "select * from user where username = ?";
        try {
            connection = DBConnection.getDBConnection();
            User loginUser = queryrunner.query(connection, check, new BeanHandler<>(User.class), username);
            if (loginUser.getPassword().equals(password)) {
                return loginUser.getId();
            } else {
                return -1;
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            DBConnection.close(connection, null, null);
        }
    }

    public static boolean signUp(String gender, String intro, String username, String pswd) throws SQLException{
        String RegUser = "insert into user values (null, ?, ?, ?)";
        String RegBio = "insert into bio values(?, ?, ?, ?)";
        String Last = "select id from user order by id desc limit 1";

        int lastId = SQLOperation.getDAOsingle(Last);
        int thisId = lastId + 1;
        int bio = SQLOperation.executeDAO(RegBio, "bio"+thisId, gender, intro, "/page/img/avatar.png");
        int user= SQLOperation.executeDAO(RegUser, username, pswd, "bio"+thisId);

        if(user == 1 && bio == 1){
            return true;
        }else {
            String del = "delete from delete from bio where id = ?";
            SQLOperation.executeDAO(del, "bio"+thisId);
           return false;
        }
    }

    public static ArrayList myPage(int userId){
        ArrayList<Object> myPageEle = new ArrayList<>();
        String loginedUser = "select * from user where id = ?";
        String userBio = "select * from bio where id = ?";
        String userMark = "select mark.*,user.username,game.name from mark,user,game where mark.user_id = ? and mark.user_id=user.id and mark.game_id=game.id order by comment_date desc";

        User LoginedUser = SQLOperation.getDAObject(User.class, loginedUser, userId);
        Bio bio = SQLOperation.getDAObject(Bio.class, userBio, LoginedUser.getBio_id());
        List<Mark> markList = SQLOperation.getDAOList(Mark.class, userMark, LoginedUser.getId());

        myPageEle.add(LoginedUser);
        myPageEle.add(bio);
        myPageEle.add(markList);

        return myPageEle;
    }

}

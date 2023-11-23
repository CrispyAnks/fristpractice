package dao;

import dataobject.Game;
import dataobject.Mark;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;
import utils.DBConnection;
import utils.SQLOperation;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;

public class CataDAO {

    public static List<Game> ranking(int platform) throws Exception{
        List<Game> gamesByPlat = new ArrayList<>();
        Connection dbConnection = DBConnection.getDBConnection();
        QueryRunner queryrunner = SQLOperation.getQueryrunner();
        String getGameId = "select game_id from mark group by game_id order by count(*) desc;";
        String get = "select game.id, game.name from game left join info on game.info_id = info.id where game.id= ? and platform = ?;";
        List<Mark> gameIds = queryrunner.query(dbConnection, getGameId, new BeanListHandler<>(Mark.class));
        for (Mark gameid: gameIds) {
            Game game = queryrunner.query(dbConnection, get, new BeanHandler<>(Game.class), gameid.getGame_id(), platform);
            gamesByPlat.add(game);
        }
        DBConnection.close(dbConnection, null, null);
        return gamesByPlat;
    }

    public static  List<Game> ranking(){
        String getGameId = "select game_id from mark group by game_id order by count(*) desc limit 3;";
        String get = "select * from game where id = ?";
        List<Mark> gameIds = SQLOperation.getDAOList(Mark.class, getGameId);
        List<Game> games = new ArrayList<>();
        for (Mark gameid: gameIds) {
            Game game = SQLOperation.getDAObject(Game.class, get, gameid.getGame_id());
            games.add(game);
        }
        return games;
    }

    public static ArrayList<?> ranking(String condi){
        String getNewgame = "select * from game order by " + condi + " desc limit 3";
        String getInfo = "select intro from info where id = ?";
        List<Game> newgames = SQLOperation.getDAOList(Game.class, getNewgame);
        ArrayList<String> intro = new ArrayList<>();
        for (Game game : newgames) {
            String infoId = game.getInfo_id();
            String re_intro = SQLOperation.getDAOsingle(getInfo, infoId);
            intro.add(re_intro);
        }
        ArrayList<Object> gameInfoList = new ArrayList<>();
        gameInfoList.add(newgames);
        gameInfoList.add(intro);
        return gameInfoList;
    }

}

package dao;

import dataobject.Game;
import dataobject.Info;
import dataobject.Mark;
import dataobject.Tag;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import utils.DBConnection;
import utils.SQLOperation;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class GameDAO {

    public static ArrayList searchByName(String gameName){
        ArrayList<Object> objects = new ArrayList<>();

        String getSearch = "select * from game where name like ?";
        String getInfo = "select * from info where id = ?";

        List<Game> games = SQLOperation.getDAOList(Game.class, getSearch, "%"+gameName+"%");
        List<Info> infoList = new ArrayList<>();
        for (Game game : games) {
            Info info  = SQLOperation.getDAObject(Info.class, getInfo,game.getInfo_id());
            infoList.add(info);
        }

        objects.add(games);
        objects.add(infoList);

        return objects;
    }

    public static ArrayList gamePage(String id){
        ArrayList<Object> objects = new ArrayList<>();

        String getGame = "select game.*,avg(rating)as'rating' from game left join mark on game.id=mark.game_id where game.id=?";
        String getTag = "select tag.* from tag right join game on tag.id=game.tag_id where game.id=?";
        String getInfo = "select info.* from info right join game on info.id=game.info_id where game.id=?";
        String getComm = "select mark.*, user.username from mark left join user on mark.user_id=user.id where mark.game_id=?";

        Game game = SQLOperation.getDAObject(Game.class, getGame, id);
        Tag tag = SQLOperation.getDAObject(Tag.class, getTag, id);
        Info info = SQLOperation.getDAObject(Info.class, getInfo, id);
        List<Mark> comments = SQLOperation.getDAOList(Mark.class, getComm, id);

        objects.add(game);
        objects.add(tag);
        objects.add(info);
        objects.add(comments);

        return objects;
    }

}

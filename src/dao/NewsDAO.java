package dao;

import dataobject.News;
import utils.SQLOperation;

import java.util.List;

public class NewsDAO {
    public static List<News> news_select(){
        String get = "select * from news";
        return SQLOperation.getDAOList(News.class, get);
    }

    public static List<News> news_select(int limit){
        String get = "select * from news limit ?";
        return SQLOperation.getDAOList(News.class, get, limit);
    }

}

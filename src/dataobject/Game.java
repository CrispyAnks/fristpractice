package dataobject;

import java.util.Date;

public class Game {
    private int id;
    private String name;
    private Date rel_date;
    private String info_id;
    private String tag_id;
    private double rating;

    public Game() {
    }

    public double getRating() {
        return rating;
    }

    public void setRating(double rating) {
        this.rating = rating;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Date getRel_date() {
        return rel_date;
    }

    public void setRel_date(Date rel_date) {
        this.rel_date = rel_date;
    }

    public String getInfo_id() {
        return info_id;
    }

    public void setInfo_id(String info_id) {
        this.info_id = info_id;
    }

    public String getTag_id() {
        return tag_id;
    }

    public void setTag_id(String tag_id) {
        this.tag_id = tag_id;
    }

    @Override
    public String toString() {
        return "Game{" +
                "game_id=" + id +
                ", game_name='" + name + '\'' +
                ", rel_date=" + rel_date +
                ", info_id='" + info_id + '\'' +
                ", tag_id='" + tag_id + '\'' +
                ", mark_id='" +
                '}';
    }
}

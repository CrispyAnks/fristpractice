package dataobject;

import java.util.Date;

public class Mark {
    private String id;
    private int status;
    private double rating;
    private String comment;

    private int user_id;
    private String username;
    private int game_id;
    private String name;

    private int popularity;


    public void setPopularity(int popularity) {
        this.popularity = popularity;
    }

    public Date getComment_date() {
        return comment_date;
    }

    public void setComment_date(Date comment_date) {
        this.comment_date = comment_date;
    }

    private Date comment_date;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public int getGame_id() {
        return game_id;
    }

    public void setGame_id(int game_id) {
        this.game_id = game_id;
    }

    public Mark() {
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public double getRating() {
        return rating;
    }

    public void setRating(double rating) {
        this.rating = rating;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Override
    public String toString() {
        return "Mark{" +
                "id='" + id + '\'' +
                ", status=" + status +
                ", rating=" + rating +
                ", comment='" + comment + '\'' +
                ", user_id=" + user_id +
                ", game_id=" + game_id +
                ", comment_date=" + comment_date +
                '}';
    }
}

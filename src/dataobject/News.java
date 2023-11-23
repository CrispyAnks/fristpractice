package dataobject;

import java.util.Date;

public class News {
    private int id;
    private String title;
    private String src;
    private Date news_date;

    public News() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getSrc() {
        return src;
    }

    public void setSrc(String src) {
        this.src = src;
    }

    public Date getNews_date() {
        return news_date;
    }

    public void setNews_date(Date news_date) {
        this.news_date = news_date;
    }

    @Override
    public String toString() {
        return "News{" +
                "id=" + id +
                ", title='" + title + '\'' +
                ", src='" + src + '\'' +
                ", news_date=" + news_date +
                '}';
    }
}

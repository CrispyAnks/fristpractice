package dataobject;

public class Info {
    private String id;
    private int platform;
    private String producer;
    private String main_staff;
    private String intro;
    private String img_src;

    public Info() {
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public int getPlatform() {
        return platform;
    }

    public void setPlatform(int platform) {
        this.platform = platform;
    }

    public String getProducer() {
        return producer;
    }

    public void setProducer(String producer) {
        this.producer = producer;
    }

    public String getMain_staff() {
        return main_staff;
    }

    public void setMain_staff(String main_staff) {
        this.main_staff = main_staff;
    }

    public String getIntro() {
        return intro;
    }

    public void setIntro(String intro) {
        this.intro = intro;
    }

    public String getImg_src() {
        return img_src;
    }

    public void setImg_src(String img_src) {
        this.img_src = img_src;
    }

    @Override
    public String toString() {
        return "Info{" +
                "info_id='" + id + '\'' +
                ", platform=" + platform +
                ", producer='" + producer + '\'' +
                ", main_staff='" + main_staff + '\'' +
                ", intro='" + intro + '\'' +
                ", img_src='" + img_src + '\'' +
                '}';
    }
}

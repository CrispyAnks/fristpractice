package dataobject;

public class Bio {
    private String id;
    private String gender;
    private String intro;
    private String img_src;

    public Bio() {
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
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
        return "Bio{" +
                "id='" + id + '\'' +
                ", gender='" + gender + '\'' +
                ", intro='" + intro + '\'' +
                ", img_src='" + img_src + '\'' +
                '}';
    }
}

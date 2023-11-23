package dataobject;

public class Tag {
    private String id;
    private int tag_01;
    private int tag_02;
    private int tag_03;

    public Tag() {
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public int getTag_01() {
        return tag_01;
    }

    public void setTag_01(int tag_01) {
        this.tag_01 = tag_01;
    }

    public int getTag_02() {
        return tag_02;
    }

    public void setTag_02(int tag_02) {
        this.tag_02 = tag_02;
    }

    public int getTag_03() {
        return tag_03;
    }

    public void setTag_03(int tag_03) {
        this.tag_03 = tag_03;
    }

    @Override
    public String toString() {
        return "Tag{" +
                "id='" + id + '\'' +
                ", tag_01=" + tag_01 +
                ", tag_02=" + tag_02 +
                ", tag_03=" + tag_03 +
                '}';
    }
}

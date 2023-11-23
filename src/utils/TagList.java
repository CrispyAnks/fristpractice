package utils;

import java.util.ArrayList;

public class TagList {
    static private ArrayList<String> tag01List = new ArrayList<>();
    static private ArrayList<String> tag02List = new ArrayList<>();
    static private ArrayList<String> tag03List = new ArrayList<>();

    static {
        String[] tag01 = {" ", "ARPG", "JRPG", "CRPG"};
        String[] tag02 = {" ", "Adventure", "Rouge-like", "Racing"};
        String[] tag03 = {" ", "Funny", "Classic", "Touching"};
        for (String tag : tag01) {
            tag01List.add(tag);
        }
        for (String tag : tag02) {
            tag02List.add(tag);
        }
        for (String tag : tag03) {
            tag03List.add(tag);
        }
    }

    public static ArrayList<String> getTag01List() {
        return tag01List;
    }

    public static ArrayList<String> getTag02List() {
        return tag02List;
    }

    public static ArrayList<String> getTag03List() {
        return tag03List;
    }
}

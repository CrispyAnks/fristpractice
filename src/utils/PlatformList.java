package utils;

import java.util.ArrayList;

public class PlatformList {
    static private ArrayList<String> platformList = new ArrayList<>();

    static {
        String[] platforms = {" ", "Nintendo Switch", "PS5", "PC"};
        for (String platform : platforms) {
            platformList.add(platform);
        }
    }

    public static ArrayList<String> getPlatformList() {
        return platformList;
    }
}

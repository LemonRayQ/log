package cn.pzhu.logistics.pojo;

import java.io.Serializable;

public class Level implements Serializable {

    private Integer levelId;
    private String name;

    public Integer getLevelId() {
        return levelId;
    }

    public void setLevelId(Integer levelId) {
        this.levelId = levelId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Override
    public String toString() {
        return "Level{" +
                "levelId=" + levelId +
                ", name='" + name + '\'' +
                '}';
    }
}

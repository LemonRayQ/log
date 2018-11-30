package cn.pzhu.logistics.pojo;

import org.apache.ibatis.type.Alias;

import java.io.Serializable;

@Alias(value = "Shuffling")
public class Shuffling implements Serializable {
    private Integer shufflingId;
    private String path;

    public Shuffling() {
    }

    public Shuffling(Integer shufflingId, String path) {
        this.shufflingId = shufflingId;
        this.path = path;
    }

    public Integer getShufflingId() {
        return shufflingId;
    }

    public void setShufflingId(Integer shufflingId) {
        this.shufflingId = shufflingId;
    }

    public String getPath() {
        return path;
    }

    public void setPath(String path) {
        this.path = path;
    }

    @Override
    public String toString() {
        return "Shuffling{" +
                "shufflingId=" + shufflingId +
                ", path='" + path + '\'' +
                '}';
    }
}

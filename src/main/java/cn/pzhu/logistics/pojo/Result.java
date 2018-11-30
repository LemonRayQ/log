package cn.pzhu.logistics.pojo;

import java.io.Serializable;

/**
 * @author Impassive_y
 * @date 2018/11/11 19:16
 */
public class Result implements Serializable {
    private Integer id;
    private String title;
    private String content;
    private String path;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getPath() {
        return path;
    }

    public void setPath(String path) {
        this.path = path;
    }

    @Override
    public String toString() {
        return "Result{" +
                "id=" + id +
                ", title='" + title + '\'' +
                ", content='" + content + '\'' +
                ", path='" + path + '\'' +
                '}';
    }
}

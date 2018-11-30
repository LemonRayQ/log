package cn.pzhu.logistics.pojo;

import java.io.Serializable;
import java.sql.Timestamp;

public class Policy implements Serializable {
    private Integer policyId;
    private String title;
    private String content;
    private Timestamp time;
    private String path;
    private Integer levelId;
    private Level level;
    private Integer approval;
    private Integer importance;

    public Integer getPolicyId() {
        return policyId;
    }

    public void setPolicyId(Integer policyId) {
        this.policyId = policyId;
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

    public Timestamp getTime() {
        return time;
    }

    public void setTime(Timestamp time) {
        this.time = time;
    }

    public Integer getLevelId() {
        return levelId;
    }

    public void setLevelId(Integer levelId) {
        this.levelId = levelId;
    }

    public String getPath() {
        return path;
    }

    public void setPath(String path) {
        this.path = path;
    }

    public Level getLevel() {
        return level;
    }

    public void setLevel(Level level) {
        this.level = level;
    }

    public Integer getApproval() {

        return approval;
    }

    public void setApproval(Integer approval) {
        this.approval = approval;
    }

    public Integer getImportance() {
        return importance;
    }

    public void setImportance(Integer importance) {
        this.importance = importance;
    }

    @Override
    public String toString() {
        return "Policy{" +
                "policyId=" + policyId +
                ", title='" + title + '\'' +
                ", content='" + content + '\'' +
                ", time=" + time +
                ", path='" + path + '\'' +
                ", levelId=" + levelId +
                ", level=" + level +
                ", approval=" + approval +
                ", importance=" + importance +
                '}';
    }
}

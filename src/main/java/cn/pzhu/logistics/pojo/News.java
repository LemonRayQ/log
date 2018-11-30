package cn.pzhu.logistics.pojo;

import org.apache.ibatis.type.Alias;

import java.io.Serializable;
import java.sql.Timestamp;

@Alias(value = "News")
public class News implements Serializable {

    private Integer newsId;
    private String title;
    private String content;
    private Timestamp time;
    private String path;
    private Integer deptId;
    private Integer classId;
    private Integer readNum;
    private Department department;
    private Classify classify;
    private Integer approval;
    private Integer importance;

    public Classify getClassify() {
        return classify;
    }

    public void setClassify(Classify classify) {
        this.classify = classify;
    }

    public Department getDepartment() {
        return department;
    }

    public void setDepartment(Department department) {
        this.department = department;
    }


    public Integer getNewsId() {
        return newsId;
    }

    public void setNewsId(Integer newsId) {
        this.newsId = newsId;
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


    public java.sql.Timestamp getTime() {
        return time;
    }

    public void setTime(java.sql.Timestamp time) {
        this.time = time;
    }


    public String getPath() {
        return path;
    }

    public void setPath(String path) {
        this.path = path;
    }


    public Integer getDeptId() {
        return deptId;
    }

    public void setDeptId(Integer deptId) {
        this.deptId = deptId;
    }


    public Integer getClassId() {
        return classId;
    }

    public void setClassId(Integer classId) {
        this.classId = classId;
    }

    public Integer getReadNum() {
        return readNum;
    }

    public void setReadNum(Integer readNum) {
        this.readNum = readNum;
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
        return "News{" +
                "newsId=" + newsId +
                ", title='" + title + '\'' +
                ", content='" + content + '\'' +
                ", time=" + time +
                ", path='" + path + '\'' +
                ", deptId=" + deptId +
                ", classId=" + classId +
                ", readNum=" + readNum +
                ", department=" + department +
                ", classify=" + classify +
                ", approval=" + approval +
                ", importance=" + importance +
                '}';
    }
}

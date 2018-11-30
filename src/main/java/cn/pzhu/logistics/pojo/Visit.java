package cn.pzhu.logistics.pojo;

import org.apache.ibatis.type.Alias;

import java.io.Serializable;

@Alias(value = "Visit")
public class Visit implements Serializable {
    private Integer visitId;
    private Integer visitCount;

    public Visit() {
    }

    public Integer getVisitId() {
        return visitId;
    }

    public void setVisitId(Integer visitId) {
        this.visitId = visitId;
    }

    public Integer getCount() {
        return visitCount;
    }

    public void setCount(Integer visitCount) {
        this.visitCount = visitCount;
    }

    public Visit(Integer visitId, Integer visitCount) {
        this.visitId = visitId;
        this.visitCount = visitCount;
    }
}

package cn.pzhu.logistics.pojo;


import org.apache.ibatis.type.Alias;

import java.io.Serializable;

@Alias(value = "Classify")
public class Classify implements Serializable {

  private Integer classifyId;
  private String name;
  private Integer level;


  public Integer getClassifyId() {
    return classifyId;
  }

  public void setClassifyId(Integer classifyId) {
    this.classifyId = classifyId;
  }


  public String getName() {
    return name;
  }

  public void setName(String name) {
    this.name = name;
  }


  public Integer getLevel() {
    return level;
  }

  public void setLevel(Integer level) {
    this.level = level;
  }

  @Override
  public String toString() {
    return "Classify{" +
            "classifyId=" + classifyId +
            ", name='" + name + '\'' +
            ", level=" + level +
            '}';
  }
}

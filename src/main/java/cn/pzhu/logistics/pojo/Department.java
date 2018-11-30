package cn.pzhu.logistics.pojo;

import org.apache.ibatis.type.Alias;

import java.io.Serializable;

@Alias(value = "Department")
public class Department implements Serializable {

  private Integer deptId;
  private String name;


  public Integer getDeptId() {
    return deptId;
  }

  public void setDeptId(Integer deptId) {
    this.deptId = deptId;
  }


  public String getName() {
    return name;
  }

  public void setName(String name) {
    this.name = name;
  }

  @Override
  public String toString() {
    return "Department{" +
            "deptId=" + deptId +
            ", name='" + name + '\'' +
            '}';
  }
}

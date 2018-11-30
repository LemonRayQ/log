package cn.pzhu.logistics.pojo;

import org.apache.ibatis.type.Alias;

import java.io.Serializable;

@Alias(value = "UserLogin")
public class UserLogin implements Serializable {

  private String userId;
  private String password;
  private Integer identity;

  public Integer getIdentity() {
    return identity;
  }

  public void setIdentity(Integer identity) {
    this.identity = identity;
  }

  public String getUserId() {
    return userId;
  }

  public void setUserId(String userId) {
    this.userId = userId;
  }


  public String getPassword() {
    return password;
  }

  public void setPassword(String password) {
    this.password = password;
  }

  @Override
  public String toString() {
    return "UserLogin{" +
            "userId='" + userId + '\'' +
            ", password='" + password + '\'' +
            ", identity=" + identity +
            '}';
  }
}

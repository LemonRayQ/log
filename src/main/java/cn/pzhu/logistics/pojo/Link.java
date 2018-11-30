package cn.pzhu.logistics.pojo;

import org.apache.ibatis.type.Alias;

import java.io.Serializable;

@Alias(value = "Link")
public class Link implements Serializable {

  private long linkId;
  private String linkName;
  private String path;


  public long getLinkId() {
    return linkId;
  }

  public void setLinkId(long linkId) {
    this.linkId = linkId;
  }


  public String getLinkName() {
    return linkName;
  }

  public void setLinkName(String linkName) {
    this.linkName = linkName;
  }


  public String getPath() {
    return path;
  }

  public void setPath(String path) {
    this.path = path;
  }

    @Override
    public String toString() {
        return "Link{" +
                "linkId=" + linkId +
                ", linkName='" + linkName + '\'' +
                ", path='" + path + '\'' +
                '}';
    }
}

package cn.pzhu.logistics.dao;

import cn.pzhu.logistics.pojo.Link;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author Impassive_y
 * @date 2018/11/9 10:40
 */
public interface LinkDao {
    boolean addLink(Link link);
    List<Link> selectAllLink();
    boolean deleteLink(@Param(value = "id") int id);
    List<Link> selectLinkWithName(@Param(value = "name") String name);
    Link jumpLink(@Param(value = "id") int id);
}

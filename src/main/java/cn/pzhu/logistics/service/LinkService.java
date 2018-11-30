package cn.pzhu.logistics.service;

import cn.pzhu.logistics.pojo.Link;

import java.util.List;

/**
 * @author Impassive_y
 * @date 2018/11/8 21:21
 */
public interface LinkService {
    boolean addLink(Link link);
    List<Link> selectAllLink();
    boolean deleteLink(int id);
    List<Link> selectLinkWithName(String name);
    Link jumpLink(int id);
}

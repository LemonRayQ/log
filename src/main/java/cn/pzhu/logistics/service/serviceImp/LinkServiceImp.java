package cn.pzhu.logistics.service.serviceImp;

import cn.pzhu.logistics.dao.LinkDao;
import cn.pzhu.logistics.pojo.Link;
import cn.pzhu.logistics.service.LinkService;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * @author Impassive_y
 * @date 2018/11/9 10:38
 */
@Service(value = "linkService")
public class LinkServiceImp implements LinkService {

    @Resource(name = "sqlSessionFactory")
    private SqlSessionFactory sqlSessionFactory;

    @Override
    public boolean addLink(Link link) {
        SqlSession session = sqlSessionFactory.openSession();
        LinkDao mapper = session.getMapper(LinkDao.class);
        boolean b = mapper.addLink(link);
        session.close();
        return b;
    }

    @Override
    public List<Link> selectAllLink() {
        SqlSession session = sqlSessionFactory.openSession();
        LinkDao mapper = session.getMapper(LinkDao.class);
        List<Link> links = mapper.selectAllLink();
        session.close();
        return links;
    }

    @Override
    public boolean deleteLink(int id) {
        SqlSession session = sqlSessionFactory.openSession();
        LinkDao mapper = session.getMapper(LinkDao.class);
        boolean b = mapper.deleteLink(id);
        session.close();
        return b;
    }

    @Override
    public List<Link> selectLinkWithName(String name) {
        SqlSession session = sqlSessionFactory.openSession();
        LinkDao mapper = session.getMapper(LinkDao.class);
        List<Link> links = mapper.selectLinkWithName(name);
        session.close();
        return links;
    }

    @Override
    public Link jumpLink(int id) {
        SqlSession session = sqlSessionFactory.openSession();
        LinkDao mapper = session.getMapper(LinkDao.class);
        Link link = mapper.jumpLink(id);
        session.close();
        return link;
    }
    public void setSqlSessionFactory(SqlSessionFactory sqlSessionFactory) {
        this.sqlSessionFactory = sqlSessionFactory;
    }

}

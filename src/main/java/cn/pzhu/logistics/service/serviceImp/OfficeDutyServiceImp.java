package cn.pzhu.logistics.service.serviceImp;

import cn.pzhu.logistics.dao.NewsManagerDao;
import cn.pzhu.logistics.dao.OfficeDutyDao;
import cn.pzhu.logistics.pojo.News;
import cn.pzhu.logistics.pojo.OfficeDuty;
import cn.pzhu.logistics.service.OfficeDutyService;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * @author Impassive_y
 * @date 2018/11/12 13:58
 */
@Service(value = "officeDutyService")
public class OfficeDutyServiceImp implements OfficeDutyService {

    @Resource(name = "sqlSessionFactory")
    private SqlSessionFactory sqlSessionFactory;

    @Override
    public OfficeDuty selectOfficeDutywithId(int id) {
        SqlSession session = sqlSessionFactory.openSession();
        OfficeDutyDao mapper = session.getMapper(OfficeDutyDao.class);
        OfficeDuty officeDuty = mapper.selectOfficeDutywithId(id);
        session.close();
        return officeDuty;
    }

    @Override
    public boolean updateOfficeDuty(OfficeDuty officeDuty) {
        SqlSession session = sqlSessionFactory.openSession();
        OfficeDutyDao mapper = session.getMapper(OfficeDutyDao.class);
        boolean b = mapper.updateOfficeDuty(officeDuty);
        session.close();
        return b;
    }

    @Override
    public boolean updateIntroduce(News news) {
        SqlSession session = sqlSessionFactory.openSession();
        NewsManagerDao mapper = session.getMapper(NewsManagerDao.class);
        boolean b = mapper.updateIntroduce(news);
        session.close();
        return b;
    }

    @Override
    public News selectIntroduce() {
        SqlSession session = sqlSessionFactory.openSession();
        NewsManagerDao mapper = session.getMapper(NewsManagerDao.class);
        News news = mapper.selectIntroduce();
        session.close();
        return news;
    }

    @Override
    public List<OfficeDuty> selectOfficeDuty() {
        SqlSession session = sqlSessionFactory.openSession();
        OfficeDutyDao mapper = session.getMapper(OfficeDutyDao.class);
        List<OfficeDuty> officeDuties = mapper.selectOfficeDuty();
        session.close();
        return  officeDuties;
    }

    @Override
    public List<OfficeDuty> selectSingleOffice(int deptId) {
        SqlSession session = sqlSessionFactory.openSession();
        OfficeDutyDao mapper = session.getMapper(OfficeDutyDao.class);
        List<OfficeDuty> officeDuties = mapper.selectSingleOffice(deptId);
        session.close();
        return officeDuties;
    }


    public void setSqlSessionFactory(SqlSessionFactory sqlSessionFactory) {
        this.sqlSessionFactory = sqlSessionFactory;
    }
}

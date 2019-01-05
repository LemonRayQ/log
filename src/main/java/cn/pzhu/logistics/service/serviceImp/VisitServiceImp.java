package cn.pzhu.logistics.service.serviceImp;

import cn.pzhu.logistics.dao.VisitDao;
import cn.pzhu.logistics.pojo.Visit;
import cn.pzhu.logistics.service.VisitService;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service(value = "visitService")
public class VisitServiceImp implements VisitService {
    @Resource(name = "sqlSessionFactory")
    private SqlSessionFactory sqlSessionFactory;

    public void setSqlSessionFactory(SqlSessionFactory sqlSessionFactory) {
        this.sqlSessionFactory = sqlSessionFactory;
    }

    @Override
    public Integer selectVisit() {
        SqlSession sqlSession = sqlSessionFactory.openSession();
        VisitDao mapper = sqlSession.getMapper(VisitDao.class);
        Visit visit = mapper.selectVisit();
        sqlSession.close();
        return visit.getCount();
    }

    @Override
    public void updateCount(int num) {
        SqlSession sqlSession = sqlSessionFactory.openSession();
        VisitDao mapper = sqlSession.getMapper(VisitDao.class);
        mapper.updateCount(num + 1);
        sqlSession.close();
    }

}

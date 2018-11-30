package cn.pzhu.logistics.service.serviceImp;

import cn.pzhu.logistics.dao.VisitDao;
import cn.pzhu.logistics.service.VisitService;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import javax.annotation.Resource;

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
        Integer visit = mapper.selectVisit();
        sqlSession.close();
        return visit;
    }

    @Override
    public void updateCount() {
        SqlSession sqlSession = sqlSessionFactory.openSession();
        VisitDao mapper = sqlSession.getMapper(VisitDao.class);
        boolean b = mapper.updateCount();
        sqlSession.close();
    }

}

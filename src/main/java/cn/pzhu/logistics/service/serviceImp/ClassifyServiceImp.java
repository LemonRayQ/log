package cn.pzhu.logistics.service.serviceImp;

import cn.pzhu.logistics.dao.ClassifyDao;
import cn.pzhu.logistics.pojo.Classify;
import cn.pzhu.logistics.service.ClassifyService;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import javax.annotation.Resource;
import java.util.List;

public class ClassifyServiceImp implements ClassifyService {

    @Resource(name = "sqlSessionFactory")
    private SqlSessionFactory sqlSessionFactory;

    @Override
    public List<Classify> select() {
        SqlSession session = sqlSessionFactory.openSession();
        ClassifyDao classifyDao = session.getMapper(ClassifyDao.class);
        List<Classify> select = classifyDao.select();
        session.close();
        return select;
    }

    @Override
    public Classify selectById(int classId) {
        SqlSession session = sqlSessionFactory.openSession();
        ClassifyDao mapper = session.getMapper(ClassifyDao.class);
        Classify classify = mapper.selectById(classId);
        session.close();
        return classify;
    }
    public void setSqlSessionFactory(SqlSessionFactory sqlSessionFactory) {
        this.sqlSessionFactory = sqlSessionFactory;
    }
}

package cn.pzhu.logistics.service.serviceImp;

import cn.pzhu.logistics.dao.DepartDao;
import cn.pzhu.logistics.pojo.Department;
import cn.pzhu.logistics.service.DepartService;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service(value = "departService")
public class DepartServiceImp implements DepartService {

    @Resource(name = "sqlSessionFactory")
    private SqlSessionFactory sqlSessionFactory;

    @Override
    public List<Department> select() {
        SqlSession session = sqlSessionFactory.openSession();
        DepartDao departDao = session.getMapper(DepartDao.class);
        List<Department> select = departDao.select();
        session.close();
        return select;
    }

    @Override
    public boolean insertDepartment(String name) {
        SqlSession session = sqlSessionFactory.openSession();
        DepartDao mapper = session.getMapper(DepartDao.class);
        boolean b =  mapper.insertDepartment(name);
        session.close();
        return b;
    }

    @Override
    public boolean changeDepart(int deptId,String name) {
        SqlSession session = sqlSessionFactory.openSession();
        DepartDao mapper = session.getMapper(DepartDao.class);
        boolean b = mapper.changeDepart(deptId,name);
        session.close();
        return b;
    }

    public void setSqlSessionFactory(SqlSessionFactory sqlSessionFactory) {
        this.sqlSessionFactory = sqlSessionFactory;
    }
}

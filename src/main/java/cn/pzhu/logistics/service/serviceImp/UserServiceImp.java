package cn.pzhu.logistics.service.serviceImp;

import cn.pzhu.logistics.dao.UserLoginDao;
import cn.pzhu.logistics.pojo.UserLogin;
import cn.pzhu.logistics.service.UserService;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service(value = "userService")
public class UserServiceImp implements UserService {

    @Resource(name = "sqlSessionFactory")
    private SqlSessionFactory sqlSessionFactory;

    @Override
    public UserLogin login(UserLogin userLogin) {
        SqlSession session = sqlSessionFactory.openSession();
        UserLoginDao userLoginDao = session.getMapper(UserLoginDao.class);
        UserLogin login = userLoginDao.login(userLogin);
        session.close();
        return login;
    }

    public void setSqlSessionFactory(SqlSessionFactory sqlSessionFactory) {
        this.sqlSessionFactory = sqlSessionFactory;
    }
}
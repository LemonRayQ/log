package cn.pzhu.logistics.service.serviceImp;

import cn.pzhu.logistics.dao.UserLoginDao;
import cn.pzhu.logistics.pojo.UserLogin;
import cn.pzhu.logistics.service.UserService;
import cn.pzhu.logistics.util.Conver2MD5;
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

    @Override
    public boolean updatePassword(Integer identity, String oldPassword, String newPassword) {

        String newPassMd5 = Conver2MD5.getMD5(newPassword);
        String oldPassMd5 = Conver2MD5.getMD5(oldPassword);

        SqlSession session = sqlSessionFactory.openSession();
        UserLoginDao mapper = session.getMapper(UserLoginDao.class);
        boolean b = mapper.updatePassword(identity, oldPassMd5, newPassMd5);

        session.close();

        return b;
    }


}
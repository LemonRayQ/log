package cn.pzhu.logistics.service.serviceImp;

import cn.pzhu.logistics.dao.NewsManagerDao;
import cn.pzhu.logistics.dao.PolicyDao;
import cn.pzhu.logistics.pojo.Level;
import cn.pzhu.logistics.pojo.Policy;
import cn.pzhu.logistics.service.PolicyService;
import cn.pzhu.logistics.util.FileUtil;
import cn.pzhu.logistics.util.Utils;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import java.io.IOException;
import java.math.BigDecimal;
import java.util.List;
import java.util.Map;

public class PolicyServiceImp implements PolicyService {

    @Resource(name = "sqlSessionFactory")
    private SqlSessionFactory sqlSessionFactory;

    @Override
    public List<Level> selectLevel() {
        SqlSession session = sqlSessionFactory.openSession();
        PolicyDao mapper = session.getMapper(PolicyDao.class);
        List<Level> levels = mapper.selectLevel();
        session.close();
        return levels;
    }

    @Override
    public boolean insertPolicy(Policy policy, MultipartFile file) {
        SqlSession session = sqlSessionFactory.openSession();
        PolicyDao mapper = session.getMapper(PolicyDao.class);
        if (!file.isEmpty()) {
            String string = "file/rule/";
            try {
                String fileName = FileUtil.uplodeFile(file, string);
                System.out.println(fileName);
                policy.setPath(fileName);
            } catch (IOException e) {
                e.printStackTrace();
                return false;
            }
        }
        policy.setTime(Utils.getCurrentTimeStamp());
        boolean b = mapper.insertPolicy(policy);
        System.out.println(policy.toString());
        session.close();
        return true;
    }

    @Override
    public List<Policy> selectPolicy(int start) {
        SqlSession session = sqlSessionFactory.openSession();
        PolicyDao mapper = session.getMapper(PolicyDao.class);
        List<Policy> policies = mapper.selectPolicy(start);
        session.close();
        return policies;
    }

    @Override
    public boolean updatePolicy(Policy policy, MultipartFile file) {
        SqlSession session = sqlSessionFactory.openSession();
        PolicyDao mapper = session.getMapper(PolicyDao.class);
        if (!file.isEmpty()) {
            String string = "file/rule/";
            try {
                String fileName = FileUtil.uplodeFile(file, string);
                policy.setPath(fileName);
            } catch (IOException e) {
                e.printStackTrace();
                return false;
            }
        }
        policy.setTime(Utils.getCurrentTimeStamp());
        policy.setContent(policy.getContent().trim());
        boolean b = mapper.updatePolicy(policy);
        session.close();
        return true;
    }

    @Override
    public boolean deletePolicy(int policyId) {
        SqlSession session = sqlSessionFactory.openSession();
        PolicyDao mapper = session.getMapper(PolicyDao.class);
        boolean b = mapper.deletePolicy(policyId);
        session.close();
        return b;
    }

    @Override
    public int selectCountPolicy() {
        SqlSession session = sqlSessionFactory.openSession();
        PolicyDao mapper = session.getMapper(PolicyDao.class);
        int i = mapper.selectCountPolicy();
        session.close();
        return i;
    }

    @Override
    public List<Policy> selectPolicy() {
        SqlSession session = sqlSessionFactory.openSession();
        PolicyDao mapper = session.getMapper(PolicyDao.class);
        List<Policy> policies = mapper.selectAllPolicy();
        session.close();
        return policies;
    }

    @Override
    public Map<String, BigDecimal> selectPolicyCount() {
        SqlSession session = sqlSessionFactory.openSession();
        PolicyDao mapper = session.getMapper(PolicyDao.class);
        Map<String, BigDecimal> integerIntegerMap = mapper.selectPolicyCount(1,2,3);
        session.close();

        return integerIntegerMap;
    }


    public void setSqlSessionFactory(SqlSessionFactory sqlSessionFactory) {
        this.sqlSessionFactory = sqlSessionFactory;
    }
}

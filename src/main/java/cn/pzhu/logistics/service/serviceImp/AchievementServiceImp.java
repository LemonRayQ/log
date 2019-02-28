package cn.pzhu.logistics.service.serviceImp;

import cn.pzhu.logistics.dao.AchievementDao;
import cn.pzhu.logistics.pojo.Result;
import cn.pzhu.logistics.service.AchievementService;
import cn.pzhu.logistics.util.FileUtil;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * @author Impassive_y
 * @date 2018/11/11 19:23
 */
@Service(value = "achievementService")
public class AchievementServiceImp implements AchievementService {

    @Resource(name = "sqlSessionFactory")
    private SqlSessionFactory sqlSessionFactory;

    @Override
    public List<Result> selectResult(int start, int num) {
        SqlSession session = sqlSessionFactory.openSession();
        AchievementDao mapper = session.getMapper(AchievementDao.class);
        List<Result> results = mapper.selectResult(start, num);
        session.close();
        return results;
    }

    @Override
    public boolean insertResult(Result result) {
        SqlSession session = sqlSessionFactory.openSession();
        AchievementDao mapper = session.getMapper(AchievementDao.class);
        result.setContent(result.getContent().trim());
        boolean b = false;
        try {
            b = mapper.insertResult(result);
        } catch (Exception e) {
            e.printStackTrace();
            FileUtil.deleteFile(result.getPath());
        }
        session.close();
        return b;
    }

    @Override
    public int selectResultCount() {
        SqlSession session = sqlSessionFactory.openSession();
        AchievementDao mapper = session.getMapper(AchievementDao.class);
        int count = mapper.selectResultCount();
        session.close();
        return count;
    }

    @Override
    public boolean deleteAchievement(int id) {
        SqlSession sqlSession = sqlSessionFactory.openSession();
        AchievementDao mapper = sqlSession.getMapper(AchievementDao.class);
        boolean b = mapper.deleteAchievement(id);
        sqlSession.close();
        return b;
    }

    @Override
    public Result selectResultWithId(int id) {
        SqlSession sqlSession = sqlSessionFactory.openSession();
        AchievementDao mapper = sqlSession.getMapper(AchievementDao.class);
        Result result = mapper.selectResultWithId(id);

        sqlSession.close();
        return result;
    }


}

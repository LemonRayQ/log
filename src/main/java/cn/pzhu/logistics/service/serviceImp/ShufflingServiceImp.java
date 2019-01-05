package cn.pzhu.logistics.service.serviceImp;

import cn.pzhu.logistics.dao.ShufflingDao;
import cn.pzhu.logistics.pojo.Shuffling;
import cn.pzhu.logistics.service.ShufflingService;
import cn.pzhu.logistics.util.FileUtil;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import java.io.File;
import java.io.IOException;
import java.util.List;

@Service(value = "shufflingService")
public class ShufflingServiceImp implements ShufflingService {
    @Resource(name = "sqlSessionFactory")
    SqlSessionFactory sqlSessionFactory;

    public void setSqlSessionFactory(SqlSessionFactory sqlSessionFactory) {
        this.sqlSessionFactory = sqlSessionFactory;
    }

    @Override
    public List<Shuffling> selectAllFromShuffling() {
        SqlSession sqlSession = sqlSessionFactory.openSession();
        ShufflingDao mapper = sqlSession.getMapper(ShufflingDao.class);
        List<Shuffling> shufflings = mapper.selectAllFromShuffling();
        sqlSession.close();
        return shufflings;
    }

    @Override
    public Boolean deleteById(Integer id) {
        Boolean flag = false;
        SqlSession sqlSession = sqlSessionFactory.openSession();
        ShufflingDao mapper = sqlSession.getMapper(ShufflingDao.class);
        Shuffling shuffling = mapper.selectImageById(id);
        String name = shuffling.getPath();
        String path = "/logistics/" + name;
        File file = new File(path);
        file.delete();
        if (mapper.deleteById(id)) {
            flag = true;
        } else {
            flag = false;
        }
        sqlSession.close();
        return flag;
    }

    @Override
    public Boolean insertImage(Shuffling shuffling, MultipartFile file) throws IOException {
        SqlSession sqlSession = sqlSessionFactory.openSession();
        ShufflingDao mapper = sqlSession.getMapper(ShufflingDao.class);
        Boolean flag = false;
        String path = "image/shuffling/";
        if (!file.isEmpty()) {
            String name = FileUtil.setRandomName(file);
            FileUtil.uploadImage(file,path,name);
            shuffling.setPath("image/shuffling/"+name);
            if (mapper.insertImage(shuffling)) {
                flag = true;
            } else {
                flag = false;
            }
        }
        sqlSession.close();
        return flag;
    }
}

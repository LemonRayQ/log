package cn.pzhu.logistics.service.serviceImp;

import cn.pzhu.logistics.dao.DepartDao;
import cn.pzhu.logistics.dao.NewsManagerDao;
import cn.pzhu.logistics.pojo.News;
import cn.pzhu.logistics.service.NewsService;
import cn.pzhu.logistics.util.FileUtil;
import cn.pzhu.logistics.util.Utils;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import java.io.IOException;
import java.util.List;

@Service(value = "newsService")
public class NewsServiceImp implements NewsService {

    @Resource(name = "sqlSessionFactory")
    private SqlSessionFactory sqlSessionFactory;

    @Override
    public boolean insertNews(News news, MultipartFile path) {
        SqlSession session = sqlSessionFactory.openSession();
        NewsManagerDao newsManagerDao = session.getMapper(NewsManagerDao.class);
        if(!path.isEmpty()){
            String string = "file/news/";
            try {
                String file = FileUtil.uplodeFile(path, string);
                news.setPath(file);
            } catch (IOException e) {
                e.printStackTrace();
                return false;
            }
        }
        news.setTime(Utils.getCurrentTimeStamp());
        boolean b = newsManagerDao.insertNews(news);
        session.close();
        return b;
    }

    @Override
    public List<News> selectNews(int start) {
        SqlSession session = sqlSessionFactory.openSession();
        NewsManagerDao mapper = session.getMapper(NewsManagerDao.class);
        List<News> news = mapper.selectNews(start);
        session.close();
        return news;
    }

    @Override
    public List<News> selectNews(int start, int classifyId) {
        SqlSession session = sqlSessionFactory.openSession();
        NewsManagerDao mapper = session.getMapper(NewsManagerDao.class);
        List<News> news = mapper.selectNewsWithClassify(start, classifyId);
        session.close();
        return news;
    }

    @Override
    public List<News> selectAllNews(int start, int classifyId) {
        SqlSession session = sqlSessionFactory.openSession();
        NewsManagerDao mapper = session.getMapper(NewsManagerDao.class);
        List<News> news = mapper.selectAllNews(start,classifyId);
        session.close();
        return news;
    }

    @Override
    public List<News> selectAllNews(int start, int classifyId, int deptId) {
        SqlSession session = sqlSessionFactory.openSession();
        NewsManagerDao mapper = session.getMapper(NewsManagerDao.class);
        List<News> news = mapper.selectAllNewsWithClassIdandDeptId(start, classifyId, deptId);
        session.close();
        return news;
    }

    @Override
    public List<News> selectSomeNews(Integer classifyId) {
        SqlSession session = sqlSessionFactory.openSession();
        NewsManagerDao newsManagerDao = session.getMapper(NewsManagerDao.class);
        List<News> list = newsManagerDao.selectSomeNews(classifyId);
        session.close();
        return list;
    }


    @Override
    public News selectNewsById(int id) {
        SqlSession session = sqlSessionFactory.openSession();
        NewsManagerDao newsManagerDao = session.getMapper(NewsManagerDao.class);
        boolean b = newsManagerDao.updateReadNum(id);
        if(b){
            News news = newsManagerDao.selectNewsById(id);
            session.close();
            return news;
        }
        return null;

    }

    @Override
    public boolean updateNews(News news,MultipartFile path) {
        SqlSession session = sqlSessionFactory.openSession();
        NewsManagerDao newsManagerDao = session.getMapper(NewsManagerDao.class);
        if(!path.isEmpty()){
            String string = "file/news/";
            try {
                String file = FileUtil.uplodeFile(path, string);
                news.setPath(file);
            } catch (IOException e) {
                e.printStackTrace();
                return false;
            }
        }
        news.setTime(Utils.getCurrentTimeStamp());
        news.setContent(news.getContent().trim());
        boolean b = newsManagerDao.updateNews(news);
        session.close();
        return b;
    }

    @Override
    public boolean deleteNews(int id) {
        SqlSession session = sqlSessionFactory.openSession();
        NewsManagerDao mapper = session.getMapper(NewsManagerDao.class);
        boolean b = mapper.deleteNews(id);
        session.close();
        return b;
    }

    @Override
    public int selectNewsCount(int classId) {
        SqlSession session = sqlSessionFactory.openSession();
        NewsManagerDao mapper = session.getMapper(NewsManagerDao.class);
        int i = mapper.selectNewsCount(classId);
        session.close();
        return i;
    }

    @Override
    public News selectNextNews(int id) {
        SqlSession session = sqlSessionFactory.openSession();
        NewsManagerDao mapper = session.getMapper(NewsManagerDao.class);
        boolean b = mapper.updateNextRead(id);
        if(b) {
            News news = mapper.selectNextNews(id);
            session.close();
            return news;
        }
        return null;
    }

    @Override
    public News selectLastNews(int id) {
        SqlSession session = sqlSessionFactory.openSession();
        NewsManagerDao mapper = session.getMapper(NewsManagerDao.class);
        boolean b = mapper.updateLastRead(id);
        if(b) {
            News news = mapper.selectLastNews(id);
            session.close();
            return news;
        }
        return null;
    }

    @Override
    public News selectNewNews(){
        SqlSession session = sqlSessionFactory.openSession();
        NewsManagerDao mapper = session.getMapper(NewsManagerDao.class);
        boolean b = mapper.updateNewNewsRead();
        if(b) {
            News news = mapper.selectNewNews();
            session.close();
            return news;
        }
        return null;
    }

    @Override
    public List<News> selectNewsWithName(String name,int classId) {
        SqlSession session = sqlSessionFactory.openSession();
        NewsManagerDao mapper = session.getMapper(NewsManagerDao.class);
        List<News> news = mapper.selectNewsWithName(name,classId);
        session.close();
        return news;
    }

    @Override
    public List<News> selectNewsWithDept(int deptId, int classId) {
        SqlSession session = sqlSessionFactory.openSession();
        NewsManagerDao mapper = session.getMapper(NewsManagerDao.class);
        List<News> news = mapper.selectWorkWithDept(deptId, classId);
        session.close();
        return news;
    }

    @Override
    public boolean updateService(News news) {
        SqlSession session = sqlSessionFactory.openSession();
        NewsManagerDao mapper = session.getMapper(NewsManagerDao.class);
        boolean b = mapper.updateService(news);
        session.close();
        return b;
    }

    @Override
    public List<News> selectOfficeNews(int classId, int deptId) {
        SqlSession session = sqlSessionFactory.openSession();
        NewsManagerDao mapper = session.getMapper(NewsManagerDao.class);
        List<News> news = mapper.selectOfficeNews(classId,deptId);
        session.close();
        return news;
    }
    @Override
    public List<News> conditionsOfQueryNews(String condition, Integer classify_id) {
        SqlSession session =sqlSessionFactory.openSession();
        NewsManagerDao mapper = session.getMapper(NewsManagerDao.class);
        DepartDao mapper1 = session.getMapper(DepartDao.class);
        List<News> news = null;
        try {
            news = mapper.conditionsOfQueryNews(condition,classify_id);
            for (int i = 0; i < news.size(); i++) {
                News news1 =  news.get(i);
                Integer deptId = news1.getDeptId();
                news1.setDepartment(mapper1.selectDeptById(deptId));
            }
        }catch (Exception e){
            e.printStackTrace();
        }

        session.close();
        return news;
    }

    @Override
    public List<News> selectImportanceNews() {
        SqlSession session = sqlSessionFactory.openSession();
        NewsManagerDao mapper = session.getMapper(NewsManagerDao.class);
        List<News> news = mapper.selectImportanceNews();
        session.close();
        return news;
    }

    @Override
    public List<News> selectApprovalNews() {
        SqlSession session = sqlSessionFactory.openSession();
        NewsManagerDao mapper = session.getMapper(NewsManagerDao.class);
        List<News> news = mapper.selectApprovalNews();
        session.close();
        return news;
    }

    @Override
    public boolean updateApproval(News news) {
        SqlSession session = sqlSessionFactory.openSession();
        NewsManagerDao mapper = session.getMapper(NewsManagerDao.class);
        boolean b = mapper.updateApproval(news);
        session.close();
        return b;
    }

    @Override
    public int selectNewsCount(int classifyId, int deptId) {
        SqlSession session = sqlSessionFactory.openSession();
        NewsManagerDao mapper = session.getMapper(NewsManagerDao.class);
        int count = mapper.selectNewsCountWithClassIdandDeptId(classifyId, deptId);
        session.close();
        return count;
    }

    public void setSqlSessionFactory(SqlSessionFactory sqlSessionFactory) {
        this.sqlSessionFactory = sqlSessionFactory;
    }
}
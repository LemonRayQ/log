package cn.pzhu.logistics.dao;

import cn.pzhu.logistics.pojo.News;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface NewsManagerDao {

    int selectNewsCount(@Param(value = "classId") int classId);
    int selectNewsCountWithClassIdandDeptId(@Param(value = "classId") int classId,@Param(value = "deptId") int deptId);
    News selectNextNews(@Param(value = "newsId") int id);
    News selectLastNews(@Param(value = "newsId") int id);
    News selectNewNews();
    News selectIntroduce();
    News selectNewsById(@Param("newId") int newId);
    boolean updateReadNum(@Param("newId") int newId);
    boolean updateNewNewsRead();
    List<News> selectSomeNews(Integer classId);
    List<News> selectAllNews(@Param(value = "start") int start,@Param(value = "classId") int classifyId);
    List<News> selectAllNewsWithClassIdandDeptId(@Param(value = "start") int satrt,@Param(value = "classId") int classifyId,@Param(value = "deptId") int deptId);
    List<News> selectNewsWithName(@Param(value = "name") String name,@Param(value = "classId") int classId);
    List<News> selectWorkWithDept(@Param(value = "deptId") int deptId,@Param(value = "classId") int classId);
    List<News> selectOfficeNews(@Param(value = "classId") int classId,@Param(value = "deptId") int deptId);
    List<News> conditionsOfQueryNews(@Param(value = "conditions") String condition,@Param(value = "id") Integer id);
    List<News> selectImportanceNews();
    List<News> selectApprovalNews();
    List<News> selectNews(@Param(value = "top") int start);
    List<News> selectNewsWithClassify(@Param(value = "top") int start,@Param(value = "classify") int classify);

    boolean updateIntroduce(News news);
    boolean updateService(News news);
    boolean updateApproval(News news);
    boolean updateNews(News news);
    boolean deleteNews(int id);
    boolean insertNews(News news);
    boolean updateNextRead(@Param(value = "newsId") int id);
    boolean updateLastRead(@Param(value = "newsId") int id);
}

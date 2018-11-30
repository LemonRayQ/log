package cn.pzhu.logistics.service;

import cn.pzhu.logistics.pojo.News;
import org.apache.ibatis.annotations.Param;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.util.List;

public interface NewsService {

    /**
     * 插入新闻
     * @param news  需要插入的新闻主体
     * @param path
     * @return
     */
    boolean insertNews(News news, MultipartFile path);

    /**
     * 查询从start开始的前五条数据
     * @param start
     * @return
     */
    List<News> selectNews(int start);

    /**
     * 根据传入的start和classifyid查询前5条新闻
     * @param start
     * @param classifyId
     * @return
     */
    List<News> selectNews(int start,int classifyId);

    /**
     * 查询从start开始的classifyId 类别下的9条新闻
     * @param start
     * @param classifyId
     * @return
     */
    List<News> selectAllNews( int start, int classifyId);

    /**
     * 查询指定科室下指定类别从start开始的9条新闻
     * @param start
     * @param classifyId
     * @param deptId
     * @return
     */
    List<News> selectAllNews(int start,int classifyId,int deptId);

    /**
     * 按照时间排序查询最新的9条新闻
     * @param clssifyId
     * @return
     */
    List<News> selectSomeNews(Integer clssifyId);

    /**
     * 根据新闻ID查询新闻信息
     * @param id
     * @return
     */
    News selectNewsById(int id);

    /**
     * 更新新闻，并更新上传的文件
     * @param news
     * @param path
     * @return
     */
    boolean updateNews(News news,MultipartFile path);

    /**
     * 根据新闻的ID查询新闻
     * @param id
     * @return
     */
    boolean deleteNews(int id);

    /**
     * 统计指定类别下新闻的数量
     * @param classId
     * @return
     */
    int selectNewsCount(int classId);

    /**
     * 根据id查询下一条新闻(查询按照时间排序)
     * @param id
     * @return
     */
    News selectNextNews(int id);

    /**
     * 根据id查询上一条新闻(查询按照时间排序)
     * @param id
     * @return
     */
    News selectLastNews(int id);

    /**
     *  查询最新一条新闻
     * @return
     */
    News selectNewNews();

    /**
     * 根据新闻名字和类别ID查询新闻
     * @param name
     * @param classId
     * @return
     */
    List<News> selectNewsWithName(String name,int classId);

    /**
     *  查询指定部门和类别下的新闻
     * @param deptId
     * @param classId
     * @return
     */
    List<News> selectNewsWithDept(int deptId,int classId);

    /**
     * 更新服务指南
     * @param news
     * @return
     */
    boolean updateService(News news);

    /**
     *
     * @param classId
     * @param deptId
     * @return
     */
    List<News> selectOfficeNews(int classId,int deptId);

    /**
     *
     * @param condition
     * @param classify_id
     * @return
     */
    List<News> conditionsOfQueryNews(String condition,Integer classify_id);

    /**
     * 查询重要的新闻
     * @return
     */
    List<News> selectImportanceNews();

    /**
     * 查询审核新闻
     * @return
     */
    List<News> selectApprovalNews();

    /**
     * 更新审核新闻
     * @param news
     * @return
     */
    boolean updateApproval(News news);

    /**
     * 查询指定部门下指定类别的新闻条数
     * @param classifyId
     * @param deptId
     * @return
     */
    int selectNewsCount(int classifyId,int deptId);
}

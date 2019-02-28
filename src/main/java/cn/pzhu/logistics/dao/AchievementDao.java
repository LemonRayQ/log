package cn.pzhu.logistics.dao;

import cn.pzhu.logistics.pojo.Result;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author Impassive_y
 * @date 2018/11/11 19:24
 */
public interface AchievementDao {
    List<Result> selectResult(@Param(value = "start") int start,@Param(value = "num") int num);
    boolean insertResult(Result result);
    int selectResultCount();
    boolean deleteAchievement(@Param("id") int id);

    Result selectResultWithId(@Param("id") int id);
}

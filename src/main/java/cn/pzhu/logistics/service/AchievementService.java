package cn.pzhu.logistics.service;

import cn.pzhu.logistics.pojo.Result;

import java.util.List;

/**
 * @author Impassive_y
 * @date 2018/11/11 19:22
 */
public interface AchievementService {
    List<Result> selectResult(int start,int num);
    boolean insertResult(Result result);
    int selectResultCount();
    boolean deleteAchievement(int id);
}

package cn.pzhu.logistics.dao;

import cn.pzhu.logistics.pojo.Visit;
import org.apache.ibatis.annotations.Param;

public interface VisitDao {

    /**
     * 查询浏览次数
     * @return
     */
    Visit selectVisit();

    /**
     * 浏览次数+1
     * @param count1
     * @return
     */
    boolean updateCount(@Param("count1") int count1);
}
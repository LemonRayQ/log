package cn.pzhu.logistics.dao;

import cn.pzhu.logistics.pojo.Classify;

import java.util.List;

public interface ClassifyDao {
    /**
     * select all classify
     * @return
     */
    List<Classify> select();
    Classify selectById(int classId);
}

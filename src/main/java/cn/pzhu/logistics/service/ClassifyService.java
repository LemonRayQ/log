package cn.pzhu.logistics.service;

import cn.pzhu.logistics.pojo.Classify;

import java.util.List;

public interface ClassifyService {
    List<Classify> select();
    Classify selectById(int classId);
}

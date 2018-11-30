package cn.pzhu.logistics.dao;

import cn.pzhu.logistics.pojo.Shuffling;
import java.util.List;

public interface ShufflingDao {
    List<Shuffling> selectAllFromShuffling();
    Boolean deleteById(Integer id);
    Boolean insertImage(Shuffling shuffling);
    Shuffling selectImageById(Integer id);
}
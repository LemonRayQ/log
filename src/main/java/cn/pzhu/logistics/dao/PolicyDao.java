package cn.pzhu.logistics.dao;

import cn.pzhu.logistics.pojo.Level;
import cn.pzhu.logistics.pojo.Policy;
import org.apache.ibatis.annotations.Param;

import java.math.BigDecimal;
import java.util.List;
import java.util.Map;

public interface PolicyDao {
    List<Level> selectLevel();
    boolean insertPolicy(Policy policy);
    List<Policy> selectPolicy(@Param(value = "start") int start);
    boolean updatePolicy(Policy policy);
    boolean deletePolicy(@Param("policyId") int policyId);
    int selectCountPolicy();
    List<Policy> selectAllPolicy();
    Map<String, BigDecimal> selectPolicyCount(@Param("status1") int id1, @Param("status2")int id2, @Param("status3")int id3);
}

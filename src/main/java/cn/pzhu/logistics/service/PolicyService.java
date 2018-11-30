package cn.pzhu.logistics.service;


import cn.pzhu.logistics.pojo.Level;
import cn.pzhu.logistics.pojo.Policy;
import org.springframework.web.multipart.MultipartFile;

import java.math.BigDecimal;
import java.util.List;
import java.util.Map;

public interface PolicyService {

    /**
     * 查询政策制度的级别
     * @return
     */
    List<Level> selectLevel();

    /**
     * 插入政策信息到数据库以及包含的文件
     * @param policy
     * @param file
     * @return
     */
    boolean insertPolicy(Policy policy, MultipartFile file);

    /**
     * 查询从start开始的前五条政策信息
     * @param start
     * @return
     */
    List<Policy> selectPolicy(int start);

    /**
     * 更新政策信息以及政策信息中的文件
     * @param policy
     * @param file
     * @return
     */
    boolean updatePolicy(Policy policy,MultipartFile file);

    /**
     * 根据政策信息的ID删除政策信息
     * @param policyId
     * @return
     */
    boolean deletePolicy(int policyId);

    /**
     *  查询政策信息的总数
     * @return
     */
    int selectCountPolicy();

    /**
     * 查询所有政策文件
     * @return
     */
    List<Policy> selectPolicy();

    /**
     * 查询所有级别政策文件的数量
     * @return
     */
    Map<String, BigDecimal> selectPolicyCount();
}

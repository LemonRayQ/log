package cn.pzhu.logistics.dao;

import cn.pzhu.logistics.pojo.OfficeDuty;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author Impassive_y
 * @date 2018/11/12 13:58
 */
public interface OfficeDutyDao {
    OfficeDuty selectOfficeDutywithId(@Param(value = "id") int id);
    boolean updateOfficeDuty(OfficeDuty officeDuty);
    List<OfficeDuty> selectOfficeDuty();

    List<OfficeDuty> selectSingleOffice(int deptId);
}

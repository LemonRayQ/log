package cn.pzhu.logistics.service;

import cn.pzhu.logistics.pojo.News;
import cn.pzhu.logistics.pojo.OfficeDuty;

import java.util.List;

/**
 * @author Impassive_y
 * @date 2018/11/12 13:56
 */
public interface OfficeDutyService {
    OfficeDuty selectOfficeDutywithId(int id);
    boolean updateOfficeDuty(OfficeDuty officeDuty);
    boolean updateIntroduce(News news);
    News selectIntroduce();
    List<OfficeDuty> selectOfficeDuty();
    List<OfficeDuty> selectSingleOffice(int deptId);
}

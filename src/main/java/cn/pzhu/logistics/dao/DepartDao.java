package cn.pzhu.logistics.dao;

import cn.pzhu.logistics.pojo.Department;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface DepartDao {
    /**
     * select all department
     * @return
     */
    List<Department> select();
    Department selectDeptById(Integer id);
    boolean insertDepartment(String name);
    boolean changeDepart(@Param(value = "deptId") int deptId, @Param(value = "name") String name);
}

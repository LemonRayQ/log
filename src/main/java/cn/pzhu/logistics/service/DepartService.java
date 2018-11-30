package cn.pzhu.logistics.service;

import cn.pzhu.logistics.pojo.Department;

import java.util.List;

public interface DepartService {
    /**
     * select all department from sql server
     * @return List
     */
    List<Department> select();
    boolean insertDepartment(String name);
    boolean changeDepart(int deptId,String name);
}

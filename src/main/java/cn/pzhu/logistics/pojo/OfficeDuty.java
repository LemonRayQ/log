package cn.pzhu.logistics.pojo;

import java.io.Serializable;

/**
 * @author Impassive_y
 * @date 2018/11/12 10:25
 */
public class OfficeDuty implements Serializable {

    private Integer deptId;
    private String duty;
    private Department department = new Department();

    public Department getDepartment() {
        return department;
    }

    public void setDepartment(Department department) {
        this.department = department;
    }

    public Integer getDeptId() {
        return deptId;
    }

    public void setDeptId(Integer deptId) {
        this.deptId = deptId;
    }

    public String getDuty() {
        return duty;
    }

    public void setDuty(String duty) {
        this.duty = duty;
    }

    @Override
    public String toString() {
        return "OfficeDuty{" +
                "deptId=" + deptId +
                ", duty='" + duty + '\'' +
                '}';
    }
}

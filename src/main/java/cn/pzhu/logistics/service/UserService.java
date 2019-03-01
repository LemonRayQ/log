package cn.pzhu.logistics.service;

import cn.pzhu.logistics.pojo.UserLogin;

public interface UserService {
    /**
     * 管理员登录
     *
     * @param userLogin 管理员信息
     * @return 查询出的管理员信息
     */
    UserLogin login(UserLogin userLogin);

    /**
     * 更改管理员密码
     * @param identity 管理员等级
     * @param oldPassword 旧密码
     * @param newPassword 新密码
     * @return 更改结果
     */
    boolean updatePassword(Integer identity, String oldPassword, String newPassword);

}

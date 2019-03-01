package cn.pzhu.logistics.controller;

import cn.pzhu.logistics.pojo.UserLogin;
import cn.pzhu.logistics.service.UserService;
import cn.pzhu.logistics.util.Conver2MD5;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 * 用户登录
 */
@Controller
public class UserLoginController {

    @Resource(name = "userService")
    private UserService userService;

    @RequestMapping(value = "logout")
    public String logout(HttpSession session) {
        session.setAttribute("loginFlag", null);
        session.setAttribute("superFlag", null);
        return "redirect:index.jsp";
    }


    /**
     * 登录
     *
     * @param userLogin 用户登录信息
     * @param session   session模块
     * @param request   request请求
     * @return 登录结果
     */
    @RequestMapping(value = "login")
    @ResponseBody
    public String login(UserLogin userLogin, HttpSession session, HttpServletRequest request) {

        String time = request.getSession().getAttribute("time").toString();
        request.getSession().setAttribute("time", null);

        boolean b = false;

        UserLogin login = userService.login(userLogin);

        if (login != null) {
            String password = login.getPassword();
            String pa = password + time;
            String md5 = Conver2MD5.getMD5(pa);

            if (userLogin.getPassword().equals(md5)) {
                b = true;
            }

        }

        if (b) {
            if ("0".equals(request.getParameter("identity"))) {
                session.setAttribute("loginFlag", userLogin);
            } else {
                session.setAttribute("superFlag", userLogin);
            }
            return "yes";
        } else {
            return "no";
        }

    }

    @RequestMapping("updatePassword")
    public String updatePassword() {
        return "backdemo/publicpages/updatePassword";
    }

    @RequestMapping("updateAdminPassword")
    public ModelAndView updateAdminPassword(Integer identity, String oldPassword, String newPassword,
                                            String confirmPassword, HttpServletRequest request) {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("backdemo/publicpages/updatePassword");

        if (!newPassword.equals(confirmPassword)) {
            //前端判断条件，success为更改成功
            request.setAttribute("updatePassword","error");
            return modelAndView;
        }

        boolean b = userService.updatePassword(identity, oldPassword, newPassword);

        if(b){
            request.setAttribute("updatePassword","success");
        }else{
            request.setAttribute("updatePassword","error");
        }


        return modelAndView;
    }

}

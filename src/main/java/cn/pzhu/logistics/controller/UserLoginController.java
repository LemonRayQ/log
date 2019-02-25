package cn.pzhu.logistics.controller;

import cn.pzhu.logistics.pojo.UserLogin;
import cn.pzhu.logistics.service.ClassifyService;
import cn.pzhu.logistics.service.DepartService;
import cn.pzhu.logistics.service.NewsService;
import cn.pzhu.logistics.service.UserService;
import cn.pzhu.logistics.util.Conver2MD5;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

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

    @Resource(name = "departService")
    private DepartService departService;

    @Resource(name = "classifyService")
    private ClassifyService classifyService;

    @Resource(name = "newsService")
    private NewsService newsService;

    @Resource(name = "newsController")
    private NewsController newsController;

    @RequestMapping(value = "logout")
    public String logout(HttpSession session) {
        session.setAttribute("loginFlag", null);
        session.setAttribute("superFlag",null);
        return "redirect:index.jsp";
    }


    /**
     *
     * 功能描述:
     *
     * @param:
     * @return:
     * @auther: Impassive_y
     * @date: 2018/11/7 22:20
     */
    @RequestMapping(value = "login")
    @ResponseBody
    public String login(UserLogin userLogin, HttpSession session, HttpServletRequest request) {

        String time = request.getSession().getAttribute("time").toString();
        request.getSession().setAttribute("time",null);

        boolean b = false;

        UserLogin login = userService.login(userLogin);

        if(login != null){
            String password = login.getPassword();
            String pa = password + time;
            String md5 = Conver2MD5.getMD5(pa);

            if(userLogin.getPassword().equals(md5)){
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

    public void setUserService(UserService userService) {
        this.userService = userService;
    }

    public void setDepartService(DepartService departService) {
        this.departService = departService;
    }

    public void setClassifyService(ClassifyService classifyService) {
        this.classifyService = classifyService;
    }

    public void setNewsService(NewsService newsService) {
        this.newsService = newsService;
    }

    public void setNewsController(NewsController newsController) {
        this.newsController = newsController;
    }
}

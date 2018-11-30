package cn.pzhu.logistics.controller;

import cn.pzhu.logistics.pojo.Classify;
import cn.pzhu.logistics.pojo.Department;
import cn.pzhu.logistics.pojo.News;
import cn.pzhu.logistics.pojo.UserLogin;
import cn.pzhu.logistics.service.ClassifyService;
import cn.pzhu.logistics.service.DepartService;
import cn.pzhu.logistics.service.NewsService;
import cn.pzhu.logistics.service.UserService;
import cn.pzhu.logistics.util.Utils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

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
    public String login(UserLogin userLogin, HttpSession session, HttpServletRequest request) {
        System.out.println(request.getParameter("identity"));
        if (userService.login(userLogin)) {
            List<Department> select = departService.select();
            List<Classify> select1 = classifyService.select();
            List<News> news = newsService.selectNews(0);
            int count = newsService.selectNewsCount(1);
            StringBuffer bar = Utils.createBar("selectNextPageNews.mvc", count, 5, 0, 1);
            session.setAttribute("bar", bar);
            session.setAttribute("depart", select);
            session.setAttribute("classify", select1);
            session.setAttribute("news", news);
            if ("0".equals(request.getParameter("identity"))) {
                session.setAttribute("loginFlag", userLogin);
            } else {
                session.setAttribute("superFlag", userLogin);
            }
            return "redirect:backdemo/news/news.jsp";
        } else {
            return "redirect:Home/admin.jsp";
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

package cn.pzhu.logistics.controller;

import cn.pzhu.logistics.pojo.Department;
import cn.pzhu.logistics.pojo.News;
import cn.pzhu.logistics.service.DepartService;
import cn.pzhu.logistics.service.NewsService;
import cn.pzhu.logistics.util.Utils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * @author Impassive_y
 * @date 2018/11/10 12:24
 */
@Controller
public class WorkController {

    @Resource(name = "departService")
    private DepartService departService;

    @Resource(name = "newsService")
    private NewsService newsService;

    @RequestMapping(value = "selectWork")
    public String selectWork(HttpSession session){
        if(session.getAttribute("depart") == null){
            List<Department> select = departService.select();
            session.setAttribute("depart",select);
        }
        List<News> news = newsService.selectNews(0, 2);
        session.setAttribute("news",news);
        int count = newsService.selectNewsCount(2);
        StringBuffer bar = Utils.createBar("../../selectNextPageNews.mvc", count, 5, 1,2);
        session.setAttribute("bar",bar);
        return "redirect:backdemo/publicpages/work.jsp";
    }


    @RequestMapping(value = "selectWorkWithDept")
    @ResponseBody
    public String selectWorkWithDept(HttpServletRequest request){
        List<News> deptList = newsService.selectNewsWithDept(Integer.parseInt(request.getParameter("deptId")), 2);
        request.getSession().setAttribute("news",deptList);
        return null;
    }

    public void setDepartService(DepartService departService) {
        this.departService = departService;
    }

    public void setNewsService(NewsService newsService) {
        this.newsService = newsService;
    }
}

package cn.pzhu.logistics.controller;

import cn.pzhu.logistics.pojo.News;
import cn.pzhu.logistics.service.NewsService;
import cn.pzhu.logistics.util.Utils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * @author Impassive_y
 * @date 2018/11/10 12:17
 */
@Controller
public class RulesController {

    @Resource(name = "newsService")
    private NewsService newsService;

    @RequestMapping(value = "selectRules")
    public String selectRules(HttpSession session){
        List<News> news = newsService.selectNews(0, 9);
        session.setAttribute("news",news);
        int count = newsService.selectNewsCount(9);
        StringBuffer bar = Utils.createBar("../../selectNextPageNews.mvc", count, 5, 1,9);
        session.setAttribute("bar",bar);
        return "redirect:backdemo/publicpages/rules.jsp";
    }

    @RequestMapping(value = "selectRulesWithName")
    public String selectRulesWithName(String name,HttpSession session){
        if("".equals(name)){
            List<News> news = newsService.selectNews(0, 9);
            session.setAttribute("news",news);
            int count = newsService.selectNewsCount(9);
            StringBuffer bar = Utils.createBar("../../selectNextPageNews.mvc", count, 5, 1,9);
            session.setAttribute("bar",bar);
        }else{
            List<News> news = newsService.selectNewsWithName(name, 9);
            session.setAttribute("news",news);
            session.setAttribute("bar",null);
        }
        return "redirect:backdemo/publicpages/rules.jsp";
    }

    public void setNewsService(NewsService newsService) {
        this.newsService = newsService;
    }
}

package cn.pzhu.logistics.controller;

import cn.pzhu.logistics.pojo.News;
import cn.pzhu.logistics.service.NewsService;
import cn.pzhu.logistics.util.Utils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * @author Impassive_y
 * @date 2018/11/10 12:16
 */
@Controller
public class GovermentController {

    @Resource(name = "newsService")
    private NewsService newsService;

    @RequestMapping(value = "selectGoverment")
    public String selectGoverment(HttpSession session){
        List<News> news = newsService.selectNews(0, 8);
        session.setAttribute("news",news);
        int count = newsService.selectNewsCount(8);
        StringBuffer bar = Utils.createBar("../../selectNextPageNews.mvc", count, 5, 1,8);
        session.setAttribute("bar",bar);
        return "redirect:backdemo/publicpages/government.jsp";
    }

    @RequestMapping(value = "selectGovernWithName")
    public String selectGovernWithName(String name,HttpSession session){
        List<News> news = newsService.selectNewsWithName(name, 8);
        session.setAttribute("news",news);
        return "redirect:backdemo/publicpages/government.jsp";
    }

    public void setNewsService(NewsService newsService) {
        this.newsService = newsService;
    }
}

package cn.pzhu.logistics.controller;

import cn.pzhu.logistics.constant.ClassifyConstant;
import cn.pzhu.logistics.pojo.News;
import cn.pzhu.logistics.service.NewsService;
import cn.pzhu.logistics.util.Utils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
    public String selectGoverment(Model model, HttpSession session){
        List<News> news = newsService.selectNews(0, ClassifyConstant.GOVERNMENT_CONSTRUCTION);
        session.setAttribute("news",news);
        int count = newsService.selectNewsCount(8);
        StringBuffer bar = Utils.createBar("./selectNextPageNews", count, 5, 1,ClassifyConstant.GOVERNMENT_CONSTRUCTION);
        model.addAttribute("bar",bar);
        return "backdemo/publicpages/government";
    }

    @RequestMapping(value = "selectGovernWithName")
    public String selectGovernWithName(String name,HttpSession session){
        List<News> news = newsService.selectNewsWithName(name, ClassifyConstant.GOVERNMENT_CONSTRUCTION);
        session.setAttribute("news",news);
        return "backdemo/publicpages/government";
    }

    public void setNewsService(NewsService newsService) {
        this.newsService = newsService;
    }
}

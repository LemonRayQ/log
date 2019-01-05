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
 * @date 2018/11/10 12:17
 */
@Controller
public class RulesController {

    @Resource(name = "newsService")
    private NewsService newsService;

    @RequestMapping(value = "selectRules")
    public String selectRules(Model model, HttpSession session){
        List<News> news = newsService.selectNews(0, ClassifyConstant.RULE_REGULATION);
        session.setAttribute("news",news);
        int count = newsService.selectNewsCount(ClassifyConstant.RULE_REGULATION);
        StringBuffer bar = Utils.createBar("./selectNextPageNews", count, 5, 1,ClassifyConstant.RULE_REGULATION);
        model.addAttribute("bar",bar);
        return "backdemo/publicpages/rules";
    }

    @RequestMapping(value = "selectRulesWithName")
    public String selectRulesWithName(String name,Model model,HttpSession session){
        if("".equals(name)){
            List<News> news = newsService.selectNews(0, ClassifyConstant.RULE_REGULATION);
            session.setAttribute("news",news);
            int count = newsService.selectNewsCount(ClassifyConstant.RULE_REGULATION);
            StringBuffer bar = Utils.createBar("./selectNextPageNews", count, 5, 1,ClassifyConstant.RULE_REGULATION);
            model.addAttribute("bar",bar);
        }else{
            List<News> news = newsService.selectNewsWithName(name, ClassifyConstant.RULE_REGULATION);
            session.setAttribute("news",news);
            model.addAttribute("bar",null);
        }
        return "backdemo/publicpages/rules";
    }

    public void setNewsService(NewsService newsService) {
        this.newsService = newsService;
    }
}

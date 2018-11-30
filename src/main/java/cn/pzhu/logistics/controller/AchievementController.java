package cn.pzhu.logistics.controller;

import cn.pzhu.logistics.pojo.Result;
import cn.pzhu.logistics.service.AchievementService;
import cn.pzhu.logistics.util.BASE64DecodedMultipartFile;
import cn.pzhu.logistics.util.FileUtil;
import cn.pzhu.logistics.util.Utils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.List;

/**
 * @author Impassive_y
 * @date 2018/11/10 12:11
 */
@Controller
public class AchievementController {

    @Resource(name = "achievementService")
    private AchievementService achievementService;

    /**
     * 后台查询成果显示
     * @param session
     * @return
     */
    @RequestMapping(value = "selectAchievements")
    public String selectAchievements(HttpSession session) {
        List<Result> results = achievementService.selectResult(0,2);
        session.setAttribute("results", results);
        int count = achievementService.selectResultCount();
        StringBuffer bar = Utils.createBar("../../selectNextPageAchievement.mvc", count, 2, 1, 0);
        session.setAttribute("bar", bar);
        return "redirect:backdemo/publicpages/achievements.jsp";
    }

    /**
     * 前端显示成果展示
     * @return
     */
    @RequestMapping(value = "selectAchievement")
    public String selectAchievement(HttpSession session){
        List<Result> results = achievementService.selectResult(0,9);
        session.setAttribute("results", results);
        int count = achievementService.selectResultCount();
        StringBuffer bar = Utils.createBar("../selectNextAchievement.mvc", count, 9, 1, 0);
        session.setAttribute("bar", bar);
        return "redirect:achievement/achievement.jsp";
    }

    @RequestMapping(value = "insertAchievement")
    @ResponseBody
    public String insertResult(Result result, HttpSession session) {
        if (achievementService.insertResult(result)) {
            List<Result> results = achievementService.selectResult(0,2);
            int count = achievementService.selectResultCount();
            StringBuffer bar = Utils.createBar("../../selectNextPageAchievement.mvc", count, 2, 1, 0);
            session.setAttribute("bar", bar);
            session.setAttribute("results", results);
            return "yes";
        } else {
            session.setAttribute("insertFlag", "no");
        }
        return "no";
    }

    @RequestMapping(value = "selectNextPageAchievement")
    public String selectNextPageAchievement(HttpServletRequest request) {
        String spage = request.getParameter("page");
        int page = Integer.parseInt(spage);
        List<Result> results = achievementService.selectResult((page - 1) * 2,2);
        request.getSession().setAttribute("results",results);
        int count = achievementService.selectResultCount();
        StringBuffer bar = Utils.createBar("../../selectNextPageAchievement.mvc", count, 2, page, 0);
        request.getSession().setAttribute("bar", bar);
        return "redirect:backdemo/publicpages/achievements.jsp";
    }

    @RequestMapping(value = "selectNextAchievement")
    public String selectNextAchievement(HttpServletRequest request) {
        String spage = request.getParameter("page");
        int page = Integer.parseInt(spage);
        List<Result> results = achievementService.selectResult((page - 1) * 9,9);
        request.getSession().setAttribute("results",results);
        int count = achievementService.selectResultCount();
        StringBuffer bar = Utils.createBar("../selectNextAchievement.mvc", count, 9, page, 0);
        request.getSession().setAttribute("bar", bar);
        return "redirect:achievement/achievement.jsp";
    }

    /**
     * 成果展示图片转换
     * @param request
     * @return
     */
    @RequestMapping(value = "uploadBase64")
    @ResponseBody
    public String uploadBase64(HttpServletRequest request) {
        String base64Data = request.getParameter("base64Data");
        MultipartFile multipartFile = FileUtil.base64ToMultipart(base64Data);
        String s = null;
        try {
            s = FileUtil.uplodeFile(multipartFile, "image/result/");
        } catch (IOException e) {
            e.printStackTrace();
            return "false";
        }
        return s;
    }


    /**
     * 删除成果展示内容
     * @param request
     * @return
     */
    @RequestMapping("deleteAchievement")
    @ResponseBody
    public String deleteAch(HttpServletRequest request){
        String index = request.getParameter("index");
        int id = Integer.parseInt(index);
        List<Result> results1 = (List<Result>) request.getSession().getAttribute("results");
        Result result = results1.get(id);
        if(!FileUtil.deleteFile(result.getPath())){
           return "false";
        }
        boolean b = achievementService.deleteAchievement(result.getId());
        List<Result> results = achievementService.selectResult(0,2);
        int count = achievementService.selectResultCount();
        StringBuffer bar = Utils.createBar("../../selectNextPageAchievement.mvc", count, 2, 1, 0);
        request.getSession().setAttribute("bar", bar);
        request.getSession().setAttribute("results", results);
        return null;
    }

    public void setAchievementService(AchievementService achievementService) {
        this.achievementService = achievementService;
    }

}

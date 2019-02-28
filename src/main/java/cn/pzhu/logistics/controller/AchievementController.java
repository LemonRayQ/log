package cn.pzhu.logistics.controller;

import cn.pzhu.logistics.pojo.Result;
import cn.pzhu.logistics.service.AchievementService;
import cn.pzhu.logistics.util.FileUtil;
import cn.pzhu.logistics.util.Utils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

/**
 * 成果展示
 *
 * @author Impassive_y
 * @date 2018/11/10 12:11
 */
@Controller
public class AchievementController {

    @Resource(name = "achievementService")
    private AchievementService achievementService;

    /**
     * 后台查询成果显示
     *
     * @param model 用于存储数据
     * @return 返回页面信息
     */
    @RequestMapping(value = "selectAchievements")
    public String selectAchievements(Model model, HttpSession session) {
        List<Result> results = achievementService.selectResult(0, 2);
        session.setAttribute("results", results);
        int count = achievementService.selectResultCount();
        StringBuffer bar = Utils.createBar("./selectNextPageAchievement", count, 2, 1, 0);
        model.addAttribute("bar", bar);
        return "backdemo/publicpages/achievements";
    }

    /**
     * 前端显示成果展示
     *
     * @return 返回页面信息
     */
    @RequestMapping(value = "selectAchievement")
    public String selectAchievement(Model model, HttpSession session) {
        List<Result> results = achievementService.selectResult(0, 9);
        session.setAttribute("results", results);
        int count = achievementService.selectResultCount();
        StringBuffer bar = Utils.createBar("./selectNextAchievement", count, 9, 1, 0);
        model.addAttribute("bar", bar);
        return "achievement/achievement";
    }

    @RequestMapping(value = "insertAchievement")
    @ResponseBody
    public String insertResult(Result result, HttpSession session, Model model) {


        if (achievementService.insertResult(result)) {
            List<Result> results = achievementService.selectResult(0, 2);
            int count = achievementService.selectResultCount();
            StringBuffer bar = Utils.createBar("./selectNextPageAchievement", count, 2, 1, 0);
            model.addAttribute("bar", bar);
            session.setAttribute("results", results);
            return "yes";
        } else {
            session.setAttribute("insertFlag", "no");
        }
        return "no";
    }

    @RequestMapping(value = "selectNextPageAchievement")
    public String selectNextPageAchievement(HttpServletRequest request, Model model) {
        String spage = request.getParameter("page");
        int page = Integer.parseInt(spage);
        List<Result> results = achievementService.selectResult((page - 1) * 2, 2);
        request.getSession().setAttribute("results", results);
        int count = achievementService.selectResultCount();
        StringBuffer bar = Utils.createBar("./selectNextPageAchievement", count, 2, page, 0);
        model.addAttribute("bar", bar);
        return "backdemo/publicpages/achievements";
    }

    @RequestMapping(value = "selectNextAchievement")
    public String selectNextAchievement(HttpServletRequest request, Model model) {
        String spage = request.getParameter("page");
        int page = Integer.parseInt(spage);
        List<Result> results = achievementService.selectResult((page - 1) * 9, 9);
        request.getSession().setAttribute("results", results);
        int count = achievementService.selectResultCount();
        StringBuffer bar = Utils.createBar("./selectNextAchievement", count, 9, page, 0);
        model.addAttribute("bar", bar);
        return "achievement/achievement";
    }

    /**
     * 成果展示图片转换
     *
     * @param request 用于接收和保存数据
     * @return 返回页面信息
     */
    @ResponseBody
    @RequestMapping(value = "uploadBase64")
    public String uploadBase64(@RequestParam(value = "base64Data", required = false) String base64Data,
                               HttpServletRequest request) {


        MultipartFile multipartFile = FileUtil.base64ToMultipart(base64Data);

        if (multipartFile != null) {
            String s;
            try {
                s = FileUtil.uplodeFile(multipartFile, "image/result/");

                System.out.println("文件名：" + s);

            } catch (IOException e) {
                e.printStackTrace();
                return "文件上传失败了哦";
            }

            return s;
        }
        return "文件上传失败";

    }


    /**
     * 删除成果展示内容
     *
     * @param request 接收和保存数据
     * @return 返回页面信息
     */
    @RequestMapping("deleteAchievement")
    @ResponseBody
    public String deleteAch(HttpServletRequest request, Model model) {
        String index = request.getParameter("index");
        int id = Integer.parseInt(index);

        Result result = achievementService.selectResultWithId(id);
        boolean b = achievementService.deleteAchievement(id);
        if (b) {

            System.out.println("result:" + result.toString());

            if (!FileUtil.deleteFile(result.getPath())) {
                return "false";
            }
        }

        //删除成功之后再查询更新
        if (b) {
            List<Result> results = achievementService.selectResult(0, 2);
            int count = achievementService.selectResultCount();
            StringBuffer bar = Utils.createBar("./selectNextPageAchievement", count, 2, 1, 0);
            model.addAttribute("bar", bar);
            request.getSession().setAttribute("results", results);
        }

        return "true";
    }

    public void setAchievementService(AchievementService achievementService) {
        this.achievementService = achievementService;
    }

}

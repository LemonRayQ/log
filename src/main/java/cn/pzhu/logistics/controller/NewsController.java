package cn.pzhu.logistics.controller;

import cn.pzhu.logistics.constant.ClassifyConstant;
import cn.pzhu.logistics.pojo.*;
import cn.pzhu.logistics.service.*;
import cn.pzhu.logistics.util.FileUtil;
import cn.pzhu.logistics.util.Utils;
import org.apache.commons.io.IOUtils;
import org.apache.ibatis.annotations.Param;
import org.springframework.mock.web.MockMultipartFile;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.Iterator;
import java.util.List;

/**
 * 新闻信息
 */
@Controller
public class NewsController {

    @Resource(name = "newsService")
    private NewsService newsService;

    @Resource(name = "departService")
    private DepartService departService;

    @Resource(name = "shufflingService")
    private ShufflingService shufflingService;

    @Resource(name = "linkService")
    private LinkService linkService;

    @Resource(name = "officeDutyService")
    private OfficeDutyService officeDutyService;

    @Resource(name = "classifyService")
    private ClassifyService classifyService;

    @Resource(name = "visitService")
    private VisitService visitService;


    @RequestMapping(value = "insertNews")
    @ResponseBody
    public String insert(@RequestParam("paths") MultipartFile path, News news, HttpSession session) {

        if (newsService.insertNews(news, path)) {
            List<News> news1 = newsService.selectNews(0, news.getClassId());
            session.setAttribute("news", news1);
            session.setAttribute("news", news1);
            session.setAttribute("insertFlag", "yes");
        } else {
            session.setAttribute("insertFlag", "no");
        }
        return "backdemo/news/news";

    }

    @RequestMapping(value = "uploadNews")
    @ResponseBody
    public String uploadNews(HttpServletRequest request) {
        String news_id = request.getParameter("index");
        @SuppressWarnings("unchecked")
        List<News> news1 = (List<News>) request.getSession().getAttribute("news");
        News news = news1.get(Integer.parseInt(news_id));
        request.getSession().setAttribute("singleNews", news);
        return "news/news.jsp";
    }

    @RequestMapping(value = "cancleUpdate")
    @ResponseBody
    public String cancleUpdate(HttpSession session) {
        session.setAttribute("singleNews", null);
        session.setAttribute("singlePolicy", null);
        return "backdemo/news/news";
    }

    @RequestMapping(value = "updateNews")
    @ResponseBody
    public String updateNews(@RequestParam("paths") MultipartFile path, News news, HttpSession session) {
        if (!path.isEmpty()) {
            News singleNews = (News) session.getAttribute("singleNews");
            FileUtil.deleteFile(singleNews.getPath());
        }
        news.setContent(news.getContent().trim());
        boolean b = newsService.updateNews(news, path);
        if (b) {
            List<News> news1 = newsService.selectNews(0, news.getClassId());
            session.setAttribute("news", news1);
            session.setAttribute("singleNews", null);
            return "success";
        }
        return "wrong";
    }

    @RequestMapping(value = "updateApproval")
    @ResponseBody
    public String updateApproval(HttpSession session, HttpServletRequest request) {
        List<News> newsList = (List<News>) session.getAttribute("approvalNews");
        News news = newsList.get(Integer.parseInt(request.getParameter("index")));
        if ("1".equals(request.getParameter("importance"))) {
            news.setImportance(1);
        }

        boolean b = newsService.updateApproval(news);
        if (b) {
            List<News> news1 = newsService.selectApprovalNews();
            session.setAttribute("approvalNews", news1);
            return "success";
        }
        return "wrong";
    }

    @RequestMapping(value = "selectWorkWithName")
    public String selectWorkWithName(String name, HttpSession session) {
        List<News> news = newsService.selectNewsWithName(name, ClassifyConstant.WORK_DYNAMIC);
        session.setAttribute("news", news);
        return "backdemo/publicpages/work";
    }

    @RequestMapping(value = "Home")
    public String newsList(HttpSession session, Model model) {


        /* 查询访问次数 */
        if (session.getAttribute("visit") == null) {
            Integer num = visitService.selectVisit();
            session.setAttribute("visit_count", num);
            visitService.updateCount(num);
        }

        /* 查询首页显示的新闻 */
        List<News> news = newsService.selectImportanceNews();
        model.addAttribute("importanceNews", news);


        /* 查询轮播图 */
        List<Shuffling> shufflings = shufflingService.selectAllFromShuffling();
        model.addAttribute("imageList", shufflings);

        /* 查询友情链接 */
        List<Link> link = linkService.selectAllLink();
        model.addAttribute("jumpLinks", link);


        /*session.setAttribute("homeFlag", "yes");*/

        return "/Home/Home";
    }

    @RequestMapping(value = "notice")
    public String notice(int newsId, Model model) {
        News news = newsService.selectNewsById(newsId);
        model.addAttribute("newsInfo", news);
        return "newsinfo/newsinfo";
    }

    @RequestMapping(value = "selectNoticeNews")
    public String selectNoticeNews(HttpServletRequest request, Model model) {

        Integer classId = Integer.parseInt(request.getParameter("classId"));
        List<News> news = newsService.selectAllNews(0, classId);
        List<Department> departments = departService.select();
        Classify classify = classifyService.selectById(classId);
        request.getSession().setAttribute("classify", classify);
        request.getSession().setAttribute("classId", classId);
        request.getSession().setAttribute("depart", departments);
        model.addAttribute("noticeNews", news);
        model.addAttribute("deptId", null);
        int count = newsService.selectNewsCount(classId);
        StringBuffer bar = Utils.createBar("./selectNextPage", count, 9, 1, classId);
        model.addAttribute("bar", bar);
        return "announcement/announcement";
    }

    @RequestMapping(value = "selectOfficeNews")
    public String selectOfficeNews(HttpServletRequest request, Model model) {
        int deptId = Integer.parseInt(request.getParameter("deptId"));
        int classId = Integer.parseInt(request.getParameter("classId"));
        List<News> news = newsService.selectOfficeNews(classId, deptId);
        model.addAttribute("noticeNews", news);
        request.getSession().setAttribute("deptId", deptId);
        int count = newsService.selectNewsCount(classId, deptId);
        StringBuffer bar = Utils.createBar("./selectNextPage", count, 9, 1, classId);
        model.addAttribute("bar", bar);
        return "announcement/announcement";
    }

    @RequestMapping(value = "selectWorkOffice")
    public String selectWorkOffice(HttpServletRequest request, Integer classId, Model model) {
        Integer deptId = Integer.parseInt(request.getParameter("deptId"));
        List<News> news = newsService.selectOfficeNews(classId, deptId);
        model.addAttribute("noticeNews", news);
        request.getSession().setAttribute("deptId", deptId);
        int count = newsService.selectNewsCount(classId, deptId);
        StringBuffer bar = Utils.createBar("./selectNextPage", count, 5, 1, classId);
        model.addAttribute("bar", bar);
        return "work/work";
    }

    @RequestMapping(value = "selectContent")
    public String selectContent(HttpServletRequest request, Model model) {
        Integer classId = Integer.parseInt(request.getParameter("classId"));

        List<News> news = newsService.selectAllNews(0, classId);

        model.addAttribute("content", news);
        return "introduce/introduce";
    }

    @RequestMapping(value = "conditionsOfQueryNews")
    public String conditionsOfQueryNews(HttpSession session, String conditions,
                                        @Param(value = "classify_id") Integer classify_id,
                                        Model model) {
        if (classify_id == null) {
            classify_id = ClassifyConstant.WORK_DYNAMIC;
        }

        List<News> news = newsService.conditionsOfQueryNews(conditions, classify_id);

        if (classify_id == ClassifyConstant.WORK_DYNAMIC) {
            model.addAttribute("noticeNews", news);
        } else {
            model.addAttribute("noticeNews", news);
        }

        model.addAttribute("show", conditions);
        /*在通知公告页面查询*/
        if (classify_id == ClassifyConstant.WORK_DYNAMIC) {
            return "work/work";
        } else {/*在工作动态页面查询*/
            return "announcement/announcement";
        }
    }

    @RequestMapping(value = "selectApprovalNews")
    public String selectNewsVerify(HttpSession session) {
        List<News> news = newsService.selectApprovalNews();

        session.setAttribute("approvalNews", news);
        return "backdemo/publicpages/review";
    }

    @RequestMapping(value = "deleteNews")
    @ResponseBody
    public String deleteNews(HttpServletRequest request) {
        boolean flag = true;
        String sindex = request.getParameter("index");
        int index = Integer.parseInt(sindex);
        @SuppressWarnings("unchecked")
        List<News> news = (List<News>) request.getSession().getAttribute("news");
        News news2 = news.get(index);
        if (news2.getPath() != null && !"".equals(news2.getPath())) {
            flag = FileUtil.deleteFile(news2.getPath());
        }

        if (flag) {
            boolean b = newsService.deleteNews(news2.getNewsId());
            if (b) {
                List<News> news1 = newsService.selectNews(0, news2.getClassify().getClassifyId());
                request.getSession().setAttribute("news", news1);
                return "success";
            }
        }
        return "wrong";
    }

    /**
     * 后台分页
     *
     * @param request
     * @return
     */
    @RequestMapping(value = "selectNextPageNews")
    public String selectNextPageNews(HttpServletRequest request, Model model) {
        String pages = request.getParameter("page");
        int page = Integer.parseInt(pages);
        String sclassId = request.getParameter("classId");
        int classId = Integer.parseInt(sclassId);
        List<News> news = newsService.selectNews((page - 1) * 5, classId);
        int count = newsService.selectNewsCount(classId);
        StringBuffer bar = Utils.createBar("./selectNextPageNews", count, 5, page, classId);
        model.addAttribute("news", news);
        model.addAttribute("bar", bar);

        switch (classId) {
            case ClassifyConstant.NOTICE_ANNOUNCEMENT:
                return "backdemo/news/news";
            case ClassifyConstant.WORK_DYNAMIC:
                return "backdemo/publicpages/work";
            case ClassifyConstant.DEPARTMENT_INTRODUCTION:
                return "backdemo/publicpages/introduce";
            case ClassifyConstant.SERVICE_GUIDE:
                return "backdemo/publicpages/Service";
            case ClassifyConstant.POLICY_DOCUMENT:
                return "backdemo/policy/policy";
            case ClassifyConstant.GOVERNMENT_CONSTRUCTION:
                return "backdemo/publicpages/government";
            case ClassifyConstant.RULE_REGULATION:
                return "backdemo/publicpages/rules";
            default:
                return null;
        }
    }

    @RequestMapping(value = "selectNextPage")
    public String selectNextPage(HttpServletRequest request, Model model) {
        String pages = request.getParameter("page");
        int page = Integer.parseInt(pages);
        String sclassId = request.getParameter("classId");
        int classId = Integer.parseInt(sclassId);
        Integer sdeptId = (Integer) request.getSession().getAttribute("deptId");
        List<News> news;
        int count;
        int num;
        if (classId == ClassifyConstant.WORK_DYNAMIC) {
            num = 5;
            if (sdeptId == null) {
                news = newsService.selectAllNews((page - 1) * 5, classId);
                count = newsService.selectNewsCount(classId);
            } else {
                int deptId = sdeptId;
                news = newsService.selectAllNews((page - 1) * 5, classId, deptId);
                count = newsService.selectNewsCount(classId, deptId);
            }
        } else {
            num = 9;
            if (sdeptId == null) {
                news = newsService.selectAllNews((page - 1) * 9, classId);
                count = newsService.selectNewsCount(classId);
            } else {
                int deptId = sdeptId;
                news = newsService.selectAllNews((page - 1) * 9, classId, deptId);
                count = newsService.selectNewsCount(classId, deptId);
            }
        }
        model.addAttribute("noticeNews", news);
        StringBuffer bar = Utils.createBar("./selectNextPage", count, num, page, classId);
        model.addAttribute("bar", bar);
        switch (classId) {
            case ClassifyConstant.NOTICE_ANNOUNCEMENT:
                return "announcement/announcement";
            case ClassifyConstant.WORK_DYNAMIC:
                return "work/work";
            case ClassifyConstant.DEPARTMENT_INTRODUCTION:
                return "duty/duty";
            case ClassifyConstant.INFORMATION_FEEDBACK:
                return "achievement/achievement";
            case ClassifyConstant.SERVICE_GUIDE:
                return "introduce/introduce";
            case ClassifyConstant.POLICY_DOCUMENT:
                return "announcement/announcement";
            case ClassifyConstant.GOVERNMENT_CONSTRUCTION:
                return "announcement/announcement";
            case ClassifyConstant.RULE_REGULATION:
                return "announcement/announcement";
            default:
                return null;
        }
    }


    /**
     * 使用异步保存markdown中的图片
     *
     * @param httpServletRequest
     * @return
     * @throws IOException
     */
    @RequestMapping(value = "uploadMarkdownImage")
    @ResponseBody
    public String uploadMarkdownImage(HttpServletRequest httpServletRequest) throws IOException {
        MultipartHttpServletRequest request = httpServletRequest instanceof MultipartHttpServletRequest ? (MultipartHttpServletRequest) httpServletRequest : null;
        /*markDown中可以上传多张图片*/
        Iterator<String> fileNames;

        String value = null;
        if (request != null) {
            fileNames = request.getFileNames();
            if (fileNames.hasNext()) {
                String fileName = fileNames.next();
                MultipartFile multipartFile = request.getFile(fileName);
                /*将multipartFile转化成File，以便执行reduceImage()方法，将空文件当作中转站，用完后在92行调用方法删除*/
                File file = File.createTempFile("temp", null);
                multipartFile.transferTo(file);
                /*压缩图片*/
                if (multipartFile != null) {
                    String picName = FileUtil.setRandomName(multipartFile);
                    FileUtil.reduceImage(file);
                    /*将File转化成MultipartFile，以便执行uplodeFile()方法*/
                    FileInputStream inputStream = new FileInputStream(file);
                    multipartFile = new MockMultipartFile(picName, picName, "text/plain", IOUtils.toByteArray(inputStream));
                    String path = "image/news/";
                    FileUtil.uplodeFile(multipartFile, path, picName);
                    value = "image/news/" + picName;
                }
                file.deleteOnExit();
            }
        }
        /*返回value 与js文件中第44行文件进行拼接，用来在markDown中回显图片*/
        return value;
    }

    @RequestMapping(value = "selectHomeNews")
    public String selectHomeNews(HttpSession session, Model model) {
        if (session.getAttribute("depart") == null) {
            List<Department> select = departService.select();
            session.setAttribute("depart", select);
        }
        List<News> news = newsService.selectNews(0);
        int count = newsService.selectNewsCount(ClassifyConstant.NOTICE_ANNOUNCEMENT);
        StringBuffer bar = Utils.createBar("./selectNextPageNews", count, 5, 0, ClassifyConstant.NOTICE_ANNOUNCEMENT);
        model.addAttribute("bar", bar);
        session.setAttribute("news", news);

        return "backdemo/news/news";

    }

    @RequestMapping(value = "selectNextNews")
    public String selectNextNews(HttpServletRequest request, Model model) {

        if (request.getSession().getAttribute("noLastNews") != null) {
            request.getSession().setAttribute("noLastNews", null);
        }

        try {
            int id = Integer.parseInt(request.getParameter("newsId"));
            News news = newsService.selectNextNews(id);
            request.getSession().setAttribute("noNextNews", null);
            model.addAttribute("newsInfo", news);
        } catch (Exception e) {
            News news = newsService.selectNewNews();
            request.getSession().setAttribute("noNextNews", news);
            model.addAttribute("newsInfo", news);
        }

        return "newsinfo/newsinfo";
    }

    @RequestMapping(value = "selectLaseNews")
    public String selectLaseNews(HttpServletRequest request, Model model) {
        if (request.getSession().getAttribute("noNextNews") != null) {
            request.getSession().setAttribute("noNextNews", null);
        }
        try {
            int id = Integer.parseInt(request.getParameter("newsId"));
            News news = newsService.selectLastNews(id);
            request.getSession().setAttribute("noLastNews", null);
            model.addAttribute("newsInfo", news);
        } catch (Exception e) {
            News news = newsService.selectNewNews();
            request.getSession().setAttribute("noLastNews", news);
            model.addAttribute("newsInfo", news);
        }
        return "newsinfo/newsinfo";
    }

    @RequestMapping(value = "selectServer")
    public String selectServer(HttpSession session) {
        List<News> news = newsService.selectAllNews(0, ClassifyConstant.SERVICE_GUIDE);
        session.setAttribute("service", news.get(0));
        return "backdemo/publicpages/Service";
    }

    @RequestMapping(value = "updateService")
    public String updateService(News news, HttpSession session) {
        boolean b = newsService.updateService(news);
        session.setAttribute("service", news);
        return "backdemo/publicpages/Service";
    }

    public void setNewsService(NewsService newsService) {
        this.newsService = newsService;
    }

    public void setDepartService(DepartService departService) {
        this.departService = departService;
    }

    public void setShufflingService(ShufflingService shufflingService) {
        this.shufflingService = shufflingService;
    }

    public void setLinkService(LinkService linkService) {
        this.linkService = linkService;
    }

    public void setOfficeDutyService(OfficeDutyService officeDutyService) {
        this.officeDutyService = officeDutyService;
    }

    public void setClassifyService(ClassifyService classifyService) {
        this.classifyService = classifyService;
    }

    public void setVisitService(VisitService visitService) {
        this.visitService = visitService;
    }
}
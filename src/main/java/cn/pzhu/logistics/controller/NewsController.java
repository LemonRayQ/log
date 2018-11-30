package cn.pzhu.logistics.controller;

import cn.pzhu.logistics.pojo.*;
import cn.pzhu.logistics.service.*;
import cn.pzhu.logistics.util.FileUtil;
import cn.pzhu.logistics.util.Utils;
import org.apache.commons.io.IOUtils;
import org.apache.ibatis.annotations.Param;
import org.springframework.mock.web.MockMultipartFile;
import org.springframework.stereotype.Controller;
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
    public String insert(@RequestParam("paths") MultipartFile path, News news, HttpSession session) {
        System.out.println(news.toString());
        if (newsService.insertNews(news, path)) {
            List<News> news1 = newsService.selectNews(0,news.getClassId());
            session.setAttribute("news",news1);
            session.setAttribute("insertFlag", "yes");
        } else {
            session.setAttribute("insertFlag", "no");
        }
        return "redirect:backdemo/news/news.jsp";
    }

    @RequestMapping(value = "uploadNews")
    @ResponseBody
    public String uploadNews(HttpServletRequest request) {
        String news_id = request.getParameter("index");
        @SuppressWarnings("unchecked")
        List<News> news1 = (List<News>) request.getSession().getAttribute("news");
        News news = news1.get(Integer.parseInt(news_id));
        request.getSession().setAttribute("singleNews", news);
        return "redirect:news/news.jsp";
    }

    @RequestMapping(value = "cancleUpdate")
    @ResponseBody
    public String cancleUpdate(HttpSession session){
        session.setAttribute("singleNews",null);
        session.setAttribute("singlePolicy",null);
        return "redirect:backdemo/news/news.jsp";
    }

    @RequestMapping(value = "updateNews")
    @ResponseBody
    public String updateNews(@RequestParam("paths") MultipartFile path, News news, HttpSession session) {
        if(!path.isEmpty()){
            News singleNews = (News)session.getAttribute("singleNews");
            FileUtil.deleteFile(singleNews.getPath());
        }
        news.setContent(news.getContent().trim());
        boolean b = newsService.updateNews(news,path);
        if(b){
            List<News> news1 = newsService.selectNews(0,news.getClassId());
            session.setAttribute("news",news1);
            session.setAttribute("singleNews",null);
            return "success";
        }
        return "wrong";
    }

    @RequestMapping(value = "updateApproval")
    @ResponseBody
    public String updateApproval(HttpSession session,HttpServletRequest request){
        List<News> newsList = (List<News>)session.getAttribute("approvalNews");
        News news = newsList.get(Integer.parseInt(request.getParameter("index")));
        if ("1".equals(request.getParameter("importance"))){
            news.setImportance(1);
        }
        System.out.println("news:"+news.toString());
        boolean b = newsService.updateApproval(news);
        if(b){
            List<News> news1 = newsService.selectApprovalNews();
            session.setAttribute("approvalNews",news1);
            return "success";
        }
        return "wrong";
    }

    @RequestMapping(value = "selectWorkWithName")
    public String selectWorkWithName(String name,HttpSession session){
        List<News> news = newsService.selectNewsWithName(name,2);
        session.setAttribute("news",news);
        return "redirect:backdemo/publicpages/work.jsp";
    }

    @RequestMapping(value = "Home.mvc")
    public String newsList(HttpSession session) {
        count(session);
        importance(session);
        shuffl(session);
        List<Link> link = link();
        session.setAttribute("jumpLinks",link);
        /*notice(session);
        work(session);
        rule(session);
        government(session);
        policy(session);
        duty(session);*/
        session.setAttribute("homeFlag","yes");
        return "redirect:/Home/Home.jsp";
    }

    public void count(HttpSession session){
        if(session.getAttribute("visit") == null){
            session.setAttribute("visit","v");
            visitService.updateCount();
        }
        Integer num = visitService.selectVisit();
        session.setAttribute("visit_count",num);
    }


    public List<Link> link(){
        return linkService.selectAllLink();
    }


    public void importance(HttpSession session){
        List<News> news = newsService.selectImportanceNews();
        session.setAttribute("impotanceNews",news);
    }

    public void duty(HttpSession session){
        List<OfficeDuty> duties = officeDutyService.selectOfficeDuty();
        session.setAttribute("duties",duties);
    }

    public void shuffl(HttpSession session){
        List<Shuffling> shufflings = shufflingService.selectAllFromShuffling();
        session.setAttribute("imageList",shufflings);
    }

    public void notice(HttpSession session) {
        List<News> list = newsService.selectSomeNews(1);
        session.setAttribute("noticeList", list);
    }

    public void work(HttpSession session) {
        List<News> list = newsService.selectSomeNews(2);
        session.setAttribute("workList", list);
    }

    public void rule(HttpSession session) {
        List<News> list = newsService.selectSomeNews(9);
        session.setAttribute("ruleList", list);
    }

    public void government(HttpSession session) {
        List<News> list = newsService.selectSomeNews(8);
        session.setAttribute("governmentList", list);
    }

    public void policy(HttpSession session) {
        List<News> list = newsService.selectSomeNews(6);
        session.setAttribute("policyList", list);
    }

    @RequestMapping(value = "notice")
    public String notice(int newsId, HttpSession session){
        News news = newsService.selectNewsById(newsId);
        session.setAttribute("newsInfo", news);
        return "redirect:newsinfo/newsinfo.jsp";
    }

    @RequestMapping(value = "selectNoticeNews.mvc")
    public String selectNoticeNews(HttpServletRequest request) {
        Integer classId = Integer.parseInt(request.getParameter("classId"));
        List<News> news =newsService.selectAllNews(0,classId);
        List<Department> departments = departService.select();
        Classify classify = classifyService.selectById(classId);
        request.getSession().setAttribute("classify",classify);
        request.getSession().setAttribute("classId",classId);
        request.getSession().setAttribute("depart",departments);
        request.getSession().setAttribute("noticeNews",news);
        request.getSession().setAttribute("deptId",null);
        int count = newsService.selectNewsCount(classId);
        StringBuffer bar = Utils.createBar("../selectNextPage.mvc", count, 9, 1, classId);
        request.getSession().setAttribute("bar",bar);
        return "redirect:announcement/announcement.jsp";
    }

    @RequestMapping(value = "selectWorkNews.mvc")
    public String selectWorkNews(HttpServletRequest request){
        Integer classId = Integer.parseInt(request.getParameter("classId"));
        List<News> news = newsService.selectNews(0,classId);
        List<Department> departments = departService.select();
        request.getSession().setAttribute("depart",departments);
        request.getSession().setAttribute("noticeNews",news);
        request.getSession().setAttribute("deptId",null);
        int count = newsService.selectNewsCount(classId);
        System.out.println("count:"+count);
        StringBuffer bar = Utils.createBar("../selectNextPage.mvc", count, 5, 1, classId);
        request.getSession().setAttribute("bar",bar);
        return "redirect:work/work.jsp";

    }

    @RequestMapping(value = "selectOfficeNews.mvc")
    public String selectOfficeNews(HttpServletRequest request){
        int deptId = Integer.parseInt(request.getParameter("deptId"));
        int classId = Integer.parseInt(request.getParameter("classId"));
        List<News> news = newsService.selectOfficeNews(classId,deptId);
        request.getSession().setAttribute("noticeNews",news);
        request.getSession().setAttribute("deptId",deptId);
        int count = newsService.selectNewsCount(classId, deptId);
        StringBuffer bar = Utils.createBar("../selectNextPage.mvc", count, 9, 1, classId);
        request.getSession().setAttribute("bar",bar);
        return "redirect:announcement/announcement.jsp";
    }

    @RequestMapping(value = "selectWorkOffice.mvc")
    public String selectWorkOffice(HttpServletRequest request,Integer classId){
        Integer deptId = Integer.parseInt(request.getParameter("deptId"));
        List<News> news = newsService.selectOfficeNews(classId,deptId);
        request.getSession().setAttribute("noticeNews",news);
        request.getSession().setAttribute("deptId",deptId);
        int count = newsService.selectNewsCount(classId, deptId);
        StringBuffer bar = Utils.createBar("../selectNextPage.mvc", count, 5, 1, classId);
        request.getSession().setAttribute("bar",bar);
        return "redirect:work/work.jsp";
    }

    @RequestMapping(value = "selectContent.mvc")
    public String selectContent(HttpServletRequest request){
        Integer classId = Integer.parseInt(request.getParameter("classId"));
        System.out.println("classId:"+classId);
        List<News> news = newsService.selectAllNews(0,classId);
        System.out.println("content:"+news.toString());
        request.getSession().setAttribute("content",news);
        return "redirect:introduce/introduce.jsp";
    }

    @RequestMapping(value = "conditionsOfQueryNews")
    public String conditionsOfQueryNews(HttpSession session,String conditions,@Param(value = "classify_id") Integer classify_id){
        List<News> news = newsService.conditionsOfQueryNews(conditions,classify_id);
        if(classify_id == 2){
            session.setAttribute("noticeNews",news);
        }else{
            session.setAttribute("noticeNews",news);
        }
        session.setAttribute("show",conditions);
        /*在通知公告页面查询*/
        if(classify_id == 2){
            return "redirect:work/work.jsp";
        }else{/*在工作动态页面查询*/
            return "redirect:announcement/announcement.jsp";
        }
    }

    @RequestMapping(value = "selectApprovalNews.mvc")
    public String selectNewsVerify(HttpSession session){
        List<News> news = newsService.selectApprovalNews();
        System.out.println("news:"+news.toString());
        session.setAttribute("approvalNews",news);
        return "redirect:backdemo/publicpages/review.jsp";
    }

    @RequestMapping(value = "deleteNews")
    @ResponseBody
    public String deleteNews(HttpServletRequest request){
        boolean flag = true;
        String sindex = request.getParameter("index");
        int index = Integer.parseInt(sindex);
        @SuppressWarnings("unchecked")
        List<News> news = (List<News>) request.getSession().getAttribute("news");
        News news2 = news.get(index);
        if(news2.getPath() != null && !"".equals(news2.getPath())){
            flag = FileUtil.deleteFile(news2.getPath());
        }
        System.out.println(news2.toString());
        if(flag){
            boolean b = newsService.deleteNews(news2.getNewsId());
            if(b){
                List<News> news1 = newsService.selectNews(0,news2.getClassify().getClassifyId());
                request.getSession().setAttribute("news",news1);
                return "success";
            }
        }
        return "wrong";
    }

    /**
     * 后台分页
     * @param request
     * @return
     */
    @RequestMapping(value = "selectNextPageNews")
    public String selectNextPageNews(HttpServletRequest request){
        String pages = request.getParameter("page");
        int page = Integer.parseInt(pages);
        String sclassId = request.getParameter("classId");
        int classId = Integer.parseInt(sclassId);
        List<News> news = newsService.selectNews((page - 1) * 5,classId);
        int count = newsService.selectNewsCount(classId);
        StringBuffer bar = Utils.createBar("../../selectNextPageNews.mvc", count, 5, page,classId);
        request.getSession().setAttribute("news", news);
        request.getSession().setAttribute("bar", bar);
        switch (classId){
            case 1: return "redirect:backdemo/news/news.jsp";
            case 2: return "redirect:backdemo/publicpages/work.jsp";
            case 3: return "redirect:backdemo/publicpages/introduce.jsp";
            case 5: return "redirect:backdemo/publicpages/Service.jsp";
            case 6: return "redirect:backdemo/policy/policy.jsp";
            case 8: return "redirect:backdemo/publicpages/government.jsp";
            case 9: return "redirect:backdemo/publicpages/rules.jsp";
            default: return null;
        }
    }

    @RequestMapping(value = "selectNextPage")
    public String selectNextPage(HttpServletRequest request){
        String pages = request.getParameter("page");
        int page = Integer.parseInt(pages);
        String sclassId = request.getParameter("classId");
        int classId = Integer.parseInt(sclassId);
        Integer sdeptId = (Integer) request.getSession().getAttribute("deptId");
        List<News> news;
        int count;
        int num;
        if(classId == 2){
            num = 5;
            if(sdeptId == null){
                news = newsService.selectAllNews((page - 1) * 5, classId);
                count = newsService.selectNewsCount(classId);
            }else{
                int deptId = sdeptId;
                news = newsService.selectAllNews((page - 1) * 5, classId, deptId);
                count = newsService.selectNewsCount(classId,deptId);
            }
        }else{
            num = 9;
            if(sdeptId == null){
                news = newsService.selectAllNews((page - 1) * 9, classId);
                count = newsService.selectNewsCount(classId);
            }else{
                int deptId = sdeptId;
                news = newsService.selectAllNews((page - 1) * 9, classId, deptId);
                count = newsService.selectNewsCount(classId,deptId);
            }
        }
        request.getSession().setAttribute("noticeNews",news);
        StringBuffer bar = Utils.createBar("../selectNextPage.mvc", count, num, page, classId);
        request.getSession().setAttribute("bar",bar);
        switch (classId){
            case 1: return "redirect:announcement/announcement.jsp";
            case 2: return "redirect:work/work.jsp";
            case 3: return "redirect:duty/duty.jsp";
            case 4: return "redirect:achievement/achievement.jsp";
            case 5: return "redirect:introduce/introduce.jsp";
            case 6: return "redirect:ammouncement/ammouncement.jsp";
            case 8: return "redirect:ammouncement/ammouncement.jsp";
            case 9: return "redirect:rule/rule.jsp";
            default: return null;
        }
    }



    /**
     * 使用异步保存markdown中的图片
     * @param httpServletRequest
     * @return
     * @throws IOException
     */
    @RequestMapping(value = "uploadMarkdownImage")
    @ResponseBody
    public String uploadMarkdownImage(HttpServletRequest httpServletRequest) throws IOException {
        MultipartHttpServletRequest request = httpServletRequest instanceof MultipartHttpServletRequest ? (MultipartHttpServletRequest)httpServletRequest:null;
        /*markDown中可以上传多张图片*/
        Iterator<String> fileNames;
        String value = null;
        if(request != null){
            fileNames = request.getFileNames();
            if(fileNames.hasNext()){
                String fileName = fileNames.next();
                MultipartFile multipartFile = request.getFile(fileName);
                /*将multipartFile转化成File，以便执行reduceImage()方法，将空文件当作中转站，用完后在92行调用方法删除*/
                File file = File.createTempFile("temp",null);
                multipartFile.transferTo(file);
                /*压缩图片*/
                if(multipartFile != null){
                    String picName = FileUtil.setRandomName(multipartFile);
                    FileUtil.reduceImage(file);
                    /*将File转化成MultipartFile，以便执行uplodeFile()方法*/
                    FileInputStream inputStream = new FileInputStream(file);
                    multipartFile = new MockMultipartFile(picName,picName,"text/plain", IOUtils.toByteArray(inputStream));
                    String path = "image/news/";
                    FileUtil.uplodeFile(multipartFile,path,picName);
                    value = "image/news/"+picName;
                }
                file.deleteOnExit();
            }
        }
        /*返回value 与js文件中第44行文件进行拼接，用来在markDown中回显图片*/
        return value;
    }

    @RequestMapping(value = "selectHomeNews")
    public String selectHomeNews(HttpSession session){
        if(session.getAttribute("depart") == null){
            List<Department> select = departService.select();
            session.setAttribute("depart",select);
        }
        List<News> news = newsService.selectNews(0);
        int count = newsService.selectNewsCount(1);
        StringBuffer bar = Utils.createBar("../../selectNextPageNews.mvc", count, 5, 0,1);
        session.setAttribute("bar",bar);
        session.setAttribute("news",news);

        return "redirect:backdemo/news/news.jsp";

    }

    @RequestMapping(value = "selectNextNews")
    public String selectNextNews(HttpServletRequest request){
        if(request.getSession().getAttribute("noLastNews") != null ){
            request.getSession().setAttribute("noLastNews",null);
        }
        try{
            int id = Integer.parseInt(request.getParameter("newsId"));
            News news = newsService.selectNextNews(id);
            request.getSession().setAttribute("noNextNews",null);
            request.getSession().setAttribute("newsInfo",news);
        }catch (Exception e){
            News news = newsService.selectNewNews();
            request.getSession().setAttribute("noNextNews",news);
            request.getSession().setAttribute("newsInfo",news);
        }
        return "redirect:newsinfo/newsinfo.jsp";
    }

    @RequestMapping(value = "selectLaseNews")
    public String selectLaseNews(HttpServletRequest request){
        if(request.getSession().getAttribute("noNextNews") != null ){
            request.getSession().setAttribute("noNextNews",null);
        }
        try{
            int id = Integer.parseInt(request.getParameter("newsId"));
            News news = newsService.selectLastNews(id);
            request.getSession().setAttribute("noLastNews",null);
            request.getSession().setAttribute("newsInfo",news);
        }catch (Exception e){
            News news = newsService.selectNewNews();
            request.getSession().setAttribute("noLastNews",news);
            request.getSession().setAttribute("newsInfo",news);
        }
        return "redirect:newsinfo/newsinfo.jsp";
    }

    @RequestMapping(value = "selectServer")
    public String selectServer(HttpSession session){
        List<News> news = newsService.selectAllNews(0, 5);
        session.setAttribute("service",news.get(0));
        return "redirect:backdemo/publicpages/Service.jsp";
    }

    @RequestMapping(value = "updateService")
    public String updateService(News news,HttpSession session){
        boolean b = newsService.updateService(news);
        session.setAttribute("service",news);
        return "redirect:backdemo/publicpages/Service.jsp";
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
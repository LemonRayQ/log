package cn.pzhu.logistics.controller;

import cn.pzhu.logistics.pojo.Shuffling;
import cn.pzhu.logistics.service.ShufflingService;
import cn.pzhu.logistics.util.FileUtil;
import org.springframework.stereotype.Controller;
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
 * 管理轮播图
 */
@Controller
public class ShufflingController {

    @Resource(name = "shufflingService")
    ShufflingService shufflingService;


    public void setShufflingService(ShufflingService shufflingService) {
        this.shufflingService = shufflingService;
    }

    @RequestMapping(value = "insertImage")
    public String insertImage(Shuffling shuffling, HttpServletRequest request) throws IOException {

        String base64Data = request.getParameter("base64Data");
        MultipartFile multipartFile = FileUtil.base64ToMultipart(base64Data);

        if (shufflingService.insertImage(shuffling, multipartFile)) {
            request.getSession().setAttribute("insertImageFlag", "yes");
            List<Shuffling> shufflings = shufflingService.selectAllFromShuffling();
            request.getSession().setAttribute("imageList", shufflings);
        } else {
            request.getSession().setAttribute("insertImageFlag", "no");
        }
        return "redirect:backdemo/imgshow/img.jsp";
    }

    @RequestMapping(value = "deleteImage")
    public String deleteImage(String shuffling_id, HttpSession session) {
        int i = Integer.parseInt(shuffling_id);
        if (shufflingService.deleteById(i)) {
            session.setAttribute("deleteImageFlag", "yes");
            List<Shuffling> shufflings = shufflingService.selectAllFromShuffling();
            session.setAttribute("imageList", shufflings);
        } else {
            session.setAttribute("deleteImageFlag", "no");
        }
        return "redirect:backdemo/imgshow/img.jsp";
    }

    @RequestMapping(value = "selectImage")
    public String selectImage(HttpSession session) {
        List<Shuffling> shufflings = shufflingService.selectAllFromShuffling();
        session.setAttribute("imageList", shufflings);
        return "redirect:backdemo/imgshow/img.jsp";
    }
}
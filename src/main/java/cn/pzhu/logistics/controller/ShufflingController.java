package cn.pzhu.logistics.controller;

import cn.pzhu.logistics.pojo.Shuffling;
import cn.pzhu.logistics.service.ShufflingService;
import cn.pzhu.logistics.util.FileUtil;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
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
    public String insertImage(Shuffling shuffling, HttpServletRequest request, Model model) throws IOException {

        String base64Data = request.getParameter("base64Data");
        MultipartFile multipartFile = FileUtil.base64ToMultipart(base64Data);

        if (shufflingService.insertImage(shuffling, multipartFile)) {
            model.addAttribute("insertImageFlag", "yes");
            List<Shuffling> shufflings = shufflingService.selectAllFromShuffling();
            model.addAttribute("imageList", shufflings);
        } else {
            model.addAttribute("insertImageFlag", "no");
        }
        return "backdemo/imgshow/img";
    }

    @RequestMapping(value = "deleteImage")
    public String deleteImage(String shuffling_id, Model model) {
        int i = Integer.parseInt(shuffling_id);
        if (shufflingService.deleteById(i)) {
            model.addAttribute("deleteImageFlag", "yes");
            List<Shuffling> shufflings = shufflingService.selectAllFromShuffling();
            model.addAttribute("imageList", shufflings);
        } else {
            model.addAttribute("deleteImageFlag", "no");
        }
        return "backdemo/imgshow/img";
    }

    @RequestMapping(value = "selectImage")
    public String selectImage(Model model) {
        List<Shuffling> shufflings = shufflingService.selectAllFromShuffling();
        model.addAttribute("imageList", shufflings);
        return "backdemo/imgshow/img";
    }
}
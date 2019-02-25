package cn.pzhu.logistics.controller;

import cn.pzhu.logistics.util.FileUtil;
import cn.pzhu.logistics.util.ResponseUtil;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;

/**
 * 文件下载
 * @author Impassive_y
 */
@Controller
public class UtilController {

    @RequestMapping(value = "downloadFile")
    public ResponseEntity<byte[]> download(HttpServletRequest request) {
        String path = request.getParameter("path").replaceAll(" ","+");
        File file = FileUtil.getFile(path);
        try {
            return ResponseUtil.buildResponseEntity(file, request);
        } catch (IOException e) {
            e.printStackTrace();
        }
        return null;
    }

    @RequestMapping(value = "connect")
    public String connect(HttpServletRequest request) {

        return "connect/connect";
    }
}

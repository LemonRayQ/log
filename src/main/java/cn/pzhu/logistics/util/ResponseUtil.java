package cn.pzhu.logistics.util;

import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;

import javax.servlet.http.HttpServletRequest;
import java.io.*;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;

public class ResponseUtil {

    private static String getBrowser(HttpServletRequest request) {
        String UserAgent = request.getHeader("USER-AGENT").toLowerCase();
        System.out.println("userAgent:"+request.getHeader("USER-AGENT").toLowerCase());
        if (UserAgent.contains("trident"))
            return "IE";
        if (UserAgent.contains("firefox")){
            return "FF";
        }
        if (UserAgent.contains("safari"))
            return "SF";
        return null;
    }

    public static ResponseEntity<byte[]> buildResponseEntity(File file,HttpServletRequest request) throws IOException {
        byte[] body = null;
        InputStream is = new FileInputStream(file);
        body = new byte[is.available()];
        int read = is.read(body);
        HttpHeaders headers = new HttpHeaders();
        switch (getBrowser(request)) {
            case "IE":
                headers.set(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename=\\\"" + URLEncoder.encode(file.getName(), "UTF-8"));
                break;
            case "FF":
                String envName = new String(file.getName().getBytes(StandardCharsets.UTF_8), StandardCharsets.ISO_8859_1);
                headers.add("Content-Disposition", "attachment;filename=\"" + envName + "\"");
                break;
            default:
                headers.add("Content-Disposition", "attachment;filename=" + URLEncoder.encode(file.getName(), "UTF-8"));
                break;
        }

        //设置Http状态码
        HttpStatus statusCode = HttpStatus.OK;
        //返回数据
        return new ResponseEntity<byte[]>(body, headers, statusCode);
    }



}

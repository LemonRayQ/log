package cn.pzhu.logistics.util;

import com.sun.image.codec.jpeg.JPEGCodec;
import com.sun.image.codec.jpeg.JPEGImageEncoder;
import org.apache.commons.io.FilenameUtils;
import org.springframework.web.multipart.MultipartFile;
import sun.misc.BASE64Decoder;

import javax.imageio.ImageIO;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.*;
import java.util.UUID;

public class FileUtil {
    public static String uplodeFile(MultipartFile multipartFile,String path) throws IOException {
        String random = UUID.randomUUID().toString().substring(0, 5);
        String name = path+random+"_"+multipartFile.getOriginalFilename();
        multipartFile.transferTo(new File("/logistics/"+name));
        return (name).replaceAll("\\\\","/");
    }

    public static void uplodeFile(MultipartFile multipartFile, String path, String name) throws IOException {
        multipartFile.transferTo(new File("/logistics/" + path + name));
    }

    public static void uploadImage(MultipartFile multipartFile, String path, String name) throws IOException {
        multipartFile.transferTo(new File("/logistics/" + path + name));
    }

    /**
     * 设置文件名，使用UUID产生随机字符串，并截取前5个，再与文件初始名通过_拼接
     * @param file
     * @return
     */
    public static String setFileName(MultipartFile file) {
        return UUID.randomUUID().toString().substring(0, 5) + "_" + file.getOriginalFilename();
    }

    public static String setRandomName(MultipartFile file){
        String originalFilename = file.getOriginalFilename();
        String extension = FilenameUtils.getExtension(originalFilename);
        return UUID.randomUUID().toString().substring(0,5)+"."+extension;
    }

    /**
     * 缩放图片(图片宽度设置为500px)
     * @param file
     * @throws IOException
     */
    public static void reduceImage(File file) throws IOException {
        /*缩放比例*/
        double rate;
        double width = FileUtil.getImageWidth(file);
        double height = FileUtil.getImageHeight(file);
        if (width == 500) {
            return;
        } else if (width > 500) {
            rate = 500 / width;
        } else {
            rate = width / 500;
        }
        width = width * rate;
        height = height * rate;
        /*读取图片并压缩图片*/
        Image image = ImageIO.read(file);
        BufferedImage bufferedImage = new BufferedImage((int) width, (int) height, BufferedImage.TYPE_INT_RGB);
        bufferedImage.getGraphics().drawImage(image.getScaledInstance((int) width, (int) height, Image.SCALE_AREA_AVERAGING), 0, 0, null);
        /*创建文件输出流*/
        FileOutputStream fileOutputStream = new FileOutputStream(file);
        JPEGImageEncoder encoder = JPEGCodec.createJPEGEncoder(fileOutputStream);
        encoder.encode(bufferedImage);
        /*关闭文件输出流*/
        fileOutputStream.close();
    }

    /**
     * 获得图片宽度，单位为px
     * @param file
     * @return
     * @throws IOException
     */
    public static int getImageWidth(File file) throws IOException {
        return ImageIO.read(file).getWidth();
    }

    /**
     * 获得文件高度，单位px
     * @param file
     * @return
     * @throws IOException
     */
    public static int getImageHeight(File file) throws IOException {
        return ImageIO.read(file).getHeight();
    }

    public static boolean deleteFile(String path){
        /*String s = path.replaceAll("/", "\\\\");*/
        File file = new File("/logistics/" + path);
        if(file.exists()){
            return file.delete();
        }else{
            return false;
        }
    }

    public static File getFile(String filePath) {
        /*String path = filePath.replaceAll("/", "\\\\");*/
        File file = new File("/logistics/"+filePath);
        return file;
    }


    public static MultipartFile base64ToMultipart(String base64) {
        try {
            String[] baseStrs = base64.split(",");

            BASE64Decoder decoder = new BASE64Decoder();
            byte[] b = new byte[0];
            b = decoder.decodeBuffer(baseStrs[1]);

            for(int i = 0; i < b.length; ++i) {
                if (b[i] < 0) {
                    b[i] += 256;
                }
            }
            return new BASE64DecodedMultipartFile(b, baseStrs[0]);
        } catch (IOException e) {
            e.printStackTrace();
            return null;
        }
    }

}
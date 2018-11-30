package cn.pzhu.logistics.util;

import java.sql.Timestamp;

public class Utils {

    public static Timestamp getCurrentTimeStamp() {
        return new Timestamp(System.currentTimeMillis());
    }

    /**
     * 生成导航栏
     *
     * @param url   连接请求的地址
     * @param count 数据总数
     * @param num   每页显示的数据
     * @param page  当前页数
     * @return
     */
    public static StringBuffer createBar(String url, int count, int num, int page,int classId) {
        StringBuffer bar = new StringBuffer();
        int pages;//共有多少页
        if (count % num == 0) {
            pages = count / num;
        } else {
            pages = (count / num) + 1;
        }
        if (page > 1) {
            bar.append("<li><a href=\"").append(url).append("?classId=").append(classId).append("&page=").append(page - 1).append("\" aria-label=\"Previous\"><span aria-hidden=\"true\">&laquo;</span></a>");
        }
        for (int i = 1; i <= pages; i++) {
            bar.append("<li><a href=\"").append(url).append("?classId=").append(classId).append("&page=").append(i).append("\">").append(i).append("</a></li>");
        }
        if (page < pages) {
            bar.append("<li><a href=\"").append(url).append("?classId=").append(classId).append("&page=").append(page + 1).append("\" aria-label=\"Previous\"><span aria-hidden=\"true\">&raquo;</span></a>");
        }
        return bar;
    }

    /**
     * 生成导航栏
     *
     * @param url   连接请求的地址
     * @param count 数据总数
     * @param num   每页显示的数据
     * @param page  当前页数
     * @return
     */
    /*public static StringBuffer createBar(String url, int count, int num, int page,int classId,int deptId) {
        StringBuffer bar = new StringBuffer();
        int pages;//共有多少页
        if (count % num == 0) {
            pages = count / num;
        } else {
            pages = (count / num) + 1;
        }
        if (page > 1) {
            bar.append("<li><a href=\"").append(url).append("?deptId=").append(deptId).append("&classId=").append(classId).append("&page=").append(page - 1).append("\" aria-label=\"Previous\"><span aria-hidden=\"true\">&laquo;</span></a>");
        }
        for (int i = 1; i <= pages; i++) {
            bar.append("<li><a href=\"").append(url).append("?deptId=").append(deptId).append("&classId=").append(classId).append("&page=").append(i).append("\">").append(i).append("</a></li>");
        }
        if (page < pages) {
            bar.append("<li><a href=\"").append(url).append("?deptId=").append(deptId).append("&classId=").append(classId).append("&page=").append(page + 1).append("\" aria-label=\"Previous\"><span aria-hidden=\"true\">&raquo;</span></a>");
        }
        return bar;
    }*/
}

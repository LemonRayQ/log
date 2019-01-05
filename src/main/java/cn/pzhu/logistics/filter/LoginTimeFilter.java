package cn.pzhu.logistics.filter;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Date;

/**
 * 生成时间令牌
 */
public class LoginTimeFilter implements Filter {

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {

        HttpServletRequest request = (HttpServletRequest)servletRequest;
        HttpServletResponse response = (HttpServletResponse) servletResponse;

        if(request.getSession().getAttribute("time") == null ){
            Date date = new Date();
            long time = date.getTime();

            request.getSession().setAttribute("time",time);

        }

        filterChain.doFilter(request,response);
    }
}
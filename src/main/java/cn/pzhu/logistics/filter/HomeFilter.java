package cn.pzhu.logistics.filter;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * @author Impassive_y
 * @date 2018/11/14 10:11
 */
public class HomeFilter implements Filter {

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        HttpServletRequest request = (HttpServletRequest)servletRequest;
        HttpServletResponse response = (HttpServletResponse)servletResponse;
        if(request.getSession().getAttribute("homeFlag") != null){
            filterChain.doFilter(request,response);
        }else{
            request.getSession().setAttribute("homeFlag","yes");
            response.sendRedirect("/logstics/index.jsp");
        }
    }


}

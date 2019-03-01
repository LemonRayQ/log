package cn.pzhu.logistics.interceptor;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class LoginInterceptor extends HandlerInterceptorAdapter {

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        String url = request.getRequestURL().toString();
        if(url.contains("delete") || url.contains("update") || url.contains("insert")){
            Object loginFlag = request.getSession().getAttribute("loginFlag");
            Object superFlag = request.getSession().getAttribute("superFlag");
            if(loginFlag == null && superFlag == null){
                response.sendRedirect("Home/admin.jsp");
                return false;
            }
        }
        return true;
    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {

        if(modelAndView != null){
            String viewName = modelAndView.getViewName();

            if(viewName.contains("backdemo")){
                Object loginFlag = request.getSession().getAttribute("loginFlag");
                Object superFlag = request.getSession().getAttribute("superFlag");
                if(loginFlag == null && superFlag == null){
                    response.sendRedirect("Home/admin.jsp");
                }
            }
        }



    }

    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {

    }

    @Override
    public void afterConcurrentHandlingStarted(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {

    }
}

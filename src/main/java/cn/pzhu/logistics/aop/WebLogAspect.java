package cn.pzhu.logistics.aop;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.jboss.logging.Logger;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;
import java.util.Enumeration;

@Aspect
@Component
public class WebLogAspect {

    private static Logger logger = Logger.getLogger(WebLogAspect.class);

    @Pointcut("execution(public * cn.pzhu.logistics.controller.*.*(..))")
    public void weblog(){

    }

    @Before("weblog()")
    public void doBefore(JoinPoint joinPoint){

        ServletRequestAttributes attributes = (ServletRequestAttributes) RequestContextHolder.getRequestAttributes();

        assert attributes != null;
        HttpServletRequest request = attributes.getRequest();
        logger.info("###############请求开始##################");
        logger.info("URL:" + request.getRequestURL().toString());
        logger.info("HTTP_METHOD:" + request.getMethod());
        logger.info("IP:" + request.getRemoteAddr());

        Enumeration<String> enumeration = request.getHeaderNames();
        while (enumeration.hasMoreElements()){
            String name = enumeration.nextElement();
            logger.info("name:{"+name+"},value:{"+request.getParameter(name)+"}");
        }

    }

    @AfterReturning(returning = "ret",pointcut = "weblog()")
    public void doAfterReturning(Object ret){
        logger.info("response:" + ret);
        logger.info("###############请求结束##################");
    }



}

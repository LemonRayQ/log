package cn.pzhu.logistics.controller;

import cn.pzhu.logistics.pojo.Level;
import cn.pzhu.logistics.pojo.News;
import cn.pzhu.logistics.pojo.Policy;
import cn.pzhu.logistics.service.PolicyService;
import cn.pzhu.logistics.util.FileUtil;
import cn.pzhu.logistics.util.Utils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.math.BigDecimal;
import java.util.List;
import java.util.Map;

@Controller
public class PolicyController {

    @Resource(name = "policyService")
    private PolicyService policyService;

    @RequestMapping(value = "selectPolicyLevel")
    public String selectPolicyLevel(HttpSession session){
        List<Level> levels = policyService.selectLevel();
        session.setAttribute("level",levels);
        List<Policy> policies = policyService.selectPolicy(0);
        int count = policyService.selectCountPolicy();
        StringBuffer bar = Utils.createBar("../../selectNextPageNews.mvc", count, 5, 1,6);
        session.setAttribute("bar",bar);
        session.setAttribute("policy",policies);
        return "redirect:backdemo/policy/policy.jsp";
    }

    @RequestMapping(value = "insertPolicy")
    public String insert(@RequestParam("paths") MultipartFile path, Policy policy, HttpSession session) {
        if (policyService.insertPolicy(policy, path)) {
            List<Policy> policies = policyService.selectPolicy(0);
            int count = policyService.selectCountPolicy();
            StringBuffer bar = Utils.createBar("../../selectNextPageNews.mvc", count, 5, 1,6);
            session.setAttribute("bar",bar);
            session.setAttribute("policy",policies);
            session.setAttribute("insertFlag", "yes");
        } else {
            session.setAttribute("insertFlag", "no");
        }
        return "redirect:backdemo/news/news.jsp";
    }

    @RequestMapping(value = "updatePolicy")
    public String updatePolicy(HttpServletRequest request){
        String policy_id = request.getParameter("policy_id");
        @SuppressWarnings("unchecked")
        List<Policy> policy = (List<Policy>) request.getSession().getAttribute("policy");
        request.getSession().setAttribute("singlePolicy",policy.get(Integer.parseInt(policy_id)));
        return "redirect:backdemo/policy/policy.jsp";
    }

    @RequestMapping(value = "updatePolicyInfo")
    @ResponseBody
    public String updatePolicyInfo(HttpSession session,Policy policy,@RequestParam("paths") MultipartFile path){
        if(!path.isEmpty()){
            Policy singleNews = (Policy)session.getAttribute("singlePolicy");
            FileUtil.deleteFile(singleNews.getPath());
        }
        policy.setContent(policy.getContent().trim());
        boolean b = policyService.updatePolicy(policy,path);
        if(b){
            List<Policy> policies = policyService.selectPolicy(0);
            session.setAttribute("policy",policies);
            session.setAttribute("singlePolicy",null);
            return "success";
        }
        return "wrong";

    }

    @RequestMapping(value = "deletePolicy")
    @ResponseBody
    public String deletePolicy(HttpServletRequest request){
        boolean flag = true;
        String policy_id = request.getParameter("policy_id");
        String policy_index = request.getParameter("index");
        @SuppressWarnings("unchecked")
        List<Policy> policy = (List<Policy>) request.getSession().getAttribute("policy");
        Policy policy1 = policy.get(Integer.parseInt(policy_index));
        System.out.println(policy1.getPath());
        if(!("".equals(policy1.getPath())) && policy1.getPath() != null){
            flag = FileUtil.deleteFile(policy1.getPath());
        }
        if(flag){
            boolean b = policyService.deletePolicy(Integer.parseInt(policy_id));
            if(b){
                List<Policy> policies = policyService.selectPolicy(0);
                int count = policyService.selectCountPolicy();
                StringBuffer bar = Utils.createBar("../../selectNextPageNews.mvc", count, 5, 1,6);
                request.getSession().setAttribute("bar",bar);
                request.getSession().setAttribute("policy",policies);
                return "success";
            }
        }
        return null;
    }

    @RequestMapping(value = "selectPolicy")
    public String selectPolicy(HttpSession session){
        List<Policy> policies = policyService.selectPolicy();
        session.setAttribute("policies",policies);
        Map<String, BigDecimal> map = policyService.selectPolicyCount();
        System.out.println("count:"+map.get("count1"));
        StringBuffer countryBar = Utils.createBar("../selectNextPage.mvc", map.get("count1").intValue(), 5, 1, 9);
        StringBuffer provinceBar = Utils.createBar("../selectNextPage.mvc", map.get("count2").intValue(), 5, 1, 9);
        StringBuffer collegeBar = Utils.createBar("../selectNextPage.mvc", map.get("count3").intValue(), 5, 1, 9);
        session.setAttribute("countryBar",countryBar);
        session.setAttribute("provinceBar",provinceBar);
        session.setAttribute("collegeBar",collegeBar);
        return "redirect:rule/rule.jsp";
    }


    public void setPolicyService(PolicyService policyService) {
        this.policyService = policyService;
    }
}

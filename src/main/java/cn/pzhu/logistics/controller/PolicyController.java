package cn.pzhu.logistics.controller;

import cn.pzhu.logistics.constant.ClassifyConstant;
import cn.pzhu.logistics.pojo.Level;
import cn.pzhu.logistics.pojo.Policy;
import cn.pzhu.logistics.service.PolicyService;
import cn.pzhu.logistics.util.FileUtil;
import cn.pzhu.logistics.util.Utils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
    public String selectPolicyLevel(Model model, HttpSession session) {
        List<Level> levels = policyService.selectLevel();
        model.addAttribute("level", levels);
        List<Policy> policies = policyService.selectPolicy(0);
        int count = policyService.selectCountPolicy();
        StringBuffer bar = Utils.createBar("./selectNextPageNews", count, 5, 1, 6);
        model.addAttribute("bar", bar);
        session.setAttribute("policy", policies);
        return "backdemo/policy/policy";
    }

    @RequestMapping(value = "insertPolicy")
    public String insert(@RequestParam("paths") MultipartFile path, Policy policy, Model model, HttpSession session) {
        if (policyService.insertPolicy(policy, path)) {
            List<Policy> policies = policyService.selectPolicy(0);
            int count = policyService.selectCountPolicy();
            StringBuffer bar = Utils.createBar("./selectNextPageNews", count, 5, 1, ClassifyConstant.POLICY_DOCUMENT);
            model.addAttribute("bar", bar);
            session.setAttribute("policy", policies);
            model.addAttribute("insertFlag", "yes");
        } else {
            model.addAttribute("insertFlag", "no");
        }
        return "backdemo/news/news";
    }

    @RequestMapping(value = "updatePolicy")
    public String updatePolicy(HttpServletRequest request) {
        String policy_id = request.getParameter("policy_id");
        @SuppressWarnings("unchecked")
        List<Policy> policy = (List<Policy>) request.getSession().getAttribute("policy");
        request.getSession().setAttribute("singlePolicy", policy.get(Integer.parseInt(policy_id)));
        return "backdemo/policy/policy";
    }

    @RequestMapping(value = "updatePolicyInfo")
    @ResponseBody
    public String updatePolicyInfo(HttpSession session, Policy policy, @RequestParam("paths") MultipartFile path) {
        if (!path.isEmpty()) {
            Policy singleNews = (Policy) session.getAttribute("singlePolicy");
            FileUtil.deleteFile(singleNews.getPath());
        }
        policy.setContent(policy.getContent().trim());
        boolean b = policyService.updatePolicy(policy, path);
        if (b) {
            List<Policy> policies = policyService.selectPolicy(0);
            session.setAttribute("policy", policies);
            session.setAttribute("singlePolicy", null);
            return "success";
        }
        return "wrong";

    }

    @RequestMapping(value = "deletePolicy")
    @ResponseBody
    public String deletePolicy(HttpServletRequest request, Model model) {
        boolean flag = true;
        String policy_id = request.getParameter("policy_id");
        String policy_index = request.getParameter("index");
        @SuppressWarnings("unchecked")
        List<Policy> policy = (List<Policy>) request.getSession().getAttribute("policy");
        Policy policy1 = policy.get(Integer.parseInt(policy_index));

        if (!("".equals(policy1.getPath())) && policy1.getPath() != null) {
            flag = FileUtil.deleteFile(policy1.getPath());
        }
        if (flag) {
            boolean b = policyService.deletePolicy(Integer.parseInt(policy_id));
            if (b) {
                List<Policy> policies = policyService.selectPolicy(0);
                int count = policyService.selectCountPolicy();
                StringBuffer bar = Utils.createBar("./selectNextPageNews", count, 5, 1, ClassifyConstant.POLICY_DOCUMENT);
                model.addAttribute("bar", bar);
                request.getSession().setAttribute("policy", policies);
                return "success";
            }
        }
        return null;
    }

    @RequestMapping(value = "selectPolicy")
    public String selectPolicy(Model model, HttpSession session) {
        List<Policy> policies = policyService.selectPolicy();
        session.setAttribute("policies", policies);
        Map<String, BigDecimal> map = policyService.selectPolicyCount();
        if (map != null) {
            StringBuffer countryBar = Utils.createBar("./selectNextPage", map.get("count1").intValue(), 5, 1, ClassifyConstant.RULE_REGULATION);
            StringBuffer provinceBar = Utils.createBar("./selectNextPage", map.get("count2").intValue(), 5, 1, ClassifyConstant.RULE_REGULATION);
            StringBuffer collegeBar = Utils.createBar("./selectNextPage", map.get("count3").intValue(), 5, 1, ClassifyConstant.RULE_REGULATION);

            model.addAttribute("countryBar", countryBar);
            model.addAttribute("provinceBar", provinceBar);
            model.addAttribute("collegeBar", collegeBar);
        }

        return "rule/rule";
    }


    public void setPolicyService(PolicyService policyService) {
        this.policyService = policyService;
    }
}

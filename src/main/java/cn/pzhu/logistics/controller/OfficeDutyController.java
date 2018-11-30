package cn.pzhu.logistics.controller;

import cn.pzhu.logistics.pojo.Department;
import cn.pzhu.logistics.pojo.OfficeDuty;
import cn.pzhu.logistics.service.DepartService;
import cn.pzhu.logistics.service.OfficeDutyService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;
@Controller
public class OfficeDutyController {
    @Resource(name = "officeDutyService")
    private OfficeDutyService officeDutyService;
    @Resource(name = "departService")
    private DepartService departService;

    public void setDepartService(DepartService departService) {
        this.departService = departService;
    }

    public void setOfficeDutyService(OfficeDutyService officeDutyService) {
        this.officeDutyService = officeDutyService;
    }


    @RequestMapping(value = "OfficeDuty.mvc")
    public String OfficeDuty(HttpSession session){
        List<Department> departments = departService.select();
        session.setAttribute("depatment",departments);
        return "redirect:duty/duty.jsp";
    }
    @RequestMapping(value = "singleOfiice.mvc")
    public String singleOfiice(HttpSession session,Integer deptId){
        List<OfficeDuty> duties = officeDutyService.selectSingleOffice(deptId);
        session.setAttribute("duties",duties);
        return "redirect:duty/duty.jsp";
    }

    @RequestMapping(value = "insertDepartment.mvc")
    public String insertOffice(HttpServletRequest request){
        String name = request.getParameter("newName");
        boolean b = departService.insertDepartment(name);
        if (b){
            List<Department> departments = departService.select();
            request.getSession().setAttribute("depart",departments);
        }
        return "redirect:backdemo/publicpages/officeDuty.jsp";
    }

    @RequestMapping(value = "changeDepart.mvc")
    @ResponseBody
    public String changeDepart(HttpServletRequest request,String changeName) {
        int deptId = Integer.parseInt(request.getParameter("optionsRadios"));
        boolean b = departService.changeDepart(deptId, changeName);
        if (b){
            List<Department> departments = departService.select();
            request.getSession().setAttribute("depart",departments);
            return "success";
        }else{
            return "wrong";
        }
    }

}

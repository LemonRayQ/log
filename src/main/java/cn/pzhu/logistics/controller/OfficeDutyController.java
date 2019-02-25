package cn.pzhu.logistics.controller;

import cn.pzhu.logistics.pojo.Department;
import cn.pzhu.logistics.pojo.OfficeDuty;
import cn.pzhu.logistics.service.DepartService;
import cn.pzhu.logistics.service.OfficeDutyService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * 后台科室职责管理
 */
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


    @RequestMapping(value = "OfficeDuty")
    public String OfficeDuty(Model model, HttpSession session){

        //查询所有的部门

        List<Department> departments = departService.select();
        session.setAttribute("depatment",departments);

        //默认查询IP为1的科室的职责
        List<OfficeDuty> duties = officeDutyService.selectSingleOffice(1);
        model.addAttribute("duties",duties);

        return "duty/duty";
    }

    @RequestMapping(value = "singleOfiice")
    public String singleOfiice(Integer deptId,Model model){
        List<OfficeDuty> duties = officeDutyService.selectSingleOffice(deptId);
        model.addAttribute("duties",duties);
        return "duty/duty";
    }

    @RequestMapping(value = "insertDepartment")
    public String insertOffice(HttpServletRequest request){
        String name = request.getParameter("newName");
        boolean b = departService.insertDepartment(name);
        if (b){
            List<Department> departments = departService.select();
            request.getSession().setAttribute("depart",departments);
        }
        return "backdemo/publicpages/officeDuty";
    }

    @RequestMapping(value = "changeDepart")
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

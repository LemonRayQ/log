package cn.pzhu.logistics.controller;

import cn.pzhu.logistics.pojo.Department;
import cn.pzhu.logistics.pojo.News;
import cn.pzhu.logistics.pojo.OfficeDuty;
import cn.pzhu.logistics.service.DepartService;
import cn.pzhu.logistics.service.OfficeDutyService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * @author Impassive_y
 * @date 2018/11/10 12:36
 */
@Controller
public class OfficeController {

    @Resource(name = "departService")
    private DepartService departService;

    @Resource(name = "officeDutyService")
    private OfficeDutyService officeDutyService;

    @RequestMapping(value = "selectOfficeDuty")
    public String selectOfficeDuty(HttpSession session, Model model){
        if(session.getAttribute("depart") == null){
            List<Department> select = departService.select();
            model.addAttribute("depart",select);
        }
        OfficeDuty officeDuty = officeDutyService.selectOfficeDutywithId(1);
        model.addAttribute("office",officeDuty);
        return "backdemo/publicpages/officeDuty";
    }

    @RequestMapping(value = "updateOfficeDuty")
    @ResponseBody
    public String updateOfficeDuty(OfficeDuty officeDuty,Model model){
        boolean b = officeDutyService.updateOfficeDuty(officeDuty);
        OfficeDuty officeDuty1 = officeDutyService.selectOfficeDutywithId(officeDuty.getDeptId());
        model.addAttribute("office",officeDuty1);
        return null;
    }

    @RequestMapping(value = "selectOfficeDutywithId")
    @ResponseBody
    public String selectOfficeDutywithId(Integer deptId,Model model){

        OfficeDuty officeDuty = officeDutyService.selectOfficeDutywithId(deptId);
        model.addAttribute("office",officeDuty);
        return null;
    }

    @RequestMapping(value = "updateIntroduce")
    public String updateIntroduce(News news,Model model){
        boolean b = officeDutyService.updateIntroduce(news);
        model.addAttribute("introduce",news);
        return "backdemo/publicpages/Introduce";
    }

    @RequestMapping(value = "selectIntroduce")
    public String selectIntroduce(Model model){
        News news = officeDutyService.selectIntroduce();
        model.addAttribute("introduce",news);
        return "backdemo/publicpages/Introduce";
    }

    public void setOfficeDutyService(OfficeDutyService officeDutyService) {
        this.officeDutyService = officeDutyService;
    }

    public void setDepartService(DepartService departService) {
        this.departService = departService;
    }
}

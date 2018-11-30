package cn.pzhu.logistics.controller;

import cn.pzhu.logistics.pojo.Department;
import cn.pzhu.logistics.pojo.News;
import cn.pzhu.logistics.pojo.OfficeDuty;
import cn.pzhu.logistics.service.DepartService;
import cn.pzhu.logistics.service.OfficeDutyService;
import org.springframework.stereotype.Controller;
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
    public String selectOfficeDuty(HttpSession session){
        if(session.getAttribute("depart") == null){
            List<Department> select = departService.select();
            session.setAttribute("depart",select);
        }
        OfficeDuty officeDuty = officeDutyService.selectOfficeDutywithId(1);
        session.setAttribute("office",officeDuty);
        return "redirect:backdemo/publicpages/officeDuty.jsp";
    }

    @RequestMapping(value = "updateOfficeDuty")
    @ResponseBody
    public String updateOfficeDuty(OfficeDuty officeDuty,HttpSession session){
        boolean b = officeDutyService.updateOfficeDuty(officeDuty);
        OfficeDuty officeDuty1 = officeDutyService.selectOfficeDutywithId(officeDuty.getDeptId());
        session.setAttribute("office",officeDuty);
        return null;
    }

    @RequestMapping(value = "selectOfficeDutywithId")
    @ResponseBody
    public String selectOfficeDutywithId(Integer deptId,HttpSession session){
        System.out.println(deptId);
        OfficeDuty officeDuty = officeDutyService.selectOfficeDutywithId(deptId);
        session.setAttribute("office",officeDuty);
        return null;
    }

    @RequestMapping(value = "updateIntroduce")
    public String updateIntroduce(News news,HttpSession session){
        boolean b = officeDutyService.updateIntroduce(news);
        session.setAttribute("introduce",news);
        return "redirect:backdemo/publicpages/Introduce.jsp";
    }

    @RequestMapping(value = "selectIntroduce")
    public String selectIntroduce(HttpSession session){
        News news = officeDutyService.selectIntroduce();
        session.setAttribute("introduce",news);
        return "redirect:backdemo/publicpages/Introduce.jsp";
    }

    public void setOfficeDutyService(OfficeDutyService officeDutyService) {
        this.officeDutyService = officeDutyService;
    }

    public void setDepartService(DepartService departService) {
        this.departService = departService;
    }
}

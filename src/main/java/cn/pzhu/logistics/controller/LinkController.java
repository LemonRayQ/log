package cn.pzhu.logistics.controller;

import cn.pzhu.logistics.pojo.Link;
import cn.pzhu.logistics.service.LinkService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * @author Impassive_y
 * @return
 * @date 2018/11/8 21:19
 */
@Controller
public class LinkController {

    @Resource(name = "linkService")
    private LinkService linkService;

    @RequestMapping(value = "insertLink")
    public String insertLink(Link link,HttpSession session){
        boolean b = linkService.addLink(link);
        if(b){
            List<Link> links = linkService.selectAllLink();
            session.setAttribute("links",links);
            return "redirect:backdemo/publicpages/friendLink.jsp";
        }
        return "redirect:backdemo/publicpages/friendLink.jsp";
    }

    @RequestMapping(value = "selectFriendLink")
    public String selectFriendLink(HttpSession session){
        List<Link> links = linkService.selectAllLink();
        session.setAttribute("links",links);
        return "redirect:backdemo/publicpages/friendLink.jsp";
    }

    @RequestMapping(value = "deleteLink")
    @ResponseBody
    public String deleteLink(HttpServletRequest request){
        String linkId = request.getParameter("linkId");
        linkService.deleteLink(Integer.parseInt(linkId));
        List<Link> links = linkService.selectAllLink();
        request.getSession().setAttribute("links",links);
        return "redirect:backdemo/publicpages/friendLink.jsp";
    }

    @RequestMapping(value = "selectWithName")
    public String selectWithName(HttpSession session,String name){
        List<Link> links = linkService.selectLinkWithName(name);
        session.setAttribute("links",links);
        return "redirect:backdemo/publicpages/friendLink.jsp";
    }

    public void setLinkService(LinkService linkService) {
        this.linkService = linkService;
    }
}

package cn.pzhu.logistics.controller;

import cn.pzhu.logistics.pojo.Link;
import cn.pzhu.logistics.service.LinkService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * 友情链接
 * @author Impassive_y
 * @date 2018/11/8 21:19
 */
@Controller
public class LinkController {

    @Resource(name = "linkService")
    private LinkService linkService;

    @RequestMapping(value = "insertLink")
    public String insertLink(Link link, Model model){
        boolean b = linkService.addLink(link);
        if(b){
            List<Link> links = linkService.selectAllLink();
            model.addAttribute("links",links);
        }
        return "backdemo/publicpages/friendLink";
    }

    @RequestMapping(value = "selectFriendLink")
    public String selectFriendLink(Model model){
        List<Link> links = linkService.selectAllLink();
        model.addAttribute("links",links);
        return "backdemo/publicpages/friendLink";
    }

    @RequestMapping(value = "deleteLink")
    @ResponseBody
    public String deleteLink(HttpServletRequest request,Model model){
        String linkId = request.getParameter("linkId");
        linkService.deleteLink(Integer.parseInt(linkId));
        List<Link> links = linkService.selectAllLink();
        model.addAttribute("links",links);
        return "backdemo/publicpages/friendLink";
    }

    @RequestMapping(value = "selectWithName")
    public String selectWithName(String name,Model model){
        List<Link> links = linkService.selectLinkWithName(name);
        model.addAttribute("links",links);
        return "backdemo/publicpages/friendLink";
    }

    public void setLinkService(LinkService linkService) {
        this.linkService = linkService;
    }
}

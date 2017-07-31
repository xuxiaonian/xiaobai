package com.huazhuo.shop.web;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.huazhuo.shop.log.SysLog;
import com.huazhuo.shop.query.SysLogQuery;
import com.huazhuo.shop.security.BackUser;

@RequestMapping("/syslogs")
@Controller
@RooWebScaffold(path = "syslogs", formBackingObject = SysLog.class)
@SessionAttributes({ "subtree", "CurrentUser" })
public class SysLogController {

    @ModelAttribute("subtree")
    public void createSubtreet(HttpServletRequest httpServletRequest) {
        httpServletRequest.getSession().setAttribute("subtree", "syslog");
    }

    @RequestMapping(produces = "text/html")
    public String list(@Valid SysLogQuery sysLogQuery, @ModelAttribute("CurrentUser") BackUser user, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        sysLogQuery.setOperator(user.getUserName());
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("syslogs", SysLog.search(sysLogQuery, firstResult, sizeNo));
            float nrOfPages = (float) SysLog.searchCount(sysLogQuery) / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("syslogs", SysLog.search(sysLogQuery));
        }
        uiModel.addAttribute("sysLogQuery", sysLogQuery);
        uiModel.addAttribute("list", sysLogQuery.toQueryString());
        uiModel.addAttribute("page", page);
        addDateTimeFormatPatterns(uiModel);
        return "syslogs/list";
    }
}

/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.cabinetms.terminal.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.cabinetms.terminal.entity.Terminal;
import com.cabinetms.terminal.service.TerminalService;

/**
 * 终端管理Controller
 * @author 付殿东
 * @version 2016-06-07
 */
@Controller
@RequestMapping(value = "${adminPath}/terminal/terminal")
public class TerminalController extends BaseController {

	@Autowired
	private TerminalService terminalService;
	
	@ModelAttribute
	public Terminal get(@RequestParam(required=false) String id) {
		Terminal entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = terminalService.get(id);
		}
		if (entity == null){
			entity = new Terminal();
		}
		return entity;
	}
	
	@RequiresPermissions("terminal:terminal:view")
	@RequestMapping(value = {"list", ""})
	public String list(Terminal terminal, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<Terminal> page = terminalService.findPage(new Page<Terminal>(request, response), terminal); 
		model.addAttribute("page", page);
		return "cabinetms/terminal/terminalList";
	}

	@RequiresPermissions("terminal:terminal:view")
	@RequestMapping(value = "form")
	public String form(Terminal terminal, Model model) {
		model.addAttribute("terminal", terminal);
		return "cabinetms/terminal/terminalForm";
	}

	@RequiresPermissions("terminal:terminal:edit")
	@RequestMapping(value = "save")
	public String save(Terminal terminal, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, terminal)){
			return form(terminal, model);
		}
		terminalService.save(terminal);
		addMessage(redirectAttributes, "保存终端管理成功");
		return "redirect:"+Global.getAdminPath()+"/terminal/terminal/?repage";
	}
	
	@RequiresPermissions("terminal:terminal:edit")
	@RequestMapping(value = "delete")
	public String delete(Terminal terminal, RedirectAttributes redirectAttributes) {
		terminalService.delete(terminal);
		addMessage(redirectAttributes, "删除终端管理成功");
		return "redirect:"+Global.getAdminPath()+"/terminal/terminal/?repage";
	}

}
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
import com.cabinetms.terminal.entity.CabinetmsTerminal;
import com.cabinetms.terminal.service.CabinetmsTerminalService;

/**
 * 终端管理Controller
 * @author houyi
 * @version 2016-10-11
 */
@Controller
@RequestMapping(value = "${adminPath}/terminal/cabinetmsTerminal")
public class CabinetmsTerminalController extends BaseController {

	@Autowired
	private CabinetmsTerminalService terminalService;
	
	@ModelAttribute
	public CabinetmsTerminal get(@RequestParam(required=false) String id) {
		CabinetmsTerminal entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = terminalService.get(id);
		}
		if (entity == null){
			entity = new CabinetmsTerminal();
		}
		return entity;
	}
	
	@RequiresPermissions("terminal:cabinetmsTerminal:view")
	@RequestMapping(value = {"list", ""})
	public String list(CabinetmsTerminal cabinetmsTerminal, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<CabinetmsTerminal> page = terminalService.findPage(new Page<CabinetmsTerminal>(request, response), cabinetmsTerminal);
		model.addAttribute("page", page);
		return "cabinetms/terminal/cabinetmsTerminalList";
	}

	@RequiresPermissions("terminal:cabinetmsTerminal:view")
	@RequestMapping(value = "form")
	public String form(CabinetmsTerminal cabinetmsTerminal, Model model) {
		model.addAttribute("cabinetmsTerminal", cabinetmsTerminal);
		return "cabinetms/terminal/cabinetmsTerminalForm";
	}

	@RequiresPermissions("terminal:cabinetmsTerminal:edit")
	@RequestMapping(value = "save")
	public String save(CabinetmsTerminal cabinetmsTerminal, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, cabinetmsTerminal)){
			return form(cabinetmsTerminal, model);
		}
		terminalService.save(cabinetmsTerminal);
		addMessage(redirectAttributes, "保存终端管理成功");
		return "redirect:"+Global.getAdminPath()+"/terminal/cabinetmsTerminal/?repage";
	}
	
	@RequiresPermissions("terminal:cabinetmsTerminal:edit")
	@RequestMapping(value = "delete")
	public String delete(CabinetmsTerminal cabinetmsTerminal, RedirectAttributes redirectAttributes) {
		terminalService.delete(cabinetmsTerminal);
		addMessage(redirectAttributes, "删除终端管理成功");
		return "redirect:"+Global.getAdminPath()+"/terminal/cabinetmsTerminal/?repage";
	}

}
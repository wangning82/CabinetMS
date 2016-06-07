/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.cabinetms.programtactic.web;

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
import com.cabinetms.programtactic.entity.ProgramTactic;
import com.cabinetms.programtactic.service.ProgramTacticService;

/**
 * 节目策略Controller
 * @author 付殿东
 * @version 2016-06-07
 */
@Controller
@RequestMapping(value = "${adminPath}/programtactic/programTactic")
public class ProgramTacticController extends BaseController {

	@Autowired
	private ProgramTacticService programTacticService;
	
	@ModelAttribute
	public ProgramTactic get(@RequestParam(required=false) String id) {
		ProgramTactic entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = programTacticService.get(id);
		}
		if (entity == null){
			entity = new ProgramTactic();
		}
		return entity;
	}
	
	@RequiresPermissions("programtactic:programTactic:view")
	@RequestMapping(value = {"list", ""})
	public String list(ProgramTactic programTactic, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<ProgramTactic> page = programTacticService.findPage(new Page<ProgramTactic>(request, response), programTactic); 
		model.addAttribute("page", page);
		return "cabinetms/programtactic/programTacticList";
	}

	@RequiresPermissions("programtactic:programTactic:view")
	@RequestMapping(value = "form")
	public String form(ProgramTactic programTactic, Model model) {
		model.addAttribute("programTactic", programTactic);
		return "cabinetms/programtactic/programTacticForm";
	}

	@RequiresPermissions("programtactic:programTactic:edit")
	@RequestMapping(value = "save")
	public String save(ProgramTactic programTactic, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, programTactic)){
			return form(programTactic, model);
		}
		programTacticService.save(programTactic);
		addMessage(redirectAttributes, "保存节目策略成功");
		return "redirect:"+Global.getAdminPath()+"/programtactic/programTactic/?repage";
	}
	
	@RequiresPermissions("programtactic:programTactic:edit")
	@RequestMapping(value = "delete")
	public String delete(ProgramTactic programTactic, RedirectAttributes redirectAttributes) {
		programTacticService.delete(programTactic);
		addMessage(redirectAttributes, "删除节目策略成功");
		return "redirect:"+Global.getAdminPath()+"/programtactic/programTactic/?repage";
	}

}
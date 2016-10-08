/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.cabinetms.program.web;

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
import com.cabinetms.program.entity.CabinetmsProgram;
import com.cabinetms.program.service.CabinetmsProgramService;

/**
 * 节目管理Controller
 * @author 付殿东
 * @version 2016-10-04
 */
@Controller
@RequestMapping(value = "${adminPath}/program/cabinetmsProgram")
public class CabinetmsProgramController extends BaseController {

	@Autowired
	private CabinetmsProgramService cabinetmsProgramService;
	
	@ModelAttribute
	public CabinetmsProgram get(@RequestParam(required=false) String id) {
		CabinetmsProgram entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = cabinetmsProgramService.get(id);
		}
		if (entity == null){
			entity = new CabinetmsProgram();
		}
		return entity;
	}
	
	@RequiresPermissions("program:cabinetmsProgram:view")
	@RequestMapping(value = {"list", ""})
	public String list(CabinetmsProgram cabinetmsProgram, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<CabinetmsProgram> page = cabinetmsProgramService.findPage(new Page<CabinetmsProgram>(request, response), cabinetmsProgram); 
		model.addAttribute("page", page);
		return "cabinetms/program/cabinetmsProgramList";
	}

	@RequiresPermissions("program:cabinetmsProgram:view")
	@RequestMapping(value = "form")
	public String form(CabinetmsProgram cabinetmsProgram, Model model) {
		model.addAttribute("cabinetmsProgram", cabinetmsProgram);
		return "cabinetms/program/cabinetmsProgramForm";
	}

	@RequiresPermissions("program:cabinetmsProgram:edit")
	@RequestMapping(value = "save")
	public String save(CabinetmsProgram cabinetmsProgram, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, cabinetmsProgram)){
			return form(cabinetmsProgram, model);
		}
		cabinetmsProgramService.save(cabinetmsProgram);
		addMessage(redirectAttributes, "保存节目管理成功");
		return "redirect:"+Global.getAdminPath()+"/program/cabinetmsProgram/?repage";
	}
	
	@RequiresPermissions("program:cabinetmsProgram:edit")
	@RequestMapping(value = "delete")
	public String delete(CabinetmsProgram cabinetmsProgram, RedirectAttributes redirectAttributes) {
		cabinetmsProgramService.delete(cabinetmsProgram);
		addMessage(redirectAttributes, "删除节目管理成功");
		return "redirect:"+Global.getAdminPath()+"/program/cabinetmsProgram/?repage";
	}

}
/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.cabinetms.unit.web;

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
import com.cabinetms.unit.entity.CabinetUnit;
import com.cabinetms.unit.service.CabinetUnitService;

/**
 * 终端机构Controller
 * @author 付殿东
 * @version 2016-06-07
 */
@Controller
@RequestMapping(value = "${adminPath}/unit/cabinetUnit")
public class CabinetUnitController extends BaseController {

	@Autowired
	private CabinetUnitService cabinetUnitService;
	
	@ModelAttribute
	public CabinetUnit get(@RequestParam(required=false) String id) {
		CabinetUnit entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = cabinetUnitService.get(id);
		}
		if (entity == null){
			entity = new CabinetUnit();
		}
		return entity;
	}
	
	@RequiresPermissions("unit:cabinetUnit:view")
	@RequestMapping(value = {"list", ""})
	public String list(CabinetUnit cabinetUnit, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<CabinetUnit> page = cabinetUnitService.findPage(new Page<CabinetUnit>(request, response), cabinetUnit); 
		model.addAttribute("page", page);
		return "cabinetms/unit/cabinetUnitList";
	}

	@RequiresPermissions("unit:cabinetUnit:view")
	@RequestMapping(value = "form")
	public String form(CabinetUnit cabinetUnit, Model model) {
		model.addAttribute("cabinetUnit", cabinetUnit);
		return "cabinetms/unit/cabinetUnitForm";
	}

	@RequiresPermissions("unit:cabinetUnit:edit")
	@RequestMapping(value = "save")
	public String save(CabinetUnit cabinetUnit, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, cabinetUnit)){
			return form(cabinetUnit, model);
		}
		cabinetUnitService.save(cabinetUnit);
		addMessage(redirectAttributes, "保存终端机构成功");
		return "redirect:"+Global.getAdminPath()+"/unit/cabinetUnit/?repage";
	}
	
	@RequiresPermissions("unit:cabinetUnit:edit")
	@RequestMapping(value = "delete")
	public String delete(CabinetUnit cabinetUnit, RedirectAttributes redirectAttributes) {
		cabinetUnitService.delete(cabinetUnit);
		addMessage(redirectAttributes, "删除终端机构成功");
		return "redirect:"+Global.getAdminPath()+"/unit/cabinetUnit/?repage";
	}

}
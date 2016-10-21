/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.cabinetms.programtactic.web;

import java.util.List;

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
import com.cabinetms.common.func.FuncUtil;
import com.cabinetms.programtactic.entity.CabinetmsProgramTactic;
import com.cabinetms.programtactic.service.CabinetmsProgramTacticService;

/**
 * 节目策略一对多生成Controller
 * @author 于滨
 * @version 2016-10-19
 */
@Controller
@RequestMapping(value = "${adminPath}/programtactic/cabinetmsProgramTactic")
public class CabinetmsProgramTacticController extends BaseController {

	@Autowired
	private CabinetmsProgramTacticService cabinetmsProgramTacticService;
	
	@ModelAttribute
	public CabinetmsProgramTactic get(@RequestParam(required=false) String id) {
		CabinetmsProgramTactic entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = cabinetmsProgramTacticService.get(id);
		}
		if (entity == null){
			entity = new CabinetmsProgramTactic();
		}
		return entity;
	}
	
	@RequiresPermissions("programtactic:cabinetmsProgramTactic:view")
	@RequestMapping(value = {"list", ""})
	public String list(CabinetmsProgramTactic cabinetmsProgramTactic, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<CabinetmsProgramTactic> page = cabinetmsProgramTacticService.findPage(new Page<CabinetmsProgramTactic>(request, response), cabinetmsProgramTactic); 
		model.addAttribute("page", page);
		return "cabinetms/programtactic/cabinetmsProgramTacticList";
	}

	@RequiresPermissions("programtactic:cabinetmsProgramTactic:view")
	@RequestMapping(value = "form")
	public String form(CabinetmsProgramTactic cabinetmsProgramTactic, Model model) throws InstantiationException, IllegalAccessException {
		List<?> programList = FuncUtil.getAll(FuncUtil.PROGRAM_KEY_NAME);
		model.addAttribute("programList", programList);
		model.addAttribute("cabinetmsProgramTactic", cabinetmsProgramTactic);
		return "cabinetms/programtactic/cabinetmsProgramTacticForm";
	}

	@RequiresPermissions("programtactic:cabinetmsProgramTactic:edit")
	@RequestMapping(value = "save")
	public String save(CabinetmsProgramTactic cabinetmsProgramTactic, Model model, RedirectAttributes redirectAttributes) throws InstantiationException, IllegalAccessException {
		if (!beanValidator(model, cabinetmsProgramTactic)){
			return form(cabinetmsProgramTactic, model);
		}
		cabinetmsProgramTacticService.save(cabinetmsProgramTactic);
		addMessage(redirectAttributes, "保存节目策略一对多生成成功");
		return "redirect:"+Global.getAdminPath()+"/programtactic/cabinetmsProgramTactic/?repage";
	}
	
	@RequiresPermissions("programtactic:cabinetmsProgramTactic:edit")
	@RequestMapping(value = "delete")
	public String delete(CabinetmsProgramTactic cabinetmsProgramTactic, RedirectAttributes redirectAttributes) {
		cabinetmsProgramTacticService.delete(cabinetmsProgramTactic);
		addMessage(redirectAttributes, "删除节目策略一对多生成成功");
		return "redirect:"+Global.getAdminPath()+"/programtactic/cabinetmsProgramTactic/?repage";
	}

}
/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.cabinetms.notice.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cabinetms.terminal.entity.CabinetmsTerminal;
import com.cabinetms.terminal.service.CabinetmsTerminalService;
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
import com.cabinetms.notice.entity.CabinetmsNotice;
import com.cabinetms.notice.service.CabinetmsNoticeService;

import java.util.List;

/**
 * 消息信息Controller
 * @author houyi
 * @version 2016-10-11
 */
@Controller
@RequestMapping(value = "${adminPath}/notice/cabinetmsNotice")
public class CabinetmsNoticeController extends BaseController {

	@Autowired
	private CabinetmsNoticeService cabinetmsNoticeService;

	@Autowired
	private CabinetmsTerminalService terminalService;

	@ModelAttribute
	public CabinetmsNotice get(@RequestParam(required=false) String id) {
		CabinetmsNotice entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = cabinetmsNoticeService.get(id);
		}
		if (entity == null){
			entity = new CabinetmsNotice();
		}
		return entity;
	}

	@RequiresPermissions("notice:cabinetmsNotice:view")
	@RequestMapping(value = {"list", ""})
	public String list(CabinetmsNotice cabinetmsNotice, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<CabinetmsNotice> page = cabinetmsNoticeService.findPage(new Page<CabinetmsNotice>(request, response), cabinetmsNotice);
		model.addAttribute("page", page);
		return "cabinetms/notice/cabinetmsNoticeList";
	}

	@RequiresPermissions("notice:cabinetmsNotice:view")
	@RequestMapping(value = "form")
	public String form(CabinetmsNotice cabinetmsNotice, Model model) {
		model.addAttribute("cabinetmsNotice", cabinetmsNotice);
		return "cabinetms/notice/cabinetmsNoticeForm";
	}

	@RequiresPermissions("notice:cabinetmsNotice:edit")
	@RequestMapping(value = "save")
	public String save(CabinetmsNotice cabinetmsNotice, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, cabinetmsNotice)){
			return form(cabinetmsNotice, model);
		}
		cabinetmsNoticeService.save(cabinetmsNotice);
		addMessage(redirectAttributes, "保存消息信息成功");
		return "redirect:"+Global.getAdminPath()+"/notice/cabinetmsNotice/?repage";
	}

	@RequiresPermissions("notice:cabinetmsNotice:edit")
	@RequestMapping(value = "delete")
	public String delete(CabinetmsNotice cabinetmsNotice, RedirectAttributes redirectAttributes) {
		cabinetmsNoticeService.delete(cabinetmsNotice);
		addMessage(redirectAttributes, "删除消息信息成功");
		return "redirect:"+Global.getAdminPath()+"/notice/cabinetmsNotice/?repage";
	}

	@RequiresPermissions("notice:cabinetmsNotice:edit")
	@RequestMapping(value = {"terminalListForm"})
	public String terminalListForm(HttpServletRequest request, HttpServletResponse response, Model model){
		List<CabinetmsTerminal> terminalList = terminalService.findList(new CabinetmsTerminal());
		model.addAttribute("terminalList", terminalList);
		return "cabinetms/notice/terminalListForm";
	}

	/**
	 * 消息发布
	 * @param cabinetmsNotice
	 * @param model
	 * @return
	 */
	@RequiresPermissions("notice:cabinetmsNotice:edit")
	@RequestMapping(value = "publish")
	public String publish(CabinetmsNotice cabinetmsNotice, Model model, RedirectAttributes redirectAttributes){
		cabinetmsNoticeService.publish(cabinetmsNotice);
		addMessage(redirectAttributes, "发布消息信息成功");
		return "redirect:"+Global.getAdminPath()+"/notice/cabinetmsNotice/?repage";
	}

}
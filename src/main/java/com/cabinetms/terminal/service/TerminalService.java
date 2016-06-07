/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.cabinetms.terminal.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.cabinetms.terminal.entity.Terminal;
import com.cabinetms.terminal.dao.TerminalDao;

/**
 * 终端管理Service
 * @author 付殿东
 * @version 2016-06-07
 */
@Service
@Transactional(readOnly = true)
public class TerminalService extends CrudService<TerminalDao, Terminal> {

	public Terminal get(String id) {
		return super.get(id);
	}
	
	public List<Terminal> findList(Terminal terminal) {
		return super.findList(terminal);
	}
	
	public Page<Terminal> findPage(Page<Terminal> page, Terminal terminal) {
		return super.findPage(page, terminal);
	}
	
	@Transactional(readOnly = false)
	public void save(Terminal terminal) {
		super.save(terminal);
	}
	
	@Transactional(readOnly = false)
	public void delete(Terminal terminal) {
		super.delete(terminal);
	}
	
}
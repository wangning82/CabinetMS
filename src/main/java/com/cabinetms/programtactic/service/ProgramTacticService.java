/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.cabinetms.programtactic.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.cabinetms.programtactic.entity.ProgramTactic;
import com.cabinetms.programtactic.dao.ProgramTacticDao;

/**
 * 节目策略Service
 * @author 付殿东
 * @version 2016-06-07
 */
@Service
@Transactional(readOnly = true)
public class ProgramTacticService extends CrudService<ProgramTacticDao, ProgramTactic> {

	public ProgramTactic get(String id) {
		return super.get(id);
	}
	
	public List<ProgramTactic> findList(ProgramTactic programTactic) {
		return super.findList(programTactic);
	}
	
	public Page<ProgramTactic> findPage(Page<ProgramTactic> page, ProgramTactic programTactic) {
		return super.findPage(page, programTactic);
	}
	
	@Transactional(readOnly = false)
	public void save(ProgramTactic programTactic) {
		super.save(programTactic);
	}
	
	@Transactional(readOnly = false)
	public void delete(ProgramTactic programTactic) {
		super.delete(programTactic);
	}
	
}
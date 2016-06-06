/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.cabinetms.program.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.cabinetms.program.entity.Program;
import com.cabinetms.program.dao.ProgramDao;

/**
 * 节目管理Service
 * @author 付殿东
 * @version 2016-06-06
 */
@Service
@Transactional(readOnly = true)
public class ProgramService extends CrudService<ProgramDao, Program> {

	public Program get(String id) {
		return super.get(id);
	}
	
	public List<Program> findList(Program program) {
		return super.findList(program);
	}
	
	public Page<Program> findPage(Page<Program> page, Program program) {
		return super.findPage(page, program);
	}
	
	@Transactional(readOnly = false)
	public void save(Program program) {
		super.save(program);
	}
	
	@Transactional(readOnly = false)
	public void delete(Program program) {
		super.delete(program);
	}
	
}
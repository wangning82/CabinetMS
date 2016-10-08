/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.cabinetms.program.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.cabinetms.program.entity.CabinetmsProgram;
import com.cabinetms.program.dao.CabinetmsProgramDao;

/**
 * 节目管理Service
 * @author 付殿东
 * @version 2016-10-08
 */
@Service
@Transactional(readOnly = true)
public class CabinetmsProgramService extends CrudService<CabinetmsProgramDao, CabinetmsProgram> {

	public CabinetmsProgram get(String id) {
		return super.get(id);
	}
	
	public List<CabinetmsProgram> findList(CabinetmsProgram cabinetmsProgram) {
		return super.findList(cabinetmsProgram);
	}
	
	public Page<CabinetmsProgram> findPage(Page<CabinetmsProgram> page, CabinetmsProgram cabinetmsProgram) {
		return super.findPage(page, cabinetmsProgram);
	}
	
	@Transactional(readOnly = false)
	public void save(CabinetmsProgram cabinetmsProgram) {
		super.save(cabinetmsProgram);
	}
	
	@Transactional(readOnly = false)
	public void delete(CabinetmsProgram cabinetmsProgram) {
		super.delete(cabinetmsProgram);
	}
	
}
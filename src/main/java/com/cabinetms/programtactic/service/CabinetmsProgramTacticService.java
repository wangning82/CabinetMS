/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.cabinetms.programtactic.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.cabinetms.programtactic.entity.CabinetmsProgramTactic;
import com.cabinetms.programtactic.dao.CabinetmsProgramTacticDao;

/**
 * 节目策略Service
 * @author 付殿东
 * @version 2016-10-09
 */
@Service
@Transactional(readOnly = true)
public class CabinetmsProgramTacticService extends CrudService<CabinetmsProgramTacticDao, CabinetmsProgramTactic> {

	public CabinetmsProgramTactic get(String id) {
		return super.get(id);
	}
	
	public List<CabinetmsProgramTactic> findList(CabinetmsProgramTactic cabinetmsProgramTactic) {
		return super.findList(cabinetmsProgramTactic);
	}
	
	public Page<CabinetmsProgramTactic> findPage(Page<CabinetmsProgramTactic> page, CabinetmsProgramTactic cabinetmsProgramTactic) {
		return super.findPage(page, cabinetmsProgramTactic);
	}
	
	@Transactional(readOnly = false)
	public void save(CabinetmsProgramTactic cabinetmsProgramTactic) {
		super.save(cabinetmsProgramTactic);
	}
	
	@Transactional(readOnly = false)
	public void delete(CabinetmsProgramTactic cabinetmsProgramTactic) {
		super.delete(cabinetmsProgramTactic);
	}
	
}
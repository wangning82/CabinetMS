/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.cabinetms.unit.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.cabinetms.unit.entity.CabinetUnit;
import com.cabinetms.unit.dao.CabinetUnitDao;

/**
 * 终端机构Service
 * @author 付殿东
 * @version 2016-06-07
 */
@Service
@Transactional(readOnly = true)
public class CabinetUnitService extends CrudService<CabinetUnitDao, CabinetUnit> {

	public CabinetUnit get(String id) {
		return super.get(id);
	}
	
	public List<CabinetUnit> findList(CabinetUnit cabinetUnit) {
		return super.findList(cabinetUnit);
	}
	
	public Page<CabinetUnit> findPage(Page<CabinetUnit> page, CabinetUnit cabinetUnit) {
		return super.findPage(page, cabinetUnit);
	}
	
	@Transactional(readOnly = false)
	public void save(CabinetUnit cabinetUnit) {
		super.save(cabinetUnit);
	}
	
	@Transactional(readOnly = false)
	public void delete(CabinetUnit cabinetUnit) {
		super.delete(cabinetUnit);
	}
	
}
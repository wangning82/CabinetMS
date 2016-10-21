/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.cabinetms.programtactic.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.cabinetms.programtactic.entity.CabinetmsProgramTactic;
import com.cabinetms.programtactic.dao.CabinetmsProgramTacticDao;
import com.cabinetms.programtactic.entity.CabinetmsProgramTacticDetail;
import com.cabinetms.programtactic.dao.CabinetmsProgramTacticDetailDao;

/**
 * 节目策略一对多生成Service
 * @author 于滨
 * @version 2016-10-19
 */
@Service
@Transactional(readOnly = true)
public class CabinetmsProgramTacticService extends CrudService<CabinetmsProgramTacticDao, CabinetmsProgramTactic> {

	@Autowired
	private CabinetmsProgramTacticDetailDao cabinetmsProgramTacticDetailDao;
	
	public CabinetmsProgramTactic get(String id) {
		CabinetmsProgramTactic cabinetmsProgramTactic = super.get(id);
		cabinetmsProgramTactic.setCabinetmsProgramTacticDetailList(cabinetmsProgramTacticDetailDao.findList(new CabinetmsProgramTacticDetail(cabinetmsProgramTactic)));
		return cabinetmsProgramTactic;
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
		for (CabinetmsProgramTacticDetail cabinetmsProgramTacticDetail : cabinetmsProgramTactic.getCabinetmsProgramTacticDetailList()){
			if (cabinetmsProgramTacticDetail.getId() == null){
				continue;
			}
			if (CabinetmsProgramTacticDetail.DEL_FLAG_NORMAL.equals(cabinetmsProgramTacticDetail.getDelFlag())){
				if (StringUtils.isBlank(cabinetmsProgramTacticDetail.getId())){
					cabinetmsProgramTacticDetail.setProgramTactic(cabinetmsProgramTactic);
					cabinetmsProgramTacticDetail.preInsert();
					cabinetmsProgramTacticDetailDao.insert(cabinetmsProgramTacticDetail);
				}else{
					cabinetmsProgramTacticDetail.preUpdate();
					cabinetmsProgramTacticDetailDao.update(cabinetmsProgramTacticDetail);
				}
			}else{
				cabinetmsProgramTacticDetailDao.delete(cabinetmsProgramTacticDetail);
			}
		}
	}
	
	@Transactional(readOnly = false)
	public void delete(CabinetmsProgramTactic cabinetmsProgramTactic) {
		super.delete(cabinetmsProgramTactic);
		cabinetmsProgramTacticDetailDao.delete(new CabinetmsProgramTacticDetail(cabinetmsProgramTactic));
	}
	
}
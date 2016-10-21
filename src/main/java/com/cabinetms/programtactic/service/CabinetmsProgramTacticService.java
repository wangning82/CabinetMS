/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.cabinetms.programtactic.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cabinetms.common.Constants;
import com.cabinetms.program.dao.ProgramDao;
import com.cabinetms.program.entity.Program;
import com.cabinetms.programtactic.dao.CabinetmsProgramTacticDao;
import com.cabinetms.programtactic.dao.CabinetmsProgramTacticDetailDao;
import com.cabinetms.programtactic.entity.CabinetmsProgramTactic;
import com.cabinetms.programtactic.entity.CabinetmsProgramTacticDetail;
import com.cabinetms.terminal.dao.CabinetmsTerminalDao;
import com.cabinetms.terminal.entity.CabinetmsTerminal;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.common.utils.StringUtils;

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
	
	@Autowired
	private CabinetmsTerminalDao cabinetmsTerminalDao;
	
	@Autowired
	private ProgramDao programDao;
	
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
					
					/**********************新增操作，需要把节目状态修正为策略中，代表占用 Start**********************/
					String programId = cabinetmsProgramTacticDetail.getProgram().getId();
					Program editProgram = programDao.get(programId);
					editProgram.setStatus(Constants.PROGRAM_STATUS_USED);
					programDao.update(editProgram);
					/**********************新增操作，需要把节目状态修正为策略中，代表占用 End**********************/
					
					cabinetmsProgramTacticDetail.preInsert();
					cabinetmsProgramTacticDetailDao.insert(cabinetmsProgramTacticDetail);
				}else{
					cabinetmsProgramTacticDetail.preUpdate();
					String delFlag = cabinetmsProgramTacticDetail.getDelFlag();
					
					/**********************删除操作，需要把节目状态修正为已提交 Start**********************/
					if(StringUtils.equals("1", delFlag)){
						String programId = cabinetmsProgramTacticDetail.getProgram().getId();
						Program editProgram = programDao.get(programId);
						editProgram.setStatus(Constants.PROGRAM_STATUS_SUBMITED);
						programDao.update(editProgram);
					}
					/**********************删除操作，需要把节目状态修正为已提交 End**********************/
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
	
	@Transactional(readOnly = false)
	public void release(CabinetmsProgramTactic cabinetmsProgramTactic){
		List<CabinetmsTerminal> termList = cabinetmsProgramTactic.getTermList();
		for (CabinetmsTerminal cabinetmsTerminal : termList) {
			String termId = cabinetmsTerminal.getId();
			CabinetmsTerminal editTerm = cabinetmsTerminalDao.get(termId);
			editTerm.setProgramTactic(cabinetmsProgramTactic);
			cabinetmsTerminalDao.update(editTerm);
		}
	}
	
}
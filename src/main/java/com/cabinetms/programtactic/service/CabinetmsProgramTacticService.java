/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.cabinetms.programtactic.service;

import java.util.List;

import org.apache.commons.collections.CollectionUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cabinetms.common.Constants;
import com.cabinetms.program.dao.ProgramDao;
import com.cabinetms.program.entity.Program;
import com.cabinetms.program.service.ProgramService;
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
	private ProgramService programService;
	
	@Autowired
	private ProgramDao programDao;
	
	public CabinetmsProgramTactic get(String id) {
		CabinetmsProgramTactic cabinetmsProgramTactic = super.get(id);
		cabinetmsProgramTactic.setCabinetmsProgramTacticDetailList(cabinetmsProgramTacticDetailDao.findList(new CabinetmsProgramTacticDetail(cabinetmsProgramTactic)));
		
		/**********************绑定节目下拉列表数据 Start**********************/
		List<CabinetmsProgramTacticDetail> cabinetmsProgramTacticDetailList = cabinetmsProgramTactic.getCabinetmsProgramTacticDetailList();
		if(CollectionUtils.isNotEmpty(cabinetmsProgramTacticDetailList)){
			for (CabinetmsProgramTacticDetail cabinetmsProgramTacticDetail : cabinetmsProgramTacticDetailList) {
				String proId = cabinetmsProgramTacticDetail.getProgram().getId();
				List<Program> programList = programService.findProgramForEdit(proId);
				cabinetmsProgramTacticDetail.setProgramList(programList);
			}
		}
		/**********************绑定节目下拉列表数据 End**********************/
		return cabinetmsProgramTactic;
	}
	
	public List<CabinetmsProgramTactic> findList(CabinetmsProgramTactic cabinetmsProgramTactic) {
		return super.findList(cabinetmsProgramTactic);
	}
	
	public Page<CabinetmsProgramTactic> findPage(Page<CabinetmsProgramTactic> page, CabinetmsProgramTactic cabinetmsProgramTactic) {
		return super.findPage(page, cabinetmsProgramTactic);
	}
	
	/**
	 * 编辑方法
	 */
	@Transactional(readOnly = false)
	public void save(CabinetmsProgramTactic cabinetmsProgramTactic) {
		super.save(cabinetmsProgramTactic);
		for (CabinetmsProgramTacticDetail cabinetmsProgramTacticDetail : cabinetmsProgramTactic.getCabinetmsProgramTacticDetailList()){
			if (CabinetmsProgramTacticDetail.DEL_FLAG_NORMAL.equals(cabinetmsProgramTacticDetail.getDelFlag())){
				if (StringUtils.isBlank(cabinetmsProgramTacticDetail.getId())){
					cabinetmsProgramTacticDetail.setProgramTactic(cabinetmsProgramTactic);
					
					/**********************新增操作，需要把节目状态修正为策略中，代表占用 Start**********************/
					String programId = cabinetmsProgramTacticDetail.getProgram().getId();
					Program editProgram = programDao.get(programId);
					editProgram.setStatus(Constants.PROGRAM_STATUS_USED);
					editProgram.preUpdate();
					programDao.update(editProgram);
					/**********************新增操作，需要把节目状态修正为策略中，代表占用 End**********************/
					
					cabinetmsProgramTacticDetail.preInsert();
					cabinetmsProgramTacticDetailDao.insert(cabinetmsProgramTacticDetail);
				}else{
					cabinetmsProgramTacticDetail.preUpdate();
					cabinetmsProgramTacticDetailDao.update(cabinetmsProgramTacticDetail);
				}
			}else{
				
				/**********************删除操作，需要把节目状态修正为已提交 Start**********************/
				String programId = cabinetmsProgramTacticDetail.getProgram().getId();
				Program editProgram = programDao.get(programId);
				editProgram.setStatus(Constants.PROGRAM_STATUS_SUBMITED);
				editProgram.preUpdate();
				programDao.update(editProgram);
				/**********************删除操作，需要把节目状态修正为已提交 End**********************/
				
				cabinetmsProgramTacticDetailDao.delete(cabinetmsProgramTacticDetail);
			}
		}
	}
	
	/**
	 * 删除方法，删除的同时把关联的节目的状态置成已提交，意味着未被使用
	 */
	@Transactional(readOnly = false)
	public void delete(CabinetmsProgramTactic cabinetmsProgramTactic) {
		super.delete(cabinetmsProgramTactic);
		
		/*********************删除策略的时候需要把策略下挂的节目状态改成已提交 Start*******************/
		resetStatusForProgram(cabinetmsProgramTactic);
		/*********************删除策略的时候需要把策略下挂的节目状态改成已提交 End*******************/
		
		clearStatusForCabinetmsTerminal(cabinetmsProgramTactic);
		
		cabinetmsProgramTacticDetailDao.delete(new CabinetmsProgramTacticDetail(cabinetmsProgramTactic));
	}
	
	/**
	 * 重置节目状态为已提交，可被再次使用
	 * @param cabinetmsProgramTactic
	 */
	@Transactional(readOnly = false)
	public void resetStatusForProgram(CabinetmsProgramTactic cabinetmsProgramTactic){
		CabinetmsProgramTacticDetail queryDetail = new CabinetmsProgramTacticDetail();
		queryDetail.setProgramTactic(cabinetmsProgramTactic);
		List<CabinetmsProgramTacticDetail> details = cabinetmsProgramTacticDetailDao.findList(queryDetail);
		if(CollectionUtils.isNotEmpty(details)){
			for (CabinetmsProgramTacticDetail cabinetmsProgramTacticDetail : details) {
				Program program = cabinetmsProgramTacticDetail.getProgram();
				String proId = program.getId();
				Program editProgram = programDao.get(proId);
				editProgram.setStatus(Constants.PROGRAM_STATUS_SUBMITED);
				editProgram.preUpdate();
				programDao.update(editProgram);
			}
		}
	}
	
	/**
	 * 发布方法，策略表的状态置成已发布，关联的终端表的策略id
	 * @param cabinetmsProgramTactic
	 */
	@Transactional(readOnly = false)
	public void release(CabinetmsProgramTactic cabinetmsProgramTactic){
		cabinetmsProgramTactic.setStatus(Constants.STATUS_RELEASED);
		cabinetmsProgramTactic.preUpdate();
		super.save(cabinetmsProgramTactic);
		
		List<CabinetmsTerminal> termList = cabinetmsProgramTactic.getTermList();
		for (CabinetmsTerminal cabinetmsTerminal : termList) {
			String termId = cabinetmsTerminal.getId();
			CabinetmsTerminal editTerm = cabinetmsTerminalDao.get(termId);
			editTerm.setProgramTactic(cabinetmsProgramTactic);
			editTerm.preUpdate();
			cabinetmsTerminalDao.update(editTerm);
		}
	}
	
	/**
	 * 撤销方法，策略表状态置成待发布，关联的终端表关联的策略置成null
	 * @param cabinetmsProgramTactic
	 */
	@Transactional(readOnly = false)
	public void cancel(CabinetmsProgramTactic cabinetmsProgramTactic){
		cabinetmsProgramTactic.setStatus(Constants.STATUS_WAIT_RELEASE);
		cabinetmsProgramTactic.preUpdate();
		super.save(cabinetmsProgramTactic);
		
		clearStatusForCabinetmsTerminal(cabinetmsProgramTactic);
	}
	
	/**
	 * 清除终端关联的策略id
	 * @param cabinetmsProgramTactic
	 */
	@Transactional(readOnly = false)
	public void clearStatusForCabinetmsTerminal(CabinetmsProgramTactic cabinetmsProgramTactic) {
		CabinetmsTerminal queryTerm = new CabinetmsTerminal();
		queryTerm.setProgramTactic(new CabinetmsProgramTactic(cabinetmsProgramTactic.getId()));
		List<CabinetmsTerminal> termList = cabinetmsTerminalDao.findList(queryTerm);
		for (CabinetmsTerminal cabinetmsTerminal : termList) {
			String termId = cabinetmsTerminal.getId();
			CabinetmsTerminal editTerm = cabinetmsTerminalDao.get(termId);
			editTerm.setProgramTactic(null);
			editTerm.preUpdate();
			cabinetmsTerminalDao.update(editTerm);
		}
	}
	
}
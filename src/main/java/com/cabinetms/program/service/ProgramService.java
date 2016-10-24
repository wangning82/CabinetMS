/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.cabinetms.program.service;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.cabinetms.program.entity.Program;
import com.cabinetms.common.Constants;
import com.cabinetms.program.dao.ProgramDao;

/**
 * 节目管理Service
 * @author 朱广成
 * @version 2016-10-19
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
	
	/**
	 * 为节目策略写的查询节目方法，如果是编辑则传id进来，
	 * 首先先查所有已提交的节目，判断编辑的节目id是否在已提交的节目集合中，
	 * 如果存在则直接返回给页面显示，如果不在，则单独查询出来放到集合中返回
	 * 
	 * @param id
	 * @return
	 */
	public List<Program> findProgramForEdit(String id){
		Program program = new Program();
		program.setStatus(Constants.PROGRAM_STATUS_SUBMITED);
		List<Program> programList = findList(program);
		if(CollectionUtils.isEmpty(programList)){
			programList = new ArrayList<>();
		}
		if(StringUtils.isNotBlank(id)){
			boolean flag = false;
			for (Program program2 : programList) {
				if(StringUtils.equals(program2.getId(), id)){
					flag = true;
					break;
				}
			}
			
			if(!flag){
				Program editProgram = get(id);
				if(editProgram!=null){
					programList.add(editProgram);
				}
			}
		}
		
		return programList;
	}
	
	/**
	 * 为节目策略写的查询节目方法，新增时调用此方法，
	 * 查所有已提交的节目返回即可
	 * 
	 * @param id
	 * @return
	 */
	public List<Program> findProgramForAdd(){
		return findProgramForEdit(null);
	}
}
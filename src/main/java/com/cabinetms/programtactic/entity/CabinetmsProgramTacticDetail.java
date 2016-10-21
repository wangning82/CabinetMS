/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.cabinetms.programtactic.entity;

import com.cabinetms.programtactic.entity.CabinetmsProgramTactic;
import org.hibernate.validator.constraints.Length;
import com.cabinetms.program.entity.Program;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 节目策略一对多生成Entity
 * @author 于滨
 * @version 2016-10-19
 */
public class CabinetmsProgramTacticDetail extends DataEntity<CabinetmsProgramTacticDetail> {
	
	private static final long serialVersionUID = 1L;
	private CabinetmsProgramTactic programTactic;		// 节目策略ID 父类
	private String programTacticName;		// 节目策略名称
	private Program program;		// 节目ID
	private String programName;		// 节目名称
	private String starttime;		// 开始时间
	private String endtime;		// 结束时间
	
	public CabinetmsProgramTacticDetail() {
		super();
	}

	public CabinetmsProgramTacticDetail(String id){
		super(id);
	}

	public CabinetmsProgramTacticDetail(CabinetmsProgramTactic programTactic){
		this.programTactic = programTactic;
	}

	public CabinetmsProgramTactic getProgramTactic() {
		return programTactic;
	}

	public void setProgramTactic(CabinetmsProgramTactic programTactic) {
		this.programTactic = programTactic;
	}
	
	@Length(min=0, max=64, message="节目策略名称长度必须介于 0 和 64 之间")
	public String getProgramTacticName() {
		return programTacticName;
	}

	public void setProgramTacticName(String programTacticName) {
		this.programTacticName = programTacticName;
	}
	
	public Program getProgram() {
		return program;
	}

	public void setProgram(Program program) {
		this.program = program;
	}
	
	@Length(min=0, max=64, message="节目名称长度必须介于 0 和 64 之间")
	public String getProgramName() {
		return programName;
	}

	public void setProgram(String programName) {
		this.programName = programName;
	}
	
	public String getStarttime() {
		return starttime;
	}

	public void setStarttime(String starttime) {
		this.starttime = starttime;
	}
	
	public String getEndtime() {
		return endtime;
	}

	public void setEndtime(String endtime) {
		this.endtime = endtime;
	}
	
}
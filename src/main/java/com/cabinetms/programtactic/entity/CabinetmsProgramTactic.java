/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.cabinetms.programtactic.entity;

import org.hibernate.validator.constraints.Length;
import java.util.Date;
import java.util.List;

import com.cabinetms.terminal.entity.CabinetmsTerminal;
import com.google.common.collect.Lists;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 节目策略一对多生成Entity
 * @author 于滨
 * @version 2016-10-19
 */
public class CabinetmsProgramTactic extends DataEntity<CabinetmsProgramTactic> {
	private static final long serialVersionUID = 1L;
	private String no;		// 策略编号
	private String name;		// 策略名称
	private String starttime;		// 开始时间
	private String endtime;		// 结束时间
	private String status;		// 策略状态
	private Date beginCreateDate;		// 开始 创建时间
	private Date endCreateDate;		// 结束 创建时间
	private List<CabinetmsProgramTacticDetail> cabinetmsProgramTacticDetailList = Lists.newArrayList();		// 子表列表
	private List<CabinetmsTerminal> termList = Lists.newArrayList();//策略发布时使用的终端收集列表
	private String programJsonStr;
	public CabinetmsProgramTactic() {
		super();
	}

	public CabinetmsProgramTactic(String id){
		super(id);
	}

	@Length(min=0, max=64, message="策略编号长度必须介于 0 和 64 之间")
	public String getNo() {
		return no;
	}

	public void setNo(String no) {
		this.no = no;
	}
	
	@Length(min=0, max=64, message="策略名称长度必须介于 0 和 64 之间")
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
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
	
	@Length(min=0, max=1, message="策略状态长度必须介于 0 和 1 之间")
	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
	
	public Date getBeginCreateDate() {
		return beginCreateDate;
	}

	public void setBeginCreateDate(Date beginCreateDate) {
		this.beginCreateDate = beginCreateDate;
	}
	
	public Date getEndCreateDate() {
		return endCreateDate;
	}

	public void setEndCreateDate(Date endCreateDate) {
		this.endCreateDate = endCreateDate;
	}
		
	public List<CabinetmsProgramTacticDetail> getCabinetmsProgramTacticDetailList() {
		return cabinetmsProgramTacticDetailList;
	}

	public void setCabinetmsProgramTacticDetailList(List<CabinetmsProgramTacticDetail> cabinetmsProgramTacticDetailList) {
		this.cabinetmsProgramTacticDetailList = cabinetmsProgramTacticDetailList;
	}

	public List<CabinetmsTerminal> getTermList() {
		return termList;
	}

	public void setTermList(List<CabinetmsTerminal> termList) {
		this.termList = termList;
	}

	public String getProgramJsonStr() {
		return programJsonStr;
	}

	public void setProgramJsonStr(String programJsonStr) {
		this.programJsonStr = programJsonStr;
	}

}
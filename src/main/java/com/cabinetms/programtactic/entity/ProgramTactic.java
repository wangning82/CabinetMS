/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.cabinetms.programtactic.entity;

import org.hibernate.validator.constraints.Length;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 节目策略Entity
 * @author 付殿东
 * @version 2016-06-07
 */
public class ProgramTactic extends DataEntity<ProgramTactic> {
	
	private static final long serialVersionUID = 1L;
	private String no;		// 策略编号
	private String name;		// 策略名称
	private String programNo;		// 节目编号
	private String programName;		// 节目名称
	private Date starttime;		// 开始时间
	private Date endtime;		// 结束时间
	
	public ProgramTactic() {
		super();
	}

	public ProgramTactic(String id){
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
	
	@Length(min=0, max=64, message="节目编号长度必须介于 0 和 64 之间")
	public String getProgramNo() {
		return programNo;
	}

	public void setProgramNo(String programNo) {
		this.programNo = programNo;
	}
	
	@Length(min=0, max=64, message="节目名称长度必须介于 0 和 64 之间")
	public String getProgramName() {
		return programName;
	}

	public void setProgramName(String programName) {
		this.programName = programName;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public Date getStarttime() {
		return starttime;
	}

	public void setStarttime(Date starttime) {
		this.starttime = starttime;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public Date getEndtime() {
		return endtime;
	}

	public void setEndtime(Date endtime) {
		this.endtime = endtime;
	}
	
}
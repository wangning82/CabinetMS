/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.cabinetms.terminal.entity;

import org.hibernate.validator.constraints.Length;
import java.util.Date;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 终端管理Entity
 * @author 付殿东
 * @version 2016-06-07
 */
public class Terminal extends DataEntity<Terminal> {
	
	private static final long serialVersionUID = 1L;
	private String no;		// 终端编号
	private String name;		// 终端名称
	private String ip;		// 终端IP
	private String programTacticId;		// 节目策略ID
	private String noticeTacticId;		// 消息策略ID
	private String unitId;		// 机构ID
	private String unitName;		// 机构名称
	private Date beginCreateDate;		// 开始 创建时间
	private Date endCreateDate;		// 结束 创建时间
	
	public Terminal() {
		super();
	}

	public Terminal(String id){
		super(id);
	}

	@Length(min=0, max=64, message="终端编号长度必须介于 0 和 64 之间")
	public String getNo() {
		return no;
	}

	public void setNo(String no) {
		this.no = no;
	}
	
	@Length(min=0, max=64, message="终端名称长度必须介于 0 和 64 之间")
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	@Length(min=0, max=64, message="终端IP长度必须介于 0 和 64 之间")
	public String getIp() {
		return ip;
	}

	public void setIp(String ip) {
		this.ip = ip;
	}
	
	@Length(min=0, max=64, message="节目策略ID长度必须介于 0 和 64 之间")
	public String getProgramTacticId() {
		return programTacticId;
	}

	public void setProgramTacticId(String programTacticId) {
		this.programTacticId = programTacticId;
	}
	
	@Length(min=0, max=64, message="消息策略ID长度必须介于 0 和 64 之间")
	public String getNoticeTacticId() {
		return noticeTacticId;
	}

	public void setNoticeTacticId(String noticeTacticId) {
		this.noticeTacticId = noticeTacticId;
	}
	
	@Length(min=0, max=64, message="机构ID长度必须介于 0 和 64 之间")
	public String getUnitId() {
		return unitId;
	}

	public void setUnitId(String unitId) {
		this.unitId = unitId;
	}
	
	@Length(min=0, max=64, message="机构名称长度必须介于 0 和 64 之间")
	public String getUnitName() {
		return unitName;
	}

	public void setUnitName(String unitName) {
		this.unitName = unitName;
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
		
}
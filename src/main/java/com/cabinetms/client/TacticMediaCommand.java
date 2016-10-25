package com.cabinetms.client;

import java.util.List;

import com.google.common.collect.Lists;

public class TacticMediaCommand {
	private String command; // 指令
	private String clientIp; // 终端IP地址
	private String destination; // 终端队列地址
	private String startDate;// 策略开始日期
	private String endDate;// 策略结束日期

	private List<TacticDetailMediaCommand> detailList = Lists.newLinkedList();

	public List<TacticDetailMediaCommand> getDetailList() {
		return detailList;
	}

	public void setDetailList(List<TacticDetailMediaCommand> detailList) {
		this.detailList = detailList;
	}

	public String getCommand() {
		return command;
	}

	public void setCommand(String command) {
		this.command = command;
	}

	public String getClientIp() {
		return clientIp;
	}

	public void setClientIp(String clientIp) {
		this.clientIp = clientIp;
	}

	public String getDestination() {
		return destination;
	}

	public void setDestination(String destination) {
		this.destination = destination;
	}

	public String getStartDate() {
		return startDate;
	}

	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}

	public String getEndDate() {
		return endDate;
	}

	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}

}

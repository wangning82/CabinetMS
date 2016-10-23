/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.cabinetms.notice.service;

import com.cabinetms.common.Constants;
import com.cabinetms.notice.dao.CabinetmsNoticeDao;
import com.cabinetms.notice.entity.CabinetmsNotice;
import com.cabinetms.terminal.entity.CabinetmsTerminal;
import com.cabinetms.terminal.service.CabinetmsTerminalService;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

/**
 * 消息信息Service
 * @author houyi
 * @version 2016-10-11
 */
@Service
@Transactional(readOnly = true)
public class CabinetmsNoticeService extends CrudService<CabinetmsNoticeDao, CabinetmsNotice> {

	@Autowired
	private CabinetmsNoticeDao cabinetmsNoticeDao;

	@Autowired
	private CabinetmsTerminalService terminalService;

	public CabinetmsNotice get(String id) {
		return super.get(id);
	}
	
	public List<CabinetmsNotice> findList(CabinetmsNotice cabinetmsNotice) {
		return super.findList(cabinetmsNotice);
	}
	
	public Page<CabinetmsNotice> findPage(Page<CabinetmsNotice> page, CabinetmsNotice cabinetmsNotice) {
		return super.findPage(page, cabinetmsNotice);
	}
	
	@Transactional(readOnly = false)
	public void save(CabinetmsNotice cabinetmsNotice) {
		super.save(cabinetmsNotice);
	}
	
	@Transactional(readOnly = false)
	public void delete(CabinetmsNotice cabinetmsNotice) {
		super.delete(cabinetmsNotice);
	}

	/**
	 * 发布消息
	 * @param cabinetmsNotice
     */
    @Transactional(readOnly = false)
    public List<CabinetmsTerminal> publish(CabinetmsNotice cabinetmsNotice){
        // 修改消息状态
		cabinetmsNotice.setStatus(Constants.NOTICE_STATUS_PUBLISHING);
		cabinetmsNoticeDao.update(cabinetmsNotice);

		List<CabinetmsTerminal> terminalList = new ArrayList<CabinetmsTerminal>();
		// 更新终端表
		for(String terminalId : cabinetmsNotice.getTerminalIds()){
			CabinetmsTerminal terminal = terminalService.get(terminalId);
			terminal.setNotice(cabinetmsNotice);
			terminalService.save(terminal);
			terminalList.add(terminal);
		}
		return terminalList;
    }

	/**
	 * 撤销发布消息
	 * @param cabinetmsNotice
	 */
	@Transactional(readOnly = false)
	public List<CabinetmsTerminal> undoPublish(CabinetmsNotice cabinetmsNotice){
		// 修改消息状态
		cabinetmsNotice.setStatus(Constants.NOTICE_STATUS_UNPUBLISHED);
		cabinetmsNotice.setBeginDate(null);
		cabinetmsNotice.setEndDate(null);
		cabinetmsNoticeDao.update(cabinetmsNotice);

		CabinetmsTerminal param = new CabinetmsTerminal();
		param.setNotice(cabinetmsNotice);
		List<CabinetmsTerminal> terminalList = terminalService.findList(param);
		for(CabinetmsTerminal terminal : terminalList){
			terminal.setNotice(null);
			terminalService.save(terminal);
		}
		return terminalList;

	}
	
}
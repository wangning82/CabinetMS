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
    public void publish(CabinetmsNotice cabinetmsNotice){
        // 修改消息状态
		cabinetmsNotice.setStatus(Constants.NOTICE_STATUS_PUBLISHING);
		cabinetmsNoticeDao.update(cabinetmsNotice);

		// 添加中间表
		for(String terminalId : cabinetmsNotice.getTerminalIds()){
			cabinetmsNotice.setTerminalId(terminalId);
			cabinetmsNoticeDao.insertNoticeToTerminal(cabinetmsNotice);

			// 更新终端表
			CabinetmsTerminal terminal = terminalService.get(terminalId);
			terminal.setNotice(cabinetmsNotice);
			terminalService.save(terminal);

			// 发送终端播放指令 TODO

		}
    }

	/**
	 * 撤销发布消息
	 * @param cabinetmsNotice
	 */
	@Transactional(readOnly = false)
	public void undoPublish(CabinetmsNotice cabinetmsNotice){
		// 修改消息状态
		cabinetmsNotice.setStatus(Constants.NOTICE_STATUS_UNPUBLISHED);
		cabinetmsNoticeDao.update(cabinetmsNotice);

		// 删除中间表
		for(String terminalId : cabinetmsNotice.getTerminalIds()){
			cabinetmsNotice.setTerminalId(terminalId);
			cabinetmsNoticeDao.deleteNoticeToTerminal(cabinetmsNotice);

			// 更新终端表
			CabinetmsTerminal terminal = terminalService.get(terminalId);
			terminal.setNotice(null);
			terminalService.save(terminal);

			// 发送终端播放指令 TODO

		}

	}
	
}
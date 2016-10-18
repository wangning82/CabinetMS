/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.cabinetms.notice.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.cabinetms.notice.entity.CabinetmsNotice;
import com.cabinetms.notice.dao.CabinetmsNoticeDao;

/**
 * 消息信息Service
 * @author houyi
 * @version 2016-10-11
 */
@Service
@Transactional(readOnly = true)
public class CabinetmsNoticeService extends CrudService<CabinetmsNoticeDao, CabinetmsNotice> {

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

    @Transactional(readOnly = false)
    public void publish(CabinetmsNotice cabinetmsNotice){
        // TODO 修改消息状态
        // TODO 添加中间表
    }
	
}
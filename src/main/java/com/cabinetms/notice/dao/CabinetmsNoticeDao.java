/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.cabinetms.notice.dao;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.cabinetms.notice.entity.CabinetmsNotice;

/**
 * 消息信息DAO接口
 * @author houyi
 * @version 2016-10-11
 */
@MyBatisDao
public interface CabinetmsNoticeDao extends CrudDao<CabinetmsNotice> {

    /**
     * 添加消息终端关系表
     * @param entity
     * @return
     */
    int insertNoticeToTerminal(CabinetmsNotice entity);

    /**
     * 删除消息终端关系表
     * @param entity
     * @return
     */
    int deleteNoticeToTerminal(CabinetmsNotice entity);
	
}
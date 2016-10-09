/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.cabinetms.programtactic.dao;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.cabinetms.programtactic.entity.CabinetmsProgramTactic;

/**
 * 节目策略DAO接口
 * @author 付殿东
 * @version 2016-10-09
 */
@MyBatisDao
public interface CabinetmsProgramTacticDao extends CrudDao<CabinetmsProgramTactic> {
	
}
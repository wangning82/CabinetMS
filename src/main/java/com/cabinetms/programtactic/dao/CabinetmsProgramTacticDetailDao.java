/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.cabinetms.programtactic.dao;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.cabinetms.programtactic.entity.CabinetmsProgramTacticDetail;

/**
 * 节目策略一对多生成DAO接口
 * @author 于滨
 * @version 2016-10-19
 */
@MyBatisDao
public interface CabinetmsProgramTacticDetailDao extends CrudDao<CabinetmsProgramTacticDetail> {
	
}
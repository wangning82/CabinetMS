/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.cabinetms.terminal.dao;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.cabinetms.terminal.entity.CabinetmsTerminal;

/**
 * 终端管理DAO接口
 *
 * @author houyi
 * @version 2016-10-11
 */
@MyBatisDao
public interface CabinetmsTerminalDao extends CrudDao<CabinetmsTerminal> {

    /**
     * 更新终端状态
     * @param entity
     * @return
     */
    int updateStatus(CabinetmsTerminal entity);

}
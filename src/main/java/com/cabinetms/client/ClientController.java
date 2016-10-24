package com.cabinetms.client;

import com.cabinetms.terminal.entity.CabinetmsTerminal;
import com.cabinetms.terminal.service.CabinetmsTerminalService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Date;

/**
 * Created by houyi on 2016/6/12.
 */
@Controller
public class ClientController {

    @Autowired
    private SimpMessagingTemplate template;

    @Autowired
    private CabinetmsTerminalService terminalService;

    @RequestMapping(value = "${clientPath}/client/index")
    public String index(HttpServletRequest request, HttpServletResponse response, Model model) {
        return "client/cabinet";
    }

    /**
     * 更新终端状态
     * @param mediaCommand
     */
    @MessageMapping("/queue")
    public void updateTerminalStatus(MediaCommand mediaCommand) {
        CabinetmsTerminal terminal = new CabinetmsTerminal();
        terminal.setTerminalIp(mediaCommand.getClientIp());
        terminal.setStatus(mediaCommand.getStatus());
        terminal.setUpdateDate(new Date());
        terminalService.updateStatus(terminal);
    }



}

package com.cabinetms.client;

import com.cabinetms.terminal.entity.CabinetmsTerminal;
import com.cabinetms.terminal.service.CabinetmsTerminalService;
import org.apache.commons.lang3.StringUtils;
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
        model.addAttribute("ip", getIpAddr(request));
        return "client/cabinet";
    }

    /**
     * 获取客户端IP地址
     * @param request
     * @return
     */
    private String getIpAddr(HttpServletRequest request) {
        String ip = request.getHeader("X-Forwarded-For");
        if (StringUtils.isNotEmpty(ip) && !"unKnown".equalsIgnoreCase(ip)) {
            //多次反向代理后会有多个ip值，第一个ip才是真实ip
            int index = ip.indexOf(",");
            if (index != -1) {
                return ip.substring(0, index);
            } else {
                return ip;
            }
        }
        ip = request.getHeader("X-Real-IP");
        if (StringUtils.isNotEmpty(ip) && !"unKnown".equalsIgnoreCase(ip)) {
            return ip;
        }
        return request.getRemoteAddr();
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

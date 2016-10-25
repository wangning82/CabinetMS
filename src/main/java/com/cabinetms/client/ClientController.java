package com.cabinetms.client;

import com.cabinetms.common.tool.Base64Util;
import com.cabinetms.terminal.entity.CabinetmsTerminal;
import com.cabinetms.terminal.service.CabinetmsTerminalService;
import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.utils.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

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
        if(mediaCommand.getStatus() != null){
            terminal.setStatus(mediaCommand.getStatus());
        }
        if(mediaCommand.getScreenshot() != null){
            terminal.setScreenshot(mediaCommand.getScreenshot());
        }
        terminal.setUpdateDate(new Date());
        terminalService.updateStatus(terminal);
    }

    @RequestMapping(value = "${clientPath}/client/saveScreenShotPic")
    @ResponseBody
    public String saveScreenShotPic(String imgStr){
        String realPath = Global.getScreenshotBaseDir() + Global.SCREENSHOT_BASE_URL;
        FileUtils.createDirectory(FileUtils.path(realPath));
        String image = imgStr.split(",")[1];
        return Base64Util.generateImage(image, realPath);
    }
}

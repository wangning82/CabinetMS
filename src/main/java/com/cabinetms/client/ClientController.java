package com.cabinetms.client;

import com.cabinetms.common.tool.Base64Util;
import com.cabinetms.terminal.entity.CabinetmsTerminal;
import com.cabinetms.terminal.service.CabinetmsTerminalService;
import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.utils.FileUtils;
import com.thinkgem.jeesite.common.utils.IdGen;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.File;
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
        response.addHeader("Access-Control-Allow-Origin", "*");
        response.addHeader("access-control-allow-credentials", "true");
        return "client/cabinet";
    }

    /**
     * 更新终端状态
     *
     * @param mediaCommand
     */
    @MessageMapping("/queue")
    public void updateTerminalStatus(MediaCommand mediaCommand) {
        CabinetmsTerminal terminal = new CabinetmsTerminal();
        terminal.setTerminalIp(mediaCommand.getClientIp());
        if (mediaCommand.getStatus() != null) {
            terminal.setStatus(mediaCommand.getStatus());
        }
        if (mediaCommand.getScreenshot() != null) {
            terminal.setScreenshot(mediaCommand.getScreenshot());
        }
        terminal.setUpdateDate(new Date());
        terminalService.updateByIP(terminal);
    }

    /**
     * 保存截图
     *
     * @param ip
     * @param imgStr
     * @param request
     * @deprecated
     */
    @RequestMapping(value = "${clientPath}/client/saveScreenShotPic", method = RequestMethod.POST)
    @ResponseBody
    public void saveScreenShotPic(String ip, String imgStr, HttpServletRequest request) {
        String realPath = Global.getScreenshotBaseDir() + Global.SCREENSHOT_BASE_URL;
        FileUtils.createDirectory(FileUtils.path(realPath));
        String image = imgStr.split(",")[1];
        String screenshot = Base64Util.generateImage(image, realPath);

        CabinetmsTerminal terminal = new CabinetmsTerminal();
        terminal.setTerminalIp(ip);
        terminal.setScreenshot(request.getContextPath() + Global.SCREENSHOT_BASE_URL + screenshot);
        terminal.setUpdateDate(new Date());
        terminalService.updateByIP(terminal);
    }

    /**
     * 保存截图
     * @param ip
     * @param request
     */
    @RequestMapping(value = "${clientPath}/client/saveScreenShotPic1", method = RequestMethod.POST)
    @ResponseBody
    public void saveScreenShotPic1(String ip, int width, int height, HttpServletRequest request) throws Exception {
        String realPath = Global.getScreenshotBaseDir() + Global.SCREENSHOT_BASE_URL;
        FileUtils.createDirectory(FileUtils.path(realPath));

        Robot robot = new Robot();
        Dimension screenSize = new Dimension(width, height);
        int areaWidth = (int) (screenSize.getWidth() / 2.3);
        int areaHeight = (int) (screenSize.getHeight() / 1.6);
        int x = 0, y = 0;
        Rectangle area = new Rectangle(x, y, areaWidth, areaHeight);
        BufferedImage beforeImage = robot.createScreenCapture(area);

        String screenshot = realPath + File.separator + IdGen.uuid() + ".bmp";
        ImageIO.write(beforeImage, "bmp", new File(screenshot));

        CabinetmsTerminal terminal = new CabinetmsTerminal();
        terminal.setTerminalIp(ip);
        terminal.setScreenshot(request.getContextPath() + Global.SCREENSHOT_BASE_URL + screenshot);
        terminal.setUpdateDate(new Date());
        terminalService.updateByIP(terminal);
    }

}

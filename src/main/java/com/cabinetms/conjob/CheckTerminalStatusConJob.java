package com.cabinetms.conjob;

import com.cabinetms.client.MediaCommand;
import com.cabinetms.terminal.entity.CabinetmsTerminal;
import com.cabinetms.terminal.service.CabinetmsTerminalService;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.scheduling.quartz.QuartzJobBean;

import java.util.List;

/**
 * 检查终端状态
 * Created by houyi on 2016/10/16.
 */
public class CheckTerminalStatusConJob extends QuartzJobBean {

    @Autowired
    private CabinetmsTerminalService terminalService;

    @Autowired
    private SimpMessagingTemplate template;

    private String queuePrefix = "/queue/";

    private String COMMAND_PING = "ping";

    @Override
    protected void executeInternal(JobExecutionContext jobExecutionContext) throws JobExecutionException {
        List<CabinetmsTerminal> list = terminalService.findList(null);
        for(CabinetmsTerminal terminal : list){
            String dest = queuePrefix + terminal.getTerminalIp();
            MediaCommand mediaCommand = new MediaCommand();
            mediaCommand.setCommand(COMMAND_PING);
            mediaCommand.setClientIp(terminal.getTerminalIp());
            mediaCommand.setDestination(dest);
            this.template.convertAndSend(dest, mediaCommand);
        }
    }
}

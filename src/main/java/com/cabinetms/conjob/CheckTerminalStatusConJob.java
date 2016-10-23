package com.cabinetms.conjob;

import com.cabinetms.client.MediaCommand;
import com.cabinetms.common.Constants;
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

    @Override
    protected void executeInternal(JobExecutionContext jobExecutionContext) throws JobExecutionException {
        List<CabinetmsTerminal> list = terminalService.findList(new CabinetmsTerminal());
        MediaCommand mediaCommand = null;
        for(CabinetmsTerminal terminal : list){
            terminal.setStatus(Constants.TERMINAL_STATUS_CLOSED);
            terminalService.updateStatus(terminal);

            String dest = Constants.SOCKET_QUEUE_PREFIX + terminal.getTerminalIp();
            mediaCommand = new MediaCommand();
            mediaCommand.setCommand(Constants.SOCKET_COMMAND_PING);
            mediaCommand.setClientIp(terminal.getTerminalIp());
            mediaCommand.setDestination(dest);
            template.convertAndSend(dest, mediaCommand);
        }
    }
}

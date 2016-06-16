package com.cabinetms.ftp.service.impl;

import com.cabinetms.ftp.service.FtpService;
import org.apache.commons.net.ftp.FTPClient;
import org.apache.commons.net.ftp.FTPFile;
import org.apache.commons.net.ftp.FTPReply;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import java.io.*;

@Service(value = "ftpService")
public class FtpServiceImpl implements FtpService {
    protected Logger logger = LoggerFactory.getLogger(getClass());

    @Value("${ftp.server.ip}")
    private String serverip;

    @Value("${ftp.server.port}")
    private Integer serverport;

    @Value("${ftp.server.username}")
    private String username;

    @Value("${ftp.server.password}")
    private String password;

    private FTPClient ftpClient;

    private FTPClient getFtpClient() {
        if (ftpClient == null) {
            ftpClient = new FTPClient();
            try {
                ftpClient.connect(serverip, serverport);
                ftpClient.login(username, password);
                if (!FTPReply.isPositiveCompletion(ftpClient.getReplyCode())) {
                    ftpClient.disconnect();
                    logger.debug("FTP 登录失败，请检查用户名或者密码是否正确！");
                    return null;
                } else {
                    logger.debug("FTP 登录成功！");
                    return ftpClient;
                }
            } catch (Exception e) {
                logger.error("FTP 连接失败！" + e);
                return null;
            }
        } else return ftpClient;
    }

    @Override
    public boolean upload(String path, String filename, File file) {
        ftpClient = getFtpClient();
        if (ftpClient != null) {
            try {
                ftpClient.changeWorkingDirectory(path);
                InputStream is = new FileInputStream(file);
                ftpClient.storeFile(filename, is);
                is.close();
                return true;
            } catch (Exception e) {
                logger.error("FTP 上传文件失败。" + e);
                return false;
            }
        }
        return false;
    }

    @Override
    public boolean download(String path, String filename, File file) {
        ftpClient = getFtpClient();
        if (ftpClient != null) {
            try {
                ftpClient.changeWorkingDirectory(path);
                FTPFile[] fs = ftpClient.listFiles();
                for (FTPFile ff : fs) {
                    if (ff.getName().equals(filename)) {
                        OutputStream is = new FileOutputStream(file);
                        ftpClient.retrieveFile(ff.getName(), is);
                        is.close();
                        break;
                    }
                }
                return true;
            } catch (Exception e) {
                logger.error("FTP 下载文件失败。" + e);
                return false;
            }
        }
        return false;
    }

    @Override
    public void disconnect() {
        ftpClient = getFtpClient();
        if (ftpClient != null) {
            try {
                ftpClient.logout();
            } catch (IOException e) {
                e.printStackTrace();
            } finally {
                if (ftpClient.isConnected()) {
                    try {
                        ftpClient.disconnect();
                    } catch (IOException e) {
                        e.printStackTrace();
                    }
                }
            }
            ftpClient = null;
        }
    }

    public String getServerip() {
        return serverip;
    }

    public void setServerip(String serverip) {
        this.serverip = serverip;
    }

    public Integer getServerport() {
        return serverport;
    }

    public void setServerport(Integer serverport) {
        this.serverport = serverport;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}

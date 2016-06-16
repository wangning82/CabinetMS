package com.cabinetms.ftp.service;

import java.io.File;

public interface FtpService {

    /**
     * 上传文件
     *
     * @param path     FTP文件路径
     * @param filename FTP文件名称
     * @param file     本地文件
     * @return
     */
    boolean upload(String path, String filename, File file);

    /**
     * 下载文件
     *
     * @param path     FTP文件路径
     * @param filename FTP文件名称
     * @param file     本地文件
     * @return
     */
    boolean download(String path, String filename, File file);

    /**
     * 断开连接
     *
     * @return
     */
    void disconnect();
}

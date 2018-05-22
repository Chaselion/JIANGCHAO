package com.zy.dmop.filestore.service.impl;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.MalformedURLException;

import jcifs.smb.SmbException;
import jcifs.smb.SmbFile;
import jcifs.smb.SmbFileInputStream;
import jcifs.smb.SmbFileOutputStream;

import org.apache.log4j.Logger;

import com.zy.dmop.api.filestore.service.IFileStoreService;


public class SambaFileStoreService implements IFileStoreService {
	private static Logger log = Logger.getLogger(SambaFileStoreService.class);
	
	private String sambaRootUrl;	// = "smb://administrator:123456@172.16.10.136/";

	private String username;
	private String password;
	private String ip;
	private String rootPath;
	
	public void init() {
		sambaRootUrl = "smb://" + username + ":" + password + "@" + ip + "/" + rootPath + "/";
		
		log.info("SambaFileStoreService samba_root_url=[" + sambaRootUrl + "]");
	}
	
	@Override
	public void writeFile(String path, InputStream in) throws IOException {
		OutputStream out = null;
		try {
			SmbFile remoteFile = new SmbFile(sambaRootUrl + path);
			out = new BufferedOutputStream(new SmbFileOutputStream(remoteFile));
			byte[] buffer = new byte[1024];
			while ((in.read(buffer)) != -1) {
				out.write(buffer);
				buffer = new byte[1024];
			}
		} finally {
			try {
				out.close();
			} catch (IOException e) {
			}
		}
	}
	
	@Override
	public InputStream readFile(String path) throws IOException {
		log.info(sambaRootUrl + path);
		SmbFileInputStream sis = new SmbFileInputStream(sambaRootUrl + path);
		return sis;
	}
	
	@Override
	public void mkdir(String filePath) {
		//File file = new File(sambaRootUrl + File.separator + fileStr);
		SmbFile remoteFile;
		try {
			remoteFile = new SmbFile(sambaRootUrl + File.separator + filePath);
			if(!remoteFile .exists() && !remoteFile.isDirectory()){
				remoteFile.mkdirs();
			}
		} catch (MalformedURLException e) {
			log.error(e.getMessage(), e);
		}catch (SmbException e) {
			log.error(e.getMessage(), e);
		}
	}
	
	@Override
	public void delete(String path) {
		SmbFile remoteFile;
		try {
			remoteFile = new SmbFile(sambaRootUrl + File.separator + path);
			if(remoteFile .exists() && !remoteFile.isDirectory()){
				remoteFile.delete();
			}
		} catch (MalformedURLException e) {
			log.error(e.getMessage(), e);
		}catch (SmbException e) {
			log.error(e.getMessage(), e);
		}
	}
	
	public void setUsername(String username) {
		this.username = username;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public void setIp(String ip) {
		this.ip = ip;
	}
	public void setRootPath(String rootPath) {
		this.rootPath = rootPath;
	}
}

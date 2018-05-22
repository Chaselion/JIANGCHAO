package com.zy.dmop.filestore.service.impl;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;

import org.springframework.util.FileCopyUtils;

import com.zy.dmop.api.filestore.service.IFileStoreService;



public class LocalFileStoreService implements IFileStoreService {
	private String rootPath;
	
	@Override
	public void writeFile(String path, InputStream in) throws IOException {
		File destFile = new File(rootPath + File.separator + path);
		byte[] bytes = FileCopyUtils.copyToByteArray(in);
		FileCopyUtils.copy(bytes, destFile);
	}
	
	@Override
	public InputStream readFile(String path) throws IOException {
		File destFile = new File(rootPath + File.separator + path);
		InputStream in = new BufferedInputStream(new FileInputStream(destFile));
		return in;
	}
	
	public void setRootPath(String rootPath) {
		this.rootPath = rootPath;
	}

	@Override
	public void mkdir(String path) {
		File file = new File(rootPath + File.separator + path);
		if(!file .exists() && !file.isDirectory()){
			file.mkdirs();
		}
	}

	@Override
	public void delete(String path) {
		File file = new File(rootPath + File.separator + path);
		if(file .exists() && !file.isDirectory()){
			file.delete();
		}
	}
}

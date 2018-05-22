package com.zy.dmop.filestore.service;

import java.io.IOException;
import java.io.InputStream;

import com.zy.dmop.api.filestore.service.IFileStoreService;


public class FileStoreService implements IFileStoreService {
	private IFileStoreService delegateService;
	
	public void setDelegateService(IFileStoreService delegateService) {
		this.delegateService = delegateService;
	}
	
	@Override
	public void writeFile(String path, InputStream in) throws IOException {
		this.delegateService.writeFile(path, in);
	}

	@Override
	public InputStream readFile(String path) throws IOException {
		return this.delegateService.readFile(path);
	}

	@Override
	public void mkdir(String fileStr) {	
		this.delegateService.mkdir(fileStr);
	}

	@Override
	public void delete(String path) {
		delegateService.delete(path);
	}
}

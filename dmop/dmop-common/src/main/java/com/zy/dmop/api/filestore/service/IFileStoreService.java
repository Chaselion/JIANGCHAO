package com.zy.dmop.api.filestore.service;

import java.io.IOException;
import java.io.InputStream;

public interface IFileStoreService {
	/**
	 * 
	 * @param path 所要保存文件在目标存储系统上的相对路径，例如 : icon/car.jpg,  car_history_data/day/2015/6/15/abc.zip
	 * @param in 所要保存文件的输入流
	 * @throws IOException
	 */
	public void writeFile(String path, InputStream in) throws IOException;
	
	public InputStream readFile(String path) throws IOException;
	
	public void mkdir(String fileStr);

	public void delete(String path);
}

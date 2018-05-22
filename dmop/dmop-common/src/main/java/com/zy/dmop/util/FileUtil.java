package com.zy.dmop.util;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStreamReader;

public class FileUtil {
	public static String loadResourceFile(String resourceDirPath, String filename) throws IOException {
		String filePath;
		if(resourceDirPath.lastIndexOf(File.separatorChar)==resourceDirPath.length()-1){
			filePath = resourceDirPath  + filename;
		}else{
			filePath = resourceDirPath + File.separator + filename;
		}
		
		File f = new File(filePath);
		InputStreamReader isr = null;
		BufferedReader br = null;
		try {
			isr = new InputStreamReader(new FileInputStream(f), "UTF-8");
			br =  new BufferedReader(isr);
			String line = null;
			StringBuilder sb = new StringBuilder();
			while ( (line = br.readLine()) != null) {
				sb.append(line).append("\n");
			}
			
			return sb.toString();
		}  finally {
			if (br != null) {
				try {
					br.close();
				} catch (IOException e) {
				}
			}
		}
	}
	
	public static String correctSeperator(String path) {
		path = path.replace('\\', File.separatorChar);
		path = path.replace('/', File.separatorChar);
		return path;
	}
	
	public static String leftAppendSeperator(String path) {
		if (!path.startsWith(File.separator)) {
			path = File.separator + path;
    	}
		return path;
	}
	
	public static String rightAppendSeperator(String path) {
		return rightAppendSeperator(path, File.separator);
	}
	
	public static String rightAppendSeperator(String path, String seperator) {
		if (!path.endsWith(seperator)) {
			path += seperator;
    	}
		return path;
	}
	
	public static String getFilenameWithoutSuffix(File file) {
		if (file.isFile()) {
			return getFilenameWithoutSuffix(file.getName());
		}
		
		throw new RuntimeException("not file: " + file.getAbsolutePath());
	}

	public static String getFilenameWithoutSuffix(String filename) {
		int lastIndexOfDot = filename.lastIndexOf('.');
		if (lastIndexOfDot >= 0) {
			return filename.substring(0, lastIndexOfDot);
		} else {
			return filename;
		}
	}
}

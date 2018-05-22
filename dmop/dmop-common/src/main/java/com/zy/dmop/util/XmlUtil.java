package com.zy.dmop.util;

import java.io.File;
import java.io.IOException;
import java.io.Reader;
import java.io.StringReader;

import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.Element;
import org.dom4j.io.SAXReader;

public class XmlUtil {
	public static Element readRootElement(File file) throws DocumentException {
		SAXReader reader = new SAXReader();
        Document doc = reader.read(file);
        return doc.getRootElement();
	}
	
	public static Element readRootElement(Reader reader) throws DocumentException {
		try {
			SAXReader saxReader = new SAXReader();
	        Document doc = saxReader.read(reader);
	        return doc.getRootElement();
		} finally {
			if (reader != null) {
				try {
					reader.close();
				} catch (IOException e) {
				}
			}
		}
	}
	
	public static Element readRootElement(String xml) throws DocumentException  {
		StringReader sr = new StringReader(xml);
		return readRootElement(sr);
	}
}
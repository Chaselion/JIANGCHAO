package com.zy.dmop.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;

public class ZipUtil {
	public static void zipFile(File srcfile, File zipfile) throws IOException {
		zipFile(srcfile, zipfile, srcfile.getName());
	}
	
	public static void zipFile(File srcfile, File zipfile, String srcFileEntryName) throws IOException {
		byte[] buf = new byte[8192];
		ZipOutputStream out = null;
		FileInputStream in = null;
		try {
			// Create the ZIP file
			out = new ZipOutputStream(new FileOutputStream(zipfile));
			// Compress the files
			in = new FileInputStream(srcfile);
			// Add ZIP entry to output stream.
			out.putNextEntry(new ZipEntry(srcFileEntryName));
			// Transfer bytes from the file to the ZIP file
			int len;
			while ((len = in.read(buf)) > 0) {
				out.write(buf, 0, len);
			}
			// Complete the entry
			out.closeEntry();
		} finally {
			if (in != null) {
				try {
					in.close();
				} catch (Exception e) {

				}
			}

			if (out != null) {
				try {
					out.close();
				} catch (Exception e) {

				}
			}
		}
	}
}

package com.letao.utils;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;

import org.apache.struts2.ServletActionContext;

/**
 * 
 * @description 上传文件
 * @author ChengBin
 * @date   2013-11-26下午6:22:16
 * @version 1.0
 */
public class FileUpload {

	/**
	 * 上传文件
	 * 
	 * @param file
	 * @param path
	 * @throws IOException 
	 */
	public static String upload(File file, String path) throws IOException {
		String fileName = null;
		File dir = null;
		//创建存放文件的根目录
		String root = ServletActionContext.getServletContext().getRealPath("/upload");
		File rootFile = new File(root);
		if (!rootFile.exists()) rootFile.mkdirs();
		
		if (file != null) {// 如果文件路径不为空
			// 获取服务器的绝对路径
			dir = new File(rootFile, path);
			if (!dir.exists()) {// 如果文件夹不存在
				dir.mkdir();// 创建文件夹
			}
			fileName = StringUitl.getStringTime() + ".jpg";// 自定义图片名称
			FileInputStream fis = null;// 输入流
			FileOutputStream fos = null;// 输出流
			try {
				fis = new FileInputStream(file);// 根据上传文件创建InputStream实例
				fos = new FileOutputStream(new File(dir, fileName)); // 创建写入服务器地址的输出流对象
				byte[] bs = new byte[1024 * 4]; // 创建字节数组实例
				int len = -1;
				while ((len = fis.read(bs)) != -1) {// 循环读取文件
					fos.write(bs, 0, len);// 向指定的文件夹中写数据
				}
			} finally {
				if (fos != null) {
					fos.flush();
					fos.close();
				}
				if (fis != null) {
					fis.close();
				}
			}
		}
		
		if (fileName != null && !"".equals(fileName)) {
			System.out.println(path + "/" + fileName);
			return path + "/" + fileName;
		}
		
		return path + "/" + fileName;
	}
}

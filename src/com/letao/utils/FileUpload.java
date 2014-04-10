package com.letao.utils;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;

import org.apache.struts2.ServletActionContext;

/**
 * 
 * @description �ϴ��ļ�
 * @author ChengBin
 * @date   2013-11-26����6:22:16
 * @version 1.0
 */
public class FileUpload {

	/**
	 * �ϴ��ļ�
	 * 
	 * @param file
	 * @param path
	 * @throws IOException 
	 */
	public static String upload(File file, String path) throws IOException {
		String fileName = null;
		File dir = null;
		//��������ļ��ĸ�Ŀ¼
		String root = ServletActionContext.getServletContext().getRealPath("/upload");
		File rootFile = new File(root);
		if (!rootFile.exists()) rootFile.mkdirs();
		
		if (file != null) {// ����ļ�·����Ϊ��
			// ��ȡ�������ľ���·��
			dir = new File(rootFile, path);
			if (!dir.exists()) {// ����ļ��в�����
				dir.mkdir();// �����ļ���
			}
			fileName = StringUitl.getStringTime() + ".jpg";// �Զ���ͼƬ����
			FileInputStream fis = null;// ������
			FileOutputStream fos = null;// �����
			try {
				fis = new FileInputStream(file);// �����ϴ��ļ�����InputStreamʵ��
				fos = new FileOutputStream(new File(dir, fileName)); // ����д���������ַ�����������
				byte[] bs = new byte[1024 * 4]; // �����ֽ�����ʵ��
				int len = -1;
				while ((len = fis.read(bs)) != -1) {// ѭ����ȡ�ļ�
					fos.write(bs, 0, len);// ��ָ�����ļ�����д����
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

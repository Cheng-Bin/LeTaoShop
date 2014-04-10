package com.letao.utils;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.util.Random;
import com.sun.image.codec.jpeg.JPEGCodec;
import com.sun.image.codec.jpeg.JPEGImageEncoder;

/**
 * 绘制验证码图片
 * 
 * @author ChengBin
 *
 */
public class SecurityImage {

	public static ByteArrayInputStream getImageAsInputStream(String securityCode) {
		BufferedImage image = createImage(securityCode);
		return convertImageToStream(image);
	}

	/**
	 * 创建带有验证码的图片
	 * 
	 * @param securityCode
	 * @return
	 */
	private static BufferedImage createImage(String securityCode) {
		int len = securityCode.length();
		int fSize = 15;
		int fWidth = fSize + 1;
		int width = len * fWidth + 6;
		int height = fSize + 10;

		BufferedImage image = new BufferedImage(width, height,
				BufferedImage.TYPE_INT_RGB);
		Graphics g = image.createGraphics();

		// 填充背景
		g.setColor(Color.WHITE);
		g.fillRect(0, 0, width, height);

		// 画边框
		g.setColor(Color.LIGHT_GRAY);
		g.setFont(new Font("Arial", Font.BOLD, height - 2));
		g.drawRect(0, 0, width - 1, height - 1);

		// 绘制干扰点
		Random rand = new Random();
		g.setColor(Color.LIGHT_GRAY);
		for (int i = 0; i < len * 6; i++) {
			int x = rand.nextInt(width);
			int y = rand.nextInt(height);
			g.drawRect(x, y, 1, 1);
		}

		// 绘制验证码
		int codeY = height - 6;
		g.setColor(new Color(19, 148, 246));
		g.setFont(new Font("Georgia", Font.BOLD, fSize));

		for (int i = 0; i < len; i++) {
			g.drawString(String.valueOf(securityCode.charAt(i)), i * 16 + 5,
					codeY);
		}
		g.dispose();

		return image;
	}

	/**
	 * 将BufferedImage转换成ByteArrayInputStream
	 * 
	 * @param image
	 * @return
	 */
	private static ByteArrayInputStream convertImageToStream(BufferedImage image) {

		ByteArrayInputStream inputStream = null;
		ByteArrayOutputStream bos = new ByteArrayOutputStream();
		JPEGImageEncoder jpeg = JPEGCodec.createJPEGEncoder(bos);
		try {
			jpeg.encode(image);
			byte[] bts = bos.toByteArray();
			inputStream = new ByteArrayInputStream(bts);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return inputStream;
	}
}

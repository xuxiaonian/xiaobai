package com.huazhuo.shop.sms;

import java.awt.Font;
import java.awt.Graphics2D;
import java.awt.image.BufferedImage;

public class SmsCheck {

	public static String sendSms() {
		IdentifyingCode idCode = new IdentifyingCode();
		BufferedImage image = new BufferedImage(idCode.getWidth(), idCode.getHeight(), BufferedImage.TYPE_INT_BGR);
		Graphics2D g = image.createGraphics();
		// 定义字体样式
		Font myFont = new Font("黑体", Font.BOLD, 16);
		// 设置字体
		g.setFont(myFont);

		g.setColor(idCode.getRandomColor(200, 250));
		// 绘制背景
		g.fillRect(0, 0, idCode.getWidth(), idCode.getHeight());

		g.setColor(idCode.getRandomColor(180, 200));
		idCode.drawRandomLines(g, 160);
		return idCode.drawRandomString(4, g);
	}
}

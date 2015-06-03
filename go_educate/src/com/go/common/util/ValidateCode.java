package com.go.common.util;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import com.sun.image.codec.jpeg.JPEGCodec;
import com.sun.image.codec.jpeg.JPEGImageEncoder;

/**
 * 生成验证码
 * @author Administrator
 *
 */
public class ValidateCode {
	private static final int WIDTH=75;
	private static final int HEIGHT=35;
	private static final int LINE_SIZE=2;
	private static final int SIZE=4;
	
	/**
	 * 
	 * @return Map 
	 */
	public static Map<String,BufferedImage> CreateValidateCode(){
		Map<String,BufferedImage> validateCode=new HashMap<String,BufferedImage>();
		BufferedImage image=new BufferedImage(WIDTH,HEIGHT,BufferedImage.TYPE_INT_RGB);
		Graphics g=image.getGraphics();
		Random r=new Random();
		g.setColor(new Color(r.nextInt(120)+135,r.nextInt(120)+135,r.nextInt(120)+135));
		g.fillRect(0, 0, WIDTH, HEIGHT);
		g.setColor(Color.WHITE);
		g.drawRect(0, 0, WIDTH-1, HEIGHT-1);
		String str="";
		for(int i=0;i<SIZE;i++){
			g.setColor(new Color(r.nextInt(120),r.nextInt(120),r.nextInt(120)));
			char c=0;
			do{
				c=(char)(r.nextInt(75)+48);
				
			}while(c>57&&c<65 || c>90&&c<122);
			int size=(int)(HEIGHT*0.5+HEIGHT*0.5*r.nextDouble());
			g.setFont(new Font("",Font.BOLD|Font.ITALIC,size));
			g.drawString(c+"",i*(WIDTH/SIZE), 25);
			str+=c+"";
		}
		for(int i=0;i<LINE_SIZE;i++){
			g.drawLine(r.nextInt(WIDTH), r.nextInt(HEIGHT), 
					r.nextInt(WIDTH), r.nextInt(HEIGHT));
		}
		validateCode.put(str, image);
		return validateCode;
	}
	
	public static InputStream getInputStream(BufferedImage image) throws IOException{
		ByteArrayOutputStream out=new ByteArrayOutputStream();
		JPEGImageEncoder encoder=JPEGCodec.createJPEGEncoder(out);
		encoder.encode(image);
		byte[] imageBts=out.toByteArray();
		InputStream in=new ByteArrayInputStream(imageBts);
		return in;
	}
	
	public static byte[]  getImageByte(BufferedImage image) throws IOException{
		ByteArrayOutputStream out=new ByteArrayOutputStream();
		JPEGImageEncoder encoder=JPEGCodec.createJPEGEncoder(out);
		encoder.encode(image);
		byte[] imageBts=out.toByteArray();
//		InputStream in=new ByteArrayInputStream(imageBts);
		return imageBts;
	}
	
}

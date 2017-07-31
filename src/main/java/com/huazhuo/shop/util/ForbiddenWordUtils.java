package com.huazhuo.shop.util;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.Reader;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.ThreadFactory;
import java.util.concurrent.TimeUnit;
import java.util.regex.Pattern;
import org.apache.commons.io.IOUtils;

/**
 * 屏蔽关键词
 * @author xueqiang.wang
 * @version 1.0
 */
public class ForbiddenWordUtils {

	/** 默认的替换字符串*/
	private static final String DEFAULT_MASK = "**";
	/** 重新加载文件时间*/
	private static int reloadInterval = 60*20; //20分钟
	/** 关键词列表*/
	private static List<Pattern> forbiddenWords;
	/** 屏蔽的关键词文件*/
	private static String fileName = "/forbiddenWords.txt";
	
	private static final ScheduledExecutorService scheduledExecutorService =
            Executors
                    .newSingleThreadScheduledExecutor(new ThreadFactory() {
                        public Thread newThread(Runnable r) {
                            return new Thread(r, "reloadFetchForbiddenWordsThread");
                        }
                    });
	
	static {
		ForbiddenWordUtils.loadForbiddenWords(fileName);
		scheduledExecutorService.scheduleWithFixedDelay(new Runnable() {
			@Override
			public void run() {
				loadForbiddenWords();
			}
		}, 
		reloadInterval, reloadInterval, TimeUnit.SECONDS);
    }
	
	/**
	 * 替换关键词
	 * @param input 输入
	 * @param mask 替换词
	 * @return
	 */
	public static String replace(String input, String mask) {
		if(mask == null || mask.trim().length() < 1){
			mask = DEFAULT_MASK;
		}
        for (int i = 0, l = forbiddenWords.size(); i < l; i++) {
            Pattern forbiddenWordPattern = forbiddenWords.get(i);
            input = forbiddenWordPattern.matcher(input).replaceAll(mask);
        }
        return input;
    }
	
	/**
	 * 用星号替换屏蔽词
	 * @param input 要过滤的字符串
	 * @return
	 */
	public static String replace(String input){
		return replace(input, DEFAULT_MASK);
	}
	
	/**
	 * 包含关键词
	 * @param input 要过滤的字符串
	 * @return 返回包含的关键词，没有则返回null
	 */
	public static String containsForbiddenWord(String input) {
        for (int i = 0, l = forbiddenWords.size(); i < l; i++) {
            Pattern forbiddenWordPattern = forbiddenWords.get(i);
            if (forbiddenWordPattern.matcher(input).find()) {
                return forbiddenWordPattern.pattern();
            }
        }
        return null;
    }
	
	/**
	 * 加载关键词
	 * @param file
	 * @throws IOException
	 */
	private static void loadForbiddenWords(String file){
		if(file == null || file.trim().length() < 1) return;
		InputStream input = ForbiddenWordUtils.class.getResourceAsStream(file);
        Reader reader = null;
        try {
            reader = new BufferedReader(new InputStreamReader(input, "UTF-8"));
            List<String> forbiddenWordsStrList = IOUtils.readLines(reader);
            forbiddenWords = new ArrayList<Pattern>();
            for (int i = forbiddenWordsStrList.size() - 1; i >= 0; i--) {
                String forbiddenWord = forbiddenWordsStrList.get(i).trim();
                if (forbiddenWord.length() == 0 || forbiddenWord.startsWith("#")) {
                    continue;
                } else {
                    forbiddenWords.add(Pattern.compile(forbiddenWord));
                }
            }
            reader.close();
        } catch (Exception e) {
        	e.printStackTrace();
            System.err.print("加载关键词失败");
        } finally {
            IOUtils.closeQuietly(reader);
        }
    }
	
	public static void loadForbiddenWords(){
		loadForbiddenWords(fileName);
	}
	
	public static void main(String[] args) {
		System.out.println(replace("最好的点点滴滴闪购,打算大苏打实打实上的中央"));
		System.out.println(containsForbiddenWord("中央决定"));
	}
}

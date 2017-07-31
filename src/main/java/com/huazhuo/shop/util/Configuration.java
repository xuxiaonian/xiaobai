package com.huazhuo.shop.util;

public class Configuration {
	private String uploadRootPath;
	private boolean demoSystem;

	public String getUploadRootPath() {
		return uploadRootPath;
	}

	public void setUploadRootPath(String uploadRootPath) {
		this.uploadRootPath = uploadRootPath;
	}

	public boolean isDemoSystem() {
		return demoSystem;
	}

	public void setDemoSystem(boolean demoSystem) {
		this.demoSystem = demoSystem;
	}
}

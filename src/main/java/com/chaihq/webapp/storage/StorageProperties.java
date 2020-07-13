package com.chaihq.webapp.storage;

import org.springframework.boot.context.properties.ConfigurationProperties;

@ConfigurationProperties("storage")
public class StorageProperties {

	/**
	 * Folder location for storing files
	 */
	private String location = "C:\\UsersXXX\\Zaheer Baloch\\Documents\\code\\chai\\chaiweb\\src\\main\\webapp\\WEB-INF\\files";

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

}

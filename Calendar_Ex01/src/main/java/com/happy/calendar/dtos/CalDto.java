package com.happy.calendar.dtos;

import java.io.Serializable;

public class CalDto implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 6691739544116569627L;
	
	private char  	calid;
	private String 	id ;
	private String 	title;
	private String 	content;
	private char 	isallday;
	private String 	startday;
	private String 	endday;
	private String 	color;
	private String 	bgcolor;
	
	public CalDto() {		
	}
	
	public CalDto(char calid, String id, String title, String content, char isallday, String startday, String endday,
			String color, String bgcolor) {		
		this.calid = calid;
		this.id = id;
		this.title = title;
		this.content = content;
		this.isallday = isallday;
		this.startday = startday;
		this.endday = endday;
		this.color = color;
		this.bgcolor = bgcolor;
	}
	
	public char getCalid() {
		return calid;
	}
	public void setCalid(char calid) {
		this.calid = calid;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public char getIsallday() {
		return isallday;
	}
	public void setIsallday(char isallday) {
		this.isallday = isallday;
	}
	public String getStartday() {
		return startday;
	}
	public void setStartday(String startday) {
		this.startday = startday;
	}
	public String getEndday() {
		return endday;
	}
	public void setEndday(String endday) {
		this.endday = endday;
	}
	public String getColor() {
		return color;
	}
	public void setColor(String color) {
		this.color = color;
	}
	public String getBgcolor() {
		return bgcolor;
	}
	public void setBgcolor(String bgcolor) {
		this.bgcolor = bgcolor;
	}

	@Override
	public String toString() {
		return "CalDto [calid=" + calid + ", id=" + id + ", title=" + title + ", content=" + content + ", isallday="
				+ isallday + ", startday=" + startday + ", endday=" + endday + ", color=" + color + ", bgcolor="
				+ bgcolor + "]";
	}
}

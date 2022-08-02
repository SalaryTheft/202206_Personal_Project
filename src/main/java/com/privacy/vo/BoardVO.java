package com.privacy.vo;

public class BoardVO {
	private int boNo;
	private String boTitle;
	private String boWriter;
	private String boContent;
	private String boCategory;
	private String boRegDate;
	private String boModDate;
	private String boDelYn;
	
	@Override
	public String toString() {
		return "BoardVO [boNo=" + boNo + ", boTitle=" + boTitle + ", boWriter=" + boWriter + ", boContent=" + boContent
				+ ", boCategory=" + boCategory + ", boRegDate=" + boRegDate + ", boModDate=" + boModDate + ", boDelYn="
				+ boDelYn + "]";
	}

	public int getBoNo() {
		return boNo;
	}

	public void setBoNo(int boNo) {
		this.boNo = boNo;
	}

	public String getBoTitle() {
		return boTitle;
	}

	public void setBoTitle(String boTitle) {
		this.boTitle = boTitle;
	}

	public String getBoWriter() {
		return boWriter;
	}

	public void setBoWriter(String boWriter) {
		this.boWriter = boWriter;
	}

	public String getBoContent() {
		return boContent;
	}

	public void setBoContent(String boContent) {
		this.boContent = boContent;
	}

	public String getBoCategory() {
		return boCategory;
	}

	public void setBoCategory(String boCategory) {
		this.boCategory = boCategory;
	}

	public String getBoRegDate() {
		return boRegDate;
	}

	public void setBoRegDate(String boRegDate) {
		this.boRegDate = boRegDate;
	}

	public String getBoModDate() {
		return boModDate;
	}

	public void setBoModDate(String boModDate) {
		this.boModDate = boModDate;
	}

	public String getBoDelYn() {
		return boDelYn;
	}

	public void setBoDelYn(String boDelYn) {
		this.boDelYn = boDelYn;
	}
}

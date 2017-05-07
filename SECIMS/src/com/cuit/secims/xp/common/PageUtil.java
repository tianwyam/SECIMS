package com.cuit.secims.xp.common;

public class PageUtil {
	int pageSize = 10; //每页显示的数据
	int pageNo = 1; //当前页码
	int totalPages = 1; //总页数
	
	public PageUtil() {
		super();
	}
	
	public PageUtil(int pageSize, int pageNo, int totalRecords) {
		super();
		this.pageSize = pageSize;
		this.pageNo = pageNo;
		this.totalPages = (totalRecords + pageSize - 1)/pageSize;
	}
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public int getPageNo() {
		return pageNo;
	}
	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}
	public int getTotalPages() {
		return totalPages;
	}
	public void setTotalPages(int totalPages) {
		this.totalPages = totalPages;
	}
}

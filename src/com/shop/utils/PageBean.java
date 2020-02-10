package com.shop.utils;
import java.io.Serializable;
/**
 * 基本模型类：序列化实体
 */
public class PageBean implements Serializable {

	/** 分页相关：当前页 */
	private int currentPage = 1;
	/** 分页相关：每页显示条数 */
	private int pageSize = 5;
	/** 分页相关：当前第几条数 */
	private int currentNum;

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getCurrentNum() {
		return currentNum;
	}

	public void setCurrentNum(int currentNum) {
		this.currentNum = currentNum;
	}

}


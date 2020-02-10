package com.shop.model;

import java.util.List;

/**
 * 分页
 */
public class PageBean {
    private int totalCount;//所有记录数
    private int totalPage;//所有页面数
    private int count;//每页记录条数
    private  int currentPage;//当前页面
    private List list; //每页的数据

    public int getTotalCount() {
        return totalCount;
    }

    public void setTotalCount(int totalCount) {
        this.totalCount = totalCount;
    }

    public int getTotalPage() {
        return totalPage;
    }

    public void setTotalPage(int totalPage) {
        this.totalPage = totalPage;
    }

    public int getCount() {
        return count;
    }

    public void setCount(int count) {
        this.count = count;
    }

    public int getCurrentPage() {
        return currentPage;
    }

    public void setCurrentPage(int currentPage) {
        this.currentPage = currentPage;
    }

    public List getList() {
        return list;
    }

    public void setList(List list) {
        this.list = list;
    }

    @Override
    public String toString() {
        return "PageBean{" +
                "totalCount=" + totalCount +
                ", totalPage=" + totalPage +
                ", count=" + count +
                ", currentPage=" + currentPage +
                ", list=" + list +
                '}';
    }
}

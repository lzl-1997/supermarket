package com.shop.model;

import com.shop.utils.PageBean;

public class Product extends PageBean {
    private String pid;
    private String pname;
    private String pimg;
    private String price;
    private int count;
    private String kind;

    public Product() {
    }

    public Product(String pid, String pname, String pimg, String price, int count, String kind) {
        this.pid = pid;
        this.pname = pname;
        this.pimg = pimg;
        this.price = price;
        this.count = count;
        this.kind = kind;
    }

    public String getPid() {
        return pid;
    }

    public void setPid(String pid) {
        this.pid = pid;
    }

    public String getPname() {
        return pname;
    }

    public void setPname(String pname) {
        this.pname = pname;
    }

    public String getPimg() {
        return pimg;
    }

    public void setPimg(String pimg) {
        this.pimg = pimg;
    }

    public String getPrice() {
        return price;
    }

    public void setPrice(String price) {
        this.price = price;
    }

    public int getCount() {
        return count;
    }

    public void setCount(int count) {
        this.count = count;
    }

    public String getKind() {
        return kind;
    }

    public void setKind(String kind) {
        this.kind = kind;
    }

    @Override
    public String toString() {
        return "Product{" +
                "pid='" + pid + '\'' +
                ", pname='" + pname + '\'' +
                ", pimg='" + pimg + '\'' +
                ", price='" + price + '\'' +
                ", count=" + count +
                ", kind='" + kind + '\'' +
                '}';
    }
}

package com.test.shopping.category;

/**
 * Created by Administrator on 2016/7/18.
 */
public class Category {
    /**
     * 最多三个级别
     */
    public static final int MAX_GRADE = 3;
    /**
     * 每个级别用两位数字表示
     */
    public static final int LEVEL_LENGTH = 2;

    private int id;
    private int pid;
    private String name;
    private String descr;
    private int cno;
    private int grade;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getPid() {
        return pid;
    }

    public void setPid(int pid) {
        this.pid = pid;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescr() {
        return descr;
    }

    public void setDescr(String descr) {
        this.descr = descr;
    }

    public int getCno() {
        return cno;
    }

    public void setCno(int cno) {
        this.cno = cno;
    }

    public int getGrade() {
        return grade;
    }

    public void setGrade(int grade) {
        this.grade = grade;
    }
}

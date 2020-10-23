package com.xiaobao.bean;

import java.sql.Date;

public class Things {
    private Long id;

    private String userName;

    private String thingName;

    private Date startTime;

    private Date endTime;

    private Integer state;

    private String thingDetail;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName == null ? null : userName.trim();
    }

    public String getThingName() {
        return thingName;
    }

    public void setThingName(String thingName) {
        this.thingName = thingName == null ? null : thingName.trim();
    }

    public Date getStartTime() {
        return startTime;
    }

    public void setStartTime(Date startTime) {
        this.startTime = startTime;
    }

    public Date getEndTime() {
        return endTime;
    }

    public void setEndTime(Date endTime) {
        this.endTime = endTime;
    }

    public Integer getState() {
        return state;
    }

    public void setState(Integer state) {
        this.state = state;
    }

    public String getThingDetail() {
        return thingDetail;
    }

    public void setThingDetail(String thingDetail) {
        this.thingDetail = thingDetail == null ? null : thingDetail.trim();
    }

    @Override
    public String toString() {
        return "Things{" +
                "id=" + id +
                ", userName='" + userName + '\'' +
                ", thingName='" + thingName + '\'' +
                ", startTime=" + startTime +
                ", endTime=" + endTime +
                ", state=" + state +
                ", thingDetail='" + thingDetail + '\'' +
                '}';
    }
}
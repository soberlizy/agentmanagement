package com.xiaobao.bean;


import java.util.HashMap;
import java.util.Map;

/**
 * @author li
 * @Created by li on 2020/10/22    12:28.
 */
public class ResultType {

    private Integer code;
    private String msg;
    private Map<String,Object> map= new HashMap<>();

    public ResultType() {
    }

    public ResultType(Integer code, String msg, Map<String, Object> map) {
        this.code = code;
        this.msg = msg;
        this.map = map;
    }

    public ResultType(Integer code, String msg){
        this.code = code;
        this.msg = msg;
    }

    public Integer getCode() {
        return code;
    }

    public void setCode(Integer code) {
        this.code = code;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public Map<String, Object> getMap() {
        return map;
    }

    public void setMap(Map<String, Object> map) {
        this.map = map;
    }

    public static ResultType login(int code, String msg,  HashMap<String,Object> map){
        ResultType result = new ResultType();
        result.setCode(code);
        result.setMsg(msg);
        result.setMap(map);
        return result;
    }

    @Override
    public String toString() {
        return "ResultType{" +
                "code=" + code +
                ", msg='" + msg + '\'' +
                ", map=" + map +
                '}';
    }
}

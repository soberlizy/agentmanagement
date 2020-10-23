package com.xiaobao.controller;

import com.xiaobao.bean.ResultType;
import com.xiaobao.bean.Things;
import com.xiaobao.service.ThingsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * @author li
 * @Created by li on 2020/10/22    15:37.
 */
@Controller
public class ThingsController {
    @Autowired
    ThingsService thingsService;

    @RequestMapping("/things")
    public String list(Model model) {
        List<Things> allThings = thingsService.getAllThings2();
        model.addAttribute("list", allThings);
        ArrayList<Integer> times = new ArrayList<>();
        for (Things allThing : allThings) {
            java.sql.Date startTime = allThing.getStartTime();
            java.sql.Date endTime = allThing.getEndTime();
            times.add(aa(startTime.toString(), endTime.toString()));
        }
        model.addAttribute("times", times);
        ResultType resultType = new ResultType(100, "成功", null);
        return "list";
    }

    @ResponseBody
    @RequestMapping("/del/{id}")
    public ResultType del(@PathVariable long id) {
        int del = thingsService.del(id);
        if (del != 0) {
            return new ResultType(100, "删除成功！", null);
        }
        return new ResultType(200, "删除失败！", null);
    }

    @ResponseBody
    @RequestMapping("/save")
    public ResultType save(Things things) {
        int save = thingsService.save(things);
        if (save != 0) {
            return new ResultType(100, "添加成功", null);
        } else return new ResultType(200, "添加失败", null);
    }

    @ResponseBody
    @RequestMapping("/getThings/{id}")
    public ResultType getThingsByID(@PathVariable long id) {
        Things things = thingsService.getThingsByID(id);
        ResultType resultType = new ResultType();
        if (null != things) {
            resultType.setCode(100);
            resultType.setMsg("成功");
            HashMap<String, Object> map = new HashMap<>();
            map.put("things", things);
            resultType.setMap(map);
            return resultType;
        } else {
            return resultType;
        }
    }

    @ResponseBody
    @RequestMapping("/updateThings/{id}")
    public ResultType update(Things things) {
        System.out.println(things);
        int update = thingsService.update(things);
        if (0 != update) {
            return new ResultType(100, "修改成功", null);
        } else return new ResultType(200, "修改失败", null);
    }

    @ResponseBody
    @RequestMapping("delAll")
    public ResultType delAll() {
        int i = thingsService.delAll();
        if(0!=i){
          return  new ResultType(100,"删除成功！",null);
        }else return  new ResultType(200,"删除失败！",null);
    }

    @InitBinder
    public void initBinder(WebDataBinder binder) {
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        dateFormat.setLenient(false);
        binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));
    }

    /**
     * 计算时间差
     *
     * @param str1
     * @param str2
     * @return
     */
    public static int aa(String str1, String str2) {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        Calendar cal1 = Calendar.getInstance();
        Calendar cal2 = Calendar.getInstance();
        try {
            cal1.setTime(sdf.parse(str1));
            cal2.setTime(sdf.parse(str2));
        } catch (ParseException e) {
            e.printStackTrace();
        }
        long l = cal2.getTimeInMillis() - cal1.getTimeInMillis();
        return new Long(l / (1000 * 60 * 60 * 24)).intValue();
    }
}

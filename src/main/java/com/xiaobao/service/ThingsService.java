package com.xiaobao.service;

import com.xiaobao.bean.Things;
import com.xiaobao.bean.ThingsExample;
import com.xiaobao.dao.ThingsMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author li
 * @Created by li on 2020/10/22    12:11.
 */
@Service
public class ThingsService {
    @Autowired
    ThingsMapper thingsMapper;

    public List<Things> getAllThings() {
        ThingsExample thingsExample = new ThingsExample();
        ThingsExample.Criteria criteria = thingsExample.createCriteria().andIdIsNotNull();
        return thingsMapper.selectByExample(thingsExample);
    }

    public int del(long id) {
        return thingsMapper.deleteByPrimaryKey(id);
    }

    public int save(Things things) {
        return thingsMapper.insert(things);
    }

    public List<Things> getAllThings2() {
        ThingsExample thingsExample = new ThingsExample();
        ThingsExample.Criteria criteria = thingsExample.createCriteria().andIdIsNotNull();
        return thingsMapper.selectByExampleWithBLOBs(thingsExample);
    }

    public Things getThingsByID(long id) {
        return thingsMapper.selectByPrimaryKey(id);
    }

    public int update(Things things) {
        ThingsExample thingsExample = new ThingsExample();
        ThingsExample.Criteria criteria = thingsExample.createCriteria().andIdEqualTo(things.getId());
        return  thingsMapper.updateByExampleWithBLOBs(things,thingsExample);
    }
    public int delAll(){
        ThingsExample thingsExample = new ThingsExample();
        ThingsExample.Criteria criteria = thingsExample.createCriteria().andIdIsNotNull();
        return thingsMapper.deleteByExample(thingsExample);
    }
}

package com.xiaobao.dao;

import com.xiaobao.bean.Things;
import com.xiaobao.bean.ThingsExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface ThingsMapper {
    long countByExample(ThingsExample example);

    int deleteByExample(ThingsExample example);

    int deleteByPrimaryKey(Long id);

    int insert(Things record);

    int insertSelective(Things record);

    List<Things> selectByExampleWithBLOBs(ThingsExample example);

    List<Things> selectByExample(ThingsExample example);

    Things selectByPrimaryKey(Long id);

    int updateByExampleSelective(@Param("record") Things record, @Param("example") ThingsExample example);

    int updateByExampleWithBLOBs(@Param("record") Things record, @Param("example") ThingsExample example);

    int updateByExample(@Param("record") Things record, @Param("example") ThingsExample example);

    int updateByPrimaryKeySelective(Things record);

    int updateByPrimaryKeyWithBLOBs(Things record);

    int updateByPrimaryKey(Things record);
}
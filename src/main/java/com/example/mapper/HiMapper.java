package com.example.mapper;

import com.example.pojo.entity.PhNo;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface HiMapper {
    @Select("select * from phno;")
    public List<PhNo> getPhNoList();

}
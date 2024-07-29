package com.example.mapper;

import com.example.pojo.entity.User;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface HelloMapper {
    @Select("select id, NAME, address from person;")
    public List<User> getUserList();

}


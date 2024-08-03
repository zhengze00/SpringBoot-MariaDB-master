package com.example.mapper;

import com.example.pojo.entity.User;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

@Mapper
public interface UserMapper {
    @Select("select count(*) from glvs_user where user_nm=#{user_nm} and user_pw=#{user_pw}")
    public Integer login(User user);

    @Select("SELECT user_contact FROM glvs_user WHERE user_nm = #{user_nm}")
    public String getUserContect(String user_nm);

    @Select("SELECT rgst_nm FROM glvs_user WHERE user_nm = #{user_nm}")
    public String getRgst_nm(String user_nm);

}

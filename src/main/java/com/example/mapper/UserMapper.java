package com.example.mapper;

import com.example.pojo.entity.User;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

@Mapper
public interface UserMapper {
    @Select("select count(*) from glvs_user where user_nm=#{user_nm} and user_pw=#{user_pw}")
    public Integer login(User user);

    @Select("SELECT user_contact FROM glvs_user WHERE user_nm = #{user_nm}")
    public String getUserContect(String user_nm);

    @Select("SELECT rgst_nm FROM glvs_user WHERE user_nm = #{user_nm}")
    public String getRgst_nm(String user_nm);

    @Select("SELECT user_bank_acc FROM glvs_user WHERE user_nm = #{user_nm}")
    public String getUserBankAcc(String user_nm);

    // 获取用户数据
    @Select("SELECT * FROM glvs_user WHERE user_nm = #{user_nm}")
    User getUserData(String user_nm);

    // 更新用户数据
    @Update("UPDATE glvs_user SET user_nm=#{user_nm}, user_contact = #{user_contact}, rgst_nm = #{rgst_nm} ,user_bank_acc = #{user_bank_acc} WHERE user_nm = #{user_nm}")
    void updateUserData(User user);

    // 更新用户密码
    @Update("UPDATE glvs_user SET user_pw = #{user_pw} WHERE user_nm = #{user_nm}")
    void updateUserPassword(@Param("user_nm") String user_nm, @Param("user_pw") String user_pw);


}

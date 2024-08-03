package com.example.controller;


import com.example.mapper.UserMapper;
import com.example.pojo.Result;
import com.example.pojo.entity.User;
import com.example.utils.JwtUtils;
import lombok.extern.slf4j.Slf4j;
import org.apache.ibatis.jdbc.Null;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;
import java.util.Map;

@Slf4j
@RestController
public class UserController {

    @Autowired
    private UserMapper userMapper;

    @CrossOrigin(origins = "http://localhost:8080")
    @PostMapping("/login")
    public Result login(@RequestBody User user){
        log.info("user try login:{}, password:{}",user.getUser_nm(),user.getUser_pw());
        Integer res = userMapper.login(user);
        if(res==1){
            Map<String, Object> claims = new HashMap<>();
            claims.put("user_nm",user.getUser_nm());
//            claims.put("user_nm",user.getUser_nm());

            //生成jwt
            String jwt = JwtUtils.generateJwt(claims);


            return Result.success(jwt);
        }else{
            return Result.error();
        }
    }




}

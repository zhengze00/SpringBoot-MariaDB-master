package com.example.controller;

import com.example.mapper.HiMapper;
import com.example.mapper.UserMapper;
import com.example.pojo.Result;
import com.example.pojo.entity.User;
import com.example.utils.JwtUtils;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.Map;

@Slf4j
@RestController
public class UserController {

    @Autowired
    private UserMapper userMapper;

    @Autowired
    private HiMapper hiMapper;

    @CrossOrigin(origins = "http://localhost:8080")
    @PostMapping("/login")
    public Result login(@RequestBody User user) {
        // 从数据库找用户写的对应的编号
        String userTypCd = hiMapper.getCommonCodeValue(user.getUser_typ_cd());

        // 修改 phoneUploadDTO 里的内容
        user.setUser_typ_cd(userTypCd);

        log.info("User try to login: {}, password: {}", user.getUser_nm(), user.getUser_pw());
        Integer res = userMapper.login(user);
        if (res == 1) {
            Map<String, Object> claims = new HashMap<>();
            claims.put("user_nm", user.getUser_nm());

            // 生成JWT
            String jwt = JwtUtils.generateJwt(claims);

            // 查询用户的其他信息
            User userInfo = userMapper.getUserInfo(user.getUser_nm());
            Map<String, Object> responseData = new HashMap<>();
            responseData.put("token", jwt);
            responseData.put("user_id", userInfo.getUser_id());
            responseData.put("user_typ_cd", userInfo.getUser_typ_cd());
            responseData.put("rgst_nm", userInfo.getRgst_nm());

            return Result.success(responseData);
        } else {
            return Result.error("Invalid username or password");
        }
    }

    @CrossOrigin(origins = "http://localhost:8080")
    @PostMapping("/updateUserData")
    public Result updateUserData(@RequestBody User user) {
        try {
            log.info("Received data: " + user);
            userMapper.updateUserData(user);
            return Result.success("User data updated successfully!");
        } catch (Exception e) {
            log.error("Error updating user data:", e); // 打印详细的错误信息
            return Result.error("Error updating user data");
        }
    }

    @CrossOrigin(origins = "http://localhost:8080")
    @PostMapping("/changePassword")
    public Result updateUserPassword(@RequestBody User user) {
        try {
            log.info("Received data: " + user);
            userMapper.updateUserPassword(user);
            return Result.success("Password changed successfully!");
        } catch (Exception e) {
            log.error("Error changing password:", e);
            return Result.error("Error changing password");
        }
    }



}

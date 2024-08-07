package com.example.controller;

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

    @CrossOrigin(origins = "http://localhost:8080")
    @PostMapping("/login")
    public Result login(@RequestBody User user) {
        log.info("User try to login: {}, password: {}", user.getUser_nm(), user.getUser_pw());
        Integer res = userMapper.login(user);
        if (res == 1) {
            Map<String, Object> claims = new HashMap<>();
            claims.put("user_nm", user.getUser_nm());

            // 生成JWT
            String jwt = JwtUtils.generateJwt(claims);
            return Result.success(jwt);
        } else {
            return Result.error("Invalid username or password");
        }
    }

    @CrossOrigin(origins = "http://localhost:8080")
    @GetMapping("/getUserData")
    public Result getUserData(@RequestParam String user_nm) {
        try {
            User user = userMapper.getUserData(user_nm);
            return Result.success(user);
        } catch (Exception e) {
            log.error("Error fetching user data:", e);
            return Result.error("Error fetching user data");
        }
    }

    @CrossOrigin(origins = "http://localhost:8080")
    @PostMapping("/updateUserData")
    public Result updateUserData(@RequestBody User user) {
        try {
            userMapper.updateUserData(user);
            return Result.success("User data updated successfully!");
        } catch (Exception e) {
            log.error("Error updating user data:", e);
            return Result.error("Error updating user data");
        }
    }

    @CrossOrigin(origins = "http://localhost:8080")
    @PostMapping("/changePassword")
    public Result updateUserPassword(@RequestBody Map<String, String> passwords) {
        String user_nm = passwords.get("user_nm");
        String newPassword = passwords.get("newPassword");
        try {
            userMapper.updateUserPassword(user_nm, newPassword);
            return Result.success("Password changed successfully!");
        } catch (Exception e) {
            log.error("Error changing password:", e);
            return Result.error("Error changing password");
        }
    }



}

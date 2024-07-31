package com.example.controller;

import com.example.mapper.HelloMapper;
import com.example.mapper.HiMapper;
import com.example.pojo.entity.User;
import com.example.pojo.entity.SalePhnNum;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Slf4j
@RestController
public class HelloController {
    @Autowired
    private HelloMapper helloMapper;
    @Autowired
    private HiMapper hiMapper;

    @RequestMapping("/hello")
    public String hello() {
        System.out.println("Welcome");
        return "Hello World";
    }

    @CrossOrigin(origins = "http://localhost:8081")
    @RequestMapping("/getUser")
    public List getUser() {
        log.info("request from getUser");
        List<User> userList = helloMapper.getUserList();
        return userList;
    }

    @CrossOrigin(origins = "http://localhost:8080")
    @RequestMapping("/getSalePhnNum")
    public Map<String, Object> getSalePhnNum() {
        log.info("request from getSalePhnNum");
        List<SalePhnNum> salePhnNumList = hiMapper.getSalePhnNumList();
        String exchangeRate = hiMapper.getExchangeRate();
        Map<String, Object> response = new HashMap<>();
        response.put("salePhnNums", salePhnNumList);
        response.put("exchangeRate", exchangeRate);
        return response;
    }


}
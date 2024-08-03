package com.example.controller;

import com.example.mapper.HelloMapper;
import com.example.mapper.HiMapper;
import com.example.mapper.UserMapper;
import com.example.pojo.Result;
import com.example.pojo.entity.PfxCount;
import com.example.pojo.entity.PhoneUploadDTO;
import com.example.pojo.entity.User;
import com.example.pojo.entity.SalePhnNum;
import jakarta.servlet.http.HttpServletRequest;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Slf4j
@CrossOrigin(origins = "http://localhost:8080")
@RestController
public class HelloController {
    @Autowired
    private HelloMapper helloMapper;
    @Autowired
    private HiMapper hiMapper;

    @Autowired
    private UserMapper userMapper;

    @RequestMapping("/hello")
    public String hello() {
        System.out.println("Welcome");
        return "Hello World";
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

    @CrossOrigin(origins = "http://localhost:8080")
    @RequestMapping("/getPfxCount")
    public List<PfxCount> getPfxCount() {
        log.info("request from getPfxCount");
        List<PfxCount> PfxCountList = hiMapper.getCountPrefix();
        System.out.println(PfxCountList.toString());
        return PfxCountList;
    }

    @CrossOrigin(origins = "http://localhost:8080")
    @RequestMapping("/upload_phone")
    public Result uploadPhone(@RequestBody PhoneUploadDTO phoneUploadDTO, HttpServletRequest req) {

        //从数据库找用户写的对应的编号
        String salePhnPfxCd = hiMapper.getCommonCodeValue( phoneUploadDTO.getSale_phn_pfx_cd());
        String saleCtgrCd = hiMapper.getCommonCodeValue( phoneUploadDTO.getSale_ctgr_cd());
        String saleStatusCd = hiMapper.getCommonCodeValue(phoneUploadDTO.getSale_status_cd());

        //修改phoneUploadDTO里的内容
        phoneUploadDTO.setSale_phn_pfx_cd(salePhnPfxCd);
        phoneUploadDTO.setSale_ctgr_cd(saleCtgrCd);
        phoneUploadDTO.setSale_status_cd(saleStatusCd);

        //从请求头中得到user_nm的值，并从数据库找到对应的联系方式，写入
        String user_nm = (String)req.getAttribute("user_nm");
        log.info("user_nm: {}", user_nm);
        String sale_contact = userMapper.getUserContect(user_nm);
        String rgst_nm = userMapper.getRgst_nm(user_nm);
        log.info("sale_contact : {}", sale_contact);

        phoneUploadDTO.setRgst_nm(rgst_nm);
        phoneUploadDTO.setSale_contact(sale_contact);

        log.info(phoneUploadDTO.toString());

        hiMapper.insertPhoneData(phoneUploadDTO);

        return Result.success();
    }




}
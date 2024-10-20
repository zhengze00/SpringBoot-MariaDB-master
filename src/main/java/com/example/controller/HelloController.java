package com.example.controller;

import com.example.mapper.HelloMapper;
import com.example.mapper.HiMapper;
import com.example.mapper.UserMapper;
import com.example.pojo.Result;
import com.example.pojo.entity.*;
import com.zaxxer.hikari.HikariDataSource;
import jakarta.servlet.http.HttpServletRequest;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Slf4j
@CrossOrigin(origins = "http://148.66.156.232:8080")
@RestController
public class HelloController {
    @Autowired
    private HelloMapper helloMapper;
    @Autowired
    private HiMapper hiMapper;
    @Autowired
    private UserMapper userMapper;
    @Autowired
    private HikariDataSource dataSource;

    @RequestMapping("/hello")
    public String hello() {
        System.out.println("Welcome");
        return "Hello World";
    }

    @CrossOrigin(origins = "http://148.66.156.232:8080")
    @RequestMapping("/getSalePhnNum")
    public Map<String, Object> getSalePhnNum() {
        log.info("request from getSalePhnNum");
        List<SalePhnNum> salePhnNumList = hiMapper.getSalePhnNumsList(); // 使用新查询方法

        // 调试输出
        for (SalePhnNum salePhnNum : salePhnNumList) {
            String userBankAcc = userMapper.getUserBankAcc(salePhnNum.getUser_nm());
            salePhnNum.setUserBankAcc(userBankAcc);
        }

        // 获取汇率和结算率
        String exchangeRate = hiMapper.getExchangeRate();
        String settlementRate = hiMapper.getSettlementRate();

        Map<String, Object> response = new HashMap<>();
        response.put("salePhnNums", salePhnNumList);
        response.put("exchangeRate", exchangeRate);
        response.put("settlementRate", settlementRate);
        return response;
    }

    @CrossOrigin(origins = "http://148.66.156.232:8080")
    @RequestMapping("/getBankAccount")
    public Map<String, Object> getBankAccount() {
        log.info("request from getBankAccount");
        List<SalePhnNum> bankAccountList = hiMapper.getBankAccountList(); // 使用新查询方法

        // 调试输出
        for (SalePhnNum bankAccount : bankAccountList) {
            String userBankAcc = userMapper.getUserBankAcc(bankAccount.getUser_nm());
            bankAccount.setUserBankAcc(userBankAcc);
        }

        // 获取汇率和结算率
        String exchangeRate = hiMapper.getExchangeRate();
        String settlementRate = hiMapper.getSettlementRate();

        Map<String, Object> response = new HashMap<>();
        response.put("bankAccount", bankAccountList);
        response.put("exchangeRate", exchangeRate);
        response.put("settlementRate", settlementRate);
        return response;
    }

    @CrossOrigin(origins = "http://148.66.156.232:8080")
    @RequestMapping("/getPfxCount")
    public List<PfxCount> getPfxCount() {
        log.info("request from getPfxCount");
        List<PfxCount> PfxCountList = hiMapper.getCountPrefix();
        System.out.println(PfxCountList.toString());
        return PfxCountList;
    }

    @CrossOrigin(origins = "http://148.66.156.232:8080")
    @RequestMapping("/upload_phone")
    public Result uploadPhone(@RequestBody PhoneUploadDTO phoneUploadDTO, HttpServletRequest req) {
        // 从数据库找用户写的对应的编号
        String salePhnPfxCd = hiMapper.getCommonCodeValue(phoneUploadDTO.getSale_phn_pfx_cd());
        String saleCtgrCd = hiMapper.getCommonCodeValue(phoneUploadDTO.getSale_ctgr_cd());
        String saleStatusCd = hiMapper.getCommonCodeValue(phoneUploadDTO.getSale_status_cd());

        // 修改 phoneUploadDTO 里的内容
        phoneUploadDTO.setSale_phn_pfx_cd(salePhnPfxCd);
        phoneUploadDTO.setSale_ctgr_cd(saleCtgrCd);
        phoneUploadDTO.setSale_status_cd(saleStatusCd);

        // 从请求头中得到 user_nm 的值，并从数据库找到对应的联系方式，写入
        String user_nm = (String) req.getAttribute("user_nm");
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

    @CrossOrigin(origins = "http://148.66.156.232:8080")
    @PostMapping("/update_phone")
    public Result updatePhoneData(@RequestBody PhoneUploadDTO phoneUploadDTO) {
        // 从数据库找用户写的对应的编号
        String salePhnPfxCd = hiMapper.getCommonCodeValue(phoneUploadDTO.getSale_phn_pfx_cd());
        String saleCtgrCd = hiMapper.getCommonCodeValue(phoneUploadDTO.getSale_ctgr_cd());
        String saleStatusCd = hiMapper.getCommonCodeValue(phoneUploadDTO.getSale_status_cd());

        // 修改 phoneUploadDTO 里的内容
        phoneUploadDTO.setSale_phn_pfx_cd(salePhnPfxCd);
        phoneUploadDTO.setSale_ctgr_cd(saleCtgrCd);
        phoneUploadDTO.setSale_status_cd(saleStatusCd);

        try {
            log.info("Received data: " + phoneUploadDTO);
            hiMapper.updatePhoneData(phoneUploadDTO);
            return Result.success();
        } catch (Exception e) {
            log.error("Error updating phone data:", e);
            return Result.error();
        }
    }

    @CrossOrigin(origins = "http://148.66.156.232:8080")
    @PostMapping("/delete_phone")
    public Result deletePhoneData(@RequestBody SaleID saleID) {
        try {
            hiMapper.deletePhoneData(saleID.getSale_id()); // 修改这里，传递正确的ID
            return Result.success();
        } catch (Exception e) {
            log.error("Error deleting phone data:", e);
            return Result.error();
        }

    }

    @CrossOrigin(origins = "http://148.66.156.232:8080")
    @PostMapping("/markSettlementCompleted")
    public Result markSettlementCompleted(@RequestBody PhoneUploadDTO phoneUploadDTO) {
        log.info("Entering markSettlementCompleted method.");
        // 从数据库找用户写的对应的编号
        String saleStatusCd = hiMapper.getCommonCodeValue(phoneUploadDTO.getSale_status_cd());
        log.info("Sale status code retrieved: {}", saleStatusCd);

        // 修改 phoneUploadDTO 里的内容
        phoneUploadDTO.setSale_status_cd(saleStatusCd);

        String rgst_nm = phoneUploadDTO.getRgst_nm();
        log.info("Owner retrieved from request: {}", rgst_nm);

        try {
            // 使用注入的 HiMapper 实例调用方法
            int result = hiMapper.markSettlementCompleted(rgst_nm);
            log.info("Result of markSettlementCompleted: {}", result);
            return Result.success(result);
        } catch (Exception e) {
            log.error("Error marking settlement completed:", e);
            return Result.error();
        }
    }


}
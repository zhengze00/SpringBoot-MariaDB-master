package com.example.pojo.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.math.BigDecimal;
import java.time.LocalDateTime;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class BankAccount {
    private Long sale_id;
    private String sale_phn_num;
    private String sale_phn_pfx_cd;
    private String sale_ctgr_cd;
    private BigDecimal sale_price;
    private String sale_status_cd;
    private String sale_contact;
    private String rgst_nm;
    private String rgst_dt;
    private String user_nm;
    private String audit_nm;
    private String audit_dt;
    private String user_bank_acc; // 新增属性

    // getters and setters
    public String getUserBankAcc() {
        return user_bank_acc;
    }

    public void setUserBankAcc(String userBankAcc) {
        this.user_bank_acc = userBankAcc;
    }
}

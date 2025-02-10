package com.example.pojo.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.math.BigDecimal;
import java.util.Date;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class SaleID {
    private String sale_id;
    private String sale_phn_pfx_cd;
    private String sale_ctgr_cd;
    private String sale_phn_num;
    private BigDecimal sale_price;
    private String sale_status_cd;
    private String sale_contact;
    private String rgst_nm;
    private String rgst_dt;
    private String audit_nm;
    private String audit_dt;

}
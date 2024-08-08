package com.example.pojo.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class User {
    private Integer user_id;
    private String user_nm;
    private String user_pw;
    private String user_contact;
    private String user_typ_cd;
    private String user_bank_acc;
    private String rgst_nm;
    private String rgst_dt;
    private String audit_nm;
    private String audit_dt;
    private String currentPassword; // Add this if you need to pass it

}





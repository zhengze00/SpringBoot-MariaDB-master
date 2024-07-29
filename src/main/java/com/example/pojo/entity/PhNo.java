package com.example.pojo.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class PhNo {
    private String number;
    private String category;
    private String phone_prefix;
    private String price_myr;
    private String status;
    private String status_date;
    private String upload_date;
    private String seller_id;
}
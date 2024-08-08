package com.example.mapper;

import com.example.pojo.entity.*;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Update;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface HiMapper {
    @Select("SELECT comm_cd_val_nm FROM glvs_common_cd WHERE comm_cd_id = 'exchange_rt_cd' AND comm_cd_val = 'E001'")
    public String getExchangeRate();

    @Select("SELECT settl_rt FROM glvs_settl_rt WHERE settl_id = '1'")
    public String getSettlementRate();

    @Select("SELECT spn.sale_id, spn.sale_phn_num, scd.comm_cd_val_nm AS sale_phn_pfx_cd, scc.comm_cd_val_nm AS sale_ctgr_cd, spn.sale_price, ss.comm_cd_val_nm AS sale_status_cd, spn.sale_contact, spn.rgst_nm, spn.rgst_dt, u.user_nm, u.user_bank_acc " +
            "FROM glvs_sale_phn_num spn " +
            "JOIN glvs_common_cd scd ON spn.sale_phn_pfx_cd = scd.comm_cd_val AND scd.comm_cd_id = 'sale_phn_pfx_cd' " +
            "JOIN glvs_common_cd scc ON spn.sale_ctgr_cd = scc.comm_cd_val AND scc.comm_cd_id = 'sale_ctgr_cd' " +
            "JOIN glvs_common_cd ss ON spn.sale_status_cd = ss.comm_cd_val AND ss.comm_cd_id = 'sale_status_cd' " +
            "JOIN glvs_user u ON spn.user_nm = u.user_nm " +
            "WHERE spn.sale_status_cd = 'S02' " +
            "ORDER BY scd.comm_cd_val_nm")
    public List<SalePhnNum> getBankAccountList();

    @Select(" SELECT spn.sale_id, spn.sale_phn_num, scd.comm_cd_val_nm, scc.comm_cd_val_nm, spn.sale_price, ss.comm_cd_val_nm, spn.sale_contact, spn.rgst_nm, spn.rgst_dt, scd.comm_cd_val_nm as sale_phn_pfx_cd, scc.comm_cd_val_nm as sale_ctgr_cd, ss.comm_cd_val_nm as sale_status_cd " +
            "FROM glvs_sale_phn_num spn "+
            "JOIN glvs_common_cd scd ON spn.sale_phn_pfx_cd = scd.comm_cd_val AND scd.comm_cd_id = 'sale_phn_pfx_cd' "+
            "JOIN glvs_common_cd scc ON spn.sale_ctgr_cd = scc.comm_cd_val AND scc.comm_cd_id = 'sale_ctgr_cd' "+
            "JOIN glvs_common_cd ss ON spn.sale_status_cd = ss.comm_cd_val AND ss.comm_cd_id = 'sale_status_cd' ORDER BY scd.comm_cd_val_nm")
    public List<SalePhnNum> getSalePhnNumsList();


    @Select("SELECT scd.comm_cd_val_nm AS phone_prefix, COUNT(spn.sale_id) AS sold_count " +
            "FROM glvs_sale_phn_num spn " +
            "JOIN glvs_common_cd scd ON spn.sale_phn_pfx_cd = scd.comm_cd_val AND scd.comm_cd_id = 'sale_phn_pfx_cd' " +
            "JOIN glvs_common_cd scc ON spn.sale_status_cd = scc.comm_cd_val AND scc.comm_cd_id = 'sale_status_cd' " +
            "WHERE scc.comm_cd_val = 'S02' " +
            "GROUP BY scd.comm_cd_val_nm ")
    public List<PfxCount> getCountPrefix();

    @Select("SELECT comm_cd_val FROM glvs_common_cd WHERE comm_cd_val_nm = #{name}")
    String getCommonCodeValue(@Param("name") String name);

    @Insert("INSERT INTO glvs_sale_phn_num (sale_phn_num, sale_phn_pfx_cd, sale_ctgr_cd, sale_price, sale_status_cd, sale_contact, rgst_nm, rgst_dt, user_typ_cd, user_nm) " +
            "VALUES (#{sale_phn_num}, #{sale_phn_pfx_cd}, #{sale_ctgr_cd}, #{sale_price}, #{sale_status_cd}, #{sale_contact}, #{rgst_nm}, #{rgst_dt}, #{user_typ_cd}, #{user_nm})")
    void insertPhoneData(PhoneUploadDTO phoneUploadDTO);

    @Delete("DELETE FROM glvs_sale_phn_num WHERE sale_id = #{saleId}")
    int deletePhoneData(@Param("saleId") String saleId); // 使用 @Param 注解确保传递参数正确

    @Update("UPDATE glvs_sale_phn_num SET sale_phn_pfx_cd = #{sale_phn_pfx_cd}, sale_ctgr_cd = #{sale_ctgr_cd}, sale_price = #{sale_price}, sale_status_cd = #{sale_status_cd}, rgst_dt = #{rgst_dt} WHERE sale_phn_num = #{sale_phn_num}")
    void updatePhoneData(PhoneUploadDTO phoneUploadDTO);

    @Update("UPDATE glvs_sale_phn_num SET sale_status_cd = 'S03' WHERE rgst_nm = #{rgst_nm} AND sale_status_cd = 'S02'")
    int markSettlementCompleted(String phoneUploadDTO);


}
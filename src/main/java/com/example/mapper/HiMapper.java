package com.example.mapper;

import com.example.pojo.entity.PfxCount;
import com.example.pojo.entity.PhoneUploadDTO;
import com.example.pojo.entity.SalePhnNum;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface HiMapper {
    @Select("SELECT comm_cd_val_nm FROM glvs_common_cd WHERE comm_cd_id = 'exchange_rt_cd' AND comm_cd_val = 'E001'")
    public String getExchangeRate();


//    @Select("SELECT spn.sale_id, spn.sale_phn_num, spn.sale_phn_pfx_cd, spn.sale_ctgr_cd, spn.sale_price, spn.sale_status_cd, spn.sale_contact, spn.rgst_nm, spn.rgst_dt, scd.comm_cd_val_nm as sale_phn_pfx_cd, scc.comm_cd_val_nm as sale_ctgr_cd, ss.comm_cd_val_nm as sale_status_cd " +
//            "FROM glvs_sale_phn_num spn " +
//            "JOIN glvs_common_cd scd ON spn.sale_phn_pfx_cd = scd.comm_cd_val AND scd.comm_cd_id = 'sale_phn_pfx_cd' " +
//            "JOIN glvs_common_cd scc ON spn.sale_ctgr_cd = scc.comm_cd_val AND scc.comm_cd_id = 'sale_ctgr_cd' " +
//            "JOIN glvs_common_cd ss ON spn.sale_status_cd = ss.comm_cd_val AND ss.comm_cd_id = 'sale_status_cd'")
//    public List<SalePhnNum> getSalePhnNumList();


    @Select(" SELECT spn.sale_id, spn.sale_phn_num, scd.comm_cd_val_nm, scc.comm_cd_val_nm, spn.sale_price, ss.comm_cd_val_nm, spn.sale_contact, spn.rgst_nm, spn.rgst_dt, scd.comm_cd_val_nm as sale_phn_pfx_cd, scc.comm_cd_val_nm as sale_ctgr_cd, ss.comm_cd_val_nm as sale_status_cd " +
    "FROM glvs_sale_phn_num spn "+
    "JOIN glvs_common_cd scd ON spn.sale_phn_pfx_cd = scd.comm_cd_val AND scd.comm_cd_id = 'sale_phn_pfx_cd' "+
    "JOIN glvs_common_cd scc ON spn.sale_ctgr_cd = scc.comm_cd_val AND scc.comm_cd_id = 'sale_ctgr_cd' "+
    "JOIN glvs_common_cd ss ON spn.sale_status_cd = ss.comm_cd_val AND ss.comm_cd_id = 'sale_status_cd' ORDER BY scd.comm_cd_val_nm")
    public List<SalePhnNum> getSalePhnNumList();

    @Select("SELECT scd.comm_cd_val_nm AS phone_prefix, COUNT(spn.sale_id) AS sold_count " +
            "FROM glvs_sale_phn_num spn " +
            "JOIN glvs_common_cd scd ON spn.sale_phn_pfx_cd = scd.comm_cd_val AND scd.comm_cd_id = 'sale_phn_pfx_cd' " +
            "JOIN glvs_common_cd scc ON spn.sale_status_cd = scc.comm_cd_val AND scc.comm_cd_id = 'sale_status_cd' " +
            "WHERE scc.comm_cd_val = 'S02' " +
            "GROUP BY scd.comm_cd_val_nm ")
    public List<PfxCount> getCountPrefix();

    @Select("SELECT comm_cd_val FROM glvs_common_cd WHERE comm_cd_val_nm = #{name}")
    String getCommonCodeValue(@Param("name") String name);

    @Insert("INSERT INTO glvs_sale_phn_num (sale_phn_num, sale_phn_pfx_cd, sale_ctgr_cd, sale_price, sale_status_cd, sale_contact, rgst_nm, rgst_dt) " +
            "VALUES (#{sale_phn_num}, #{sale_phn_pfx_cd}, #{sale_ctgr_cd}, #{sale_price}, #{sale_status_cd}, #{sale_contact}, #{rgst_nm}, #{rgst_dt})")
    void insertPhoneData(PhoneUploadDTO phoneUploadDTO);


}


SELECT spn.sale_id, spn.sale_phn_num, scd.comm_cd_val_nm, scc.comm_cd_val_nm, spn.sale_price, ss.comm_cd_val_nm, spn.sale_contact, spn.rgst_nm, spn.rgst_dt, scd.comm_cd_val_nm as sale_phn_pfx_cd, scc.comm_cd_val_nm as sale_ctgr_cd, ss.comm_cd_val_nm as sale_status_cd
            FROM glvs_sale_phn_num spn
            JOIN glvs_common_cd scd ON spn.sale_phn_pfx_cd = scd.comm_cd_val AND scd.comm_cd_id = 'sale_phn_pfx_cd'
            JOIN glvs_common_cd scc ON spn.sale_ctgr_cd = scc.comm_cd_val AND scc.comm_cd_id = 'sale_ctgr_cd'
            JOIN glvs_common_cd ss ON spn.sale_status_cd = ss.comm_cd_val AND ss.comm_cd_id = 'sale_status_cd'
            ORDER BY scd.comm_cd_val_nm
            
            
SELECT 
    scd.comm_cd_val_nm AS phone_prefix,
    COUNT(spn.sale_id) AS sold_count
FROM 
    glvs_sale_phn_num spn
JOIN 
    glvs_common_cd scd ON spn.sale_phn_pfx_cd = scd.comm_cd_val AND scd.comm_cd_id = 'sale_phn_pfx_cd'
JOIN 
    glvs_common_cd scc ON spn.sale_status_cd = scc.comm_cd_val AND scc.comm_cd_id = 'sale_status_cd'
WHERE 
    scc.comm_cd_val = 'S02' -- 'S02' 代表 SoldOut 状态
GROUP BY 
    scd.comm_cd_val_nm;
    
    
    
SELECT scd.comm_cd_val_nm AS phone_prefix, COUNT(spn.sale_id) AS sold_count 
            FROM glvs_sale_phn_num spn 
            JOIN glvs_common_cd scd ON spn.sale_phn_pfx_cd = scd.comm_cd_val AND scd.comm_cd_id = 'sale_phn_pfx_cd' 
            JOIN glvs_common_cd scc ON spn.sale_status_cd = scc.comm_cd_val AND scc.comm_cd_id = 'sale_status_cd' 
            WHERE scc.comm_cd_val = 'S02' 
            GROUP BY scd.comm_cd_val_nm 
            

SELECT * FROM glvs_user;


SELECT comm_cd_val_nm FROM glvs_common_cd WHERE comm_cd_id = 'exchange_rt_cd' AND comm_cd_val = 'E001'


SELECT comm_cd_val FROM glvs_common_cd WHERE comm_cd_val_nm = "017"



SELECT user_contact FROM glvs_user WHERE user_nm = "abc"

            
-- 插入12条数据到 glvs_sale_phn_num 表中
INSERT INTO glvs_sale_phn_num (sale_phn_num, sale_phn_pfx_cd, sale_ctgr_cd, sale_price, sale_status_cd, sale_contact, rgst_nm, rgst_dt, audit_nm, audit_dt)
VALUES 
('012-3456-8789', 'P03', 'S028', 100.00, 'S01', '012-3456-7890', 'John Doe', '2023-01-01', 'Admin', '2023-01-01'),
('013-9876-8543', 'P04', 'S030', 155.00, 'S02', '013-9876-5432', 'Jane Smith', '2023-02-02', 'Admin', '2023-02-02'),
('014-1234-8567', 'P05', 'S031', 1200.00, 'S01', '014-1234-5678', 'Robert Brown', '2023-03-03', 'Admin', '2023-03-03'),
('015-7654-8321', 'P06', 'S028', 250.00, 'S01', '015-7654-3210', 'Emily Davis', '2023-04-04', 'Admin', '2023-04-04'),
('016-1122-8334', 'P07', 'S028', 3000.00, 'S02', '016-1122-3344', 'Michael Wilson', '2023-05-05', 'Admin', '2023-05-05'),
('017-4433-8221', 'P08', 'S028', 75.00, 'S01', '017-4433-2210', 'Linda Johnson', '2023-06-06', 'Admin', '2023-06-06'),
('018-9988-8776', 'P09', 'S028', 4500.00, 'S01', '018-9988-7760', 'David Martinez', '2023-07-07', 'Admin', '2023-07-07'),
('019-5544-8332', 'P10', 'S030', 190.00, 'S01', '019-5544-3320', 'Sarah Rodriguez', '2023-08-08', 'Admin', '2023-08-08'),
('010-6677-8889', 'P01', 'S029', 850.00, 'S01', '010-6677-8890', 'James Lee', '2023-09-09', 'Admin', '2023-09-09'),
('011-9988-8444', 'P02', 'S028', 550.00, 'S02', '011-9988-4440', 'Jessica Walker', '2023-10-10', 'Admin', '2023-10-10'),
('012-1234-8987', 'P03', 'S033', 630.00, 'S01', '012-1234-9870', 'William Hall', '2023-11-11', 'Admin', '2023-11-11'),
('013-7654-8320', 'P04', 'S028', 99.00, 'S01', '013-7654-3200', 'Laura Allen', '2023-12-12', 'Admin', '2023-12-12');

INSERT INTO glvs_sale_phn_num (sale_phn_num, sale_phn_pfx_cd, sale_ctgr_cd, sale_price, sale_status_cd, sale_contact, rgst_nm, rgst_dt, audit_nm, audit_dt)
VALUES 
('011-3456-8789', 'P01', 'S028', 100.00, 'S01', '012-3456-7890', 'John Doe', '2023-01-01', 'Admin', '2023-01-01')

SELECT user_bank_acc FROM glvs_user WHERE rgst_nm = "ZZ"

SELECT *
FROM glvs_sale_phn_num
WHERE REPLACE(sale_phn_num, '-', '') LIKE '%345%';

ALTER TABLE glvs_sale_phn_num
ADD COLUMN audit_nm VARCHAR(50),
ADD COLUMN audit_dt DATE;

-- 첫 번째 사용자 데이터 삽입
INSERT INTO glvs_user (user_nm, user_pw, user_contact, user_typ_cd, user_bank_acc, rgst_nm, rgst_dt, audit_nm, audit_dt)
VALUES 
('abc', '123', 011-3456-7890', 'U01', 'SH111-222-333', 'John', '2024-08-05', 'Admin', '2024-08-05');
('zz', '123', '019-765-4321', 'U02', 'NH444-555-666', 'ZZ', '2024-08-05', 'Admin', '2024-08-05');

INSERT INTO glvs_settl_rt (settl_id,settl_rt)
VALUES 
('1','0.9');


UPDATE glvs_sale_phn_num SET sale_status_cd = 'S03' WHERE rgst_nm = "Kim" AND sale_status_cd = 'S02'

ALTER TABLE glvs_sale_phn_num
ADD COLUMN user_typ_cd VARCHAR(50),
ADD COLUMN user_nm VARCHAR(50);

SELECT si.*, u.user_bank_acc
FROM glvs_sale_phn_num si
INNER JOIN (
    SELECT DISTINCT user_nm
    FROM glvs_sale_phn_num
    WHERE sale_status_cd = 'S02'
) du ON si.user_nm = du.user_nm
INNER JOIN glvs_user u ON si.user_nm = u.user_nm
WHERE si.sale_status_cd = 'S02'
 JOIN glvs_common_cd scd ON si.sale_phn_pfx_cd = scd.comm_cd_val AND scd.comm_cd_id = 'sale_phn_pfx_cd' 
 JOIN glvs_common_cd scc ON si.sale_ctgr_cd = scc.comm_cd_val AND scc.comm_cd_id = 'sale_ctgr_cd' 
 JOIN glvs_common_cd ss ON si.sale_status_cd = ss.comm_cd_val AND ss.comm_cd_id = 'sale_status_cd' ORDER BY scd.comm_cd_val_nm"



SELECT * FROM glvs_user WHERE user_nm = 'zz'

UPDATE glvs_user SET user_nm=#{user_nm}, user_contact = #{user_contact}, rgst_nm = #{rgst_nm} ,user_bank_acc = #{user_bank_acc} WHERE user_nm = #{user_nm}

UPDATE glvs_user SET user_pw = #{user_pw} WHERE user_nm = #{user_nm}

select count(*) from glvs_user where user_nm='123' and user_pw='123'

DELETE FROM glvs_sale_phn_num WHERE sale_phn_num = '010-0000-0000'

DELETE FROM glvs_sale_phn_num WHERE sale_id = '1'

UPDATE glvs_sale_phn_num SET sale_phn_pfx_cd = 'P01', sale_ctgr_cd = 'S001', sale_price = 100, sale_status_cd = 'S01' , rgst_dt ='2024-08-05', rgst_nm = 'NANZU' WHERE sale_phn_num = '123'
   
   
SELECT spn.sale_id, spn.sale_phn_num, scd.comm_cd_val_nm AS sale_phn_pfx_cd, scc.comm_cd_val_nm AS sale_ctgr_cd, spn.sale_price, ss.comm_cd_val_nm AS sale_status_cd, spn.sale_contact, spn.rgst_nm, spn.rgst_dt, u.user_bank_acc 
        FROM glvs_sale_phn_num spn 
        JOIN glvs_common_cd scd ON spn.sale_phn_pfx_cd = scd.comm_cd_val AND scd.comm_cd_id = 'sale_phn_pfx_cd' 
        JOIN glvs_common_cd scc ON spn.sale_ctgr_cd = scc.comm_cd_val AND scc.comm_cd_id = 'sale_ctgr_cd' 
        JOIN glvs_common_cd ss ON spn.sale_status_cd = ss.comm_cd_val AND ss.comm_cd_id = 'sale_status_cd'
        JOIN glvs_user u ON spn.user_nm = u.user_nm 
        WHERE spn.sale_status_cd = 'S02' 
        ORDER BY scd.comm_cd_val_nm
        
SELECT spn.sale_id, spn.sale_phn_num, scd.comm_cd_val_nm, scc.comm_cd_val_nm, spn.sale_price, ss.comm_cd_val_nm, spn.sale_contact, spn.rgst_nm, spn.rgst_dt, scd.comm_cd_val_nm as sale_phn_pfx_cd, scc.comm_cd_val_nm as sale_ctgr_cd, ss.comm_cd_val_nm as sale_status_cd 
		 FROM glvs_sale_phn_num spn 
		 JOIN glvs_common_cd scd ON spn.sale_phn_pfx_cd = scd.comm_cd_val AND scd.comm_cd_id = 'sale_phn_pfx_cd' 
		 JOIN glvs_common_cd scc ON spn.sale_ctgr_cd = scc.comm_cd_val AND scc.comm_cd_id = 'sale_ctgr_cd' 
		 JOIN glvs_common_cd ss ON spn.sale_status_cd = ss.comm_cd_val AND ss.comm_cd_id = 'sale_status_cd' ORDER BY scd.comm_cd_val_nm
	
SELECT scd.comm_cd_val_nm AS phone_prefix, COUNT(spn.sale_id) AS sold_count 
      FROM glvs_sale_phn_num spn 
      JOIN glvs_common_cd scd ON spn.sale_phn_pfx_cd = scd.comm_cd_val AND scd.comm_cd_id = 'sale_phn_pfx_cd' 
      JOIN glvs_common_cd scc ON spn.sale_status_cd = scc.comm_cd_val AND scc.comm_cd_id = 'sale_status_cd' 
      WHERE scc.comm_cd_val = 'S02' 
      GROUP BY scd.comm_cd_val_nm 

     
SELECT user_bank_acc FROM glvs_user WHERE user_nm = 'zz'


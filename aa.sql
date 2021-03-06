create table jt_dianyuanjia(
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
dian_yuan_jia_ming_cheng VARCHAR(82) not null UNIQUE,
    suo_shu_ji_fang VARCHAR(76),
    dui_ying_di_ya_jiao_liu_pei_dian_ming_cheng VARCHAR(82),
    dian_yuan_jia_chan_quan_gui_shu VARCHAR(8),
    sheng_ming_zhou_qi_zhuang_tai VARCHAR(8) not null,
    dian_yuan_jia_lei_xing VARCHAR(12),
    dian_yuan_jia_chang_jia VARCHAR(10),
    dian_yuan_jia_xing_hao VARCHAR(60),
    zheng_liu_mo_kuai_xing_hao VARCHAR(32),
    zheng_liu_mo_kuai_gong_lv INT,
    zheng_liu_mo_kuai_shu_liang INT,
    kong_zhi_mo_kuai_xing_hao VARCHAR(42),
    yi_ci_xia_dian_duan_zi_shu INT,
    er_ci_xia_dian_duan_zi_shu INT,
    shi_ji_dian_ya FLOAT,
    shi_ji_dian_liu FLOAT,
    shi_fou_gong_xiang VARCHAR(2),
    gong_xiang_fang VARCHAR(10),
    guan_lian_dong_tai_zi_chan_tiao_ma VARCHAR(222),
    yi_dong_gong_cheng_zhong_xin_fu_ze_ren VARCHAR(8),
    shi_gong_she_ji_fu_ze_ren VARCHAR(32),
    shi_gong_jian_li_fu_ze_ren VARCHAR(32),
    shi_gong_fang_fu_ze_ren VARCHAR(32),
    dian_yuan_jia_chan_quan_fang_fu_ze_ren VARCHAR(10),
    dai_wei_fu_ze_ren VARCHAR(8),
    yi_xian_dai_wei_ren_yuan VARCHAR(16),
    dian_yuan_jia_zhao_pian VARCHAR(490),
    bei_zhu VARCHAR(256));

create table jt_kongdiao(
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
kong_diao_ming_cheng VARCHAR(82) not null UNIQUE,
    suo_shu_ji_fang VARCHAR(76),
    suo_shu_wu_li_zhan_dian_ming_cheng VARCHAR(66),
    kong_diao_chan_quan_gui_shu VARCHAR(8),
    sheng_ming_zhou_qi_zhuang_tai VARCHAR(8),
    kong_diao_pin_pai VARCHAR(8),
    kong_diao_xing_hao VARCHAR(46),
    kong_diao_lei_xing VARCHAR(8),
    kong_diao_fang_zhi_fang_shi VARCHAR(6),
    jie_dian_fang_shi VARCHAR(14),
    kong_diao_gong_lv INT,
    tou_ru_shi_yong_shi_jian VARCHAR(20),
    wai_ji_shi_fou_an_zhuang_fang_dao_wang VARCHAR(2),
    guan_lian_dong_tai_zi_chan_tiao_ma VARCHAR(142),
    yi_dong_gong_cheng_zhong_xin_fu_ze_ren VARCHAR(32),
    shi_gong_she_ji_fu_ze_ren VARCHAR(32),
    shi_gong_jian_li_fu_ze_ren VARCHAR(32),
    shi_gong_fang_fu_ze_ren VARCHAR(10),
    kong_diao_chan_quan_fang_fu_ze_ren VARCHAR(10),
    dai_wei_fu_ze_ren VARCHAR(8),
    yi_xian_dai_wei_ren_yuan VARCHAR(16),
    kong_diao_zhao_pian VARCHAR(362),
    bei_zhu VARCHAR(256));

create table jt_jifang(
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
ji_fang_ming_cheng VARCHAR(86) not null UNIQUE,
    suo_shu_wu_li_zhan_dian_ming_cheng VARCHAR(78),
    suo_shu_wu_ye_he_tong_bian_hao VARCHAR(86),
    sheng_ming_zhou_qi_zhuang_tai VARCHAR(8) not null,
    ru_wang_ri_qi VARCHAR(20),
    ji_fang_lei_xing_I VARCHAR(6),
    ji_fang_lei_xing_II VARCHAR(10),
    ji_fang_lei_xing_III VARCHAR(24),
    suo_zai_lou_ceng VARCHAR(10),
    lou_ceng_nei_wei_zhi VARCHAR(102),
    ji_fang_mian_ji FLOAT,
    ji_fang_ceng_gao FLOAT,
    ji_fang_cheng_zhong_neng_li INT,
    ji_fang_chan_quan_gui_shu VARCHAR(8) not null,
    shi_fou_gong_xiang VARCHAR(2),
    gong_xiang_fang VARCHAR(16),
    suo_shu_tie_ta_gong_si_ji_fang_ming_cheng VARCHAR(50),
    suo_shu_tie_ta_gong_si_ji_fang_bian_ma VARCHAR(40),
    guan_lian_zhuan_ye VARCHAR(30),
    ye_wu_ji_bie VARCHAR(12),
    sheng_nei_ji_fang_lei_xing VARCHAR(26),
    zong_zi_ji_fang_ming_cheng VARCHAR(88),
    ji_fang_dai_ma VARCHAR(36),
    guan_lian_dong_tai_zi_chan_tiao_ma VARCHAR(110),
    yi_dong_gong_cheng_zhong_xin_fu_ze_ren VARCHAR(32),
    shi_gong_she_ji_fu_ze_ren VARCHAR(32),
    shi_gong_jian_li_fu_ze_ren VARCHAR(32),
    shi_gong_fang_fu_ze_ren VARCHAR(32),
    she_ji_fang_an_wen_jian VARCHAR(102),
    jun_gong_tu_zhi VARCHAR(32),
    ji_fang_chan_quan_fang_fu_ze_ren VARCHAR(10),
    dai_wei_fu_ze_ren VARCHAR(36),
    yi_xian_dai_wei_ren_yuan VARCHAR(10),
    ji_fang_zhao_pian VARCHAR(502),
    bei_zhu VARCHAR(256));

create table jt_dianchi(
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
dian_chi_zu_ming_cheng VARCHAR(74) not null UNIQUE,
    suo_shu_ji_fang VARCHAR(62),
    jie_ru_dian_yuan_jia_ming_cheng VARCHAR(68),
    suo_shu_wu_li_zhan_dian_ming_cheng VARCHAR(52),
    dian_chi_chan_quan_gui_shu VARCHAR(8),
    sheng_ming_zhou_qi_zhuang_tai VARCHAR(8) not null,
    dian_chi_zu_lei_xing VARCHAR(6),
    dian_chi_zu_shu INT,
    dian_chi_zong_rong_liang INT,
    dian_chi_chang_jia VARCHAR(12),
    dian_chi_xing_hao VARCHAR(32),
    tou_ru_shi_yong_shi_jian VARCHAR(20),
    guan_lian_dong_tai_zi_chan_tiao_ma VARCHAR(170),
    yi_dong_gong_cheng_zhong_xin_fu_ze_ren VARCHAR(8),
    shi_gong_she_ji_fu_ze_ren VARCHAR(32),
    shi_gong_jian_li_fu_ze_ren VARCHAR(32),
    shi_gong_fang_fu_ze_ren VARCHAR(32),
    dian_chi_chan_quan_fang_fu_ze_ren VARCHAR(10),
    dai_wei_fu_ze_ren VARCHAR(8),
    yi_xian_dai_wei_ren_yuan VARCHAR(16),
    dian_chi_zhao_pian VARCHAR(418),
    bei_zhu VARCHAR(256));

create table jt_wulizhandian(
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
zhan_dian_wei_yi_bian_ma VARCHAR(32),
    wu_li_zhan_dian_ming_cheng VARCHAR(78) not null UNIQUE,
    chai_fen_guan_xi VARCHAR(6),
    suo_shu_gui_hua_zhan_ming_cheng VARCHAR(66),
    zhu_cong_guan_xi VARCHAR(10),
    suo_shu_zhu_zhan_ming_cheng VARCHAR(40),
    sheng_ming_zhou_qi_zhuang_tai VARCHAR(8),
    ru_wang_shi_jian VARCHAR(20),
    wei_hu_lei_xing VARCHAR(4),
    zhan_dian_lei_xing VARCHAR(8),
    shi_fou_min_gan_zhan VARCHAR(2),
    shi_fou_zheng_fu_bu_men_zhan VARCHAR(2),
    shi_fou_chao_da_zhan VARCHAR(2),
    fang_xun_deng_ji VARCHAR(10),
    GPS_jing_du FLOAT,
    GPS_wei_du FLOAT,
    suo_shu_qu_xian VARCHAR(6),
    suo_shu_qu_yu VARCHAR(6),
    zhan_dian_di_zhi VARCHAR(132),
    wu_xian_dai_wei_wei_hu_qu_yu VARCHAR(6),
    di_li_huan_jing VARCHAR(6),
    di_yu_lei_xing VARCHAR(4),
    shi_fou_you_jian_zhu_zhan_dian VARCHAR(2),
    suo_shu_lou_yu VARCHAR(92),
    lou_yu_ceng_shu VARCHAR(16),
    sheng_nei_zhan_dian_ming_cheng VARCHAR(156),
    sheng_nei_zhan_dian_dai_ma VARCHAR(28),
    san_fei_qu_fei_zhan_dian_lei_xing VARCHAR(18),
    she_ji_fang_an_wen_jian VARCHAR(322),
    jun_gong_tu_zhi VARCHAR(334),
    zhou_bian_huan_jing_tu_pian VARCHAR(502),
    hang_pai_di_tu VARCHAR(446),
    dui_ying_tie_ta_zhan_zhi_ming_cheng VARCHAR(44),
    ye_wu_que_ren_dan_hao VARCHAR(248),
    dui_ying_tie_ta_zhan_dian_bian_ma VARCHAR(86),
    wei_hu_ji_bie VARCHAR(6),
    shi_fou_gong_xiang_zhan_dian VARCHAR(2),
    yi_dong_wu_xian_shi_fu_ze_ren VARCHAR(4),
    yi_dong_pian_qu_fu_ze_ren VARCHAR(6),
    dai_wei_gong_si VARCHAR(4),
    dai_wei_fu_ze_ren VARCHAR(6),
    yi_xian_dai_wei_ren_yuan VARCHAR(6),
    tie_ta_gong_si_pian_qu_fu_ze_ren VARCHAR(32),
    tie_ta_dai_wei_fu_ze_ren VARCHAR(32),
    yi_xian_tie_ta_dai_wei_ren_yuan VARCHAR(32),
    xia_dai_luo_ji_zhan_dian_shu_liang INT,
    xia_dai_BBU_shu_liang INT,
    xia_dai_RRU_shu_liang INT,
    bei_zhu VARCHAR(256));

create table jt_luojizhandian(
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
luo_ji_zhan_dian_ming_cheng VARCHAR(110) not null UNIQUE,
    tian_kui_suo_zai_wu_li_zhan_dian_ming_cheng VARCHAR(76),
    shi_yong_BBU_ming_cheng VARCHAR(106),
    luo_ji_zhan_dian_lei_xing VARCHAR(6),
    shi_yong_pin_duan VARCHAR(8),
    sheng_ming_zhou_qi_zhuang_tai VARCHAR(8),
    luo_ji_zhan_dian_biao_shi_ma VARCHAR(30),
    suo_shu_shang_ceng_she_bei VARCHAR(26),
    suo_shu_OMC VARCHAR(58),
    suo_shu_SGW VARCHAR(32),
    suo_shu_SAE_GW VARCHAR(22),
    suo_shu_MMEPOOL VARCHAR(22),
    suo_shu_SGWPOOL VARCHAR(18),
    wang_guan_jie_kou_IP_di_zhi_lie_biao VARCHAR(32),
    chuan_shu_bao_zheng_dai_kuan_CIR VARCHAR(32),
    chuan_shu_feng_zhi_dai_kuan_PIR VARCHAR(32),
    EOMS_xi_tong_shang_ji_zhan_kai_tong_liu_cheng_gong_dan_hao VARCHAR(32),
    she_ji_fang_an_wen_jian VARCHAR(86),
    jun_gong_tu_zhi VARCHAR(112),
    yi_dong_gong_cheng_zhong_xin_fu_ze_ren VARCHAR(6),
    yan_shou_ren_xing_ming VARCHAR(32),
    jian_she_gong_qi VARCHAR(68),
    ru_wang_shi_jian VARCHAR(20),
    chu_yan_ji_yao_wen_hao VARCHAR(78),
    jiao_wei_ri_qi VARCHAR(20),
    ji_zhan_deng_ji VARCHAR(32),
    VIP_ji_bie VARCHAR(4),
    xin_yuan_suo_zai_wu_li_zhan_dian VARCHAR(32),
    chuan_shu_jie_ru_she_bei_suo_zai_wu_li_zhan_dian VARCHAR(32),
    wang_guan_cai_ji_bbu_jing_du FLOAT,
    wang_guan_cai_ji_bbu_wei_du FLOAT,
    luo_ji_xiao_qu_shu INT,
    yi_dong_wu_xian_shi_fu_ze_ren VARCHAR(4),
    yi_dong_pian_qu_fu_ze_ren VARCHAR(6),
    dai_wei_gong_si VARCHAR(4),
    dai_wei_fu_ze_ren VARCHAR(6),
    yi_xian_dai_wei_ren_yuan VARCHAR(6),
    bei_zhu VARCHAR(256));

finish

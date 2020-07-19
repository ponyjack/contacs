
create table dianchijia(
    id INT NOT NULL AUTO_INCREMENT,
dian_yuan_jia_ming_cheng VARCHAR(82) not null UNIQUE,
    suo_shu_ji_fang VARCHAR(32) not null,
    dui_ying_di_ya_jiao_liu_pei_dian_ming_cheng VARCHAR(32) not null,
    dian_yuan_jia_chan_quan_gui_shu VARCHAR(32) not null,
    sheng_ming_zhou_qi_zhuang_tai VARCHAR(32) not null,
    dian_yuan_jia_lei_xing VARCHAR(32),
    dian_yuan_jia_chang_jia VARCHAR(32),
    dian_yuan_jia_xing_hao VARCHAR(32),
    zheng_liu_mo_kuai_xing_hao VARCHAR(32),
    zheng_liu_mo_kuai_gong_lv VARCHAR(32),
    zheng_liu_mo_kuai_shu_liang VARCHAR(32),
    kong_zhi_mo_kuai_xing_hao VARCHAR(32),
    yi_ci_xia_dian_duan_zi_shu VARCHAR(32),
    er_ci_xia_dian_duan_zi_shu VARCHAR(32),
    shi_ji_dian_ya VARCHAR(32),
    shi_ji_dian_liu VARCHAR(32),
    shi_fou_gong_xiang VARCHAR(32) not null,
    gong_xiang_fang VARCHAR(10),
    guan_lian_dong_tai_zi_chan_tiao_ma VARCHAR(222),
    yi_dong_gong_cheng_zhong_xin_fu_ze_ren VARCHAR(8) not null,
    shi_gong_she_ji_fu_ze_ren VARCHAR(32),
    shi_gong_jian_li_fu_ze_ren VARCHAR(32),
    shi_gong_fang_fu_ze_ren VARCHAR(32),
    dian_yuan_jia_chan_quan_fang_fu_ze_ren VARCHAR(32),
    dai_wei_fu_ze_ren VARCHAR(32),
    yi_xian_dai_wei_ren_yuan VARCHAR(32),
    dian_yuan_jia_zhao_pian VARCHAR(32),
    bei_zhu VARCHAR(32)}


create table kongtiao(
    id INT NOT NULL AUTO_INCREMENT,
kong_diao_ming_cheng VARCHAR(82) not null UNIQUE,
    suo_shu_ji_fang VARCHAR(32) not null,
    suo_shu_wu_li_zhan_dian_ming_cheng VARCHAR(32),
    kong_diao_chan_quan_gui_shu VARCHAR(32) not null,
    sheng_ming_zhou_qi_zhuang_tai VARCHAR(32) not null,
    kong_diao_pin_pai VARCHAR(32),
    kong_diao_xing_hao VARCHAR(32),
    kong_diao_lei_xing VARCHAR(32),
    kong_diao_fang_zhi_fang_shi VARCHAR(32),
    jie_dian_fang_shi VARCHAR(32),
    kong_diao_gong_lv VARCHAR(32),
    tou_ru_shi_yong_shi_jian VARCHAR(32) not null,
    wai_ji_shi_fou_an_zhuang_fang_dao_wang VARCHAR(32),
    guan_lian_dong_tai_zi_chan_tiao_ma VARCHAR(142),
    yi_dong_gong_cheng_zhong_xin_fu_ze_ren VARCHAR(32),
    shi_gong_she_ji_fu_ze_ren VARCHAR(32),
    shi_gong_jian_li_fu_ze_ren VARCHAR(32),
    shi_gong_fang_fu_ze_ren VARCHAR(10),
    kong_diao_chan_quan_fang_fu_ze_ren VARCHAR(32),
    dai_wei_fu_ze_ren VARCHAR(32),
    yi_xian_dai_wei_ren_yuan VARCHAR(32),
    kong_diao_zhao_pian VARCHAR(32),
    bei_zhu VARCHAR(32)}
机房_2020-07-18.xlsx
create table ss(
    id INT NOT NULL AUTO_INCREMENT,
ji_fang_ming_cheng VARCHAR(86) not null UNIQUE,
    suo_shu_wu_li_zhan_dian_ming_cheng VARCHAR(32) not null,
    suo_shu_wu_ye_he_tong_bian_hao VARCHAR(32) not null,
    sheng_ming_zhou_qi_zhuang_tai VARCHAR(32) not null,
    ru_wang_ri_qi VARCHAR(32),
    ji_fang_lei_xing_I VARCHAR(32) not null,
    ji_fang_lei_xing_II VARCHAR(32),
    ji_fang_lei_xing_III VARCHAR(32),
    suo_zai_lou_ceng VARCHAR(32) not null,
    lou_ceng_nei_wei_zhi VARCHAR(102),
    ji_fang_mian_ji VARCHAR(32) not null,
    ji_fang_ceng_gao_（m） VARCHAR(32),
    ji_fang_cheng_zhong_neng_li_（kN/m2） VARCHAR(32),
    ji_fang_chan_quan_gui_shu_（D） VARCHAR(32) not null,
    shi_fou_gong_xiang VARCHAR(32) not null,
    gong_xiang_fang VARCHAR(16),
    suo_shu_tie_ta_gong_si_ji_fang_ming_cheng VARCHAR(50),
    suo_shu_tie_ta_gong_si_ji_fang_bian_ma VARCHAR(40),
    guan_lian_zhuan_ye VARCHAR(32),
    ye_wu_ji_bie VARCHAR(32),
    sheng_nei_ji_fang_lei_xing VARCHAR(32),
    zong_zi_ji_fang_ming_cheng VARCHAR(88),
    ji_fang_dai_ma VARCHAR(36),
    guan_lian_dong_tai_zi_chan_tiao_ma VARCHAR(110),
    yi_dong_gong_cheng_zhong_xin_fu_ze_ren VARCHAR(32),
    shi_gong_she_ji_fu_ze_ren VARCHAR(32),
    shi_gong_jian_li_fu_ze_ren VARCHAR(32),
    shi_gong_fang_fu_ze_ren VARCHAR(32),
    she_ji_fang_an_wen_jian VARCHAR(32),
    jun_gong_tu_zhi VARCHAR(32),
    ji_fang_chan_quan_fang_fu_ze_ren VARCHAR(32),
    dai_wei_fu_ze_ren VARCHAR(32),
    yi_xian_dai_wei_ren_yuan VARCHAR(32),
    ji_fang_zhao_pian VARCHAR(32),
    bei_zhu VARCHAR(32)}
电池_2020-07-18.xlsx
create table ss(
    id INT NOT NULL AUTO_INCREMENT,
dian_chi_zu_ming_cheng VARCHAR(74) not null UNIQUE,
    suo_shu_ji_fang VARCHAR(32) not null,
    jie_ru_dian_yuan_jia_ming_cheng VARCHAR(32) not null,
    suo_shu_wu_li_zhan_dian_ming_cheng VARCHAR(32),
    dian_chi_chan_quan_gui_shu VARCHAR(32) not null,
    sheng_ming_zhou_qi_zhuang_tai VARCHAR(32) not null,
    dian_chi_zu_lei_xing VARCHAR(32),
    dian_chi_zu_shu VARCHAR(32),
    dian_chi_zong_rong_liang VARCHAR(32),
    dian_chi_chang_jia VARCHAR(32),
    dian_chi_xing_hao VARCHAR(32),
    tou_ru_shi_yong_shi_jian VARCHAR(32) not null,
    guan_lian_dong_tai_zi_chan_tiao_ma VARCHAR(170),
    yi_dong_gong_cheng_zhong_xin_fu_ze_ren VARCHAR(8),
    shi_gong_she_ji_fu_ze_ren VARCHAR(32),
    shi_gong_jian_li_fu_ze_ren VARCHAR(32),
    shi_gong_fang_fu_ze_ren VARCHAR(32),
    dian_chi_chan_quan_fang_fu_ze_ren VARCHAR(32),
    dai_wei_fu_ze_ren VARCHAR(32),
    yi_xian_dai_wei_ren_yuan VARCHAR(32),
    dian_chi_zhao_pian VARCHAR(32),
    bei_zhu VARCHAR(32)}
物理站点_2020-07-18.xlsx
create table ss(
    id INT NOT NULL AUTO_INCREMENT,
zhan_dian_wei_yi_bian_ma VARCHAR(32),
    wu_li_zhan_dian_ming_cheng VARCHAR(78) not null UNIQUE,
    chai_fen_guan_xi VARCHAR(32) not null,
    suo_shu_gui_hua_zhan_ming_cheng VARCHAR(32),
    zhu_cong_guan_xi VARCHAR(32) not null,
    suo_shu_zhu_zhan_ming_cheng VARCHAR(32),
    sheng_ming_zhou_qi_zhuang_tai VARCHAR(32) not null,
    ru_wang_shi_jian VARCHAR(32),
    wei_hu_lei_xing VARCHAR(32) not null,
    zhan_dian_lei_xing VARCHAR(32),
    shi_fou_min_gan_zhan VARCHAR(32),
    shi_fou_zheng_fu_bu_men_zhan VARCHAR(32),
    shi_fou_chao_da_zhan VARCHAR(32),
    fang_xun_deng_ji VARCHAR(32),
    GPS_jing_du VARCHAR(32) not null,
    GPS_wei_du VARCHAR(32) not null,
    suo_shu_qu_xian VARCHAR(32),
    suo_shu_qu_yu_（_xiang_zhen_） VARCHAR(32) not null,
    zhan_dian_di_zhi VARCHAR(32),
    wu_xian_dai_wei_wei_hu_qu_yu VARCHAR(32) not null,
    di_li_huan_jing VARCHAR(32),
    di_yu_lei_xing VARCHAR(32),
    shi_fou_you_jian_zhu_zhan_dian VARCHAR(32),
    suo_shu_lou_yu VARCHAR(32),
    lou_yu_ceng_shu VARCHAR(16),
    sheng_nei_zhan_dian_ming_cheng VARCHAR(156),
    sheng_nei_zhan_dian_dai_ma VARCHAR(28),
    san_fei_qu_fei_zhan_dian_lei_xing VARCHAR(32),
    she_ji_fang_an_wen_jian VARCHAR(32),
    jun_gong_tu_zhi VARCHAR(32),
    zhou_bian_huan_jing_tu_pian VARCHAR(32),
    hang_pai_di_tu VARCHAR(32),
    dui_ying_tie_ta_zhan_zhi_ming_cheng VARCHAR(44),
    ye_wu_que_ren_dan_hao VARCHAR(248),
    dui_ying_tie_ta_zhan_dian_bian_ma VARCHAR(86),
    wei_hu_ji_bie VARCHAR(32),
    shi_fou_gong_xiang_zhan_dian VARCHAR(32),
    yi_dong_wu_xian_shi_fu_ze_ren VARCHAR(32),
    yi_dong_pian_qu_fu_ze_ren VARCHAR(32),
    dai_wei_gong_si VARCHAR(32),
    dai_wei_fu_ze_ren VARCHAR(32),
    yi_xian_dai_wei_ren_yuan VARCHAR(32),
    tie_ta_gong_si_pian_qu_fu_ze_ren VARCHAR(32),
    tie_ta_dai_wei_fu_ze_ren VARCHAR(32),
    yi_xian_tie_ta_dai_wei_ren_yuan VARCHAR(32),
    xia_dai_luo_ji_zhan_dian_shu_liang VARCHAR(32),
    xia_dai_BBU_shu_liang VARCHAR(32),
    xia_dai_RRU_shu_liang VARCHAR(32),
    bei_zhu VARCHAR(32)}
逻辑站点_2020-07-18.xlsx
create table ss(
    id INT NOT NULL AUTO_INCREMENT,
luo_ji_zhan_dian_ming_cheng VARCHAR(110) not null UNIQUE,
    tian_kui_suo_zai_wu_li_zhan_dian_ming_cheng VARCHAR(32) not null,
    shi_yong_BBU_ming_cheng VARCHAR(32) not null,
    luo_ji_zhan_dian_lei_xing VARCHAR(32) not null,
    shi_yong_pin_duan VARCHAR(32),
    sheng_ming_zhou_qi_zhuang_tai VARCHAR(32) not null,
    luo_ji_zhan_dian_biao_shi_ma VARCHAR(30),
    suo_shu_shang_ceng_she_bei VARCHAR(32),
    suo_shu_OMC VARCHAR(32),
    suo_shu_SGW VARCHAR(32),
    suo_shu_SAE-GW VARCHAR(32),
    suo_shu_MMEPOOL VARCHAR(32),
    suo_shu_SGWPOOL VARCHAR(32),
    wang_guan_jie_kou_IP_di_zhi_lie_biao VARCHAR(32),
    chuan_shu_bao_zheng_dai_kuan_CIR VARCHAR(32),
    chuan_shu_feng_zhi_dai_kuan_PIR VARCHAR(32),
    EOMS_xi_tong_shang_ji_zhan_kai_tong_liu_cheng_gong_dan_hao VARCHAR(32),
    she_ji_fang_an_wen_jian VARCHAR(32),
    jun_gong_tu_zhi VARCHAR(32),
    yi_dong_gong_cheng_zhong_xin_fu_ze_ren VARCHAR(6),
    yan_shou_ren_xing_ming VARCHAR(32),
    jian_she_gong_qi VARCHAR(68),
    ru_wang_shi_jian VARCHAR(32),
    chu_yan_ji_yao_wen_hao VARCHAR(78),
    jiao_wei_ri_qi VARCHAR(32),
    ji_zhan_deng_ji VARCHAR(32),
    VIP_ji_bie VARCHAR(32),
    xin_yuan_suo_zai_wu_li_zhan_dian VARCHAR(32),
    chuan_shu_jie_ru_she_bei_suo_zai_wu_li_zhan_dian VARCHAR(32),
    wang_guan_cai_ji_bbu_jing_du VARCHAR(32),
    wang_guan_cai_ji_bbu_wei_du VARCHAR(32),
    luo_ji_xiao_qu_shu VARCHAR(32),
    yi_dong_wu_xian_shi_fu_ze_ren VARCHAR(32),
    yi_dong_pian_qu_fu_ze_ren VARCHAR(32),
    dai_wei_gong_si VARCHAR(32),
    dai_wei_fu_ze_ren VARCHAR(32),
    yi_xian_dai_wei_ren_yuan VARCHAR(32),
    bei_zhu VARCHAR(32)}
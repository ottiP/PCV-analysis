data[data$year_month=="2021-12" & data$age=="0" & data$patient_gender_code=="F"&data$race_code=="U"&data$PCV_combined=="U"&data$flu_vacc
     =="FALSE"&data$zoster_vacc=="FALSE"&data$bmi_30_plus=="FALSE"&data$comorbidities=="FALSE"&data$income_est_mod=="U",]


data_comb[data_comb$year_month=="2021-12" & data_comb$age=="0" & data_comb$patient_gender_code=="F"&data_comb$race_code=="U"&data_comb$PCV_combined=="U"&data_comb$flu_vacc
     =="FALSE"&data_comb$zoster_vacc=="FALSE"&data_comb$bmi_30_plus=="FALSE"&data_comb$comorbidities=="FALSE"&data_comb$income_est_mod=="U",]




supp_table_filled[supp_table_filled$year_month=="2021-12" & supp_table_filled$age=="1" & supp_table_filled$patient_gender_code=="F"& supp_table_filled$race_code=="U"&supp_table_filled$PCV_combined=="U"&
                    supp_table_filled$flu_vacc
     =="FALSE"&supp_table_filled$zoster_vacc=="FALSE"&supp_table_filled$bmi_30_plus=="FALSE"&supp_table_filled$comorbidities=="FALSE"&supp_table_filled$income_est_mod=="U"
     &supp_table_filled$COVID_severity!="non_resp_severe"& supp_table_filled$COVID_severity!="ICU_crit_care",]


core_table[core_table$year_month=="2021-12" & core_table$age=="1" & core_table$patient_gender_code=="F"& core_table$race_code=="U"&core_table$PCV_combined=="U"&
             core_table$flu_vacc
                  =="FALSE"&core_table$zoster_vacc=="FALSE"&core_table$bmi_30_plus=="FALSE"&core_table$comorbidities=="FALSE"&core_table$income_est_mod=="U"
                  &core_table$COVID_severity!="non_resp_severe"& core_table$COVID_severity!="ICU_crit_care",]

data[data$year_month=="2021-12" & data$age=="1" & data$patient_gender_code=="F"&data$race_code=="U"&data$PCV_combined=="U"&data$flu_vacc
     =="FALSE"&data$zoster_vacc=="FALSE"&data$bmi_30_plus=="FALSE"&data$comorbidities=="FALSE"&data$income_est_mod=="U",]


supp_table_filled[supp_table_filled$year_month=="2021-12" & supp_table_filled$age=="1" & supp_table_filled$patient_gender_code=="F"& supp_table_filled$race_code=="U"&supp_table_filled$PCV_combined=="U"&
                    supp_table_filled$flu_vacc
     =="FALSE"&supp_table_filled$zoster_vacc=="FALSE"&supp_table_filled$bmi_30_plus=="FALSE"&supp_table_filled$comorbidities=="FALSE"&supp_table_filled$income_est_mod=="U"
     &supp_table_filled$COVID_severity!="non_resp_severe"& supp_table_filled$COVID_severity!="ICU_crit_care",]

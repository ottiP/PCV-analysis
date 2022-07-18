run_model <- function(df,list_cov,list_out)
  {## Convert columns of list_cov to factors
  col_names <- list_cov[2:length(list_cov)]
  df[col_names] <- lapply(df[col_names], factor)
  df$race_code <- relevel(df$race_code,ref="W")
  df$PCV_combined <- relevel(df$PCV_combined,ref="U")
  ## Create df of response and non-responses to be fed to the logistic regression
  df1 <- df[df$COVID_severity %in% list_out,]
  data1 <- df1[df1$COVID_severity == list_out[1],]
  data2 <- df1[df1$COVID_severity ==list_out[2],]
  #list_cov_tot <- paste(c("year_month",list_cov))
  data_comb<-merge(data1,data2,all.x=TRUE,all.y=TRUE)
  ## 
  if(sum(df1$count)==sum(data_comb$count.x)+sum(data_comb$count.y)){print("OK")}
  else print("ERROR")
  ## Run logistic regression model
  data_comb$COVID_severity.x<-NULL
  data_comb$COVID_severity.y<-NULL
  m<-glm(cbind(count.x, count.y) ~ age+patient_gender_code+PCV_combined+. -year_month, data=data_comb, family = binomial("logit"))
  #summary(m1)
  m.ci<-confint(m)
  m.table <- cbind(coef(m),m.ci)
  colnames(m.table) <- c("estimate","lower","upper")
  m.table <- exp(m.table)
  m.vif <- vif(m)
  result <- list("m.table"=m.table,"vif"=m.vif)
  return(result)
}
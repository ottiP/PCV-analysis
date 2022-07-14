library(tidyverse)
set.seed(5)
df<-tibble(Gender = as.factor(sample(c("m","f"), 200, replace = TRUE, prob=c(0.6,0.4))),
           Age_Group = as.factor(sample(c("[<30]","[30-65]", "[65+]"), 200, replace = TRUE, prob=c(0.3,0.6,0.1))),
           Response = rbinom(200, 1, prob = 0.2))
df
model1<-glm(Response ~ Gender+Age_Group, data = df, family = binomial("logit"))
summary(model1)

df_agg<-df%>%group_by(Gender, Age_Group)%>%summarise(Impressions=n(), Responses=sum(Response))%>%
  ungroup()%>%mutate(RR=Responses/Impressions)
df_agg

df_agg$No_Responses <- df_agg$Impressions- df_agg$Responses
df_agg

m3<-glm(cbind(Responses, No_Responses) ~ Gender+Age_Group, data=df_agg, family = binomial("logit"))
summary(m3)
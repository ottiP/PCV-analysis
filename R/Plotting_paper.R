######Plotting
library(dplyr)
library(ggplot2)
library(duckdb)
library(arrow)
library(lubridate)
library(reshape2)
library(vtable)
library(tidyr)
#library(plyr)
library(data.table)
library(forestplot)
library(metafor)
library(patchwork)
library(ggplotify)

#### Load data
mod1<-readRDS("./Results/m.table.mod1")
mod2<-readRDS("./Results/m.table.mod2")
mod3<-readRDS("./Results/m.table.mod3")
mod4<-readRDS("./Results/m.table.mod4")
colnames(mod1)<-c("mean","lower","upper")
colnames(mod2)<-c("mean","lower","upper")
colnames(mod3)<-c("mean","lower","upper")
colnames(mod4)<-c("mean","lower","upper")


mod1<-as.data.frame(mod1[c(1,2,3,6,7),])
mod1$model<-c("PPSV23 >5yrs","PPSV23 <=5yrs","PCV13 only","PCV13 and PPSV23 <=5yrs","PCV13 and PPSV23 >5yrs")
mod1$OR<-c("1.01 (0.95,1.06)","1.05 (1.01,1.08)","0.91 (0.88,0.93)","0.95 (0.91,0.99)","0.91 (0.85,0.97)")
mod2<-as.data.frame(mod2[c(1,2,3,6,7),])
mod2$model<-c("PPSV23 >5yrs","PPSV23 <=5yrs","PCV13 only","PCV13 and PPSV23 <=5yrs","PCV13 and PPSV23 >5yrs")
mod2$OR<-c("0.99 (0.90,1.10)","1.12 (1.05,1.20)","1.08 (1.02,1.14)","1.21 (1.13,1.29)","1.07 (0.96,1.19)")#round(mod2$mean,2)
mod3<-as.data.frame(mod3[c(1,2,3,6,7),])
mod3$model<-c("PPSV23 >5yrs","PPSV23 <=5yrs","PCV13 only","PCV13 and PPSV23 <=5yrs","PCV13 and PPSV23 >5yrs")
mod3$OR<-c("0.96 (0.88,1.06)","1.03 (0.97,1.10)","0.92 (0.88,0.97)","0.96 (0.88,1.03)","0.89 (0.79,0.99)")#round(mod3$mean,2)
mod4<-as.data.frame(mod4[c(1,2,3,6,7),])
mod4$model<-c("PPSV23 >5yrs","PPSV23 <=5yrs","PCV13 only","PCV13 and PPSV23 <=5yrs","PCV13 and PPSV23 >5yrs")
mod4$OR<-c("0.97 (0.89,1.06)","1.07 (1.01,1.14)","0.85 (0.81,0.90)","0.92 (0.85,0.98)","0.83 (0.73,0.92)")#round(mod4$mean,2)


#par(mfrow = c(2, 2)) # 1-by-2 grid of plots
g1<-mod1 %>% forestplot(labeltext=c(model,OR),
                    zero=1,
                    title="A) Severe respiratory or ICU vs non-severe outcomes",
                    boxsize = 0.1,
                    xlab="OR",
                    xticks=c(0.8,1.0,1.2,1.6)) %>% 
         fp_set_style(box = "royalblue",
               line = "darkblue",
               summary = "royalblue") %>%
         fp_add_header(OR="OR (95%CI)")
g2<-mod2 %>% forestplot(labeltext=c(model,OR),
                    zero=1,
                    title="B) Severe respiratory or ICU vs severe non-resp outcomes",
                    boxsize = 0.1,
                    xlab="OR",
                    xticks=c(0.8,1.0,1.2,1.6)) %>% 
  fp_set_style(box = "royalblue",
               line = "darkblue",
               summary = "royalblue") %>%
  fp_add_header(OR="OR (95%CI)")
g3<-mod3 %>% forestplot(labeltext=c(model,OR),
                    zero=1,
                    title="C) ICU vs severe respiratory outcomes",
                    boxsize = 0.1,
                    xlab="OR",
                    xticks=c(0.8,1.0,1.2,1.6)) %>% 
  fp_set_style(box = "royalblue",
               line = "darkblue",
               summary = "royalblue") %>%
  fp_add_header(OR="OR (95%CI)")
g4<-mod4 %>% forestplot(labeltext=c(model,OR),
                    zero=1,
                    title="D) ICU vs non-severe outcomes",
                    boxsize = 0.1,
                    xlab="OR",
                    xticks=c(0.8,1.0,1.2,1.6)) %>% 
  fp_set_style(box = "royalblue",
               line = "darkblue",
               summary = "royalblue") %>%
  fp_add_header(OR="OR (95%CI)")




g1<-grid2grob(print(g1))
g2<-grid2grob(print(g2))
g3<-grid2grob(print(g3))
g4<-grid2grob(print(g4))

wrap_elements(g1)*wrap_elements(g2)/(wrap_elements(g3)*wrap_elements(g4))



ggsave(gsave,"./Figures/Figure1.png")

forest(x=mod1$mean, 
       ci.lb = mod1$lower,
       ci.ub = mod1$upper,
       cex = 1.5,
       annotate=FALSE, 
       at=seq(0.8,1,1.2),
       xlim=c(0.8,1.2),
       xlab="OR"
       #slab=rownames(dat),
       #psize=psize*.7,
       #atransf=exp
)


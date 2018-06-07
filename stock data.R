#Q2

##package install
install.packages("ggplot2")
install.packages("CCA")
install.packages("dplyr")
install.packages("TTR")
#install.packages("forcast")
library(ggplot2)
library(dplyr)
library(CCA)
library(TTR)
#library(forecast)

##setting path 
setwd("C:/Users/HS/Documents/GitHub/Analysing-stock-market")    #너가 저장하는 폴더 위치 / 사용해야함  / 사용하면 안됨 
data<-read.csv("Q2_GLOBAL_INDEX_DATA.csv")  #미리 엑셀파일 csv 로 저장해놓고 불러와

#EDA
head(data)
tail(data)
names(data)
#View(data)
summary(data)
#군데군데 결측치 있는데 어떻게 처리할 것인지? 
#중간에 matrix type 으로 바꾸면서 결측치가 1로 저장됐음

class(data$DATE)   #factor 형식은 연산이 안됨, 연산이 되는 numeric 으로 변환
#class(data$KOSPI)  
#class(data$KOSPI_200)
#class(data$KOSDAQ)
#class(data$SP_500)

#DATE 변수를 DATE형식으로 변환 
data$DATE<-as.Date(data$DATE)

#factor 변수를 numeric으로 변환
data$KOSPI <- as.numeric(data$KOSPI)
data$KOSPI_200 <- as.numeric(data$KOSPI_200)
data$SP_500 <- as.numeric(data$SP_500)
data$RUSSELL_3000 <- as.numeric(data$RUSSELL_3000)
data$NIKKEI_225 <- as.numeric(data$NIKKEI_225)
data$HANGSENG <- as.numeric(data$HANGSENG)
data$SHANGHAI_A <- as.numeric(data$SHANGHAI_A)
data$FTSE_100<- as.numeric(data$FTSE_100)
data$DAX <- as.numeric(data$DAX)

summary(data)


#TS 객체 생성
class(data)
D <-as.matrix(data[,-1])   #data.frame을 matrix로
class(D)
head(D)
summary(D)

#Generating time series
z <- ts(D, start = c(2001, 1), frequency = 365.25)  
class(z)
#head(z) # as "matrix"
#head(data)
#tail(z)
#tail(data)
#summary(z)
#summary(data[-1])
#decompose(z)

#Picture of time series
plot(z)
plot(z, plot.type = "single", lty = 1:3)
#par(mfrow=c(1,1))
#par(mfrow=c(2,4))
plot(z[,1], ylab="KOSPI")
plot(z[,2], ylab="KOSPI_200")
plot(z[,3], ylab="KOSDAQ")
plot(z[,4], ylab="SP_500")
plot(z[,5], ylab="RUSSELL_3000")
plot(z[,6], ylab="NIKKEI_225")

####분석
#시계열모형 구축을 위한 시계열자료의 부분선택
p1<-window(z, c(2001,1), c(2002,2))
p2<-window(z, c(2002,1), c(2003,2))

plot(p1)
plot(p2)

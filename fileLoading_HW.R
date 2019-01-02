###----------------------------------------------------------------
### DATA LOADING TO R PAPERWORK
###----------------------------------------------------------------

  
  
# 1. CSV 데이타 1개 
## 대상 엑셀파일이 존재하는 사이트 확인
browseURL("https://archive.ics.uci.edu/ml/datasets/Wholesale+customers")

## 대상 엑셀파일이 존재하는 url 지정
url_cvs <- "https://archive.ics.uci.edu/ml/machine-learning-databases/00292/Wholesale%20customers%20data.csv"

download.file(url_cvs, 
              destfile = "wholeSale.cvs", 
              method = "wininet",
              mode = "wb")

## 현재 작업경로 확인
getwd()

## 현재 작업경로에 있는 파일 목록 확인
dir()
list.files()

## 현재 작업경로에 있는 폴더 목록 확인
list.dirs()

## 엑셀파일 목록만 조회
list.files(pattern = ".cvs") 

wholeSale <- read.csv("wholeSale.cvs")

# ------------------------------------
## 내부구조파악
str(wholeSale)
class(wholeSale); mode(wholeSale)
# - readr::read_excel() 함수로 로딩시 최신 데이터셋 포맷인
#   tibble(tbl_df, tbl) 형식과 기존 포맷인 data.frame형태로 로딩됨

library(dplyr)
glimpse(wholeSale)

# ------------------------------------
## 전체내용 조회
wholeSale
# - myRetail에 들어 있는 데이터포맷이 tibble형식이라 
#   콘솔창 범위만큼 변수가 출력되고, 레코드도 10개로 출력됨

## 간단내용 조회
head(wholeSale)
tail(wholeSale)

#install.packages("psych")
library(psych)
headTail(wholeSale)

## 기술통계 요약
summary(wholeSale)
library(skimr)
skim(wholeSale)

# 2. EXCEL 1개 
## 대상 엑셀파일이 존재하는 사이트 확인
browseURL("https://archive.ics.uci.edu/ml/datasets/default+of+credit+card+clients")
#https://archive.ics.uci.edu/ml/datasets/BLOGGER

## 대상 엑셀파일이 존재하는 url 지정
url <- "https://archive.ics.uci.edu/ml/machine-learning-databases/00350/default%20of%20credit%20card%20clients.xls"


# This research aimed at the case of customers default payments in Taiwan and compares the predictive accuracy of probability of default among six data mining methods.
# From the perspective of risk management, the result of predictive accuracy of the estimated probability of default will be more valuable than the binary result of classification - credible or not credible clients.
# Because the real probability of default is unknown, this study presented the novel Sorting Smoothing Method to estimate the real probability of default. 
# With the real probability of default as the response variable (Y), and the predictive probability of default as the independent variable (X), the simple linear regression result (Y = A + BX) shows that the forecasting model produced by artificial neural network has the highest coefficient of determination; its regression intercept (A) is close to zero, and regression coefficient (B) to one. Therefore, among the six data mining techniques, artificial neural network is the only one that can accurately estimate the real probability of default.

## util::download.file() 함수이용 엑셀파일 하드디스크로 다운로드 받기
download.file(url, 
              destfile = "test.xls", 
              method = "wininet",
              mode = "wb")


## 현재 작업경로 확인
getwd()

## 현재 작업경로에 있는 파일 목록 확인
dir()
list.files()

## 현재 작업경로에 있는 폴더 목록 확인
list.dirs()

## 엑셀파일 목록만 조회
list.files(pattern = ".xls") 

#install.packages("readxl")
file.info("test.xls")

library(readxl)
excel_sheets("test.xls")


myRetail <- read_excel(path = "test.xls", sheet = 1, ## sheet 순번을 정해서 추출
                       col_names = TRUE, 
                       trim_ws = TRUE, 
                     range = c("A2:Y30002") ,
                       na = c("", "?"))

# ------------------------------------
## 내부구조파악
str(myRetail)
class(myRetail); mode(myRetail)
# - readr::read_excel() 함수로 로딩시 최신 데이터셋 포맷인
#   tibble(tbl_df, tbl) 형식과 기존 포맷인 data.frame형태로 로딩됨

library(dplyr)
glimpse(myRetail)

# ------------------------------------
## 전체내용 조회
myRetail
# - myRetail에 들어 있는 데이터포맷이 tibble형식이라 
#   콘솔창 범위만큼 변수가 출력되고, 레코드도 10개로 출력됨

## 간단내용 조회
head(myRetail)
tail(myRetail)

#install.packages("psych")
library(psych)
headTail(myRetail)

## 기술통계 요약
summary(myRetail)
library(skimr)
skim(myRetail)

# 3. ZIP 파일 1개 
# https://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
# -- 헤더가 없으면 헤더 임의로 넣고 추출 
# -- 컬럼명 RENAME 
# 
# -- 선정하여 다운로드하여 DS 저장
# -- 3개의 DS 합쳐서 .R을 강사님께 전달 




# ===========================================
#   <과제2> UCI머신러닝 사이트 파일다운로드 관련
# 
# (1) 파일특성에 맞는 로딩함수와 옵션사용 구분필요
# read_csv()는 delim=""옵션이 별도로 없음 --> 콤마(,)기호를 사용한 데이터셋 전용
# read_csv2()도 delim=""옵션이 별도로 없음 --> 세미콜론(;)기호를 사용한 데이터셋 전용
# read_delim()는 delim=""옵션이 있음 --> 콤마(,)나 세미콜론(;), 탭(\t)에 따라 적절하게 설정해 사용
# 
# 또한 decimal point(소수점)이 어떠한 기호로 되어 있는지도 주의깊게 보고
# dec = 라는 옵션 사용을 고려해야함
# 
# (2) 엑셀파일 다운로드시 파일 확장자 주의필요
# 예전 엑셀버전의 확장자 .xls과 최근 엑셀버전 확장자인 .xlsx파일을 임의대로 변경해서는 안됨
# 
# (3) 다운받은 3종류 파일을 하나로 묶어서 R전용 바이너리(binary) 파일로 하드에 저장하는 코드필요
# 
# (4) UCI사이트 이외에 다양한 다른 온라인 사이트도 가능함
# - 공공데이터포털(https://www.data.go.kr/)
# - 서울열린데이터광장(https://data.seoul.go.kr/)
# - 경기도데이터포털
# - K-ICT 빅데이터센터 데이터큐브(https://kbig.kr/portal/kbig/datacube/dataset/dataset.page)
#   => Study Resource
# - 데이터진흥원 데이터스토어(https://www.datastore.or.kr/)
#   => telecom, carddata 
# - SKT 빅데이터허브(https://www.bigdatahub.co.kr/index.do)
#   => base on telecom
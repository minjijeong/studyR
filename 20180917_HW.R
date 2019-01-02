############################## 실습과제 ##################################
## 1. 대상데이터셋
# ggplot2::diamonds, ggplot2::mpg, AemsHousing::ames_raw 중에서 선정가능
#
## 2. 파생변수만들기
# 선정된 데이터셋에서 범주형 1개, 연속형 1개씩 변수컬럼 선정후
# 적정한 기준으로 리코딩하기
#
## 3. 요약집계
# 새롭게 만든 파생변수 2개를 기준으로 적정한 연속변수와의
# 요약집계결과표 만들기
# (단, 기술통계함수는 평균, 표준편차가 출력되도록)
# (단, 평균을 기준으로 내림차순 정렬이 되도록)
# (단, aggregate()함수를 사용한 결과표 1개, 
#      dplyr::summarize & group_by를 사용한 결과표 1개 만들기)
##########################################################################
#-----------------------------------------------------------------------
## 1. 아이디어 구성
#  - 집의 나이와 리모델링의 관계 확인 
#-----------------------------------------------------------------------
## 데이터셋 조회
library(AmesHousing)
# https://ww2.amstat.org/publications/jse/v19n3/Decock/DataDocumentation.txt
# http://ww2.amstat.org/publications/jse/v19n3/decock.pdf
(ames_raw)
print(ames_raw)
#View(ames_raw)

library(psych)
psych::headTail(ames_raw)

library(tibble)
glimpse(ames_raw)

#-----------------------------------------------------------------------
## 2. 파생변수 구성
#-----------------------------------------------------------------------
#  - Year of House - Current Year - 'Year Built' : 완공시점
#  - term of remodeling : 'Year Remode/Add' - 'Year Built' : 리모델링 시점 
#    (단, 리모델링하지 않은경우 Year Built 값 대체)
#-----------------------------------------------------------------------
data(ames_raw)
ames_raw$`Year Built`

## 2.1 Year of House 연산
Sys.Date()
now <- format(Sys.Date(), format="%Y")
now <- as.integer(now)
str(now)

ames_raw$YearOfHouse <-  now - ames_raw$'Year Built'
ames_raw$YearOfRemode <- NULL
str(ames_raw$'Year Remod/Add')
ames_raw$YearOfRemod <- ames_raw$'Year Remod/Add' - ames_raw$'Year Built'

ames_raw[grep('Year', colnames(ames_raw))]

remod <- select(ames_raw, PID, 'Year Remod/Add', 'Year Built')
#colnames(ames_raw) %in% c("PID",'Year Remod/Add',"Year Built")

## dplyr::mutate() 기능함수 이용방식
ames_raw <- mutate(ames_raw, YearOfHouse2 = now - ames_raw$'Year Built')
dd <- select(ames_raw, YearOfHouse, 'Year Built')
ff <- select(ames_raw, YearOfRemod, 'Year Remod/Add')

summary(dd$YearOfHouse)
summary(ff$YearOfHouse)

#-----------------------------------------------------------------------
## 3. 파생변수 구현
#-----------------------------------------------------------------------
# ------------------------------------------------------
## 기본 달러$ 또는 대괄호[] 연산자 사용 변수리코딩
# - Year.con: Year Condition - New/Mint/Classic/Old
dd$Year.condi <- NULL

dd$Year.condi[dd$YearOfHouse <= 10] <- "New" 
dd$Year.condi[dd$YearOfHouse > 10 & 
               dd$YearOfHouse <= 45] <- "Mint" 
dd$Year.condi[dd$YearOfHouse > 45 & 
               dd$YearOfHouse <= 64] <- "Classic" 
dd$Year.condi[dd$YearOfHouse > 64] <- "old" 

ames_raw$Year.condi <- dd$Year.condi

dd # 추가된 파생변수 확인
##table(dd$Year.condi, useNA = "always")
ames_raw[grep('Year', colnames(ames_raw))]


## 데이터셋 기술통계
Hmisc::describe(ames_raw[grep('Year', colnames(ames_raw))])
prettyR::describe(ames_raw[grep('Year', colnames(ames_raw))])
psych::describe(ames_raw[grep('Year', colnames(ames_raw))])
library(skimr)
skim(ames_raw[grep('Year', colnames(ames_raw))])

#-----------------------------------------------------------------------
## 4. 요약집계
#-----------------------------------------------------------------------
#  - 리모델링 시점 평균 (Built와 Remode 년도가 같은경우 제외한다) 
#  - 평균을 기준으로 내림차순 정렬
#  - aggregate()함수를 사용한 결과표 1개, 
#      dplyr::summarize & group_by를 사용한 결과표 1개 만들기
#-----------------------------------------------------------------------
#     요약집계 그룹별 분석결과를 확인할 수 있음
str(sample$YearOfRemod)
result.mean <- sample$YearOfHouse
result <- aggregate(sample[1:4], 
                    list(Age.House = sample$YearOfHouse, Age.Update = sample$YearOfRemod ),
                    mean, na.rm = TRUE)

# - 요약집계 분석결과를 별도 객체와 데이터셋 구조로 관리/조회 가능
## 요약할 자료 별도 추출
sample <- ames_raw[grep('Year', colnames(ames_raw))]

groupdata <- group_by(sample, Year.condi )
summarise(groupdata, avg_remod = mean( YearOfRemod, na.rm=TRUE))


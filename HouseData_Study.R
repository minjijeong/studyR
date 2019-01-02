
################################################################################
## 실습
################################################################################
## AmesHousing 코딩북
# 범주형 컬럼
# Sale Type     WD     New   COD ConLD   CWD ConLI ConLw  Oth  Con  VWD
# Sale Condition  Normal Partial Abnorml Family Alloca AdjLand
# 연속형형 컬럼
# SalePrice       180796.06 160000.0 6.381884e+09 79886.69    2930
# ------------------------------------------------------
# 아이디어 1. 집의 나이와 리모델링의 관계 확인 
# 아이디어 2. 집 나이-리모델링 포함에 따른 단위면적당 가격 
# 아이디어 3. 지역에 따라 리모델링까지 걸린 시간
# 아이디어 4. 지역별 단위면적당 가격 
# 아이디어 5. 집 넓이당 차고 크기 비교 
# 아이디어 6. 세일즈 타입에 따라 년간 판매 된 것 관계성
################################################################################
## 데이터셋 조회
library(AmesHousing)
# https://ww2.amstat.org/publications/jse/v19n3/Decock/DataDocumentation.txt
# http://ww2.amstat.org/publications/jse/v19n3/decock.pdf
(ames_raw)
print(ames_raw)
View(ames_raw)

## 데이터셋 간단조회
head(ames_raw)
tail(ames_raw)

library(psych)
psych::headTail(ames_raw)

# ----------------------------------------
## 데이터셋 구조파악
str(ames_raw)

library(tibble)
glimpse(ames_raw)

# ----------------------------------------
## 데이터셋 기술통계
Hmisc::describe(ames_raw)
prettyR::describe(ames_raw)
psych::describe(ames_raw)
library(skimr)
skim(ames_raw)

###############################################################################
## 데이터셋에 변수간 연산을 통한 새로운 변수컬럼을 추가(mutate)하기
# - 데이터셋에 들어 있는 변수컬럼이나 별도의 데이터를 활용해 
#   새로운 변수컬럼(요약변수, 파생변수)을 만들어 추가함 
# ------------------------------------------------------
## 1캐럿당 가격($)에 대한 별도 변수컬럼 추가 

## 기본 달러$ 또는 대괄호[] 연산자 사용 방식
# - ppc: price per caret
?ames_raw
ames_raw$`Year Built`
Sys.Date()
now <- format(Sys.Date(), format="%Y")
now <- as.integer(now)
str(now)

ames_raw$YearOfHouse <-  now - ames_raw$'Year Built'
#ames_raw$SalePrice <- diamonds$price / diamonds$carat 
ames_raw[grep("Year", colnames(ames_raw))]


remod <- select(ames_raw, PID, 'Year Remode/Add', 'Year Built')

colnames(ames_raw) %in% c("PID","Year Remode/Add","Year Built")
## dplyr::mutate() 기능함수 이용방식
ames_raw <- mutate(ames_raw, YearOfHouse2 = now - ames_raw$'Year Built')
ames_raw

# diamonds %<>% mutate(ppc3 = price/carat)
# diamonds
# - 양방향/할당 파이프연산자 %<>% 이용

###############################################################################
## 연속변수 구간범위지정을 통한 변수리코딩으로 새로운 변수컬럼 추가(mutate) 하기

## 연속변수 변수리코딩을 위한 간단 데이터셋 준비
data("ames_raw")
ames_raw <- mutate(ames_raw, YearOfHouse = now - ames_raw$'Year Built')
dd <- select(ames_raw, YearOfHouse, 'Year Built')

dd
summary(dd$YearOfHouse)
# - dd데이터셋에 있는 carat 변수컬럼을 적당한 구간으로 변수리코딩할 예정
# -  carat의 값이 1.0이하이면 --> low로 리코딩
# -  carat의 값이 1.0보다 크고, 3.0보다 이하이면 --> middle로 리코딩
# -  carat의 값이 3.0보다 크면 --> high로 리코딩

# ------------------------------------------------------
## 기본 달러$ 또는 대괄호[] 연산자 사용 변수리코딩
# - age.con: Age Condition - New/Mint/Classic/Old
dd$age.condi <- NULL

dd$age.condi[dd$YearOfHouse <= 10] <- "New" 
dd$age.condi[dd$YearOfHouse > 10 & 
               dd$YearOfHouse <= 45] <- "Mint" 
dd$age.condi[dd$YearOfHouse > 45 & 
               dd$YearOfHouse <= 64] <- "Classic" 
dd$age.condi[dd$YearOfHouse > 64] <- "old" 

dd # 추가된 파생변수 확인
table(dd$age.condi, useNA = "always")
# - useNA="always" 옵션을 통해서 결측치(NA) 항목도 빈도테이블에 나옴

# ------------------------------------------------------
## base::cut() 함수이용 변수리코딩
dd$age.condi2 <- cut(dd$YearOfHouse,
                     breaks = c(-Inf, 10, 45, 64, Inf),
                     include.lowest = FALSE, right = TRUE, 
                     labels = c("New", "Mint", "Classic","old")) 
dd # 추가된 파생변수 확인
table(dd$age.condi , useNA = "always")
table(dd$age.condi2 , useNA = "always")
# - useNA="always" 옵션을 통해서 결측치(NA) 항목도 빈도테이블에 나옴

# ------------------------------------------------------
## dplyr::mutate() 기능함수 이용 변수리코딩
dd %<>% mutate(cr.grd3 = cut(dd$carat,
                             breaks = c(-Inf, 1, 3, Inf),
                             include.lowest = FALSE, right = TRUE, 
                             labels = c("low", "middle", "high")))

dd # 추가된 파생변수 확인
table(dd$cr.grd, useNA = "ifany")
table(dd$cr.grd2, useNA = "ifany")
table(dd$cr.grd3, useNA = "ifany")
# - useNA="ifany" 옵션을 통해서 결측치(NA) 항목이 존재하면 빈도테이블에 나오며,
#   결측치(NA) 항목이 존재하지 않으면 빈도테이블에 나오지 않음

###############################################################################
## 범주형변수 항목선택을 통한 변수리코딩으로 새로운 변수컬럼 추가(mutate) 하기

## 연속변수 변수리코딩을 위한 간단 데이터셋 준비
data("diamonds")
dd <- select(diamonds, carat, cut)

dd
table(dd$cut)
summary(dd$cut)
# - dd데이터셋에 있는 cut 변수컬럼 범주항목들을 적당히 묶어서 변수리코딩
# -  cut의 값이 Fair, Good, Very Good이면 --> Normal로 리코딩
# -  cut의 값이 Premium     Ideal이면 --> Special로 리코딩

# ------------------------------------------------------
## 기본 달러$ 또는 대괄호[] 연산자 사용 변수리코딩
# - cut.grd: cut grade

dd$cut.grd[dd$cut %in% c("Fair", 
                         "Good", 
                         "Very Good")] <- "Normal"


dd$cut.grd[dd$cut %in% c("Premium", 
                         "Ideal")] <- "Special" 

dd # 추가된 파생변수 확인
table(dd$cut.grd, useNA = "always")
# - useNA="always" 옵션을 통해서 결측치(NA) 항목도 빈도테이블에 나옴

str(dd)
# - 일반 문자열 객체형식(chr)로 변수리코딩했음을 알 수 있음

# ------------------------------------------------------
## base::factor() 함수이용 변수리코딩

dd$cut.grd2 <- factor(dd$cut, 
                      levels = c("Fair", "Good", "Very Good", 
                                 "Premium", "Ideal"),
                      labels = c("Normal", "Normal", "Normal", 
                                 "Special", "Special"))

dd # 추가된 파생변수 확인
table(dd$cut.grd, useNA = "always")
table(dd$cut.grd2, useNA = "always")
# - useNA="always" 옵션을 통해서 결측치(NA) 항목도 빈도테이블에 나옴

str(dd)
# - 서열형 팩터 객체형식(Ord.factor)로 변수리코딩했음을 알 수 있음

# ------------------------------------------------------
## car::recode() 함수이용 변수리코딩
# install.packages("car")
library(car)

dd$cut.grd3 <- car::recode(dd$cut, 
                           "c('Fair', 'Good', 'Very Good')='Normal'; 
                           c('Premium', 'Ideal')='Special'")

dd # 추가된 파생변수 확인
table(dd$cut.grd, useNA = "always")
table(dd$cut.grd3, useNA = "always")
# - useNA="always" 옵션을 통해서 결측치(NA) 항목도 빈도테이블에 나옴

str(dd)
# - 범주형 팩터 객체형식(Factor)로 변수리코딩했음을 알 수 있음

# ------------------------------------------------------
## doBy::recodeVar() 함수이용 변수리코딩
# install.packages("doBy")
library(doBy)

dd$cut.grd4 <- recodeVar(dd$cut, 
                         src=list(c("Fair", "Good", "Very Good"),
                                  c("Premium", "Ideal")), 
                         tgt=list("Normal","Special"))


dd # 추가된 파생변수 확인
table(dd$cut.grd, useNA = "always")
# - useNA="always" 옵션을 통해서 결측치(NA) 항목도 빈도테이블에 나옴

str(dd)
# - 범주형 팩터 객체형식(Factor)로 변수리코딩했음을 알 수 있음

# ------------------------------------------------------
## dplyr::mutate() + dplyr::recode() 기능함수 이용 변수리코딩
dd %<>% mutate(cut.grd5 = 
                 dplyr::recode(dd$cut, 
                               "Fair" = "Normal",
                               "Good" = "Normal",
                               "Very Good" = "Normal",
                               "Premium" = "Special",
                               "Ideal" = "Special"))

dd # 추가된 파생변수 확인
table(dd$cut.grd, useNA = "ifany")
table(dd$cut.grd5, useNA = "ifany")
# - useNA="ifany" 옵션을 통해서 결측치(NA) 항목이 존재하면 빈도테이블에 나오며,
#   결측치(NA) 항목이 존재하지 않으면 빈도테이블에 나오지 않음

str(dd)
# - 서열형 팩터 객체형식(Ord.factor)로 변수리코딩했음을 알 수 있음

# ------------------------------------------------------
## dplyr::mutate() + dplyr::if_else() 기능함수 이용 변수리코딩
dd %<>% mutate(cut.grd6 = 
                 if_else(dd$cut 
                         %in% c("Fair", "Good", "Very Good"),
                         
                         "Normal", "Special"))

dd # 추가된 파생변수 확인
table(dd$cut.grd, useNA = "ifany")
table(dd$cut.grd6, useNA = "ifany")
# - useNA="ifany" 옵션을 통해서 결측치(NA) 항목이 존재하면 빈도테이블에 나오며,
#   결측치(NA) 항목이 존재하지 않으면 빈도테이블에 나오지 않음

str(dd)
# - 일반 문자열 객체형식(chr)로 변수리코딩했음을 알 수 있음

### End of Source #############################################################





#------------------------------------------------------------------------------------------------------------------------------------
# 2018.09.04 ~ 2018.09.06
#------------------------------------------------------------------------------------------------------------------------------------
###################################
##### init Setting
###################################
getwd()
setwd("C:\\workspaceR")
Sys.setenv(JAVA_HOME="C:\\Program Files\\Java\\jre1.8.0_131")

##install.packages("coefplot")
##library(devtools)

###################################
##### Studying
###################################
assign("j",4)
##변수 선언내역 확인 
objects()
ls()

## 변수 할당 해제 
rm(x)
rm(y)
remove(zy)
## 다중선택 가능 ,로 추가 
rm(j,z)


##메모리 객체 확인
ls()

##메모리 전체 할당 해제 
rm(list=ls())

# ----------------------------------------
#4.3 데이타유형
# ----------------------------------------
#4.3.1 Numberic Data
# ----------------------------------------

#실수 Numeric - double
x<- 13
class(x)
is.numeric(x)
is.integer(x)

#정수 Integer - int,long => 실수형이기도
z<- 10L
class(z)
is.numeric(z)
is.integer(z)
# ----------------------------------------
#4.3.2 문자열 데이타  
# ----------------------------------------
y<-"Hello World"
class(y)
is.numeric(y)
id <- "data"

#추가설명 다음시간
sId <- factor("date2")

#문자열사이즈 함수 
nchar(id)
# ----------------------------------------
#4.3.3 날짜
# ----------------------------------------
date0 <- as.Date("2018-11-13") ## 날짜 데이타로 변환하여 저
date1 <- 2018-11-13 #연산으로처리됨 날짜로 인식x
# [1] 1994
# > class(date1)
# [1] "numeric"

date1 <- "2018-11-13" #연산으로처리됨 날짜로 인식x
# [1] "2018-11-13"
# > class(date1);mode(date1)
# [1] "character"
# [1] "character"

date1
class(date1);mode(date1)
date0
class(date0);mode(date0)
# [1] "2018-11-13"
# > class(date0);mode(date0)
# [1] "Date"
# [1] "numeric"

## class 객체(=변수)의 어떤 타입인지 (그릇의형태)
## mode 객체(=변수)의 내용이 무엇인지 - 명시적, 암묵적  
## ; 세미콜론은 줄바꿈 코드 

date0; date1;

## POSIXct : 날짜포맷 Portoble Operating System Interface X

now<-strptime("2018-03-06 17:45:00","%Y-%m-%d %H:%M:%S")

as.Date.POSIXlt(now)

##Iubridate
# ----------------------------------------
#4.3.4 논리형
# ----------------------------------------
logic <- T
logic <- TRUE
## logic <- Ture ## True를 변수로 인식 
## logic <- true ## true를 변수로 인식
logic

##논리연산자
###비교연산자
k<- 2==3
k<- 2!=3
k

is.logical(k)
address <- "부산"
address=="서울"

T <- 7 ## T를 TRUE가 아닌 변수로 처리
## 변수 지정시, 예약어는 피하는 것이 좋다 

## 핟당연산자 <- , = 
## 비교연산자 ==, <=, >=, >, <, !=, ==

##메모리초기화
rm(list=ls())

# ----------------------------------------
#4.4 벡터(Vector)
# ----------------------------------------
x <- 4 ## 스칼라 변수  
## 두개 이상의 데이타가 한 변수로 선언되어 있는 변수

## c함수 사용 - combine(또는 concatenate) 함수 여러개의 데이타를 yearTemp 대입
yearTemp <- c((1),2,13,30,22,21,17)
str(yearTemp)
y <- -1
# ----------------------------------------
#4.4.1 벡터연산 
# ----------------------------------------
thisYearTmp <- yearTemp -5
yearTemp
thisYearTmp
# > yearTemp
# [1] -1  2 13 30 22 21 17
# > thisYearTmp
# [1] -6 -3  8 25 17 16 12
## vector indexing 1~7
## 부분 추출 (=indexing, subsetting)
## 벡터변수의 특정위치의 데이타 접

exp <- yearTemp^2
exp
root <- sqrt(yearTemp)
## 음수 포합시 sqrt 사용불가 
root

#vector
x <- c(27)
#scala
x <- 27 

## 연속된 수 할당 
## 콜론연산자 사용 -> sequence 생성
## startNum : EndNum ## diff: 1단
## 벡터연산은 length가 동일해야지 가능 
## for문 사용은 가급적 사용하지 않는것을 추천한다(반복구문-performance 문제로)
arry0 <- 1:11
arry1 <- -4:2

length(arry0)
### 길이, 즉 데이타의 수에 따라 cost가 결정됨 
NROW(arry0)
### 길이, 즉 데이타의 개수 측정

arry <- arry0 + arry1
arry

## 기타데이타 - +Inf
## Inf : infinity의 약자 무한 +Inf, -Inf
## NA : missing 데이타 결축치 아직 측정되지 않은것(불가 혹은 미측정) Not Available
### 숫자 : NA  문자열 : <NA>
### 데이타 로딩시, 분석 그룹에서 코딩북에 결측치를 어떤식으로 할지 지정/
#### R: NA, SaSS : . 기타 등등
## NaN : Not a Number 숫자가 아님 


# 열/컬럼/ 변수 / 속성 attribute = 피쳐 feature 
### - 항목 종류
# 행/ 로우 / 관찰치 / 레코드 record/ 케이스 or 사 
###- 고객 테이블 - 고객의 프로필

##벡터 각 요소 비교연산
arry0 <=5 
# [1]  TRUE  TRUE  TRUE  TRUE  TRUE FALSE FALSE FALSE FALSE FALSE FALSE
any(arry0 < arry1)

q <- c("Hello","world","swimming","yummy")
str(q)
nchar(q)

any(nchar(q)<5)

##any, all 두개의 벡터 비교시 각각의 동일한 인덱스 끼리 비교
##any - 조건에 만족하는것이 1개라도 있나 
##all - 모든 조건이 만족하는가?

## Vector Indexing 
# > ## Vector Indexing 
#   > q[0]
# character(0)
# > ## Vector Indexing 
#   > q[1]
# [1] "Hello"
# > ## Vector Indexing 
#   > q[2]
# [1] "world"
# > ## Vector Indexing 
#   > q[3]
# [1] "swimming"

### 연속 인덱스 범위지정
# > q[1:2]
# [1] "Hello" "world"
### 비연속성 인덱스 범위지정
# q[c(1,4)]
# [1] "Hello" "yummy"



rm(list=ls())

# ----------------------------------------
# 4.4.2 팩터형 벡
# ----------------------------------------

######################################################################
## (R입문책_p.90) 팩터형 데이터의 알파벳 순서 체크
######################################################################

## 팩터형 데이터의 알파벳 순서 체크

## 4가지 학력에 관한 문자열 벡터 
# - hs: hign school
# - cl: college degree
# - ms: master degree
# - dt: doctoral degree
edulevel <- c("ms", "dt", "hs", "ms", "ms", "cl", 
              "dt", "hs", "hs", "dt", "dt", "ms", 
              "hs", "cl", "ms", "dt", "hs", "ms", 
              "hs", "cl", "cl", "hs", "hs", "cl", 
              "hs", "cl", "cl")
edulevel # 객체내용 조회

## 학위 구분으로 보면, 다항형 데이타로 취급가능 
## 학위의 서열의 의미로 보면 서열형 데이타 (hs < cl < ms < dt)

levels(edulevel) 
# - 객체에 들어 있는 반복되는 항목조회
# - 일반 문자열 벡터이므로 특별한 레벨이 들어 있지않아서 NULL로 나옴 

## NULL - 데이타 존재X 
## NA - 데이타 위치는 존재, 실제 데이타를 불측정 혹은 미측정

str(edulevel)
# - 객체 내부구조를 보면 객체형식이 chr임을 알 수 있음
# chr [1:27] "ms" "dt" "hs" "ms" "ms" "cl" "dt" "hs" "hs" "dt" "dt" "ms" ...

#yearTemp <- c((1),2,13,30,22,21,17)
#str(yearTemp)
# num [1:7] 1 2 13 30 22 21 17

table(edulevel) # 범주형변수 빈도수 계산 
# - 우리가 알고 있는 학력순서로 출력되지 않고 알파벳순서로 출력되어,
#   자연스로운 학력증가/감소에 따른 빈도수 비교가 어려움
# edulevel
# cl dt hs ms 
# 7  5  9  6 
# ----------------------------------------
## 팩터화(범주형데이터화)
## 방향성을 알수없다. order by 처리 안되어 있음.


edulevel2 <- factor(edulevel)
edulevel2
# [1] ms dt hs ms ms cl dt hs hs dt dt ms hs cl ms dt hs ms hs cl cl hs hs cl
# [25] hs cl cl
# Levels: cl dt hs ms
# - 팩터화 이후 레벨표시는 되었지만 여전히 알파벳 순서임
## group by와 동일한 기능 -- 범주형 데이타로 인식

levels(edulevel2[1])

str(edulevel2) 
# - 내부구조를 보면 객체형식이 chr에서 Factor로 변경되었음을 알 수 있음
## - STRUCTURE 약자, CLASS/MODE/LENGTH 정보 제공
## Factor w/ 4 levels "cl","dt","hs",..: 4 2 3 4 4 1 2 3 3 2 ...
##                    4개 레벨로 구분 -  레벨번호로 표현

table(edulevel2)
# edulevel2
# cl dt hs ms ## 요약집계
# 7  5  9  6  ## 기술통계 - 빈도수
# ----------------------------------------
## 팩터화 + 레벨정의

edulevel.f <- factor(edulevel, levels = c("hs", "cl", "ms", "dt")) 
## factor 함수 사용시, level를 인수/인자/파라미터로 지정하여 순서지정
## 명목의 의미로 부여
## level 미지정시, 자동 level 확인하여 level설정
## 명명규칙을 .f로 함으로써 factor형으로 범주데이타 처리한것으로 표기함
edulevel.f
# - 팩터화시 4가지 학력을 우리가 알고있는 학력순으로 배치했음 

levels(edulevel.f)

str(edulevel.f)
table(edulevel.f)
# - 우리는 학력의 순서를 감안하여 레벨을 배치했지만 
#   R은 그냥 단순 명목범주(nominal categorical variable) 개념으로 
#   첫번째가 hs이고, 마지막이 dt라는 정도로 이해함

# ----------------------------------------
## 팩터화 + 레벨정의 + 순서지정

# Levels: hs cl ms dt
# > levels(edulevel.f)
# [1] "hs" "cl" "ms" "dt"
# > str(edulevel.f)
# Factor w/ 4 levels "hs","cl","ms",..: 3 4 1 3 3 2 4 1 1 4 ...
# > table(edulevel.f)
# edulevel.f
# hs cl ms dt 
##-- left to the right 
# 9  7  6  5 


edulevel_f <- factor(edulevel, 
                     levels = c("hs", "cl", "ms", "dt"), 
                     ordered = T)
edulevel_f_as <- as.factor(edulevel) ##파라미터 사용불가 파라미터 사용하려면 factor 함수 사용

table(edulevel_f_as)
## 인자, ordered 옵션추가
edulevel_f
# - 팩터화시 4가지 학력순서간에 서열이 있음을 명시적으로 지정하였음

levels(edulevel.f)

str(edulevel_f)
table(edulevel_f)
# - 비로서 R도 학력레이블이 서열의 의미를 가지고 있고,
#   학력이 커질 수록 빈도수가 감소하는 음의 경향성이 있음을 알 수 있음 

### End of Source ####################################################


## vector는 동일한 object type만 허용한다

## 함수 시작문구 의미
# as.xxxxx 변환처리 
# is.xxxxx 현재상태구분
x<-c('1','2','3')
y<-c(1,2,3)

attr(edulevel_f,x)

# ----------------------------------------
# 4.5 함수 호출하기 
# ----------------------------------------

mean(y)

# ----------------------------------------
# 4.6 함수에 대한 도움말 문서
# ----------------------------------------
? mean
help(mean)

## 함수 조회
apropos("COUNT")


# ----------------------------------------
# 4.7 결측값
# ----------------------------------------
# ----------------------------------------
# 4.7.1 NA - Not Available
# ----------------------------------------
## 미응답(미정)/ 해당없을경우
## 요소의 자리는 존재
a <- c(1,2,3,NA,3,42,32)

## 결측데이타인지 확인
is.na(a)
any(is.na(a))
mean(a)
mean(a, na.rm = TRUE) ## NA REMOVED FOR CALCULATING AVERGAE 
## na를 제거 함으로써, 오류허용가능성커졌다.
## 빅데이타에서 오류를 허용가능성이 스몰데이타에 비해 크다
sum(a, na.rm = TRUE)
min(a, na.rm = TRUE)
max(a, na.rm = TRUE)
var(a, na.rm = TRUE) ## 분산
sd(a, na.rm = TRUE)
## 코딩북이 없을 경우 데이타를 업로드후 분포를 통해 결측값을 정한다.
## 오류를 어떻게 다루느냐가 중요함
## 알고리즘에 결측값은 노이즈를 발생시킨다. 이런한 노이즈는 제거해야한다.
## multiple inputation 결측치를 대체기법, 여러 후보군을 뽑아 대체한다.

## 결측데이타 대체법
## NA를 제외한 정상데이타에서 범주형일때는 최빈치(많은빈도)로 입력
## NA를 제외한 정상데이타에서 연속형일때는 중간값 또는 평균을 입력

which(is.na(a))
## 해당하는 값의 위치 출력

which(a==1)


####################################################
## (R입문책_p.90) 변수의 결측치 대체(imputation)
####################################################

## 1. 연속형 변수의 결측치(NA) 처리

## raw데이터 준비
x <- c(6.5, 4.9, NA, 4.2, 7.3, NA , 11.7, 6.9, 5.2)
x

mean(x) # NA로 인해서 평균도 NA로 출력 
mean(x, na.rm = TRUE) # NA를 제외하고 연산결과 출력

which(is.na(x)) 
# - 어떤 요소위치(자리)에 NA가 있는지 확인

# --------------------------------------------------
## 1.1 단순삭제로 처리 
x2 <- x[!is.na(x)] ## 조건을 가지고 처리 소프트코딩
x2

x3 <- x[1:4] ## 하드코딩 ##작업의 재연성으로 인해 하드코딩을 지양한다
x3
mean(x2)

# --------------------------------------------------
## 1.2 단순대체: 산술평균값(mean)으로 대체

x.avg <- mean(x, na.rm = TRUE)
x.avg
# - NA를 제외한 정상데이터를 활용한 산술평균값

x.na <- which(is.na(x))
x.na
# - 변수x에 포함된 NA가 있는 위치(인덱스)

x[is.na(x)] <- x.avg
x[x.na]<-x.avg
x
# - 변수x의 3번째와 6번째 위치에 있었던 NA값이
#   x.avg 평균값으로 대체됨

x <- round(x, 1) 
x
# - 소수첫째자리까지만 출력
# - 소수둘째자리에서 자동반올림해줌

# --------------------------------------------------
## 1.3 단순대체: 중앙값(median)으로 대체
## 대리변수 - 소득수준을 알수 없어. 차량,주거자산 보유 유무를 통해 대리변수로 대체

rm(list=ls())
## 다시 로데이터 준비
x <- c(6.5, 4.9, NA, 4.2, 7.3, NA , 11.7, 6.9, 5.2)
x

x.med <- median(x, na.rm = TRUE) ## 중앙값
x.med
# - 중앙값 산출

x.na <- which(is.na(x))
x.na
# - 변수x에 포함된 NA가 있는 위치(인덱스)

x[is.na(x)] <- x.med
x
# - 변수x의 3번째와 6번째 위치에 있었던 NA값이
#   x.med 중앙값으로 대체됨

median(x)

#ageband 나이대별로 구분 - 등간척도 
#청소년,성인,노인 - 서열척도

######################################################################
## 2. 범주형 변수의 결측치(NA) 처리

## raw데이터 준비
grade <- c("C", "B", "B", "D", NA, 
           "B", "D", "B", "D", "D",
           "D", "D", "C", "B", "B", 
           "C", "B", NA, "D", "C",
           "C", "A", "A", "B", "B", 
           "B", NA, "B", "A")

table(grade)
table(grade, useNA = "ifany")
table(grade, useNA = "always")
addmargins(table(grade, useNA = "ifany"))

# - 범주변수의 범주항목별 빈도수와 NA항목의 빈도수 확인
##  범주형 데이타는 중앙값, 평균값 처리 불가
## ifany 
## addmargins : 가장자리에 sum을 추가
## 데이타 분석은 하이엔드 기술을 쓰지 않더라도 빈도수를 기준으로 설계진행
## 엑센츄어, 아이비엠 etc

# --------------------------------------------------
## 2.1 단순삭제

is.na(grade) # grade변수의 요소값별로 결측치인지 판단
!is.na(grade) # grade변수의 요소값별로 결측치가 아닌지 판단

grade2 <- grade[!is.na(grade)]
grade2
# - grade변수의 내용중 결측치가 아닌 내용만 부분추출함

table(grade2)
addmargins(table(grade2))
# - 추출된 서브셋을 이용해 범주항목별 빈도수 파악
# - 원래 29개 요소값에서 3개 NA를 제거해서 26개로 나타남

# --------------------------------------------------
## 2.2 단순대체: 최빈치(mode)로 대체

grade.tb <- table(grade, useNA = "ifany")
grade.tb
# - grade변수의 범주항목별 빈도수 파악

max(grade.tb) 
# - 최대 빈도수 수치파악
which.max(grade.tb) 
# - 최대 빈도수를 가진 항목이름과 위치파악

grade.max <- which.max(grade.tb)
grade.max
# - 최대 빈도수를 가진 항목이름과 위치를 별도로 저장

grade.mode <- names(grade.max)
grade.mode
# - 최대 빈도수를 가진 항목이름을 별도로 추출해 저장
## mode : 최빈치

grade[is.na(grade)] <- grade.mode
grade
# - 변수 grade의 3번째와 6번째 위치에 있었던 NA값이
#   최대빈도수 항목인 "B"로 대체됨

labels(grade.max)
names(grade.max)

table(grade)
addmargins(table(grade))
# - 원래 grade 변수에 있던 29개 요소값 중 3개 NA요소들이 
#   최빈치인 "B"로 대체되어 29개가 유지됨

######################################################################
### 연습문제 #########################################################

## 예제1: 다음 20명 고객들의 8월한달 
#         카드결제횟수 내용을 보고 결측치를 대체하시오.

freq <- sample(30:80, 20)  

freq <- c(69, 70, NA, 59, 44, 31, 79, 57, 77, 33, 
          63, 75, 37, 65, 38, NA, 68, 55, NA, 41)
freq


freq.na <- which(is.na(freq))
freq.na_list <- freq[freq.na]


## 평균값 
freq.avg <- mean(freq,na.rm = TRUE)
## 56.525
#freq[freq.na]
freq[is.na(freq)] <- freq.avg
freq <- round(freq,1)
freq

## 중앙값 
freq.med <- median(freq,na.rm=TRUE)
## 56.75
freq[is.na(freq)] <- freq.med
freq

# --------------------------------------------------

## 예제2: 다음 20명 고객들의 8월 한달동안 
#         가장 비중있게 구매한 제품군 내용을 보고 결측치를 단순대체하시오.

product <- c("beauty", NA, "clothing", "food", "drink", 
             "food", "clothing", "food", "food", "beauty",
             "drink", "food", NA, "beauty", "food", 
             "clothing", "food", "lesuire", NA, "beauty")

product.na <- product[is.na(product)]

## 벡터 속성 중 NA 항목 찾아 <NA>로 변환
product.tb <- table(product,useNA = "ifany")
## MAX Frequency를 가진 속성의 위치와 이름 구하기
product.max <- which.max(product.tb)
## max 항목 정보 저장 
product.mode <- names(product.max)
## max인 항목 NA를 대체 

product[is.na(product)] <- product.mode
table(product)
addmargins(table(product, useNA="ifany"))

length(product)

rm(list=ls())
### End of source ####################################################

# ----------------------------------------
# 4.7.2  NULL
# ----------------------------------------
z <- c(1, NULL, 3)
## NULL은 단독으로만 존재해야함. 벡터에서는 NULL 대신에 NA로 표기되어야 한다.
z <- c(1, NA, 3)

str(z)
length(z) ## NULL은 포함되지 않는다, 데이타 할당처리 X 
is.null(z)

k <- c()
length(k)
is.null(k)

d <- NULL
length(d)
is.null(d)

# ----------------------------------------
# 4.7.3  파이프 연산
# ----------------------------------------
####################################################
## (R입문책_p.94) 파이프 연산자를 이용한 연계작업
####################################################

## raw데이터 준비
grade <- c("C", "B", "B", "D", NA, 
           "B", "D", "B", "D", "D",
           "D", "D", "C", "B", "B", 
           "C", "B", NA, "D", "C",
           "C", "A", "A", "B", "B", 
           "B", NA, "B", "A")

## 일련의 연계작업을 위해 여러개의 기능함수를 사용함

## (1) 필요함수 중첩사용방식
table(grade) # 빈도테이블계산
table(grade, useNA = "ifany") # 결측치 포함 빈도테이블계산
addmargins(table(grade, useNA = "ifany")) # 총합포함 빈도테이블 계산

## (2) 작업연계용 임시변수 사용방식
grade.tb <- table(grade, useNA = "ifany")
addmargins(grade.tb)

## (3) 파이프연산자 사용방식

prop.table(table(grade, useNA = "ifany"))

## 파이프연산자 패키지 설치
install.packages("magrittr")
library(magrittr)

## package exit
#detach("package:maritt", unload=TRUE)

grade %>% table() %>% addmargins()
# - 파이프연산자를 통해 일련의 작업을 이어서 진행함
# grade put into pipe then excute table function then addmargins function
## ---------same proceess---------------------
#1. grade.tb <- table(grade, useNA = "ifany")
#2. addmargins(grade.tb)

## make it easy and simple. no need to define new temp various
## 임시변수 사용안해도 됨으로 편리함
## %>% 뒤에 함수를 선언하고 일괄적으로 순서대로 실행하도록 함

grade %>% table %>% addmargins 
# - 함수사용시 작성해야할 괄호()를 생략해도 됨

grade %>% table(useNA = "ifany") %>% addmargins
# - 특정함수의 인수/인자/파라미터/옵션 사용도 가능

# ----------------------------------------
# 5. 고급 데이터 구조
# ----------------------------------------
## 스칼라 데이타
a <- 2

## 벡터 데이타
h <- c(1:72)

## 행렬 데이타 
mat <- matrix(h, nrow = 6)
## load 시 속도면에서 빠른 퍼포먼스 구현
# > mat
# [,1] [,2] [,3] [,4] [,5] [,6] [,7] [,8] [,9] [,10] [,11] [,12]
# [1,]    1    7   13   19   25   31   37   43   49    55    61    67
# [2,]    2    8   14   20   26   32   38   44   50    56    62    68
# [3,]    3    9   15   21   27   33   39   45   51    57    63    69
# [4,]    4   10   16   22   28   34   40   46   52    58    64    70
# [5,]    5   11   17   23   29   35   41   47   53    59    65    71
# [6,]    6   12   18   24   30   36   42   48   54    60    66    72

mat[1,2]


## 데이터 프레임 
# - 행렬처럼 컬럼명이 숫자가 아닌 특정 명칭인 것

## 배열데이터 : 가로x세로x차원 
arr <- array(h,dim = c(4,6,3))

arr[1,2,3] ## 가로, 세로, 차우
# > array(h,dim = c(4,6,3))
# , , 1
# 
# [,1] [,2] [,3] [,4] [,5] [,6]
# [1,]    1    5    9   13   17   21
# [2,]    2    6   10   14   18   22
# [3,]    3    7   11   15   19   23
# [4,]    4    8   12   16   20   24
# 
# , , 2
# 
# [,1] [,2] [,3] [,4] [,5] [,6]
# [1,]   25   29   33   37   41   45
# [2,]   26   30   34   38   42   46
# [3,]   27   31   35   39   43   47
# [4,]   28   32   36   40   44   48
# 
# , , 3
# 
# [,1] [,2] [,3] [,4] [,5] [,6]
# [1,]   49   53   57   61   65   69
# [2,]   50   54   58   62   66   70
# [3,]   51   55   59   63   67   71
# [4,]   52   56   60   64   68   72원

## list data
k <- list(one=h, two=mat, three=arr)

k$three
## 리스트의 데이타 출력 => 변수명 $ 리스트별칭
## 분석처리 한 내용을 변수에 할당하였을때, 정보의 다양한 데이타 타입이 존재하여 list 형태로 저장처리


# ----------------------------------------
# 5.1 데이터 프레임
# ----------------------------------------
## 행과 열로 구성되어 있다
## 데이타 프레임을 구성하는 열은 모두 길이가 같다.

x <- 10:5
y <- -4:1
q <- c("Hotkey","Football","Baseball","Curling","Rugby","Lacrosse")
length(x)
length(y)
length(q)
theDF <- data.frame(q,x,y)
## dataset 구조
#          q  x  y
# 1   Hotkey 10 -4
# 2 Football  9 -3
# 3 Baseball  8 -2
# 4  Curling  7 -1
# 5    Rugby  6  0
# 6 Lacrosse  5  1

str(theDF)
# 'data.frame':	6 obs. of  3 variables:
#   $ q: Factor w/ 6 levels "Baseball","Curling",..: 4 3 1 2 6 5
##### 문자형 데이타의 경우 factor형으로 자동적으로 설정됨
# $ x: int  10 9 8 7 6 5
# $ y: int  -4 -3 -2 -1 0 1

## factor형으로 자동설정되버리면, 데이타가 많을때, 범주데이타 설정할필요없는데 
## 쓸데없이 메모리를 사용하게된다.
## 문자는 문자로 frame에 설정한다.

## nickname 부여 컬럼명
theDF.nick <- data.frame(sports = q, order = x, rank = y)

## 프레임의 사이즈확인 
nrow(theDF.nick)
ncol(theDF.nick)
dim(theDF.nick) ##demesion 구하기 

colnames(theDF.nick)
names(theDF.nick)
## colnames == name 함수 동일한 기능
names(theDF.nick)[0] <- "activities"## [] index 지정
row.names(theDF.nick)
row.names<-paste("row_id",row.names(theDF.nick))
# rownames, row.names 동일한 기능 
rownames(theDF.nick) <- row.names


## 데이터셋 행이름 & 열이름 조회 및 관리

## 메모리로딩 패키지 목록
search()
# [1] ".GlobalEnv"        "tools:rstudio"     "package:stats"    
# [4] "package:graphics"  "package:grDevices" "package:utils"    
# [7] "package:datasets"  "package:methods"   "Autoloads"        
# [10] "package:base"
## "package:datasets" : 예제 데이타셋 패키지 포함
## dataset loading - 메모리에 올리는 것 아님 
datasets::mtcars

## package dataset list print
library(help = "datasets")

## R패키지에 포함된 SAMPLE 데이타 할당
data(mtcars) # datasets패키지에 있는 mtcars예제데이터셋 메모리로 로딩
## 패키지 우선순위가 정해져 있음
help(mtcars) # 해당 데이터셋 도움말(코딩북) 확인

mtcars # 전체 데이터셋 내용 조회
## 출력시 실제 메모리 할당

##종속변수, 반응변수, 성과변수(e.g. KPI)
#[, 1]	 mpg	 Miles/(US) gallon

##투입변수, 독립변수, 예측변수, 투입변수
# [, 2]	 cyl	 Number of cylinders
# [, 3]	 disp	 Displacement (cu.in.)
# [, 4]	 hp	 Gross horsepower
# [, 5]	 drat	 Rear axle ratio
# [, 6]	 wt	 Weight (1000 lbs)
# [, 7]	 qsec	 1/4 mile time
# [, 8]	 vs	 Engine (0 = V-shaped, 1 = straight)
# [, 9]	 am	 Transmission (0 = automatic, 1 = manual)
# [,10]	 gear	 Number of forward gears
# [,11]	 carb	 Number of carburetors



names(mtcars) # 변수컬럼 조회
colnames(mtcars) # 변수컬럼 조회
rownames(mtcars) # 행이름 조회
row.names(mtcars) # 행이름 조회

## grep 검색/조회
grep("Merc", row.names(mtcars)) 
# - 행이름중에서 Merc라는 단어가 들어간 레코드 위치(인덱스번호) 조회
mtcars[grep("Merc", row.names(mtcars)), ]  ## 변수[행,열] ## 빈값은 전체선택
# - Merc라는 이름이 들어간 레코드 내용(콘텐츠) 조회

## indexing은 세로방향 
## 필터링은 가로방향

## 컬럼 데이타 뽑기
mtcars["mpg"] ## mpg가 별도로 중복 선언되어 있을수 있음. 
mtcars[1]  ## 변수인용이 많을때는 숫자가 편함
mtcars$mpg ##'$' 1개의 컬럼만 사용할때만 사용

mtcars[c("mpg","gear")] ## 컬럼이 2~5 개 일때 편함
mtcars[c(1,10)]

#[x]mtcars[c("mpg":"gear")] ## 컬럼이 2~5 개 일때 편함
mtcars[c(1:10)]
#[x]mtcars$c(mpg:gear) ##'$' 1개의 컬럼만 사용할때만 사용

Merc <- mtcars[grep("Merc", row.names(mtcars)), ] 
Merc 
# - Merc 차종에 대한 서브데이터셋 추출

## 데이터셋 전치기능을 가진 t() 함수 사용
t(Merc) 
# - 데이터셋 전치(transpose) --> 차량 속성별로 Merc차종별 특징을 비교할 수 있음

##############################################################################
## 데이터셋의 행이름을 별도 변수컬럼으로 만드는 방법
head(mtcars) # 행이름에 인덱스번호가 아닌 차량이름이 들어 있음

mtcars$carname <- row.names(mtcars) 
# - 행이름을 활용해 별도의 carname이라는 변수컬럼 추가
head(mtcars) 
# - 추가된 carname 변수컬럼 확인

row.names(mtcars) <- NULL 
# - 불필요한 행이름을 없애고 보통의 숫자 인덱스로 만들어줌
head(mtcars) 
# - 없어진 행이름 확인, 숫자인덱스로 변경된 것 확인

mtcars <- mtcars[c(12, 1:11)] 
# - carname이라는 변수컬럼이 제일 왼쪽에서 자리잡을 수 있도록 위치변경
head(mtcars) 
# - 변경된 변수컬럼 위치 확인

## 근본적으로 rownames 자리에 있는 내용을 별도의 변수컬럼으로 만들어 주는 이유
# - 그냥 그대로 차량이름들을 활용할 수 있지만, 
#   그러면 매번 mtcars[c("wt", mpg") rownames(mtcars)] 처럼 코딩이 복잡해 짐
# - 어떠한 테이블이든 해당테이블의 주인공의 이름이 있어야 관리가 용이함
# - 매번 rownames(mtcars)라는 것으로 복잡하게 호출을 하지 않아도 됨
# - 즉 carnames라는 별도 변수컬럼이 필요한 이유임


head(mtcars,n=7)
tail(mtcars,n=7)

print(head(mtcars,n=7))
View(head(mtcars,n=7))
View(mtcars)
### End of Source ############################################################


## Package 버젼 확인 
packageVersion("BASE")


################################################################################
##-------------------------------------------------------------------------------
##연습문제
##-------------------------------------------------------------------------------
## R패키지에 포함된 SAMPLE 데이타 할당
data(mtcars) # datasets패키지에 있는 mtcars예제데이터셋 메모리로 로딩
mtcars # 전체 데이터셋 내용 조회
################################################################################

# 1. 종속변수인 mpg를 제일 뒤에 배치하기 
#selctedCol <- grep("mpg",colnames(mtcars))
selctedCol <- c("mpg")
length_cols <- length(colnames(mtcars))
mtcars.ds <- mtcars[c(setdiff(colnames(mtcars) , selctedCol),selctedCol)]



# 2. 범주형변수와 연속형변수를 묶어서 배치 
##종속변수, 반응변수, 성과변수(e.g. KPI)
#[, 1]	 mpg	 Miles/(US) gallon

##투입변수, 독립변수, 예측변수, 투입변수
# [, 2]	 cyl	 Number of cylinders
# [, 3]	 disp	 Displacement (cu.in.)
# [, 4]	 hp	 Gross horsepower
# [, 5]	 drat	 Rear axle ratio
# [, 6]	 wt	 Weight (1000 lbs)
# [, 7]	 qsec	 1/4 mile time
# [, 8]	 vs	 Engine (0 = V-shaped, 1 = straight)
# [, 9]	 am	 Transmission (0 = automatic, 1 = manual)
# [,10]	 gear	 Number of forward gears
# [,11]	 carb	 Number of carburetors

## 하드코딩
mtcars[c(1)]
print("----------------------------------")
mtcars[c(2:11)]


# 3. 차종 중에 Honda차종만 서브셋 만들기 
searchNm <- c("Honda")
mtcars.ds <- mtcars[grep(searchNm,rownames(mtcars)),]
  
# 4. Merc차종들의 연비와 기어종류 서브셋 
searchNm <- c("Merc")
mainVec <- c("gear","mpg")
mtcars[grep(searchNm,rownames(mtcars)),mainVec]



#------------------------------------------------------------------------------------
#model.matrix()
#attr
#list
#행열 
#건너띔 나중에 나오면 다시 
#--------------------------------------------

#Sass, Excel, CVS 등 전용파일 업로드 하는 경우가 있다. 

# <공통사항>
# (1) 주석문(#)을 각 단위작업 시작시, 또는 결과정리시
# 적절하게 붙이도록 하자
# 
# (2) 콤마(,) 기호나 화살표(<-) 연산자 다음에 공백을 한 칸 두어 코드 가독성을 높이자!
# 
# ===========================================  
# <과제1> mtcars 데이터셋 관련 
# 
# (1) 코딩북과 실제 데이터를 확인해 범주형과 연속형을 잘 구분하자!
# 변수컬럼 의미혼동: 연비(mpg: mile per gallon), 배기량(disp: displacement), 
# 변수컬럼 유형혼동: 실린더유형(cyl) --> 범주형 데이터
# 
# (2) 각 단위코드 작업내용별 결과를 확인할 수 있도록
# 결과객체 확인코드를 작성하자. 
# 
# mtcars <- mtcars[c(2, 8:11, 3:7)]
# mtcars # 단위작업을 통한 결과객체 확인코드

#------------------------------------------------------------------------------------------------------------------------------------
# 2018.09.10 ~ 2018.09.14
#------------------------------------------------------------------------------------------------------------------------------------
## 메모리로딩 패키지 목록
search()
# [1] ".GlobalEnv"        "tools:rstudio"     "package:stats"    
# [4] "package:graphics"  "package:grDevices" "package:utils"    
# [7] "package:datasets"  "package:methods"   "Autoloads"        
# [10] "package:base"
##install.packages("ggplot2")
library(ggplot2)

library(dplyr)

help(package = "ggplot2")
data(package = "ggplot2")

diamonds

## diaomnds table info
class(diamonds)
help(diamonds)
library(tibble)
glimpse(diamonds)

## 데이타셋 기술통계 
## 기술통계 분석을 통해 주요항목을 요약하여 보는것 = 통계량
## 가능성이 높은 요소(중심지표)를 통해 업무 설계?
# 기본 패키지 분석
summary(diamonds)
# 패키지 import 분석
# install.packages("Hmisc")
# library(Hmisc)
Hmisc::describe(diamonds)
# install.packages("prettyR")
# library(prettyR)
prettyR::describe(diamonds)
# install.packages("psych")
# library(psych)
psych::describe(diamonds)
# install.packages("skimR")
# library(skimR)
skim(diamonds)



## 데이터셋 간단조회
head(diamonds)
tail(diamonds)

library(psych)
psych::headTail(diamonds)

#----------------------------------------------------------------------------------------------------------
## 인덱싱(=selecting) 조건 지정하여 추출
## 사용원하는 데이타를 추출 (뺄것만 빼거나, 일부만 추출)

# Seletion/Indexing

# 대괄호 및 $ 표시는 단일 불러올때 속도가 빠르다. 
# 다중일때는 속도가 느릴수 있다. 
diamonds$carat # vector 형태로 출력
diamonds[1]    # row만 출력

diamonds["carat"] # tibble 구조 출력 (본래 형태)
diamonds[,"carat"] # 상위와 동일
diamonds[1] # row만 출력 tibble 구조 출력
diamonds[ , 1] # 모든 변수를 가져 오라는 뜻 

## base::subset
subset(diamonds,select = "carat")
subset(diamonds,select = c("carat","depth"))
subset(diamonds,select = 1)
subset(diamonds,select = c(1,2))


## install.package("magrittr")
## library(magrittr)
## 파이프 %>% 연산자 사용
diamonds %>% subset(select = "carat")
diamonds %>% subset(select = 1)


## dplyr::select() 패키지 함수 
## tibble 구조 데이타를 관리할때 dplyr이 효율성이 높음
select(diamonds, carat)
select(diamonds, -carat,-cut)
# select(diamonds, -(carat,cut)) #ERROR
select(diamonds, -C(carat,cut))
select(diamonds, 1)

## 파이프 %>% 연산자 사용
diamonds %>% select(carat)
diamonds %>% select(1)

## 특정 변수만 제외처리 
# diamonds$-[1] (x)
# diamonds$-carat(x)
# diamonds[-"carat"] (x)
# diamonds[,-"carat"] (X)
diamonds[-1]
diamonds[,-1]
diamonds[-5,2:10,-2]

# subset(diamonds,select = "carat") (x)
# subset(diamonds,select = c("carat","depth")) (x)
subset(diamonds,select = -1)
subset(diamonds,select = c(-1,-2))
subset(diamonds,select = -c(1,2))

## 파이프 %>% 연산자 사용
# diamonds %>% subset(select = -"carat") (x)
# diamonds %>% subset(select = c(-"carat")) #(x)
diamonds %>% subset(select = -1)
diamonds %>% select(-carat)
diamonds %>% select(-1)

vTarget <- c("carat","depth")
vTarget2 <- c(-1,-2)
abTarget2 <- c(1,2)

subset(diamonds,select = vTarget)
subset(diamonds,select = vTarget2)
subset(diamonds,select = -abTarget2)

## dplyr::select() 패키지 함수 
select(diamonds,-carat,-price)

## 파이프 %>% 연산자 사용
diamonds %>% select(-carat,-price)



###5. 연속위치 변수컬럼 인덱싱
# diamonds$c(1:7) (x)
# diamonds[c("carat":"ckarty")] (x)
diamonds[ c(1:4) ]
diamonds[,c(1:4)]
diamonds[1:4]
diamonds[,1:4]
diamonds[ c(1:4,7) ]

target <- c(1:4)
target <- 1:4
target <- c(1:4,7)
subset(diamonds,select = target)


## 5.4 
# dplyr::select
select(diamonds,carat:color) ## 기존의 subset과 달리 적용가능




#------------------------------------------------------------------------------------------
## 특정 글자 검색
## 정규표현식 이용 (Regular Expression)
#--------------------------------------------------------------------------------
#  특정한 패턴을 가진 문자열을 표시/검색/조회 하기 
#--------------------------------------------------------------------------------

# 2017 오하이오주 부동산 빅데이터 
# install.packages("AmesHousing")
#https://www.rdocumentation.org/packages/AmesHousing/versions/0.0.3/topics/ames_raw
library(AmesHousing)
## 중복된 이름이 존재할까봐, package와 연결하여 로딩처리
data(ames_raw,package="AmesHousing")
# ames_geo                     Raw Ames Housing Data
# ames_raw                     Raw Ames Housing Data
# ames_schools                 Ames Public Schools
ames_raw
## 상업시설, 고속화도록 진입, 한강, 흑인인구 비율, 학원
(ames_raw)
print(ames_raw)
View(ames_raw)

#----------------------------------------
# 구조 파악 
#----------------------------------------
str(ames_raw)

library(tiblle)
glimpse(ames_raw)

psych::describe(ames_raw)    ## 연속용 인자들 보기에 적합한듯
skimr::skim(ames_raw)        ## 연속용 인자들 보기에 적합한듯

Hmisc::describe(ames_raw) ## 범주용 변수인자 확인 가능
prettyR::describe(ames_raw) ## 범주용 변수인자 확인 가능

#----------------------------------------
# 실습  
#----------------------------------------
# base::grep() & tidyselect::starts_with() ## tibble구조일때 grep보다 효율적이다 ## dplyr과 매칭이 좋다
# ends_with : ~와 끝나는 starts_with : ~와 시작하는 
colnames(ames_raw)
## ^ : Exterxxxxxx 모든것 
## ignore.case : 대소문자 구분할지 말지 
## value : 찾고자 하는 문자열 출력 T:True F: False
grep(pattern="^Exter",
     x = colnames(ames_raw),
     ignore.case = TRUE 
     ) 
grep( pattern="^Exter"
    , x = colnames(ames_raw)
    , ignore.case = TRUE 
    , value=T
    )
# grep(pattern, x, ignore.case = FALSE, perl = FALSE, value = FALSE,
#      fixed = FALSE, useBytes = FALSE, invert = FALSE)

## 인수명 match : 정규표현식이 아닌 문자열로 표기 
starts_with(match = "Exter", vars = colnames(ames_raw), ignore.case = TRUE)
gIndex <- grep(pattern="^Exter",x = colnames(ames_raw),ignore.case = TRUE)
sIndex <- starts_with(match = "Exter", vars = colnames(ames_raw), ignore.case = TRUE)

## 컬럼 추출
colnames(ames_raw)[gIndex]
colnames(ames_raw)[sIndex]
#### tibble 구조 이므로 행,렬을 통해 접근가능하다. 
#### dataFrame 구조나 vector도 확인해보기
## 대괄호 [] 연산자 사용 인뎅싱/셀렉션 방식 
ames_raw[gIndex]
ames_raw[sIndex]
## 대괄호 [행, 열] 연산자 사용 인뎅싱/셀렉션 방식 
ames_raw[, gIndex]
ames_raw[, sIndex]

#---------------------------------------------------
## 1.3 base::subset() 사용 인덱싱/셀렉션 방식
subset(ames_raw,select=gIndex)
subset(ames_raw,select=sIndex)

## 파이프 연산 
ames_raw %>% subset(select=gIndex)
ames_raw %>% subset(select=sIndex)

select(ames_raw,gIndex)
select(ames_raw,grep("^Exter", colnames(ames_raw)))
select(ames_raw,starts_with("Exter"))




#----------------------------------------
# 실습 - 시작단어 
#----------------------------------------
## 참고 : https://statkclee.github.io/ds-authoring/regex-r.html
# base::grep() & tidyselect::starts_with() ## tibble구조일때 grep보다 효율적이다 ## dplyr과 매칭이 좋다
# ends_with : ~와 끝나는 starts_with : ~와 시작하는 
colnames(ames_raw)
### "^sa.+e$" => saXxxxxe xxx부분 글자수 상과없음 e로만 끝나면됨 
## ^ : Exterxxxxxx 모든것 
## $ : xxxxxxxxxExter 끝자리 매칭
## . : 자리수 개수 
## .+ : 자리수 상관없음 
## \\d: 숫자 
## [0-9] : 숫자
## ignore.case : 대소문자 구분할지 말지 
## value : 찾고자 하는 문자열 출력 T:True F: False
## grep, matches 함수를 이용하여 정규표현식으로 검색가능
sWord <- "Lot"
sRegWord <- "^Lot"
sRegWord <- "[0-9]"
sRegWord <- "^c.+ \\d$"
sRegWord <- " \\d.+"
sRegWord <- "Fin.+\\d$"


grep(pattern=sRegWord,
     x = colnames(ames_raw),
     ignore.case = TRUE,
     value = T
) 
grep( pattern=sRegWord
      , x = colnames(ames_raw)
      , ignore.case = TRUE 
      , value=T
)
# grep(pattern, x, ignore.case = FALSE, perl = FALSE, value = FALSE,
#      fixed = FALSE, useBytes = FALSE, invert = FALSE)

## 인수명 match : 정규표현식이 아닌 문자열로 표기 
starts_with(match = sWord, vars = colnames(ames_raw), ignore.case = TRUE)
gIndex <- grep(pattern=sRegWord,x = colnames(ames_raw),ignore.case = TRUE)
sIndex <- starts_with(match = sWord, vars = colnames(ames_raw), ignore.case = TRUE)

## 컬럼 추출
colnames(ames_raw)[gIndex]
colnames(ames_raw)[sIndex]
#### tibble 구조 이므로 행,렬을 통해 접근가능하다. 
#### dataFrame 구조나 vector도 확인해보기
## 대괄호 [] 연산자 사용 인뎅싱/셀렉션 방식 
ames_raw[gIndex]
ames_raw[sIndex]
## 대괄호 [행, 열] 연산자 사용 인뎅싱/셀렉션 방식 
ames_raw[, gIndex]
ames_raw[, sIndex]

#---------------------------------------------------
## 1.3 base::subset() 사용 인덱싱/셀렉션 방식
subset(ames_raw,select=gIndex)
subset(ames_raw,select=sIndex)

## 파이프 연산 
ames_raw %>% subset(select=gIndex)
ames_raw %>% subset(select=sIndex)

select(ames_raw,gIndex)
select(ames_raw,grep(sRegWord, colnames(ames_raw)))
select(ames_raw,starts_with(sWord))


#----------------------------------------
# 실습 - 종결단어 
#----------------------------------------
endWord <- "Area$" ## 단어로 끝나는것 

sWord <- "Area"
sRegWord <- "Area$"

# grep(pattern, x, ignore.case = FALSE, perl = FALSE, value = FALSE,
#      fixed = FALSE, useBytes = FALSE, invert = FALSE)

## 인수명 match : 정규표현식이 아닌 문자열로 표기 
#starts_with
gIndex <- grep(pattern = sRegWord,x = colnames(ames_raw),ignore.case = TRUE)
sIndex <- ends_with(match = sWord,vars = colnames(ames_raw),ignore.case = TRUE)

## 컬럼 추출
colnames(ames_raw)[gIndex]
colnames(ames_raw)[sIndex]
#### tibble 구조 이므로 행,렬을 통해 접근가능하다. 
#### dataFrame 구조나 vector도 확인해보기
## 대괄호 [] 연산자 사용 인뎅싱/셀렉션 방식 
ames_raw[gIndex]
ames_raw[sIndex]
## 대괄호 [행, 열] 연산자 사용 인뎅싱/셀렉션 방식 
ames_raw[,gIndex]
ames_raw[,sIndex]

#---------------------------------------------------
## 1.3 base::subset() 사용 인덱싱/셀렉션 방식
subset(ames_raw,select=gIndex)
subset(ames_raw,select=sIndex)

## 파이프 연산 
ames_raw %>% select(gIndex)
ames_raw %>% select(sIndex)
ames_raw %>% select(grep(sRegWord,x=colnames(ames_raw)))
ames_raw %>% select(ends_with(sWord))

##############################################################################
# grep 함수 patter옵션에 정규식이 아닌 문자열 입력시, 
# 문자열내에 어느위치에든 포함된 것을 검색
##############################################################################
gIndex <- grep(pattern = sRegWord,x = colnames(ames_raw),ignore.case = TRUE)
sIndex <- ends_with(match = sWord,vars = colnames(ames_raw),ignore.case = TRUE)

## tidyselect:: 포함된 함수
tidyselect::contains(match="Fin", vars = colnames(ames_raw), ignore.case = TRUE)
tidyselect::matches(match="Fin", vars = colnames(ames_raw), ignore.case = TRUE)


##############################################################################
#--------------------------------------------------------------------------------
# 데이타셋
#--------------------------------------------------------------------------------
diamonds
#--------------------------------------------------------------------------------
## 레코드(row) 인덱싱/샐렉션 = 필터링 슬라이싱
#--------------------------------------------------------------------------------
# subset(데이타셋,,select=컬럼단위로 찾기)
# subset(ames_raw,subset =(샐렉트옵션),select=(컬럼옵션) )
#--------------------------------------------------------------------------------
# 특정 변수컬럼 일치비교조건 1개 지정 필터링
#--------------------------------------------------------------------------------
diamonds[diamonds$cut == "Ideal",]
diamonds[which(diamonds$cut=="Ideal"),] 
##상위예제를 사용시 row데이타 이상시에는 which함수 사용
diamonds[diamonds$cut != "Ideal",]
diamonds[which(diamonds$cut !="Ideal"),] 


## base::subset()
#subset(diamonds,colnames(c("cut","clarity"))==c("Ideal","SI2"))
subset(diamonds, clarity=="SI2"&&cut=="Ideal")
subset(diamonds, clarity=="SI2"||cut=="Ideal")
subset(diamonds, cut==c("Ideal","Good"))
subset(diamonds, clarity=="SI2")

diamonds %>% subset(cut=="Ideal") 

### performance 측정
microbenchmark::microbenchmark(
                subset(diamonds, clarity=="SI2"&&cut=="Ideal"),
                dplyr::filter(diamonds,cut=="Ideal"&&clarity=="SI2"),
                dplyr::filter(diamonds,cut=="Ideal",clarity=="SI2")
                )

#median-> 중간값, max-> 최대 걸린시간 측정
microbenchmark::microbenchmark(
  subset(diamonds, clarity=="SI2"&&cut=="Ideal")
)
dplyr::filter(diamonds,cut=="Ideal"&&clarity=="SI2")
dplyr::filter(diamonds,cut=="Ideal",clarity=="SI2")

#2018-09-12

diamonds[diamonds$cut =='Ideal', ]

x <- diamonds[diamonds$cut == "Ideal", ]

table(x$cut, useNA = "ifany")





# base::subset()  --------------------------------------
subset(diamonds, cut == "Ideal")
library(magrittr)
diamonds %>% subset(cut == "Ideal")



y<- subset(diamonds, cut == "Ideal")
table(y$cut, useNA= "ifany")

#필터링 결과 확인



?subset









#dplyr::filter() --------------------------------------
library(dplyr)

filter(diamonds, cut == "Ideal")

diamonds %>% filter(cut == "Ideal") %>%
  
  select(cut) %>%              #cut변수
  
  table(useNA = "ifany") %>%   #빈도분석
  
  addmargins %>%               #합 sum
  
  as.data.frame                #세로로 만들어줌

# as.data.frame() 함수 : 데이터 프레임처럼 만들어주는 함수

# 세로방향으로 만들어줌



y2 <- table(y$cut, useNA = "ifany")

y2



y3 <- addmargins(y2)

y3



y4 <- as.data.frame(y3)

y4

# 파이프 연산자를 썼을 때 편리성

# 코드가 중복되지 않는다.





#조건제외  --------------------------------------

diamonds[diamonds$cut != "Ideal", ]

diamonds[which(diamonds$cut != "Ideal"), ]



x <- diamonds[diamonds$cut != "Ideal", ]
table(x$cut, useNA = "ifany")
y2 <- table(x$cut, useNA = "ifany")
y3 <- addmargins(y2)
y4 <- as.data.frame(y3)

# 필터링 확인

# Ideal은 0으로 나와야함 왜냐하면 걔만 빼달라고  했으니까

  




#base::subset() 

subset(diamonds, cut != "Ideal")

diamonds %>% subset(cut != "Ideal")



y <- subset(diamonds, cut != "Ideal")

table(y$cut, useNA = "ifany")





#dplyr::filter() --------------------------------------

filter(diamonds, cut != "Ideal")

diamonds %>% filter(cut != "Ideal")



diamonds %>% filter(cut != "Ideal") %>%
  
  select(cut) %>%   #레코드와 상관없이 변수만 상관있음 컷변수만 보겠다.
  
  table(useNA = "ifany") %>%  #컷 안에 Ideal이 있냐없냐
  
  addmargins %>%
  
  as.data.frame

#필터링 결과 확인


diamonds[diamonds$cut == c("Ideal","Good"),] ##변수한개가 여러개의 값을 가지게될때
diamonds[diamonds$cut %in% c("Ideal","Good"),] ##변수한개가 여러개의 값을 가지게될때
diamonds[diamonds$cut =="Ideal"|diamonds$cut == "Good",] ## 여러항목을 비교할때 유용
diamonds[which(diamonds$cut =="Ideal"|diamonds$cut == "Good"),]
diamonds[with(diamonds,cut =="Ideal"|cut == "Good"),] ## 여러항목을 비교할때 유용

diamonds %>% filter(cut != "Ideal"&cut != "Good") %>%
  select(cut) %>%   #레코드와 상관없이 변수만 상관있음 컷변수만 보겠다
  table(useNA = "ifany") %>%  #컷 안에 Ideal이 있냐없냐
  addmargins %>%
  as.data.frame

comStr <- diamonds$cut =="Ideal" & diamonds$color == "E"
diamonds[diamonds$cut %in% c("Ideal","Good"),] ##변수한개가 여러개의 값을 가지게될때
diamonds[diamonds$cut =="Ideal" & diamonds$color == "E",] ## 여러항목을 비교할때 유용
diamonds[which(comStr),]
diamonds[with(diamonds,cut =="Ideal"&color == "E"),] ## 여러항목을 비교할때 유용

y <- subset(diamonds, cut != "Ideal"&color != "E")
y <- subset(diamonds, cut != "Ideal"&cut != "Good")
table(y$cut, useNA = "ifany")


subset(diamonds, cut !="Ideal" & cut !="Good")
diamonds %>% subset(cut == "Ideal" | cut =="Good")
diamonds %>% subset(cut == "Ideal" | color =="E")
y <- subset(diamonds, cut !="Ideal" & cut !="Good")
table(y$cut)

#--------------------------------------------------------------------------------
## 3. 범주형 변수 2개 이상에 대한 복합 조건비교 피러링 
#--------------------------------------------------------------------------------
#################################################################################
# 3.1 "조건일치" 필터링 
#--------------------------------------------------------------------------------
#기본 달러 $ 또는 [] 대괄호 연산자 사용
diamonds[diamonds$cut == "Ideal" & diamonds$clarity == "VS2",]
diamonds[which(diamonds$cut == "Ideal" & diamonds$clarity == "VS2"),]
diamonds[with(diamonds,cut == "Ideal" & clarity == "VS2"),]

x <- diamonds[diamonds$cut == "Ideal" & diamonds$clarity == "VS2",]
table(x$cut, dnn="커팅품질 항목별 빈도수")
table(x$clarity, dnn="투명도 항목별 빈도수")

subset(diamonds, cut == "Ideal" & clarity == "VS2")
diamonds %>% subset( cut == "Ideal" & clarity == "VS2")

y <- subset(diamonds, cut == "Ideal" & clarity == "VS2")
table(y$cut, dnn = "커팅품질 항목별 빈도수")
table(y$clarity, dnn = "투명도 항목별 빈도수")


# &,| 단일비교를 이용하면 or, and로 사용 
# &&, || 첫데이타만 비교하여 결과값 출력한다. 전체 확인 x

#--------------------------------------------------------------------------------
## 4. 연속형 변수 N개 이상에 대한 복합 조건비교 피러링 
#--------------------------------------------------------------------------------
#################################################################################
# 4.1 "조건일치" 1개 조건 필터링 
#--------------------------------------------------------------------------------
diamonds[diamonds$price >= 1000,]
diamonds[which(diamonds$price >= 1000),]

x <- diamonds[diamonds$price >= 1000,]
summary(x$price)

subset(diamonds,price >= 1000)
diamonds %>% subset(price >= 1000)

y <- subset(diamonds,price >= 1000)
summary(y$price)

filter(diamonds, price >= 1000)
diamonds %>% filter(price >= 1000)

diamonds %>% filter(price >= 1000) %>% select(price) %>% summary

#################################################################################
# 4.2 "조건일치" 2개 이상 조건 필터링 
#--------------------------------------------------------------------------------
diamonds[diamonds$price >= 1000 & diamonds$carat > 2 ,]
diamonds[which(diamonds$price >= 1000 & diamonds$carat > 2),]

x <- diamonds[diamonds$price >= 1000 & diamonds$carat > 2,]
summary(x[c("price","carat")])

subset(diamonds,price >= 1000 & carat > 2)
diamonds %>% subset(price >= 1000 & carat > 2)

y <- subset(diamonds,price >= 1000 & carat > 2)
summary(x[c("price","carat")])

filter(diamonds, price >= 1000 & carat > 2)
diamonds %>% filter(price >= 1000 & carat > 2)

diamonds %>% filter(price >= 1000 & carat > 2) %>% select(c("price","carat")) %>% summary
#################################################################################
# 4.2 "조건일치" 3개 이상 조건 필터링 
#--------------------------------------------------------------------------------
## PEMDAS
## | 보다는 &가 우선순위 높다
## (A | B) & C
## A | (B & C)
## A | B | C
## (A & B) | C

#################################################################################
# 5. 범주형과 연속형 변수에 대한 복합 조건비교 필터링 
#--------------------------------------------------------------------------------

diamonds[diamonds$cut == "Ideal" & diamonds$price > 15000,]
diamonds[which(diamonds$cut == "Ideal" & diamonds$price > 15000),]
diamonds[with(diamonds,cut == "Ideal" & price > 15000),]

subset(diamonds, cut=="Ideal" & price > 15000)
diamonds %>% subset(cut=="Ideal" & price > 1500)

y <- subset(diamonds, cut=="Ideal" & price > 15000)
summary(y[c("cut","price")]) 

library(skimr)
skim(y[c("cut","price")])


filter(diamonds,cut=="Ideal" & price > 15000)
filter(diamonds,cut=="Ideal" , price > 15000)

diamonds %>% filter(cut=="Ideal" & price > 15000)
diamonds %>% filter(cut=="Ideal" , price > 15000)

#################################################################################
# 6. 특정 임차행 1개범위 지정 슬라이스 
#--------------------------------------------------------------------------------
diamonds[1,]

slice(diamonds,1)
diamonds %>% slice(5)

diamonds[-5,]
slice(diamondsbbb)
# 누구누구인지 알고 왜 잘라내야하는지 알때 사용
slice(diamonds,c(7, 3:3))


###70%/ 30% 나누면 70% 훈련데이타 30% 학습데이타 
# 훈련데이타 규칙뽑고 테스트 데이타로 검증 
# 훈련데이타를 쪼개서 그를 이요하여 학습

#################################################################################
# 7. 무작위샘플링 
#--------------------------------------------------------------------------------
# 데이타 분활시 샘플링
# base::sample
# dplyr 샘플링 함수 포함 
# 계통형 추출 - 맥주공장 500상자 중에 1개 맛보고 정상인지 확인 
# 층화형 추출 - 남자 200명 여자 50명 -> 성별로 층을 나누고 샘플링 몇명씩 
# 통계는 표본을 기준으로 추출하여 결론을 도출하지만, 
# 머신러닝은 추출하여 업무에 적용하여 결과확인
#--------------------------------------------------------------------------------
## 기본 base::sample() 함수이용 : 복원추출x
## 1번 sampling
#-샘플링 재현성을 위한 초기난수값 설정
set.seed(1)

#- 실제 diamonds셋의 내용이 아닌 추출대상 레코드번호 
# nRow : 레코드 개수 파악하고 싶다면 사용 - length 도 가능
# size : 100개를 무작위로 추출
# replace : 부스팅 기법 - 주어진 데이타를 여러번 추출하여 데이타를 부풀려서 결과 추출 TRUE
#           주어진 데이타를 복원(반복)추출할 필요가 없다면 Replace=FALSE 추정
index <- sample(1:nrow(diamonds),size=100,replace=FALSE)
index

## 추출된 데이타 
diamonds[index,]

#-무작위 비복원추출 레코드번호를 이용해 실제 내용 
## 이렇게 추출된 것이 훈련데이타로 사용할 수 있다.
sub.dd <- diamonds[index,]
#sub.dd2 <- diamonds[index,]
## sub.dd == sub.dd2
sub.dd
skim(sub.dd)
#--------------------------------------------------------------------------------
## 기본 base::sample() 함수이용 : 복원추출
## 200번 샘플링 - set.seed 설정값 및 sample 옵션이 동일해야지 각각 다른 사용자가 뽑아도 동일한 결과 출력 
#-샘플링 재현성을 위한 초기난수값 설정
set.seed(200)

index2 <- sample(1:100, size=1000,replace=TRUE)
# 확률적으로 1~100사이의 각 항목이 10번 미만으로 추출될 것이다. 

table(index2)

sub.dd2 <- diamonds[index2,]
skim(sub.dd2)
#--------------------------------------------------------------------------------
## dplyr::sample_n() 함수이용 - 개수를 지정하여 샘플추출 전처리 및 가공에 용이
## dplyr::sample_frac() 함수이용 - 비율을 지정하여 샘플추출

set.seed(1234)

## 대상 데이타를 통채로 삽입 - 레코드의 번호가 아니라 데이타 추출된 데이타 다이렉트로 출력 
## 대상 데이타를 쪼개어서 샘플링 역할
result <- sample_n(diamonds , size=100 , replace=FALSE)
result

set.seed(1234)
diamonds %>% sample_n(size=100) %>% skim

set.seed(5678)
## 주어진 데이타 100개를 replace=TRUE를 줌으로 써 1000개로 뻥튀기해서 훈련데이타로 생성
result2 <- sample_n(diamonds[1:100,],
                    size=1000,
                    replace=TRUE)
result2

set.seed(5678)
diamonds %>% sample_n(size=1000)

## dplyr::sample_n() 함수이용 - size를 수량과 곱하여 개수를 지정하여 샘플추출 전처리 및 가공에 용이
set.seed(333)
index <- sample(1:nRow(diamonds),size=nrow(diamonds)*0.7,replace=FALSE)

train.dd <- diamonds[index,]
skim(train.dd)

test.dd <- diamonds[-index,]
skim(test.dd)

## dplyr::sample_frac() 함수이용 - 비율을 지정하여 샘플추출
set.seed(1234)

TrainD <- sample_frac(diamonds, size=0.7,replace=FALSE)
skim(TrainD)
## 차집합 함수 dplyr::setdiff(A,B) = A-B
TestD <- dplyr::setdiff(diamonds, TrainD)
skim(TestD)


var1 <- grep("good", diamonds$cut, ignore.case = TRUE)
#var2 <- grep("good", diamonds$cut, ignore.case = TRUE, value=TRUE)
var3 <- grepl("good", diamonds$cut, ignore.case = TRUE)

diamonds[var1,]
#diamonds[var2,]
diamonds[var3,]

x <- diamonds[var1,]
table(x$cut)

##### grepl = grep logical => 정규화를 이용하여 추철 가능
subset(diamonds, grepl("good", diamonds$cut, ignore.case = TRUE))

y <- subset(diamonds, grepl("good", diamonds$cut, ignore.case = TRUE))
table(y$cut)

filter(diamonds,grepl("good", diamonds$cut, ignore.case = TRUE))

z <- filter(diamonds,grepl("good", diamonds$cut, ignore.case = TRUE))
skim(z$cut)
table(z$cut)

diamonds %>% filter(grepl("good", diamonds$cut, ignore.case = TRUE)) %>% skim
diamonds %>% filter(grepl("good", diamonds$cut, ignore.case = TRUE)) %>% select(cut) %>% table


vReg1 <- grep("v.+\\d", diamonds$clarity, ignore.case = TRUE )
vReg2 <- grep("v.+\\d", diamonds$clarity, ignore.case = TRUE , value=TRUE)
vReg3 <- grepl("v.+\\d", diamonds$clarity, ignore.case = TRUE )

diamonds[vReg1,]
#diamonds[vReg2,]
vReg2
diamonds[vReg3,]

x <- diamonds[vReg1,]
table(x$clarity)

subset(diamonds,vReg3)
y <- subset(diamonds,vReg3)
skim(y$clarity)
table(y$clarity)

diamonds %>% filter(vReg3) %>% select(clarity) %>% table 



################################################################################
## 데이터셋관리(DML: Data Manipulation Language)
# - 레코드번호(위치)를 이용한 필터링(Filtering)/슬라이싱(Slicing)
################################################################################

## 필요패키지 설치 & 로딩
# install.packages("ggplot2") # 예제데이터셋 diamonds 이용
# install.packages("dplyr") # 데이터셋 조작 패키지
# install.packages("tibble") # 데이터셋 조회함수 glimpse() 이용
# install.packages("magrittr") # 파이프연산자 %>% 이용
# install.packages("Hmisc") # 기술통계 describe() 이용
# install.packages("prettyR") # 기술통계 describe(), 간단조회 headTail() 이용
# install.packages("psych") # 기술통계 describe() 이용
# install.packages("skimr") # 기술통계 skim() 이용
# install.packages("tidyselect") # 문자열 중 원하는 패턴찾기 패키지  

library(ggplot2)
library(dplyr)
library(tibble)
library(magrittr)
library(Hmisc)
library(prettyR)
library(psych)
library(skimr)
library(tidyselect)

# ------------------------------------------------------------
## ggplot2 패키지에 내장된 diamonds 데이터셋 활용

## ggplot2 패키지 도움말
library(help = ggplot2) # 간단 도움말 뷰어 오픈
help(package = ggplot2) # 알파벳순서 도움말 탭 오픈
data(package = "ggplot2") # 해당 패키지에 들어 있는 예제데이터셋 목록조회

## diamonds 데이터셋 로딩 & 코딩북 확인
data(diamonds)

help(diamonds)
## diamonds 코딩북
# 다이아몬드 등급 결정기준 4C: carat, cut, color, clarity
# carat: 무게/순도를 의미함 --> 순금의 1/24을 1캐럿으로 나타냄 
# cut: 커팅품질(다이아몬드의 광채를 결정함) --> Fair, Good, Very Good, Premium, Ideal
# => 다항 분류 예측 
# color: 색상 --> J(worst) to D(best)
# => 이항 분류 예측
# clarity: 투명도 --> I1(worst), SI1, SI2, VS1, VS2, VVS1, VVS2, IF(best)

# table: 다이아몬드의 제일 상단 평면의 폭 --> 43 ~ 95
# price: 다이아몬드의 가격 --> $326 ~ $18,823

# x: 길이(mm) 다이아몬드를 위에서 보았을 때 상대적으로 기다란 가로특성 --> 0 ~ 10.74
# y: 폭(mm) 다이아몬드를 위에서 보았을 때 상대적으로 짧은 세로특성 --> 0 ~ 58.9
# z: 깊이(mm) --> 0 ~ 31.8 
#    - 적정한 깊이(빛이 위쪽으로 반사), 너무 높거나 낮은 깊이는 빛반사가 떨어짐
# depth: x(길이mm)와 y(폭mm) 대비 z(깊이mm)의 비율을 계산한 값

################################################################################
## 데이터셋 간단조회
head(diamonds)
tail(diamonds)

library(psych)
psych::headTail(diamonds)

# ------------------------------
## 데이터셋 구조파악
str(diamonds)

library(tibble)
glimpse(diamonds)

# ------------------------------
## 데이터셋 기술통계
Hmisc::describe(diamonds)
prettyR::describe(diamonds)
psych::describe(diamonds)
skim(diamonds)

################################################################################
## 데이터셋에 있는 특정 레코드행 필터링(Filtering)/슬라이싱(Slicing) 하기
# - 행/로우(row), 관찰치/관측치(observation), 레코드(record), 
#   사례/케이스(case)를 대상으로 
#   조건을 지정해 특정 관찰치를 부분추출함

# - 방법1: base패키지에 속한 달러$연산자를 이용하는 방법 
#          --> 1개 변수컬럼 지정인덱싱만 가능함
# - 방법2: base패키지에 속한 대괄호[]연산자를 이용하는 방법 
# - 방법3: base::subset() 함수를 이용하는 방법
# - 방법4: dplyr::select() 함수를 이용하는 방법
#   --> select()라는 이름을 가진 함수는 다양한 패키지에서 사용하는 기능함수명이므로
#       이상하게 작동할시에는 단순 select()함수가 아닌 dplyr::select()로 코딩필요

################################################################################
## 1. 범주형 변수 1개에 대한 단순 조건비교 필터링

## 1.1 범주형변수 1개에 단순 "조건일치" 필터링

## 기본 달러$ 또는 대괄호[] 연산자 사용 필터링 방식
diamonds[diamonds$cut == "Ideal", ] 
diamonds[which(diamonds$cut == "Ideal"), ] 

x <- diamonds[diamonds$cut == "Ideal", ] 
table(x$cut, useNA = "ifany")
# - 필터링 결과확인

# --------------------
## base::subset() 기능함수 이용방식
subset(diamonds, cut == "Ideal")
diamonds %>% subset(cut == "Ideal")

y <- subset(diamonds, cut == "Ideal")
table(y$cut, useNA = "ifany")
# - 필터링 결과확인

y2 <- table(y$cut, useNA = "ifany")
y2

y3 <- addmargins(y2)
y3

y4 <- as.data.frame(y3)
y4


# --------------------
## dplyr::filter() 기능함수 이용방식
filter(diamonds, cut == "Ideal")
diamonds %>% filter(cut == "Ideal")

diamonds %>% filter(cut == "Ideal") %>% 
  select(cut) %>% 
  table(useNA = "ifany") %>%
  addmargins %>% 
  as.data.frame
# - 필터링 결과확인

# ------------------------------------------------------
## 1.2 범주형변수 1개에 단순 "조건제외" 필터링

## 기본 달러$ 또는 대괄호[] 연산자 사용 필터링 방식
diamonds[diamonds$cut != "Ideal", ] 
diamonds[which(diamonds$cut != "Ideal"), ] 

x <- diamonds[diamonds$cut != "Ideal", ] 
table(x$cut, useNA = "ifany")
# - 필터링 결과확인

# --------------------
## base::subset() 기능함수 이용방식
subset(diamonds, cut != "Ideal")
diamonds %>% subset(cut != "Ideal")

y <- subset(diamonds, cut != "Ideal") 
table(y$cut, useNA = "ifany")
# - 필터링 결과확인

# --------------------
## dplyr::filter() 기능함수 이용방식
filter(diamonds, cut != "Ideal")
diamonds %>% filter(cut != "Ideal")

diamonds %>% filter(cut != "Ideal") %>% 
  select(cut) %>% 
  table(useNA = "ifany") %>%
  addmargins %>% 
  as.data.frame
# - 필터링 결과확인

################################################################################
## 2. 범주형 변수 1개에 대한 복합 조건비교 필터링

## 2.1 범주형변수 1개에 복합 "조건일치" 필터링

## 기본 달러$ 또는 대괄호[] 연산자 사용 필터링 방식: 
# ~ 또는(or)이라는 의미의 %in%, 수직바(|) 연산자 사용

diamonds[diamonds$cut %in% c("Ideal", "Good"), ] 

diamonds[diamonds$cut == "Ideal" | 
           diamonds$cut == "Good", ] 

diamonds[which(diamonds$cut == "Ideal" | 
                 diamonds$cut == "Good"), ] 

diamonds[with(diamonds, cut == "Ideal" | 
                cut == "Good"), ] 


x <- diamonds[diamonds$cut %in% c("Ideal", "Good"), ] 
table(x$cut, useNA = "ifany")
# - 필터링 결과확인

# --------------------
## base::subset() 기능함수 이용방식
subset(diamonds, cut %in% c("Ideal", "Good"))
subset(diamonds, cut == "Ideal" | cut == "Good")

diamonds %>% subset(cut %in% c("Ideal", "Good"))
diamonds %>% subset(cut == "Ideal" | cut == "Good")

y <- subset(diamonds, cut %in% c("Ideal", "Good")) 
table(x$cut, useNA = "ifany")
# - 필터링 결과확인

y2 <-table(x$cut, useNA = "ifany")
y2

y3 <- addmargins(y2)
y3

y4 <- as.data.frame(y3)
y4


# --------------------
## dplyr::filter() 기능함수 이용방식
filter(diamonds, cut %in% c("Ideal", "Good"))
filter(diamonds, cut == "Ideal" | cut == "Good")

diamonds %>% filter(cut %in% c("Ideal", "Good"))
diamonds %>% filter(cut == "Ideal" | cut == "Good")

diamonds %>% filter(cut %in% c("Ideal", "Good")) %>%
  select(cut) %>% 
  table(useNA = "ifany") %>%
  addmargins %>% 
  as.data.frame
# - 필터링 결과확인 

# ------------------------------------------------------
## 2.2 범주형변수 1개에 복합 "조건제외" 필터링

## 기본 달러$ 또는 대괄호[] 연산자 사용 필터링 방식
diamonds[diamonds$cut != "Ideal" & diamonds$cut != "Good", ] 
diamonds[which(diamonds$cut != "Ideal" & diamonds$cut != "Good"), ] 
diamonds[with(diamonds, cut != "Ideal" & cut != "Good"), ] 

x <- diamonds[diamonds$cut != "Ideal" & diamonds$cut != "Good", ] 
table(x$cut)
# - 필터링 결과확인 

# --------------------
## base::subset() 기능함수 이용방식
subset(diamonds, cut != "Ideal" & cut != "Good")
diamonds %>% subset(cut == "Ideal" & cut == "Good")

y <- subset(diamonds, cut != "Ideal" & cut != "Good") 
table(y$cut)
# - 필터링 결과확인 

# --------------------
## dplyr::filter() 기능함수 이용방식
# - filer() 함수에서는 &연산자 대신에 콤마(,)기호를 사용해도 and로 인식함
filter(diamonds, cut != "Ideal" & cut != "Good")
filter(diamonds, cut != "Ideal", cut != "Good")
diamonds %>% filter(cut != "Ideal" & cut != "Good")

diamonds %>% filter(cut != "Ideal" & cut != "Good") %>%
  select(cut) %>% 
  table(useNA = "ifany") %>%
  addmargins %>% 
  as.data.frame
# - 필터링 결과확인 

################################################################################
## 3. 범주형 변수 2개 이상에 대한 복합 조건비교 필터링

## 3.1 범주형변수 2개에 복합 "조건일치" 필터링

## 기본 달러$ 또는 대괄호[] 연산자 사용 필터링 방식
diamonds[diamonds$cut == "Ideal" & diamonds$clarity == "VS2", ] 
diamonds[which(diamonds$cut == "Ideal" & diamonds$clarity == "VS2"), ] 
diamonds[with(diamonds, cut == "Ideal" & clarity == "VS2"), ] 

x <- diamonds[diamonds$cut == "Ideal" & diamonds$clarity == "VS2", ]  
table(x$cut, dnn = "커팅품질 항목별 빈도수")
table(x$clarity, dnn = "투명도 항목별 빈도수")
# - 필터링 결과확인 

# --------------------
## base::subset() 기능함수 이용방식
subset(diamonds, cut == "Ideal" & clarity == "VS2")
diamonds %>% subset(cut == "Ideal" & clarity == "VS2")

y <- subset(diamonds, cut == "Ideal" & clarity == "VS2") 
table(y$cut, dnn = "커팅품질 항목별 빈도수")
table(y$clarity, dnn = "투명도 항목별 빈도수")
# - 필터링 결과확인 

# --------------------
## dplyr::filter() 기능함수 이용방식
# - filer() 함수에서는 &연산자 대신에 콤마(,)기호를 사용해도 and로 인식함
filter(diamonds, cut == "Ideal" & clarity == "VS2")
filter(diamonds, cut == "Ideal", clarity == "VS2")
# - filter()함수에서는 &기호 대신에 콤마(,)기호를 사용해도 됨

diamonds %>% filter(cut == "Ideal" & clarity == "VS2")
diamonds %>% filter(cut == "Ideal", clarity == "VS2")

diamonds %>% filter(cut == "Ideal" & clarity == "VS2") %>%
  count(cut, clarity)
# - 필터링 결과확인 

# ------------------------------------------------------
## 3.2 범주형변수 2개에 복합 "조건제외" 필터링

## 기본 달러$ 또는 대괄호[] 연산자 사용 필터링 방식
diamonds[diamonds$cut != "Ideal" & diamonds$clarity != "VS2", ] 
diamonds[which(diamonds$cut != "Ideal" & diamonds$clarity != "VS2"), ] 
diamonds[with(diamonds, cut != "Ideal" & clarity != "VS2"), ] 

x <- diamonds[diamonds$cut == "Ideal" & diamonds$clarity != "VS2", ]   
table(x$cut, dnn = "커팅품질 항목별 빈도수")
table(x$clarity, dnn = "투명도 항목별 빈도수")
# - 필터링 결과확인 

# --------------------
## base::subset() 기능함수 이용방식
subset(diamonds, cut == "Ideal" & clarity == "VS2")
diamonds %>% subset(cut == "Ideal" & clarity == "VS2")

y <- subset(diamonds, cut == "Ideal" & clarity == "VS2") 
table(y$cut, dnn = "커팅품질 항목별 빈도수")
table(y$clarity, dnn = "투명도 항목별 빈도수")
# - 필터링 결과확인 

# --------------------
## dplyr::filter() 기능함수 이용방식
# - filer() 함수에서는 &연산자 대신에 콤마(,)기호를 사용해도 and로 인식함
filter(diamonds, cut == "Ideal" & clarity == "VS2")
filter(diamonds, cut == "Ideal", clarity == "VS2")

diamonds %>% filter(cut == "Ideal" & clarity == "VS2")
diamonds %>% filter(cut == "Ideal", clarity == "VS2")
# - filter()함수에서는 &기호 대신에 콤마(,)기호를 사용해도 됨

diamonds %>% filter(cut == "Ideal" & clarity == "VS2") %>%
  count(cut, clarity)
# - 필터링 결과확인 

################################################################################
## 4. 연속형 변수 1개에 대한 단순 조건비교 필터링

## 4.1 연속형변수 1개에 단순 "조건일치" 필터링

## 기본 달러$ 또는 대괄호[] 연산자 사용 필터링 방식
diamonds[diamonds$price >= 1000, ] 
diamonds[which(diamonds$price >= 1000), ] 

x <- diamonds[diamonds$price >= 1000, ] 
summary(x$price)
# - 필터링 결과확인 

# --------------------
## base::subset() 기능함수 이용방식
subset(diamonds, price >= 1000)
diamonds %>% subset(price >= 1000)

y <- subset(diamonds, price >= 1000) 
summary(y$price)
# - 필터링 결과확인 

# --------------------
## dplyr::filter() 기능함수 이용방식
filter(diamonds, price >= 1000)
diamonds %>% filter(price >= 1000)

diamonds %>% filter(price >= 1000) %>% 
  select(price) %>% summary
# - 필터링 결과확인 

# ------------------------------------------------------
## 4.2 연속형변수 2개에 복합 "조건일치" 필터링

## 기본 달러$ 또는 대괄호[] 연산자 사용 필터링 방식
diamonds[diamonds$carat > 2 & diamonds$price < 14000, ] 
diamonds[which(diamonds$carat > 2 & diamonds$price < 14000), ] 
diamonds[with(diamonds, carat > 2 & price < 14000), ]

x <- diamonds[diamonds$carat > 2 & diamonds$price < 14000, ]  
summary(x[c("carat", "price")])
# - 필터링 결과확인 

# --------------------
## base::subset() 기능함수 이용방식
subset(diamonds, carat > 2 & price < 14000)
diamonds %>% subset(carat > 2 & price < 14000)

y <- subset(diamonds, carat > 2 & price < 14000)
summary(x[c("carat", "price")])
# - 필터링 결과확인 

# --------------------
## dplyr::filter() 기능함수 이용방식
filter(diamonds, carat > 2 & price < 14000)
filter(diamonds, carat > 2, price < 14000)

diamonds %>% filter(carat > 2 & price < 14000)
diamonds %>% filter(carat > 2, price < 14000)
# - filter()함수에서는 &기호 대신에 콤마(,)기호를 사용해도 됨

diamonds %>% filter(carat > 2 & price < 14000) %>%
  select(carat, price) %>%
  summary
# - 필터링 결과확인 


################################################################################
## 5. 범주형과 연속형 변수에 대한 복합 조건비교 필터링

## 기본 달러$ 또는 대괄호[] 연산자 사용 필터링 방식
diamonds[diamonds$cut == "Ideal" & diamonds$price > 15000, ] 
diamonds[which(diamonds$cut == "Ideal" & diamonds$price > 15000), ] 
diamonds[with(diamonds, cut == "Ideal" & price > 15000), ] 

x <- diamonds[diamonds$cut == "Ideal" & diamonds$price > 15000, ] 
summary(x[c("cut", "price")])
# - 필터링 결과확인 

# --------------------
## base::subset() 기능함수 이용방식
subset(diamonds, cut == "Ideal" & price > 15000)
diamonds %>% subset(cut == "Ideal" & price > 15000)

y <- subset(diamonds, cut == "Ideal" & price > 15000) 
summary(y[c("cut", "price")])
# - 필터링 결과확인 

# --------------------
## dplyr::filter() 기능함수 이용방식
filter(diamonds, cut == "Ideal" & price > 15000)
filter(diamonds, cut == "Ideal", price > 15000)
# - filter()함수에서는 &기호 대신에 콤마(,)기호를 사용해도 됨

diamonds %>% filter(cut == "Ideal" & price > 15000)
diamonds %>% filter(cut == "Ideal", price > 15000)
# - filter()함수에서는 &기호 대신에 콤마(,)기호를 사용해도 됨

diamonds %>% filter(cut == "Ideal" & price > 15000) %>%
  select(cut, price) %>%
  summary
# - 필터링 결과확인 


###############################################################################
## 6. 데이터셋에 있는 특정 관찰치를 슬라이싱(Slicing)하기
# - 행/로우(row), 관찰치/관측치(observation), 레코드(record), 
#   사례/케이스(case)를 대상으로 
#   행번호 범위를 지정해 특정 관찰치를 부분추출함

# ------------------------------------------------------
## 6.1 특정 일치행 1개범위 지정 슬라이싱

## 기본 달러$ 또는 대괄호[] 연산자 사용 슬라이싱 방식
diamonds[5, ] 

## dplyr::slice() 기능함수 이용방식
slice(diamonds, 5)
diamonds %>% slice(5)

# ------------------------------------------------------
## 6.2 특정 일치행 1개범위 제외 슬라이싱

## 기본 대괄호[] 연산자 사용 슬라이싱 방식
diamonds[-5, ] 

## dplyr::slice() 기능함수 이용방식
slice(diamonds, -5)
diamonds %>% slice(-5)

# ------------------------------------------------------
## 6.3 특정 일치행 복수범위 지정 슬라이싱

## 기본 대괄호[] 연산자 사용 슬라이싱 방식
diamonds[c(2, 7, 3:5), ] 

## dplyr::slice() 기능함수 이용방식
slice(diamonds, c(2, 7, 3:5))
diamonds %>% slice(c(2, 7, 3:5))

# ------------------------------------------------------
## 6.4 특정 일치행 복수범위 제외 슬라이싱

## 기본 대괄호[] 연산자 사용 슬라이싱 방식
diamonds[-c(2, 7, 3:5), ] 

## dplyr::slice() 기능함수 이용방식
slice(diamonds, -c(2, 7, 3:5))
diamonds %>% slice(-c(2, 7, 3:5))

###############################################################################
## 7. 데이터셋에 있는 특정 관찰치를 무작위추출(sampling) 하기
# - 행/로우(row), 관찰치/관측치(observation), 레코드(record), 
#   사례/케이스(case)를 대상으로 
#   레코드갯수나 추출비율을 지정해 특정 관찰치를 부분추출함

## 7.1 데이터셋에서 필요한 레코드 갯수만큼 무작위추출하는 경우

## 기본 base::sample() 함수이용: 비복원추출

set.seed(1)
# - 샘플링 재현성을 위한 초기난수값 설정

index <- sample(1:nrow(diamonds), 
                size = 100, 
                replace = FALSE)
index
# - 실제 diamonds셋의 내용이 아닌 추출대상 레코드번호(인덱스번호)가 무작위추출됨

sub.dd <- diamonds[index, ]
sub.dd
# - 무작위 비복원추출된 레코드번호를 이용해 실제 내용을 추출함

# --------------------
## 기본 base::sample() 함수이용: 복원추출

set.seed(200)
# - 샘플링 재현성을 위한 초기난수값 설정

index2 <- sample(1:100, size = 1000, replace = TRUE)
index2
# - 실제 diamonds셋의 내용이 아닌 추출대상 레코드번호(인덱스번호)가 복원추출됨
# - 추출대상은 1:100 즉 100개인데, 추출사이즈갯수는 100개이므로 복원추출이 필요함

table(index2)
# - 무작위추출된 인덱스번호들이 중복추출 되었음을 빈도수로 있음

sub.dd2 <- diamonds[index2, ]
sub.dd2
skim(sub.dd2)
# - 무작위 복원추출된 레코드번호를 이용해 실제 내용을 추출함

# --------------------
## dplyr::sample_n() 함수이용: 비복원추출

set.seed(1234)
# - 샘플링 재현성을 위한 초기난수값 설정

result <- sample_n(diamonds, 
                   size = 100, 
                   replace = FALSE)
result
# - 이 함수는 레코드번호가 아닌 실제 diamonds의 레코드내용을 추출해줌

set.seed(1234)
diamonds %>% sample_n(size =100) %>% skim

# --------------------
## dplyr::sample_n() 함수이용: 복원추출

set.seed(5678)
# - 샘플링 재현성을 위한 초기난수값 설정

result2 <- sample_n(diamonds[1:100, ], 
                    size = 1000, 
                    replace = TRUE)
result2
# - 이 함수는 레코드번호가 아닌 실제 diamonds의 레코드내용을 추출해줌

set.seed(5678)
diamonds %>% slice(1:100) %>% 
  sample_n(size = 1000, replace = TRUE) %>% skim

# ------------------------------------------------------
## 7.2 데이터셋에서 필요한 레코드 비율만큼 무작위추출하는 경우

## 기본 base::sample() 함수이용

set.seed(333)
# - 샘플링 재현성을 위한 초기난수값 설정

index <- sample(1:nrow(diamonds), 
                size = nrow(diamonds)*0.7, 
                replace = FALSE)
index
# - 실제 diamonds셋의 내용이 아닌 추출대상 레코드번호(인덱스번호)가 무작위추출됨

train.dd <- diamonds[index, ]
train.dd
skim(trian.dd) 
# - 훈련데이터 70%

test.dd <- diamonds[-index, ]
test.dd
skim(test.dd) 
# - 테스트데이터 30%

# --------------------
## dplyr::sample_frac() 함수이용 비율추출

set.seed(1234)
# - 샘플링 재현성을 위한 초기난수값 설정

TrainD <- sample_frac(diamonds, size = 0.7, replace = FALSE)
TrainD
skim(TrainD)
# - 훈련데이터 70%

TestD <- dplyr::setdiff(diamonds, TrainD)
TestD
skim(TestD)
# - 테스트데이터 30%

################################################################################
## 8. 레코드 대상 필터링 구현시 정규표현식 사용

## 8.1 cut변수에 goog이라는 단어가 들어간 레코드 조회
table(diamonds$cut)

## 기본 달러$ 또는 대괄호[] 연산자 사용 필터링 방식
grep("good", diamonds$cut, ignore.case = TRUE) # 해당 레코드 번호추출
grep("good", diamonds$cut, ignore.case = TRUE, value = TRUE) # 해당 레코드 값추출
grepl("good", diamonds$cut, ignore.case = TRUE) # 해당 레코드 논리값추

diamonds[grep("good", diamonds$cut, ignore.case = TRUE), ]
diamonds[grepl("good", diamonds$cut, ignore.case = TRUE), ]

x <- diamonds[grep("good", diamonds$cut, ignore.case = TRUE), ]
table(x$cut)
# - 필터링 결과확인

# --------------------
## base::subset() 기능함수 이용방식
subset(diamonds, grepl("good", diamonds$cut, 
                       ignore.case = TRUE))

y <- diamonds[grep("good", diamonds$cut, 
                   ignore.case = TRUE), ]
table(y$cut)
# - 필터링 결과확인

# --------------------
## dplyr::filter() 기능함수 이용방식

filter(diamonds, grepl("good", diamonds$cut, 
                       ignore.case = TRUE))
diamonds %>% filter(grepl("good", diamonds$cut, 
                          ignore.case = TRUE))

diamonds %>% filter(grepl("good", diamonds$cut, 
                          ignore.case = TRUE)) %>% 
  select(cut) %>% table
# - 필터링 결과확인 


# ------------------------------------------------------
## 8.2 clarity변수에 "문자V + 아무문자 + 숫자"가 들어간 레코드 조회
table(diamonds$clarity)

## 기본 달러$ 또는 대괄호[] 연산자 사용 필터링 방식
grep("v.+\\d", diamonds$clarity, ignore.case = TRUE) # 해당 레코드 번호추출
grep("v.+\\d", diamonds$clarity, ignore.case = TRUE, value = TRUE) # 해당 레코드 값추출
grepl("v.+\\d", diamonds$clarity, ignore.case = TRUE) # 해당 레코드 논리값추

diamonds[grep("v.+\\d", diamonds$clarity, ignore.case = TRUE), ]
diamonds[grepl("v.+\\d", diamonds$clarity, ignore.case = TRUE), ]

x <- diamonds[grep("v.+\\d", diamonds$clarity, ignore.case = TRUE), ]
table(x$clarity)
# - 필터링 결과확인

# --------------------
## base::subset() 기능함수 이용방식
subset(diamonds, grepl("v.+\\d", diamonds$clarity, 
                       ignore.case = TRUE))

y <- subset(diamonds, grepl("v.+\\d", diamonds$clarity, 
                            ignore.case = TRUE))
table(y$clarity)
# - 필터링 결과확인

# --------------------
## dplyr::filter() 기능함수 이용방식
filter(diamonds, grepl("v.+\\d", diamonds$clarity, ignore.case = TRUE))
diamonds %>% filter(grepl("v.+\\d", diamonds$clarity, ignore.case = TRUE))

diamonds %>% filter(grepl("v.+\\d", diamonds$clarity, ignore.case = TRUE)) %>%
  select(clarity) %>% table
# - 필터링 결과확인

### End of Source #############################################################

##############################################################################
# 파생변수 생성하기 
#-----------------------------------------------------------------------------
# 색, 규격, 커팅 품질이 다르지만 무게대비하여 가격이 어느정도 하는지 추가변수 구현
# 연속데이타를 보고 구간으로 쪼개어 -> 파생변수 생성할수 있다. 
# 관련 유사사례 및 브레인 스토밍을 통해 의미있는 범주로 지정하여 파생변수로 생성가능
diamonds$ppc <- diamonds$price / diamonds$carat
diamonds

summary(diamonds$ppc)

## dplyr::mutate() 기능함수 
diamonds <- mutate(diamonds,ppc2 = price/carat)

## - 파이프 %<>% 사용
diamonds %<>% mutate(ppc3 = price/carat)


# 연속변수 carat, cut를 가공 가능 
# - carat < 1.0 #low-level
# - carat > 1.0 & carat < 3.9 #mid-level
# - carat > 3.0 #high-level


dd <- diamonds
dd <- mutate(diamonds,cr.grd = carat)
dd <- select(diamonds, carat, cut)

dd$cr.grd <- NULL

dd$cr.grd[dd$carat <= 1.0] <- "low"
dd$cr.grd[dd$carat > 1.0 & dd$carat <= 3.0] <- "middle"
dd$cr.grd[dd$carat > 3.0] <- "high"

dd
table(dd$cr.grd, useNA = "always")
table(dd$cr.grd)

#dplyr::setdiff(diamonds, dd[colnames(diamonds,x=c("low","middle","high"))])

#-----------------------------------------------------------------------------
#10만원이상 프로모션에 반응을 보이는 고객을 추정
dd$cr.grd2 <- NULL
# base::cut() 
dd$cr.grd2 <- cut(dd$carat,
                  breaks = c(-Inf,1,3,Inf), #x <1/ 1<= x <3 / 3<= x 
                  include.lowest = FALSE, right = TRUE,
                  labels= c("low","middle","high"))

table(dd$cr.grd2, useNA = "always")
table(dd$cr.grd2)

#-----------------------------------------------------------------------------
## 예측력을 높이기위해 요소가 분포가 불균등할때, 수치가 낮은 아웃라이어 일때 
## 즉, fair가 빈도수가 낮을때 아래와 같이 묶어서 데이타 전처리가 가능하다. 

dd$cut.grd <- NULL

dd$cut.grd[dd$cut %in% c("Fair","Good","Very Good")] <- "Normal"
dd$cut.grd[dd$cut %in% c("Premium","Ideal")] <- "Special"

dd

table(dd$cut.grd, useNA = "always")
str(dd)
#-----------------------------------------------------------------------------
##factor 함수 이용
dd$cut.grd2 <- factor(dd$cut,
                     levels = c("Fair","Good","Very Good","Premium","Ideal"),
                     labels = c("Normal","Normal","Normal","Special","Special") ## 위치로 맵핑
                     )
# 파생변수 확인
table(dd$cut.grd, useNA = "always")
table(dd$cut.grd2, useNA = "always")

#-----------------------------------------------------------------------------
## 회계연관 있는 데이타가 존재하는 패키지 
## car::record()
#install.packages("car")
library(car)

## factor와 달리 각 대체변수와 맵핑 가능
## 불편한점 레코드 데이타 작은 따음표쓰는거..ㅠ
dd$cut.grd3 <- car::recode(dd$cut,
                           "c('Fair','Good','Very Good','Premium','Ideal')='Normal';
                            c('Primium','Ideal')='Special'")

table(dd$cut.grd3, useNA = "always")

#-----------------------------------------------------------------------------
## 회계연관 있는 데이타가 존재하는 패키지 
## doBy::recordVar()
install.packages("doBy")
library(doBy)

## list는 데이타가 혼재가 된경우 쓴다. 
## src : Source 
## tgt : target
dd$cut.grd4 <- recodeVar(dd$cut,
                         src=list(c("Fair","Good","Very Good"),
                                  c("Premium","Ideal")),
                         tgt=list("Normal","Special"))

table(dd$cut.grd4, useNA = "always")

#-----------------------------------------------------------------------------
## dplyr::recode() - tibble구조시 사용 추천 - 퍼포먼수 좋음
dd$cut.grd5 <- dplyr::recode(dd$cut,
                             "Fair"="Normal",
                             "Good"="Normal",
                             "Very Good"="Normal",
                             "Premium"="Special",
                             "Ideal"="Special")
table(dd$cut.grd5, useNA = "always")
#-----------------------------------------------------------------------------
dd %<>% mutate(cut.grd5 = 
                dplyr::recode(dd$cut,
                              "Fair"="Normal",
                              "Good"="Normal",
                              "Very Good"="Normal",
                              "Premium"="Special",
                              "Ideal"="Special"))
table(dd$cut.grd5, useNA = "always")

#-----------------------------------------------------------------------------
## dplyr::if_else(조건,TRUE-결과값,FALSE-결과값) 
dd %<>% mutate(cut.grd6 = if_else(dd$cut %in% c("Fair","Good","Very Good"),
                                              "Normal", "Special")
                                 )
table(dd$cut.grd6, useNA = "always")
table(dd$cut.grd6, useNA = "ifany")     
###############################################################################
## dplyr패키지를 활용한 데이터다루기: 변수변환/리코딩으로 요약/파생변수 만들기
# - mutate(), recode(), if_else()
###############################################################################
# - ggplot2 패키지에 내장된 diamonds 데이터셋 활용

## ggplot2 패키지 설치 및 로딩
# install.packages("ggplot2")
library(ggplot2)

## ggplot2 패키지에 대한 도움말
library(help = ggplot2) # 간단 도움말 뷰어 오픈
help(package = ggplot2) # 알파벳순서 도움말 탭 오픈
data(package = "ggplot2") # 해당 패키지에 들어 있는 예제데이터셋 목록확

## --------------------------------------
## 데이터셋 로딩 & 탐색

data(diamonds)
head(diamonds)

help(diamonds)

## diamonds 코딩북
# 다이아몬드 등급 결정기준 4C: carat, cut, color, clarity
# carat: 무게/순도를 의미함 --> 순금의 1/24을 1캐럿으로 나타냄 
# cut: 커팅품질(다이아몬드의 광채를 결정함) --> Fair, Good, Very Good, Premium, Ideal
# color: 색상 --> J(worst) to D(best)
# clarity: 투명도 --> I1(worst), SI1, SI2, VS1, VS2, VVS1, VVS2, IF(best)

# table: 다이아몬드의 제일 상단 평면의 폭 --> 43 ~ 95
# price: 다이아몬드의 가격 --> $326 ~ $18,823

# x: 길이(mm) 다이아몬드를 위에서 보았을 때 상대적으로 기다란 가로특성 --> 0 ~ 10.74
# y: 폭(mm) 다이아몬드를 위에서 보았을 때 상대적으로 짧은 세로특성 --> 0 ~ 58.9
# z: 깊이(mm) --> 0 ~ 31.8 
#    - 적정한 깊이(빛이 위쪽으로 반사), 너무 높거나 낮은 깊이는 빛반사가 떨어짐
# depth: x(길이mm)와 y(폭mm) 대비 z(깊이mm)의 비율을 계산한 값

# ------------------------------------------------------
## 속도 문제가 있는 경우 10% 정도 샘플링을 통해서 진행
# choice <- sample(1:NROW(diamonds), NROW(diamonds)*0.1, replace = FALSE)
# choice
# NROW(choice)
# diamonds <- diamonds[choice, ]
# ------------------------------------------------------

################################################################################
## 데이터셋 조회
diamonds
(diamonds)
print(diamonds)
View(diamonds)

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
skim(ames_raw)

###############################################################################
## 데이터셋에 변수간 연산을 통한 새로운 변수컬럼을 추가(mutate)하기
# - 데이터셋에 들어 있는 변수컬럼이나 별도의 데이터를 활용해 
#   새로운 변수컬럼(요약변수, 파생변수)을 만들어 추가함 

# ------------------------------------------------------
## 1캐럿당 가격($)에 대한 별도 변수컬럼 추가 

## 기본 달러$ 또는 대괄호[] 연산자 사용 방식
# - ppc: price per caret

diamonds$ppc <- diamonds$price / diamonds$carat 
diamonds

## dplyr::mutate() 기능함수 이용방식
diamonds <- mutate(diamonds, ppc2 = price/carat)
diamonds

diamonds %<>% mutate(ppc3 = price/carat)
diamonds
# - 양방향/할당 파이프연산자 %<>% 이용

###############################################################################
## 연속변수 구간범위지정을 통한 변수리코딩으로 새로운 변수컬럼 추가(mutate) 하기

## 연속변수 변수리코딩을 위한 간단 데이터셋 준비
data("diamonds")
dd <- select(diamonds, carat, cut)

dd
summary(dd$carat)
# - dd데이터셋에 있는 carat 변수컬럼을 적당한 구간으로 변수리코딩할 예정
# -  carat의 값이 1.0이하이면 --> low로 리코딩
# -  carat의 값이 1.0보다 크고, 3.0보다 이하이면 --> middle로 리코딩
# -  carat의 값이 3.0보다 크면 --> high로 리코딩

# ------------------------------------------------------
## 기본 달러$ 또는 대괄호[] 연산자 사용 변수리코딩
# - cr.grd: caret grade
dd$cr.grd[dd$carat <= 1.0] <- "low" 
dd$cr.grd[dd$carat > 1.0 & 
            dd$carat <= 3.0] <- "middle" 
dd$cr.grd[dd$carat > 3.0] <- "high" 

dd # 추가된 파생변수 확인
table(dd$cr.grd, useNA = "always")
# - useNA="always" 옵션을 통해서 결측치(NA) 항목도 빈도테이블에 나옴

# ------------------------------------------------------
## base::cut() 함수이용 변수리코딩
dd$cr.grd2 <- cut(dd$carat,
                  breaks = c(-Inf, 1, 3, Inf),
                  include.lowest = FALSE, right = TRUE, 
                  labels = c("low", "middle", "high")) 
dd # 추가된 파생변수 확인
table(dd$cr.grd, useNA = "always")
table(dd$cr.grd2, useNA = "always")
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

################################################################################
# 두 변수의 관계 분석 
# 범주 ~ 범주 : 교차-연관 분석
# 연속 ~ 연속 : +-1 상관 관계 분석
# 범주 ~ 연속 : 요약집계 / 다차원분석
# ------------------------------------------------------
# 1) 인수 설정방식 
# stats::aggregate(), base::tapply(), psych::describeBy()
# 2) 관계식 설정방식 (종속 ~ 독립)

data(mtcars)
head(mtcars)

# ------------------------------------------------------
# 문제상황 : cyl -> mpg 실린더통 개수가 연비에 미치는 영향
# ------------------------------------------------------
## stats::aggregate(x= 결과변수,by=기준변수,FUN=구분기준,na.rm= NA를 제외)
aggregate(x = mtcars,
          by = list(mtcars$cyl),
          FUN = mean, na.nm=TRUE)
## 4기통이 연비의  높다 

aggregate(mtcars[c(1,3:6)],
          list(mtcars$cyl),
          mean, na.rm=TRUE)

## group : 기준
## mpg 데이터 변동일어남 
## 실린더 개수 평균을 단위면적당 가격 
# 실린더 개수 많을 수록 마력은 올라가고 
# 실리더 개수 많을 수록 연비가 커진다(사용 연료가 더 커진다)
# wte도 커진다

# row 레이블 붙이기 
aggregate(mtcars[c(1,3:6)],
          list(CylType=mtcars$cyl),
          mean, na.rm=TRUE)
aggregate(x = mtcars,
          by = list(CylType=mtcars$cyl),
          FUN = mean, na.nm=TRUE)
result <- aggregate(mtcars[c(1,3:6)],
          by = list(CylType=mtcars$cyl,
                    Gear_Type= mtcars$gear),
          FUN = mean, na.nm=TRUE)

#----------------------------------------------
# order() 정렬 함수 
# - :내림차순 / 생략: 오름차순

result[order(result$CylType,
             result$Gear_Type, -result$mpg),]

#----------------------------------------------
## base::tapply() - 요약집계
# 1. 기준변수 - mtcars$gear, mtcars$cyl
# 2. 연속변수 - mtcars$mpg
# 3. 통계함수 - factor
tapply(X=mtcars$mpg, 
       INDEX=list(mtcars$cyl), 
       FUN=mean,
       na.rm = T)

tapply(X=mtcars$mpg, 
       INDEX=list(mtcars$cyl), 
       FUN=mean,
       na.rm = T)


mtcars$cyl2 <- factor(mtcars$cyl,
                      levels = c(4,6,8),
                      labels = c("4기통","6기통","8기통"))

tapply(mtcars$mpg, mtcars$cyl2, mean, na.rm=T)
mtcars$gear2 <- factor(mtcars$gear,
                       levels = c(3,4,5),
                       labels = c("3단","4단","5단") )

tapply(mtcars$mpg, list(mtcars$cyl2,mtcars$gear2), mean, na.rm=T)

#----------------------------------------------
## psych::describeBy() - 요약집계
# 1. 기준변수 - mtcars$gear, mtcars$cyl
# 2. 연속변수 - mtcars$mpg
# 3. 통계함수 - factor
library(psych)

psych::describeBy(x=mtcars[1], group=mtcars$am)
psych::describeBy(x=mtcars[1], group=mtcars$am, mat=T)

# describeBy(mtcars[c(1,3)],
describeBy(mtcars[c(1,3)],
          list(mtcars$gear, mtcars$am),
          mat = T)

###############################################################################
## 요약집계(aggreagation)를 이용한 그룹간 특성차이분석
###############################################################################

## 요약집계 분석개념
# - 요약집계 기준변수에 따라 요약집계 결과변수의 특성치를 비교분석하는 방법
# - 요약집계 기준변수는 범주형 변수로 여러개의 그룹/집단으로 구성됨
# - 요약집계 결과변수는 연속형 변수로 다양한 기술통계함수를 적용해 특성차이를 비교함

## 요약집계 함수사용방법
# - 요약집계 함수에 입력하는 기준변수와 결과변수의 입력방식에 따라 
#   인수설정방식과 관계식 설정방식으로 나눔

# (1) 인수설정방식
# - 요약집계 함수에 기준변수와 결과변수를 일반적인 기능함수의 
#   인수/인자/파라미터 설정방식으로 입력하는 방법
# - stats::aggregate(), base::tapply(), psych::describeBy() 함수가 대표적임 

# (2) 관계식 설정방식
# - 요약집계 함수에 기준변수와 결과변수간 관계를 
#   일종의 관계식(formula) 형식으로 설정하는 방식
# - 관계식(포뮬러; formula) 방식을 사용하면 인수설정방식에 비해서 
#   변수간의 관계를 직접적으로 묘사해 보다 직관적인 분석관계를 이해+설정할 수 있음
# - stats::aggregate(), doBy::summaryBy() 함수가 대표적임

###############################################################################
## 1. 인수 설정방식에 대한 예제: datasets::mtcasrs 데이터셋을 이용 
###############################################################################

## 요약집계 결과출력을 위한 자리수 설정
options(digits = 4)
# - 요약그룹 비교를 평균값을 가지고 하므로 출력수치를 4자리 정도로 해서 
#   모든 변수값들이 소수점이 출력될 수 있도록 함

## 요약집계를 위한 데이터셋 준비
data(mtcars) # datasets 패키지에 있는 mtcars 데이터셋 메모리로 로딩
help(mtcars) # mtcars에 대한 도움말(조작적정의, 코딩북) 확인

str(mtcars)
head(mtcars)

###############################################################################
### stats::aggregate() 이용 ==> stats는 기본 내장로딩 패키지

## aggregate() 모든 인수 사용
aggregate(x = mtcars, 
          by = list(mtcars$cyl), 
          FUN = mean, na.rm = TRUE) 
# - x옵션: mtcars 데이터프레임의 모든 변수컬럼 데이터를 대상으로 
#   요약집계하겠다는 의미
# - 이로인해 불필요한 변수컬럼에 대해서도 요약집계 통계치가 나와서 다소 불편함
#   특히 그룹변수로 사용한 cyl이 나시 요약집계 테이블에 나와서 불편함
# - by옵션: mtcars 데프에서 1개 변수를 집계그룹 기준변수로 선정함
#   aggregate()에서는 요약집계 기준변수가 1개이든 2개이든 by = list()로 설정해야 함
# - FUN옵션: 평균함수를 mtcars 데프의 모든 변수컬럼에 적용(결측치 제외)

# ------------------------------------------------------
## aggregate() 인수 없이 사용
aggregate(mtcars[c(1, 3:6)], 
          list(mtcars$cyl), 
          mean, na.rm = TRUE) 
# - mtcars 데프에서 보고싶은 요약집계 변수컬럼 5개를 인덱싱해서 준비함
#   요약집계된 통계치 산정결과가 보다 심플해서 해석하기 용이함
# - mtcars 데프에서 1개 변수를 집계그룹 기준변수로 선정함
#   그러나 요약집계에 사용한 기준변수의 변수컬럼명이 Group.1이라서 구체화할 필요가 있음
# - 산술평균 함수를 보고싶은 요약집게 변수컬럼 5개에 동시적용함 

aggregate(mtcars[c(1, 3:6)], 
          list(CylType = mtcars$cyl), 
          
          mean, na.rm = TRUE)
# - 집계그룹 기준변수로 선정된 1개 변수컬럼에 별도의 요약집계 그룹명칭을 부여함
# - 어떤 변수컬럼을 요약집계 기준변수로 사용했는지 그룹명칭이 있어 이해하기 용이해짐 

aggregate(mtcars[c(1, 3:6)], 
          list(Cyl.Type = mtcars$cyl, 
               Gear_Type = mtcars$gear),
          mean, na.rm = TRUE)
# - 집계그룹 기준변수로 cyl을 1순위로, gear를 2순위로 선정해 보다 다차원적인 분석이 됨
#   요약집계를 위한 그룹명칭은 자유롭게 설정가능함
# - 요약집계 기준변수 2개를 복합적으로 사용한 결과,
#   cyl 4, 6, 8기통 X gear 3, 4, 5단 = 9개의 요약집계그룹이 나와야 함
# - 요약집계 테이블에는 cyl 8기통 X gear 4단 스펙을 가진 차종은 없는 것으로 판단됨
# ==> 이를 통해 aggregate()는 복합 요약집계 기준변수를 통해 다중 결과변수들 간의
#     요약집계 그룹별 분석결과를 확인할 수 있음

result <- aggregate(mtcars[c(1, 3:6)], 
                    list(Cyl.Type = mtcars$cyl, Gear_Type = mtcars$gear),
                    mean, na.rm = TRUE)
# - 요약집계 분석결과를 별도 객체와 데이터셋 구조로 관리/조회 가능

result[order(result$Cyl.Type, 
             result$Gear_Type, -result$mpg), ]


# - Cyl.Type으로 오름차순, Gear_Typehwy으로 오름차순, mpg는 내림차순으로 정렬조회

View(result)
# - 별도의 뷰어창을 통해서 요약집계 결과내용 확인
# - 특정변수를 기준으로 정렬도 가능함

# ------------------------------------------------------
aggregate(mtcars[c(1, 3:6)], 
          list(Cyl.Type = mtcars$cyl, 
               Gear_Type = mtcars$gear,
               Autotype = mtcars$am),
          mean, na.rm = TRUE)
# - 3중 복합 요약집계 기준변수 설정도 잘 작동함

result2 <- aggregate(mtcars[c(1, 3:6)], 
                     list(Cyl.Type = mtcars$cyl, 
                          Gear_Type = mtcars$gear,
                          Autotype = mtcars$am),
                     mean, na.rm = TRUE)
# - 요약집계 분석결과를 별도 객체와 데이터셋 구조로 관리/조회 가능

result[order(result2$Cyl.Type, result2$Gear_Type, -result2$mpg), ]
# - Cyl.Type으로 오름차순, Gear_Typehwy으로 오름차순, mpg는 내림차순으로 정렬조회

View(result2)
# - 별도의 뷰어창을 통해서 요약집계 결과내용 확인
# - 특정변수를 기준으로 정렬도 가능함

###############################################################################
### base::tapply() 이용 집계작업

tapply(X = mtcars$mpg, 
       INDEX = list(mtcars$cyl), 
       FUN = mean, na.rm = T)
# - INDEX 옵션에 설정해주는 기준변수가 1개이므로 그냥 INDEX = mtcars$cyl라고 해도 됨
# - tapply() 괄호안에 매번 abc$ 붙이는 것을 해소하려면, with({})을 사용하면 됨
# - with(mtcars, {tapply(X = price, INDEX = list(gender), FUN = mean)})

# ------------------------------------------------------
mtcars$cyl2 <- factor(mtcars$cyl, 
                      levels = c(4, 6, 8), 
                      labels = c("4기통", "6기통", "8기통"))
# - cly변수를 팩터화해 4 = "4기통", 6 = "6기통", 8 = "8기통"으로 레이블을 붙임

tapply(mtcars$mpg, mtcars$cyl2, mean, na.rm = T)
# - cyl 유형별 연비(mpg) 특성을 평균값을 통해 비교해 봄
# - tapply()의 인수명을 생략했고, 요약집계 기준변수도 1개라서 list() 표시 마저도 없애 간략화 함

# ------------------------------------------------------
mtcars$gear2 <- factor(mtcars$gear, 
                       levels = c(3, 4, 5), 
                       labels = c("3단", "4단", "5단"))
# g- ear변수를 팩터화해 3 = "3단", 4 = "4단", 5 = "5단"으로 레이블을 붙임

tapply(mtcars$mpg, list(mtcars$cyl2, mtcars$gear2), mean, na.rm = T)
# - 요약집계 변수로 1순위 cyl2, 2순위 gear2를 설정해서 요약집계 함
# - cyl2 4, 6, 8기통 X gear2 3, 4, 5단 간 복합 요약집계 그룹을 만들어 교차테이블 형식으로 분석함
# - 이 교차테이블에서도 8기통 X 4단 그룹은 NA로 나타나 해당 스펙 차종은 없는 것으로 판단됨
# - 이 구문도 with(mtcars, {})를 통해 간단하게 표현할 수 있음
# - with(mtcars, {tapply(mpg, list(cyl2, gear2), mean, na.rm = T)})

result <- tapply(mtcars$mpg, list(mtcars$cyl2, mtcars$gear2), mean, na.rm = T)
View(result)

# ------------------------------------------------------
mtcars$am2 <- factor(mtcars$am, levels = c(0, 1), labels = c("수동", "자동"))
# - am변수를 팩터화해 0 = "자동", 1 = "수동"으로 레이블을 붙임

tapply(mtcars$mpg, 
       list(mtcars$cyl2, 
            mtcars$gear2, 
            mtcars$am2), 
       mean, na.rm = T)
# - 요약집계 기준변수로 1순위 cyl2, 2순위 gear2, 3순위 am2를 설정해 3중 복합 요약집계를 실시함
# - 기존의 cyl2 X gear2간의 교차테이블이 am = 자동 레이어(층)과 am = 수동 레이어로 3차원으로 나타남
# - 간단히 with(mtcars, {tapply(mpg, list(cyl2, gear2, am2), mean)})

# ==> 이를 통해 tapply()는 단일 요약집계 기준변수를 통해 다중 결과변수들 간의
#     요약집계 그룹별 분석결과를 확인할 수 있음

###############################################################################
### psych::describeBy() 이용 집계작업

# install.packages(psych)
library(psych)

## 요약집계변수 1개 + 요약결과변수 1개
describeBy(x = mtcars[1], 
           group = mtcars$am)

describeBy(x = mtcars[1], 
           group = mtcars$am, mat = TRUE)

## 요약집계변수 1개 + 요약결과변수 여러개
describeBy(mtcars[c(1, 3)], 
           mtcars$gear)

describeBy(mtcars[c(1, 3)], 
           mtcars$gear, mat = TRUE)

## 요약집계변수 다차원 + 요약결과변수 여러개
describeBy(mtcars[c(1, 3)], list(mtcars$gear, mtcars$am))
describeBy(mtcars[c(1, 3)], 
           list(mtcars$gear, 
                mtcars$am), 
           mat = TRUE)

### End of Source #############################################################

###############################################################################
## 요약집계(aggreagation)를 이용한 그룹간 특성차이분석
###############################################################################

## 요약집계 분석개념
# - 요약집계 기준변수에 따라 요약집계 결과변수의 특성치를 비교분석하는 방법
# - 요약집계 기준변수는 범주형 변수로 여러개의 그룹/집단으로 구성됨
# - 요약집계 결과변수는 연속형 변수로 다양한 기술통계함수를 적용해 특성차이를 비교함

## 요약집계 함수사용방법
# - 요약집계 함수에 입력하는 기준변수와 결과변수의 입력방식에 따라 
#   인수설정방식과 관계식 설정방식으로 나눔

# (1) 인수설정방식
# - 요약집계 함수에 기준변수와 결과변수를 일반적인 기능함수의 
#   인수/인자/파라미터 설정방식으로 입력하는 방법
# - stats::aggregate(), base::tapply() 함수가 대표적임 

# (2) 관계식 설정방식
# - 요약집계 함수에 기준변수와 결과변수간 관계를 
#   일종의 관계식(formula) 형식으로 설정하는 방식
# - 관계식(포뮬러; formula) 방식을 사용하면 인수설정방식에 비해서 
#   변수간의 관계를 직접적으로 묘사해 보다 직관적인 분석관계를 이해+설정할 수 있음
# - stats::aggregate(), doBy::summaryBy() 함수가 대표적임

###############################################################################
## 2. 관계식 설정방식에 대한 예제: ggplot2::mpg 데이터셋을 이용 
###############################################################################

## 요약집계를 위한 데이터셋 준비

 install.packages("ggplot2")
library(ggplot2)
data(package = "ggplot2")
data(mpg, package = "ggplot2")
help(mpg)

mpg
str(mpg)

# --------------------------------------------------
## 집계기준 대상변수들에 대해 팩터화를 통해 레이블 반영

## cyl(실린더 유형) 변수 팩터화
table(mpg$cyl)
mpg$cyl.f <- factor(mpg$cyl, levels = c(4, 5, 6, 8),
                    labels = c("4기통", "5기통", "6기통", "8기통"),
                    ordered = TRUE)

## drv(구동방식) 변수 팩터화
table(mpg$drv)
mpg$drv.f <- factor(mpg$drv, levels = c("4", "f", "r"),
                    labels = c("4륜구동", "전륜구동", "후륜구동"),
                    ordered = TRUE)

## fl(연료유형) 변수 팩터화
table(mpg$fl)
mpg$fl.f <- factor(mpg$fl, levels = c("c", "d", "e","p", "r"),
                   labels = c("압축천연가스", "디젤", "에타놀", "프리미엄", "일반"),
                   ordered = TRUE)

## class(차량유형) 변수 팩터화
table(mpg$class)
mpg$class.f <- factor(mpg$class, 
                      levels = c("2seater", "subcompact", "compact", 
                                 "midsize", "suv", "minivan", "pickup"),
                      labels = c("2인승", "경차", "소형차",
                                 "중형차", "SUV", "미니밴", "픽업트럭"),
                      ordered = TRUE)

## trans(기어방식) 변수 범주화 & 팩터화 
table(mpg$trans)
# install.packages("doBy")
library(doBy)
mpg$trans.c <- recodeVar(mpg$trans,
                         src = list(c("auto(av)", "auto(l3)", "auto(l4)",
                                      "auto(l5)", "auto(l6)", "auto(s4)",
                                      "auto(s5)", "auto(s6)"),
                                    c("manual(m5)", "manual(m6)")),
                         tgt = list("자동기어", "수동기어"))

str(mpg$trans.c) 
# - 문자열(chr) 형식으로 단순 리코딩된 데이터

mpg$trans.f <- factor(mpg$trans.c, 
                      levels = c("자동기어", "수동기어"),
                      ordered =  TRUE)
# - 팩터형으로 추가작업한 결과

str(mpg$trans.f) 

# --------------------------------------------------
## 팩터형으로 만든 집계기준 변수 확인
# - cyl.f(실린더유형), drv.f(구동방식), fl.f(연료유형), 
#   class.f(차량유형), trans.f(기어방식) 변수

str(mpg)

###############################################################################
## stats::aggregate() 이용 요약집계 작업

## 요약집계 기준변수 다차원 + 요약집계 결과변수 1개인 상황 
##formula 왼쪽 독립 - 오른쪽 투입변수 
## 전륜 << 사륜 << 후륜 연비효율이 낮아진다. 
aggregate(formula = hwy ~ drv, data = mpg, FUN = mean, na.rm = TRUE)
aggregate(formula = hwy ~ drv.f, data = mpg, FUN = mean, na.rm = TRUE)
# - formula, data, FUN 옵션사용

# + trans 뜻 ?
aggregate(hwy ~ drv + trans, mpg, mean, na.rm = TRUE)
aggregate(hwy ~ drv.f + trans.f, mpg, mean, na.rm = TRUE)

aggregate(hwy ~ fl + drv + trans, mpg, mean, na.rm = TRUE)
aggregate(hwy ~ fl.f + drv.f + trans.f, mpg, mean, na.rm = TRUE)
# - formula, data, FUN 옵션사용없이 바로 인수값 설정도 가능
# - 요약집계 기준변수를 1개에서 필요한 만큼 추가해 다차원 분석이 가능함

# ------------------------------------------------------
## 요약집계변수 다차원 + 요약결과변수 다차원인 상황
## 종속변수 cty를 추가함
## cbind : 컬럼 바인듯 뜻 
aggregate(cbind(hwy, cty) ~ drv.f, mpg, mean, na.rm = TRUE)
aggregate(cbind(hwy, cty) ~ drv.f + trans.f, mpg, mean, na.rm = TRUE)
aggregate(cbind(hwy, cty, displ) ~ fl.f + drv.f + trans.f, mpg, mean, na.rm = TRUE)
# - 요약집계 기준변수를 1개에서 필요한 만큼 추가할 수 있으며,
#   동시에 요약집계 결과변수도 1개에서 필요한 만큼 추가해 다차원 분석이 가능함
# - 요약집계 기준변수는 단순히 플러스(+) 기호로 추가하면 되며,
#   요약집계 결과변수는 cbind() 함수로 연결해 나가도로 코딩규칙이 되어 있음

# ------------------------------------------------------
out <- aggregate(cbind(hwy, cty, displ) ~ fl.f + drv.f + trans.f, 
                 mpg, mean, na.rm = TRUE)
# - 요약집계 분석결과를 별도 객체와 데이터셋 구조로 관리/조회 가능

out[order(-out$hwy, out$cty), ]
# - hwy로 내림차순, cty로 오름차순 정렬시킴

View(out)
# - 별도의 뷰어창을 통해서 요약집계 결과내용 확인
# - 특정변수를 기준으로 정렬도 가능함

###############################################################################
## doBy::summaryBy() 이용 요약집계 작업

# install.packages("doBy")
library(doBy)

## 요약집계 기준변수 다차원 + 요약집계 결과변수 1개인 상황 
##formula 왼쪽 독립 - 오른쪽 투입변수 
mpg <- as.data.frame(mpg)
summaryBy(formula = hwy ~ drv.f, data = mpg, FUN = mean, na.rm = TRUE)
# - formula, data, FUN 옵션사용

summaryBy(hwy ~ drv.f + trans.f, mpg, FUN = mean, na.rm = TRUE)
summaryBy(hwy ~ drv.f + trans.f + fl.f, 
          mpg, FUN = mean, na.rm = TRUE)
# - formula, data 옵션은 생략가능하지만 FUN 옵션명은 필수로 표기해야함
# - 요약집계 기준변수를 1개에서 필요한 만큼 추가해 다차원 분석이 가능함

# ------------------------------------------------------
## 요약집계변수 다차원 + 요약결과변수 다차원인 상황
summaryBy(hwy + cty ~ drv.f, mpg, FUN = mean, na.rm = TRUE)
summaryBy(hwy + cty ~ drv.f + trans.f, mpg, FUN = mean, na.rm = TRUE)
summaryBy(hwy + cty + displ ~ drv.f + trans.f + fl.f, 
          mpg, FUN = mean, na.rm = TRUE)
# - 요약집계 기준변수를 1개에서 필요한 만큼 추가할 수 있으며,
#   동시에 요약집계 결과변수도 1개에서 필요한 만큼 추가해 다차원 분석이 가능함
# - 요약집계 기준변수와 결과변수 모두 단순히 플러스(+) 기호로 추가해 나가면 됨
# - formula, data 옵션은 생략가능하지만 FUN 옵션명은 필수로 표기해야함

# ------------------------------------------------------
out2 <- summaryBy(hwy + cty + displ ~ drv.f + trans.f + fl.f, 
                  mpg, FUN = mean, na.rm = TRUE)
# - 요약집계 분석결과를 별도 객체와 데이터셋 구조로 관리/조회 가능

out2[order(-out2$hwy, out2$cty), ]
# - hwy로 내림차순, cty로 오름차순 정렬시킴

View(out2)
# - 별도의 뷰어창을 통해서 요약집계 결과내용 확인
# - 특정변수를 기준으로 정렬도 가능함

### End of Source #############################################################






###############################################################################
## dplyr패키지를 활용한 데이터다루기: 요약집계(aggregation) 하기
# - summarize(), group_by(), arrange()
###############################################################################

###############################################################################
## 요약집계를 위한 데이터셋 준비: ggplot2::diamonds 데이터셋 이용
# install.packages("ggplot2")
library(ggplot2)
data(package = "ggplot2")
data(diamonds, package = "ggplot2")
help(diamonds)

diamonds
str(diamonds)

## diamonds 코딩북
# 다이아몬드 등급 결정기준 4C: carat, cut, color, clarity
# carat: 무게/순도를 의미함 --> 순금의 1/24을 1캐럿으로 나타냄 
# cut: 커팅품질(다이아몬드의 광채를 결정함) --> Fair, Good, Very Good, Premium, Ideal
# color: 색상 --> J(worst) to D(best)
# clarity: 투명도 --> I1(worst), SI1, SI2, VS1, VS2, VVS1, VVS2, IF(best)

# table: 다이아몬드의 제일 상단 평면의 폭 --> 43 ~ 95
# price: 다이아몬드의 가격 --> $326 ~ $18,823

# x: 길이(mm) 다이아몬드를 위에서 보았을 때 상대적으로 기다란 가로특성 --> 0 ~ 10.74
# y: 폭(mm) 다이아몬드를 위에서 보았을 때 상대적으로 짧은 세로특성 --> 0 ~ 58.9
# z: 깊이(mm) --> 0 ~ 31.8 
#    - 적정한 깊이(빛이 위쪽으로 반사), 너무 높거나 낮은 깊이는 빛반사가 떨어짐
# depth: x(길이mm)와 y(폭mm) 대비 z(깊이mm)의 비율을 계산한 값

###############################################################################
## 데이터셋에 있는 변수컬럼에 대해 다양한 기술통계 함수를 적용해 개별 요약
# - summarize() 기능함수명은 여러 패키지에서 사용하고 있으므로
#   dplyr::summarize()처럼 명시적으로 코딩하는 것이 좋음

# ------------------------------------------------------
## (A-1) 특정 변수컬럼 1개를 단순 요약

## 기본 기술통계함수 개별사용
mean(diamonds$price)
x <- mean(diamonds$price)

names(x) <- "AvgPrice" 
x
# - 산술평균값에 별도 이름부여

## dplyr::summarize() 기능함수 이용방식
dplyr::summarize(diamonds, mean(price))
diamonds %>% dplyr::summarize(mean(price))

dplyr::summarize(diamonds, 
                 Avg_Price = mean(price))
diamonds %>% dplyr::summarize(Avg_Price = mean(price))
# - 산술평균값에 별도 이름부여

# ------------------------------------------------------
## (A-2) 특정 변수컬럼 1개를 여러 기술통계로 요약

## 기본 달러$ 또는 대괄호[] 연산자 사용방식
mean(diamonds$price)
median(diamonds$price)
var(diamonds$price)
sd(diamonds$price)
# - 개별적으로 기술통계량 값을 구함

x1 <- mean(diamonds$price)
x2 <- median(diamonds$price)
x3 <- var(diamonds$price)
x4 <- sd(diamonds$price)

x.all <- c(x1, x2, x3, x4)
x.all

names(x.all) <- c("Avg_Price", "Medi_Price", "Var_Price", "SD_Price")
x.all
# - 기술통계 값들에 별도로 이름을 부여함

## dplyr::summarize() 기능함수 이용방식
dplyr::summarize(diamonds, 
                 Avg_Price = mean(price),
                 Medi_Price = median(price), 
                 Var_Price = var(price),
                 SD_Price = sd(price))

diamonds %>% dplyr::summarize(Avg_Price = mean(price),
                              Medi_Price = median(price), 
                              Var_Price = var(price),
                              SD_Price = sd(price))
# - dplyr::summarize() 기능함수를 이용해 한번의 diamonds 데이터셋 지정으로
#   여러가지 기술통계량을 쉽게 구할 수 있으며, 각 결과값에 별로 레이블 반영용이함

###############################################################################
## 요약집계 기준변수에 따라 요약집계 결과변수의 특성치를 비교분석
# - group_by() 함수를 이용해 요약집계 기준(범주형)변수를 필요한 만큼 설정가능 
# - dplyr::summarize() 함수로 요약집계 결과(연송혁)변수를 필요한 만큼 설정하고
#   다양한 기술통계함수를 적용해서 비교할 수 있음
# - arrange() 함수를 이용해 요약집계 결과 중 기준을 정해 내림/올림차순 정렬가능 

# ------------------------------------------------------
## (B-1) 요약집계 기준변수 1개로 요약집계 결과변수 1개를 분석
# - 커팅품질(cut)에 따른 가격(price) 비교를 평균값을 기준으로 내림차순 정렬
library(dplyr)
## 일련의 작업진행에 필요한 중간 연결변수객체 이용방식
dd.grouped <- group_by(diamonds, cut)
dd.grouped
# - diamonds 데이터셋에 대해 cut변수컬럼을 요약집계 기준으로 설정해 
#   별도의 그룹데이터로 분리하고 dd.grouped 객체에 저장함

dd.sumed <- dplyr::summarize(dd.grouped, Avg_Price = mean(price))
dd.sumed
# - 요약결과변수로 price와 carat 변수를 설정하고 평균값으로 요약집계를 실시하여
#   dd.sumed 객체에 저장함

dd.arranged <- arrange(dd.sumed, desc(Avg_Price))
dd.arranged
# - 요약집계 기준변수에 따라 요약집계 결과변수의 내용을 정렬해 
#   dd.arranged객체에 저장함

# ------------------------------------------------------
## 파이프 연산자 %>%를 이용한 간결한 코딩방식
diamonds %>% 
  group_by(cut) %>%
  dplyr::summarize(Avg_Price = mean(price)) %>% 
  arrange(desc(Avg_Price))
# - 중간중간 작업진행에 따라 임시 연결변수가 불필요함
# - group_by()함수를 이용해 요약집계 기준변수로 cut변수컬럼을 지정함
# - summarize() 함수를 이용해 cut변수컬럼에 속한 5개 다이아몬드커팅 품질에 따라 
#   요약집계 결과변수인 다이아몬드 가격을 요약집계함
# - arrange() 함수를 사용해 요약집계한 평균가격을 내림차순으로 정렬함 

# ------------------------------------------------------
## (B-2) 요약집계 기준변수 여러 개로 요약집계 결과변수 여러 개를 다차원 분석

## 파이프 연산자 %>%를 이용한 간결한 코딩방식
diamonds %>% 
  group_by(cut, color) %>%
  dplyr::summarize(Avg_Price = mean(price),
                   Avg_Carat = mean(carat)) %>% 
  arrange(desc(Avg_Price), Avg_Carat)

###############################################################################
## 요약집계를 위한 데이터셋 준비: ggplot2::mpg 데이터셋 이용
# install.packages("ggplot2")
library(ggplot2)
data(package = "ggplot2")
data(mpg, package = "ggplot2")
help(mpg)

mpg
str(mpg)

# --------------------------------------------------
## 집계기준 대상변수들에 대해 팩터화를 통해 레이블 반영

## cyl(실린더 유형) 변수 팩터화
table(mpg$cyl)
mpg$cyl.f <- factor(mpg$cyl, levels = c(4, 5, 6, 8),
                    labels = c("4기통", "5기통", "6기통", "8기통"),
                    ordered = TRUE)

## drv(구동방식) 변수 팩터화
table(mpg$drv)
mpg$drv.f <- factor(mpg$drv, levels = c("4", "f", "r"),
                    labels = c("4륜구동", "전륜구동", "후륜구동"),
                    ordered = TRUE)

## fl(연료유형) 변수 팩터화
table(mpg$fl)
mpg$fl.f <- factor(mpg$fl, levels = c("c", "d", "e","p", "r"),
                   labels = c("압축천연가스", "디젤", "에타놀", "프리미엄", "일반"),
                   ordered = TRUE)

## class(차량유형) 변수 팩터화
table(mpg$class)
mpg$class.f <- factor(mpg$class, 
                      levels = c("2seater", "subcompact", "compact", 
                                 "midsize", "suv", "minivan", "pickup"),
                      labels = c("2인승", "경차", "소형차",
                                 "중형차", "SUV", "미니밴", "픽업트럭"),
                      ordered = TRUE)

## trans(기어방식) 변수 범주화 & 팩터화 
table(mpg$trans)
# install.packages("doBy")
library(doBy)
mpg$trans.c <- recodeVar(mpg$trans,
                         src = list(c("auto(av)", "auto(l3)", "auto(l4)",
                                      "auto(l5)", "auto(l6)", "auto(s4)",
                                      "auto(s5)", "auto(s6)"),
                                    c("manual(m5)", "manual(m6)")),
                         tgt = list("자동기어", "수동기어"))

str(mpg$trans.c) 
# - 문자열(chr) 형식으로 단순 리코딩된 데이터

mpg$trans.f <- factor(mpg$trans.c, 
                      levels = c("자동기어", "수동기어"),
                      ordered =  TRUE)
# - 팩터형으로 추가작업한 결과

str(mpg$trans.f) 

# --------------------------------------------------
## 팩터형으로 만든 집계기준 변수 확인
# - cyl.f(실린더유형), drv.f(구동방식), fl.f(연료유형), 
#   class.f(차량유형), trans.f(기어방식) 변수

str(mpg)

# --------------------------------------------------
## (C-1) 요약집계 기준변수 1개로 요약집계 결과변수 1개를 분석

## 기본 aggregate() 함수의 포뮬러 설정방식
aggregate(formula = hwy ~ drv.f, 
          data = mpg, 
          FUN = mean, na.rm = TRUE)

## magrittr::%>% 파이프 연산자와 dplyr::group_by()와 summarize() 이용방식
mpg %>% 
  group_by(drv.f) %>%
  dplyr::summarize(Avg_hwy = mean(hwy, na.rm = TRUE)) %>% 
  arrange(desc(Avg_hwy))

# --------------------------------------------------
## (C-2) 요약집계 기준변수 여러 개 요약집계 결과변수 1개를 분석

## 기본 aggregate() 함수의 포뮬러 설정방식
aggregate(hwy ~ drv.f + trans.f, 
          mpg, mean, na.rm = TRUE)
aggregate(hwy ~ fl.f + drv.f + trans.f, 
          mpg, mean, na.rm = TRUE)

## magrittr::%>% 파이프 연산자와 dplyr::group_by()와 summarize() 이용방식
mpg %>% 
  group_by(trans.f, drv.f) %>%
  dplyr::summarize(Avg_hwy = mean(hwy, na.rm = TRUE)) %>% 
  arrange(desc(Avg_hwy))

mpg %>% 
  group_by(trans.f, drv.f, fl.f) %>%
  dplyr::summarize(Avg_hwy = mean(hwy, na.rm = TRUE)) %>% 
  arrange(desc(Avg_hwy))

# --------------------------------------------------
## (C-3) 요약집계 기준변수 다차원 + 요약집계 결과변수 다차원 분석

## 기본 aggregate() 함수의 포뮬러 설정방식
aggregate(cbind(hwy, cty) ~ drv.f + trans.f, 
          mpg, mean, na.rm = TRUE)
aggregate(cbind(hwy, cty, displ) ~ fl.f + drv.f + trans.f, 
          mpg, mean, na.rm = TRUE)

## 파이프 연산자 %>%를 이용한 간결한 코딩방식
mpg %>% 
  group_by(trans.f, drv.f) %>%
  dplyr::summarize(Avg_hwy = mean(hwy, na.rm = TRUE), 
                   Avg_cty = mean(cty, na.rm = TRUE)) %>% 
  arrange(desc(Avg_hwy), desc(Avg_cty))

mpg %>% 
  group_by(trans.f, drv.f, fl.f) %>%
  dplyr::summarize(Avg_hwy = mean(hwy, na.rm = TRUE), 
                   Avg_cty = mean(cty, na.rm = TRUE)) %>% 
  arrange(desc(Avg_hwy), desc(Avg_cty))

### End of Source #############################################################

grep(pattern="^21",
     x = ames_raw$`Year Built`,
     ignore.case = TRUE 
) 

if_else(ames_raw$`Year Built` > 2018,TRUE,FALSE)
;
View(ames_raw)



mpg[,sort(names(mpg))]
mpg[,c("class"     ,"cty"    ,"trans"       ,"year")]
sort()



#반복구문(for.while) 그리고 사용자정의함수(user defined function)
###########################################################
#코드블럭
#####반복구문 for
##1. 1부터 100까지 연속으로 더하기
# 반복구문에서 사용할 변수의 초기값 설정
sum <- 0
for ( i in 1:100)  #반복 조건 설정
  sum <- sum + i    #실질적 반복대상 코딩
sum

#아래 세 가지 모두 같음
for ( i in 1:100) sum <- sum + i
for ( i in 1:100) sum <- (sum + i)
for ( i in 1:100)
  sum <- sum + i

sum   #반복실행 결과 출력

#하드코딩 : 소스코드를 찾아야하고 코드라인 중에서 원하는 작업을 다르게 하고 싶으면
#           인수자리를 바꿔야하는 코딩

#--------------------------------
# 이를 대신할 R 벡터함수
cumsum(1:100)
# 소프트 코딩 : 원하는 걸 쉽게 넣을 수 있음
# 누적합(cumulative sum)함수
# 벡터의 마지막 요소값을 인덱싱하는 방법
x <- cumsum(1:100)
x[length(x)] # 100번째 요소값만 필터링
rev(x)[1]    # reverse로 역순으로 배치됨 (마지막 요소가 맨 처음으로 옴)
tail(x, n=1)    # 제일 끝에 있는 것 한 개만 보겠다.
dplyr::last(x)  # dplyr::first(x) 도 있음(맨 처음, 맨 끝에 존재하는 값 조회)


#####반복구문 while

j <- 1
total <- 0

while (j <= 100) {
  
  total <- total + j
  
  j <- j+1    }


total
#------------------------------------------------------
#####사용자정의함수(user defined function)
#### addto() 함수를 이용해서 사용자 함수를 직접 짜보자!

addto<-function(num){        #사용자정의함수명{ 인수명 설정 num=인수, 인자, 파라미터
  #인수명이 여러개일 경우 하나쓰고 (,) 콤마하고 또 쓰면 됨
  #addto(c(3,8,7))
  #----------------------------
  sum<-0                     #
  for (i in 1:num){          # 실질적 실행대상 코드블럭 ex)1:50이면 50번정도 루프가 돌아간다는 뜻
    sum <- sum + i           #
  }                          # 하나씩 꺼내어 쓰되, 다 쓰면 종료하게 됨
  #----------------------------
  return(sum)}              #최종적 사용자정의함수 실행결과 반환
addto
#실행대상 코드블럭을 언제든지 addto라는 함수를 이용해서 쓰겠다.
#addto라는 이름으로 작명을 했기 때문에 addto 라는 함수로 쓸 수  있다.
#addto(num=)로 쓸 수 있다.

search()
addto(100)
addto(num=100)
addto(n = 100)
addto(nu = 100)

#----------------------------------------------------------
addto <- function(from, to){
  sum <- 0
  for (i in from:to) {
    sum <- sum + i
  }
  return(sum)}

addto

search()
addto(from=1, to=100)
addto(to=100, from=1)  #위치를 바꿔도 잘 작동됩니다.
addto(1,100)
addto(from=1,100)
addto(fr=1, 100)

#----------------------------------------------------------

addto <- function(from, to){
  sum <-0
  for (i in from:to) {
    sum <- sum + i
  }
  names(sum) <- paste(from, "부터", to, "까지 합산결과", sep="")
  return(sum)}
addto
addto(2, 48)
addto(25, 489)

######################################################################
### apply() 함수 사용예
######################################################################

# 사용목적: 특정 데이터셋 대해 가로방향(행단위)으로,
#           또는 세로방향(열단위)으로 필요한 함수를 일괄 적용해줌

# ---------------------------------------
## 간단 데이터 생성
m <- matrix(1:9, nrow = 3)
m
#데이터를 컬럼방향으로 입력하고 있다는 것 확인 가능함
# byrow=T 라는 옵션을 추가하면 행렬방향으로 입력함


## 행렬데이터에 대한 가로 & 세로 방향 연산
rowSums(m)
# - 행렬데이터 m객체에 대해 가로방향으로 각 행(row)별로 합(sum)을 구함
colSums(m)
# - 행렬데이터 m객체에 대해 세로방향으로 각 열(col)별로 합(sum)을 구함

# ---------------------------------------
## apply() 함수를 이용한 가로 & 세로 방향 연산
apply(m, 1, sum)
# 1은 가로방향
# - m객체에 들어 있는 데이터에 대해서 가로방향(인수 1)으로
#   sum()함수를 한줄 한줄 적용한 결과

apply(m, 2, sum)
# 2는 세로방향
# - m객체에 들어 있는 데이터에 대해서 세로방향(인수 2)으로
#   sum()함수를 한칸 한칸 적용한 결과

# - rowSums() vs. apply()
# - rowSums는 가로방향으로 총합만 구할수 있음
# - apply()는 가로/세로방향으로 다양한 함수를 사용할 수 있음

# ---------------------------------------
## 가로방향 연산결과에 대한 동일성 검토
identical(rowSums(m), apply(m, 1, sum))

str(rowSums(m)) # 데이터유형은 숫자, 객체형식은 실수벡터(num)임
str(apply(m, 1, sum)) # 데이터유형은 숫자, 객체형식이 정수(int)임

# - rowSums()와 apply() 산출결과의 형식은 달라도 숫자내용은 동일하며
#   실수, 정수간 서로 형식 변환이 가능하므로 문제없음

rowSums(m) %>% as.integer %>% str # 실수벡터(num)를 정수벡터(int)로 변환
apply(m, 1, sum) %>% as.numeric %>% str # 정수벡터(int)를 실수벡터(num)로 변환

# ---------------------------------------
## apply() 함수 적용시 데이터셋에 NA가 있는 경우
m[2, 1] <- NA
m

colSums(m) # 사칙연산에서 NA가 있으면 결과도 NA로 나옴
colSums(m, na.rm = TRUE) # NA를 제외한 실제 데이터만 갖고 사칙연산수행

apply(m, 2, sum) # 사칙연산에서 NA가 있으면 결과도 NA로 나옴
apply(m, 2, sum, na.rm = TRUE)  # NA를 제외한 실제 데이터만 갖고 사칙연산수행

######################################################################
## 학생명부 데이터프레임 생성을 통한 apply() 함수 적용예

student <- c("John Davis","Angela Williams","Bullwinkle Moose",
             "David Jones","Janice Markhammer", "Cheryl Cushing",
             "Reuven Ytzrhak", "Greg Knox","Joel England","Mary Rayburn")
math <- c(502, 600, 412, 358, 495, 512, 410, 625, 573, 522)
science <- c(95, 99, 80, 82, 75, 85, 80, 95, 89, 86)
english <- c(25, 22, 18, 15, 20, 28, 15, 30, 27, 18)

## data.frame 객체형태로 가공
roster.df <- data.frame(student,
                        math,
                        science,
                        english,
                        stringsAsFactors=FALSE)
#팩터형으로 만들지 말라는 뜻
roster.df
str(roster.df)


## tibble 객체형태로 가공
# install.packages("tibble)
library(tibble)

roster.tb <- tibble(student, math, science, english)
str(roster.tb)

## 또는 data.frame객체를 tibble 객체로 변환
roster <- as_tibble(roster.df)
roster
str(roster)

#수학은 만점이 700, 과학은 100, 영어는 30점
#데이터의 단위나 범위가 천차만별일 때, 동일한 기준으로 맞춰주는 작업을 스케일링한다고 함
#과목 점수를 -1 ~1 또는 0~1사이로 만드는 등의 표준화
#표준화 작업은 딥러닝할 때 배움

# ---------------------------------------
## 학생명부 데이터에 apply() 함수를 바로 적용한 경우
apply(roster[2:4], 1, mean) #가로방향 평균
# - roster를 가로방향으로, 각 행별로, 각 레코드별로, 각 관찰치별로
#   개별 학생들의 평균성적 도출
# - 각 과목별 스케일(단위 & 범위)가 달라 바람직하지 않음

apply(roster[2:4], 2, mean) #세로방향 평균
# - roster df를 세로방향으로, 각 열별로, 각 변수컬럼별로, 각 피처별로
#   개별 과목들의 평균성적 도출
# - 각 과목별 평균점수를 구했으나 스케일이 달라 상호비교 어려움

######################################################################
## 학생명부 데이터에 스케일링(scailing) 실시후 평균점수 산출
# - 스케일링: 동시에 사용할 변수들의 단위와 범위가 다를 때
#   비례축소/크기변환을 통해 표준화 하는 방법
# - math: 700점만점, science: 100점만점(현행유지), english: 30점만점

## 모든 과목을 100점 만점으로 표준화

# install.packages("magrittr")
library(magrittr)
# - 파이프 %>% 연산자 사용을 위한 패키지 로딩

roster$math100 <- round((roster$math * 100) / 700, 1)
roster$eng100 <- ((roster$english * 100) / 30) %>% signif(1)
# - Math 700점 만점, Science 100점 만점, English 30점 만점으로 가정
# - science과목은 100점 만점 기준으로 수집된 데이터로 간주해 스케일링 작업없음

head(roster)
head(roster[c(3, 5, 6)])
# - 100점만점 기준으로 스케일링된 결과확인

# ---------------------------------------
## 100점만점 스케일링된 학생명부 데이터에
# - apply() 함수를 적용해 개인별 성적평균과 표준편차 계산

roster$st.avg <- apply(roster[c(3, 5, 6)], 1, mean) %>% round(1)
roster$st.sd <- apply(roster[c(3, 5, 6)], 1, sd) %>% round(1)
# c(3, 5, 6) 대신에 과목명을 넣어도 됨 "과목명","과목명","과목명"
# - roster df를 가로방향으로, 각 행별로,
#   개별 학생들의 평균성적과 표준편차 도출
# - 여러과목의 평균점수를 통해서 개인별 학습능력을 판단할 수 있음
# - 여러과목의 표준편차를 통해서 개인별 과목간 편차가 어느정도인지 확인가능함

roster
roster[-c(2, 4)]

# install.packages("dplyr")
library(dplyr)
# - 데이터셋 처리패키지 기능 중 정렬(arrange) 기능사용을 위한 패키지 로딩

arrange(roster, desc(st.avg), st.sd)
roster %>% arrange(desc(st.avg), st.sd)
# - 학생들의 성적평균(st.avg)를 1순위로 내림차순 정렬해
#   어느학생이 우수한지 상대적으로 취약한지 파악가능
# - 학생들의 성적표준편차(st.sd)를 2순위로 오름차순 정렬해
#   평균이 동일할 때 어느학생이 상대적으로 과목간 편차가 안정적인지 파악가능

# ---------------------------------------
## 과목별 평균점수 산출
sj.avg <- apply(roster[c(3, 5, 6)], 2, mean) %>% round(1)
sj.avg
sj.sd <- apply(roster[c(3, 5, 6)], 2, sd) %>% round(1)
sj.sd

## 과목별 성적산출 결과취합
tibble(sj.avg, sj.sd)
result <- tibble(names(sj.avg), sj.avg, sj.sd)
result

arrange(result, desc(sj.avg), desc(sj.sd))
# - 학생들의 성적평균(st.avg)를 1순위로 내림차순 정렬
# - 학생들의 성적표준편차(st.sd)를 2순위로 내림차순 정렬

### End of Source ####################################################


#-------------------------------
#리스트 형식 데이터객체 생성
ex <- list(A = matrix(1:12, 3),  #매트릭스 데이터  #byrow=T 하면 가로방향으로 채워짐
           B = 1:5,              #벡터 데이터
           C = matrix(1:4, 2),
           D = rep(c(2,4),3))    #반복문 3번 반복
ex
ex$A
ex[[1]]

ex$A[2, ]

sum(ex$A)
sum(ex$B)
sum(ex$C)
sum(ex$D)
sum(ex[[1]])
sum(ex[[2]])
sum(ex[[3]])
sum(ex[[4]])


result <- c()
result

for (i in 1:NROW(ex)) {
  result[i] <- sum(ex[[i]])
}
#1~4 즉, A~D를 호출해서 합을 구하고 있다.
# sum 값을 result[i]에 집어넣어

result
result[2]

sapply(ex, sum)
# simple+ apply
# 심플하게 ex 의 요소들을 sum 해라

lapply(ex, sum)
#


#
student <- c("John Davis","Angela Williams","Bullwinkle Moose",
             "David Jones","Janice Markhammer", "Cheryl Cushing",
             "Reuven Ytzrhak", "Greg Knox","Joel England","Mary Rayburn")
math <- c(502, 600, 412, 358, 495, 512, 410, 625, 573, 522)
science <- c(95, 99, 80, 82, 75, 85, 80, 95, 89, 86)
english <- c(25, 22, 18, 15, 20, 28, 15, 30, 27, 18)

# first name 또는 Last name만 따서
# ~~님 반갑습니다. 라는 letter에 집어넣기
library(tibble)
roster <- tibble(student, math, science, english)
roster

rm(list=ls())
gc()
# 메모리에 로딩, 생성 되어 있는것 지우기(이전 것과 충돌되지 않도록)
# 이전 작업에서 남아 있는 청소


# 학생 성명을 성과 이름으로 분리
out <- strsplit(roster$student, split=" ")
#strsplit = string split 문자 분리
out

##참고
unlist(out)  #리스트가 아닌 벡터로 보여줌

#이름은 이름대로 잘라서 독립변수,
#성은 성대로 잘라서 독립변수,
#각각의 list항목에 접근하는 방법 lapply, sapply


fst.name <- sapply(out, "[", 1)
fst.name
str(fst.name)
#fst.name <- sapply(리스트명(전체데이터), 함수, n번째줄(컬럼))
#                             "[" = 추출한다는 함수
#리스트 전체에 함수를 적용

lst.name <- sapply(out, "[", 2)
lst.name
str(lst.name)
## data.frame 정형데이타 생성
final <-data.frame(roster, fst.name, lst.name)
final

# 전처리할 때 많이 쓰는 기법
# 예를 들어, 주소를 분리 시/군/구 등으로

final <- final[c(1, 5:6, 2:4)]
# 컬럼 순서 재배치
final

fst.name2 <- lapply(out,"[",1)
las.name2 <- lapply(out,"[",2)
str(fst.name2)
fst.name2 <- unlist(fst.name2)
las.name2 <- unlist(las.name2)

out

result <-data.frame(roster, fst.name2,las.name2)

result.t <-tibble(roster, fst.name2,las.name2)



library(dplyr)
library(magrittr)
library(tidyr)

roster %<>% tidyr::separate(student,
                            into = c("f.name","l.name"),
                            sep = " ")
roster %<>% tidyr::unite(col = full.name,
                         f.name, l.name,
                          sep=" ")


#------------------------------------------------------------------------------------------------------------------------------------
# 2018.09.17 ~ 2018.09.21
#------------------------------------------------------------------------------------------------------------------------------------
#
student <- c("John Davis","Angela Williams","Bullwinkle Moose",
             "David Jones","Janice Markhammer", "Cheryl Cushing",
             "Reuven Ytzrhak", "Greg Knox","Joel England","Mary Rayburn")
math <- c(502, 600, 412, 358, 495, 512, 410, 625, 573, 522)
science <- c(95, 99, 80, 82, 75, 85, 80, 95, 89, 86)
english <- c(25, 22, 18, 15, 20, 28, 15, 30, 27, 18)

# first name 또는 Last name만 따서
# ~~님 반갑습니다. 라는 letter에 집어넣기
library(tibble)
roster <- tibble(student, math, science, english)
roster

##rm(list=ls())
##gc()
# 메모리에 로딩, 생성 되어 있는것 지우기(이전 것과 충돌되지 않도록)
# 이전 작업에서 남아 있는 청소


# 학생 성명을 성과 이름으로 분리
out <- strsplit(roster$student, split=" ")
#strsplit = string split 문자 분리
out

##참고
unlist(out)  #리스트가 아닌 벡터로 보여줌

#이름은 이름대로 잘라서 독립변수,
#성은 성대로 잘라서 독립변수,
#각각의 list항목에 접근하는 방법 lapply, sapply


fst.name <- sapply(out, "[", 1)
fst.name
str(fst.name)
#fst.name <- sapply(리스트명(전체데이터), 함수, n번째줄(컬럼))
#                             "[" = 추출한다는 함수
#리스트 전체에 함수를 적용

lst.name <- sapply(out, "[", 2)
lst.name
str(lst.name)
## data.frame 정형데이타 생성
final <-data.frame(roster, fst.name, lst.name)
final

# 전처리할 때 많이 쓰는 기법
# 예를 들어, 주소를 분리 시/군/구 등으로

final <- final[c(1, 5:6, 2:4)]
# 컬럼 순서 재배치
final

fst.name2 <- lapply(out,"[",1)
las.name2 <- lapply(out,"[",2)
str(fst.name2)
fst.name2 <- unlist(fst.name2)
las.name2 <- unlist(las.name2)

out

result <-data.frame(roster, fst.name2,las.name2)

result.t <-tibble(roster, fst.name2,las.name2)


## name 컬럼 추출/재결
library(dplyr)
library(magrittr)
library(tidyr)

roster %<>% tidyr::separate(student,
                            into = c("f.name","l.name"),
                            sep = " ")
roster %<>% tidyr::unite(col = full.name,
                         f.name, l.name,
                         sep=" ")



######################################################################
## 가상의 주민번호 벡터데이터 생성
ssn <- c(920219-2868883, 700617-2382241, 790905-1600179, 850720-2949160, 
         900908-2515523, 670106-1683231, 820224-1532098, 950828-1771741, 
         811208-1363675, 940903-2885073)
ssn 
str(ssn)
# - ssn에 저장된 주민번호들을 숫자로 인식하고, 
#   (-) 기호도 빼기로 인식해 결국 사칙연산이 적용된 숫자 벡터로 나옴


## 가상의 주민번호 문자열벡터로 생성
ssn <- c("920219-2868883", "700617-2382241", "790905-1600179", 
         "850720-2949160", "900908-2515523", "670106-1683231", 
         "820224-1532098", "950828-1771741", "811208-1363675", 
         "940903-2885073")
ssn
str(ssn)
# - 이제는 정상적인 주민번호 양식의 문자열벡터가 만들어 짐

raw <- strsplit(ssn,split = "-")
birth <- lapply(raw, "[",1)
## sapply를 쓰지 않고 lapply를 쓴 이유는 list 구조를 유지해야지만 
## 주문번호 앞,뒤자리를 다시 합칠수 있게 때문에 

## 기존 주민번호 위치 미포함
birth.year <- substring(text=birth,
                        first = c(1,3,5),
                        last = c(2,4,6))

## 리스트 형태로 기존의 주민번호 앞자리 index(위치) 포
birth2 <- lapply(birth,substring,
                 first = c(1,3,5),
                 last = c(2,4,6))

## 단일 문자열 쪼개기 
birth.year <- substr(birth,1,2)
birth.month <- substr(birth,3,4)

birth3 <- lapply(birth,substr,
                 1,2)

id <- lapply(raw,"[",2)
id

## 1: 성별, 2-5: 주소지 6:순번 7:도용 식별번 
id2 <- lapply(id,substring,
                 first = c(1,2,6,7),
                 last = c(1,5,6,7))

######################################################################
## 학생명부 데이터셋에 공통작업 적용하기 

##rm(list = ls())
gc()
# - 메모리에 로딩&생성&가공 되어 있는 모든 객체 클리어
# - 이전 작업에서 남아 있는 학생명부 관련 데이터 일괄삭제를 위함
student <- c("John Davis","Angela Williams","Bullwinkle Moose",
             "David Jones","Janice Markhammer", "Cheryl Cushing",
             "Reuven Ytzrhak", "Greg Knox","Joel England","Mary Rayburn")
math <- c(72, 86, 59, 51, 71, 73, 59, 89, 82, 75)
science <- c(95, 99, 80, 82, 75, 85, 80, 95, 89, 86)
english <- c(80, 70, 60, 50, 70, 90, 50, 100, 90, 60)

## tibble 객체형태로 가공
# install.packages("tibble)
library(tibble)
roster <- tibble(student, math, science, english)
roster

# ---------------------------------------
## 학생성명을 성과 이름으로 분리
out <- strsplit(roster$student, split=" ")
out
# - 개별학생의 성명을 이름과 성으로 분리하고
#   분리된 이름과 성이 서로 섞여 혼란스럽지 않도록 
#   개인별로 하나의 리스트항목 형태로 결과가 반환된 것임

## 참고
unlist(out)
# - 리스트형식을 풀어서 리스트에 들어 있는 모든 리스트항목을
#   하나의 벡터로 만들어 주는 함수
# - 개별학생의 성명을 이름과 성으로 분리한 것은 좋은데, 
#   분리된 이름과 성이 서로 섞여 있어서 후속분속에 어려움이 많음

# - 리스트 형식으로 성명이 성과 이름으로 분리됨

## sapply()를 활용한 부분추출
# - 리스트 형식의 데이터셋에서 각 리스트항목별로 동일한 작업을 적용하는 함수

fst.name <- sapply(out, "[", 1) # out[1]과 동일한 코딩
fst.name
# - out 리스트객체에서 각 리스트항목별로 첫번째 자리에 있는 
#   이름 요소값들만을 추출해 sapply()를 이용해 하나의 벡터로 만들어 줌

lst.name <- sapply(out, "[", 2) # out[2]와 동일한 코딩
lst.name
# - out 리스트객체에서 각 리스트항목별로 두번째 자리에 있는 
#   이름 요소값들만을 추출해 sapply()를 이용해 하나의 벡터로 만들어 줌

final <- data.frame(roster, fst.name, lst.name)
final
# - 원래 학생명부에 분리된 이름, 성 변수컬럼을 추가함

final <- final[c(1, 5:6, 2:4)]
final
# - 원래 학생풀네임 바로 옆에 분리된 이름, 성 변수컬럼을 위치시킨 데이터셋

## 참고사항
cf <- sapply(out, "[", c(1, 2)) # out[c(1, 2)]과 동일한 코딩
cf
# - out 리스트객체에서 각 리스트항목별로 첫번째와 두번째 자리에 있는
#   요소값을 같이 추출해 줌

# ---------------------------------------
## 참고
fir.name <- lapply(out, "[", 1)
fir.name
las.name <- lapply(out, "[", 2)
las.name
# - out 리스트객체에서 이름과 성을 별도로 추출했으나 
#   lapply()는 원래 리스트객체 형태로 저장하게 됨 

## 리스트객체를 벡터포맷으로 변환해 데이터셋으로 구성
fir.name <- unlist(fir.name)   
fir.name
las.name <- unlist(las.name)   
las.name

result <- data.frame(roster, fir.name, las.name)
result

result <- data.frame(roster[1], fir.name, las.name, roster[-1])
result

#-------------------------
## 참고 다음방법도 그레잇함!

library(dplyr)
library(magrittr)
library(tidyr)

roster %<>% tidyr::separate(student,
                            into = c('f.name', 'l.name'), 
                            sep=" ")
roster

roster %<>% tidyr::unite(col = full.name, 
                         f.name, l.name, 
                         sep=" ")
roster



######################################################################
## 가상의 주민번호 벡터데이터 생성
ssn <- c(920219-2868883, 700617-2382241, 790905-1600179, 850720-2949160, 
         900908-2515523, 670106-1683231, 820224-1532098, 950828-1771741, 
         811208-1363675, 940903-2885073)
ssn 
str(ssn)
# - ssn에 저장된 주민번호들을 숫자로 인식하고, 
#   (-) 기호도 빼기로 인식해 결국 사칙연산이 적용된 숫자 벡터로 나옴


## 가상의 주민번호 문자열벡터로 생성
ssn <- c("920219-2868883", "700617-2382241", "790905-1600179", 
         "850720-2949160", "900908-2515523", "670106-1683231", 
         "820224-1532098", "950828-1771741", "811208-1363675", 
         "940903-2885073")
ssn
str(ssn)
# - 이제는 정상적인 주민번호 양식의 문자열벡터가 만들어 짐

# ---------------------------------------
raw <- strsplit(ssn, split = "-")
raw
# - 생년월일과 개인고유번호를 구별하는 (-)기호를 이용해 분리시킴
# - 분리된 결과는 개인별 특성을 유지하기 위해서 리스트형식으로 분리됨

birth <- lapply(raw, "[", 1)
birth
# - 분리된 주민번호에서 개인별 생년월일 요소값만 별도로 추출
# - 역시 개인별 고유특성을 유지할 수 있는 리스트형식을 취하기 위해 
#   sapply()가 아닌, lapply()를 적용함

# ---------------------------------------
## 참고
substring(text = "701031", 
          first = c(1, 3, 5), 
          last = c(2, 4, 6))
# - text에 주어진 대상문자열을 first에서 last로 끝나는 자리수에 대해서
#   부분추출해 주는 함수
# - first와 last에 담긴 벡터숫자들간의 벡터연산에 의해
#   (1, 2), (2, 4), (5, 6)이라는 first, last 조합이 만들어 지게 된 것임

birth2 <- lapply(birth, substring, 
                 first = c(1, 3, 5), 
                 last = c(2, 4, 6))
birth2
# - 개인별 생년, 생월, 생일 데이터 분리추출
# - 역시 개인별 특성을 구별해 유지하기 위해서 리스트형식으로 만들기 위해
#   sapply()가 아닌, lapply()를 적용함

# ---------------------------------------
id <- lapply(raw, "[", 2)
id
# - 분리된 주민번호에서 개인별 고유번호 요소값만 별도로 추출
# - 역시 개인별 고유특성을 유지할 수 있는 리스트형식을 취하기 위해 
#   sapply()가 아닌, lapply()를 적용함

id2 <- lapply(id, substring, 
              first = c(1, 2, 6, 7), 
              last = c(1, 5, 6, 7))
id2
# - 개인별 생년, 생월, 생일 데이터 분리추출
# - 역시 개인별 특성을 구별해 유지하기 위해서 리스트형식으로 만들기 위해
#   sapply()가 아닌, lapply()를 적용함

# ---------------------------------------
## 분할한 데이터를 하나의 데이터프레임으로 정리

## 리스트객체에 대해 sapply()로 특정한 요소위치 상관없이 추출한 경우
sapply(birth2, "[")
sapply(id2, "[")
# - 개별 리스트항목별 첫번째 요소위치에 있는 데이터를 묶어서 하나의 벡터로 만들
# - 이런방식으로 두번째, 세번째,...요소 위치에 있는 데이터도 묶어서 
#   각각 벡터로 만들고, 이를 위아래로 붙이다 보니 마치 행렬처럼 결과가 나오게 됨

birth3 <- t(sapply(birth2, "["))
birth3
id3 <- t(sapply(id2, "["))
id3
# - t() 함수로 행열형식 데이터를 피벗핑하면, 원하는 파싱(parsing)결과가 나옴

colnames(birth3) <- c("year", "month", "day")
birth3
colnames(id3) <- c("gender", "region", "sequence", "check")
id3

## 리스트객체에 대해 sapply()로 특정한 요소위치별로 지정해서 추출한 경우
year <- sapply(birth2, "[", 1)
year
month <- sapply(birth2, "[", 2)
month
day <- sapply(birth2, "[", 3)
day
# - 생년월일별 데이터 별도 변수에 추출저장

gender <- sapply(id2, "[", 1)
gender
region <- sapply(id2, "[", 2)
region
sequence <- sapply(id2, "[", 3)
sequence
check <- sapply(id2, "[", 4)
check
# - 개인고유번호 데이터 별도 변수에 추출저장

ssn.df <- data.frame(ssn, year, month, day, 
                     gender, region, sequence, check, 
                     stringsAsFactors = F)
# - 하나의 데이터프레임으로 엮음

ssn.df
str(ssn.df)
# - 내용 & 구조 확인


birth.3 <- as.data.frame(birth3)
id.3 <- as.data.frame(id3)

ssn.final <- data.frame(birth.3,id.3,
                        stringsAsFactors = FALSE)

ssn.final
str(ssn.fi)
### End of Source ####################################################


######################################################################
### sapply() & lapply() 함수 사용예
######################################################################

# 사용목적: 특정 데이터셋에 들어 있는 각 요소항목별로 
#           필요한 함수를 일괄 적용해줌

## 리스트형식 데이터객체 생성
ex <- list(A = matrix(1:12, 3), 
           B = 1:5, 
           C = matrix(1:4, 2), 
           D = rep(c(2, 4), 3))
ex
# - 리스트항목을 통해서 여러가지 데이터유형과 데이터객체를 담고 있음

## 리스트객체 요소값 인덱싱 방법
ex$A
ex[[1]]
# - 리스트에 표시된 리스트항목 이름($A)이나 
#   리스트항목 인덱스([[1]])를 통해 조회/활용가능

ex$A[2, ]
ex[[1]][2, ]
# - 리스트객체 ex에서 리스트항목 A의 내용 중에서 2번째 행을 조회  

ex$A[, 3]
ex[[1]][, 3]
# - 리스트객체 ex에서 리스트항목 A의 내용 중에서 3번째 열을 조회  

ex$A[2, 3]
ex[[1]][2, 3]
# - 리스트객체 ex에서 리스트항목 A의 내용 중에서 
#   2번째 행과, 3번째 열에 위치한 요소를 조회  


######################################################################
## 리스트객체 요소항목마다 공통작업 적용하기(1)
# - 일일이 데이터셋 항목에 접근해 공통작업 적용방식

sum(ex$A)
sum(ex$B)
sum(ex$C)
sum(ex$D)
# - 각 리스트항목별 이름($OOO)을 통한 조회를 통해 
#   공통적인 작업인 sum() 함수적용

sum(ex[[1]])
sum(ex[[2]])
sum(ex[[3]])
sum(ex[[4]])
# - 각 리스트항목별 이름([[OOO]])을 통한 조회를 통해 
#   공통적인 작업인 sum() 함수적용

# - ex리스트객체에 들어 있는 리스트항목마다 합을 구하기 위한 
#   sum() 함수를 리스트항목에 일일이 적용하기 위한 코드를 작성하는 번거로움

######################################################################
## 리스트객체 요소항목마다 공통작업 적용하기(2)
# - 사용자정의함수를 이용한 리스트항목별 공통작업 적용

result <- c()
result
# - 사용자정의함수를 통해 리스트항목별 
#   공통작업을 적용한 결과를 반환받을
#   result 벡터객체를 만들고, 내용은 NULL상태로 준비함 

for(i in 1:NROW(ex)) {
  result[i] <- sum(ex[[i]])
}
# - ex리스트 객체에 들어 있는 각 리스트항목별로 하나씩 조회해
#   sum() 함수를 적용하고, 이를 result 벡터객체에 요소로 저장함

result
# - for() 반복함수를 이용한 작업결과

######################################################################
## 리스트객체 요소항목마다 공통작업 적용하기(3)
# - sapply()와 lapply()를 이용한 리스트항목별 공통작업 적용

sapply(ex, sum)
# - ex에 들어 있는 각 리스트항목별 sum() 함수를 적용(apply)하고, 
#   그 결과를 간단히(simple) 벡터객체 형식으로 만들어냄
# - simple + apply --> sapply

lapply(ex, sum)
# - ex에 들어 있는 각 리스트항목별 sum() 함수를 적용(apply)하고, 
#   그 결과를 리스트(list) 객체 형식으로 만들어냄
# - list + apply --> lapply
install.packages("purrr")
library(purrr)
map(ex,sum)
identical(map(ex,sum),lapply(ex,sum))

## lapply(ds,function)

## 가로로 출력 - tibble타입 
map_df(ex, sum)

## 숫자형태로 => 형식이 안맞아서 에러
## sum 함수가 double 이라 강제로 int형태로 변경불가해서 에러
map_int(ex, sum)
## NROW : 데이타 요소 개수 
map_int(ex, NROW)

## 더블형태로  - vector타입
map_dbl(ex,sum)

## char 형태 - vector타입
map_chr(ex,sum)

## logical 타입으로 => 형식이 안맞아서 에러
map_lgl(ex,sum)
## 넘버형인지 확인(실수)
map_lgl(ex, is.numeric)

## function(인수){}
## is.matrix 매트릭스 형식이라면, 모든 항목 x2
## 익명/무명 함수 - 이름에 별도로 함수선언하여 사용하는 방식이 아닌 바로 사용
## 사칙연산과 같은 단순작업일때는 별도로 함수 선언없이 익명함수를 사용할수있다. 
map_if(ex, is.matrix, function(x){x*2})
## function(x) == ~.x 동일한 의미 
map_if(ex, is.matrix, ~.x * 2)
## 함수 선언
my.f <- function(x){x*2}
map_if(ex, is.matrix, my.f)


map_if(ex, is.vector, function(x){x-3})
map_if(ex, is.vector, ~.x -3)



######################################################################
## 데이터 순환사용(interation) purrr 패키지의 map() 계열 함수
######################################################################
# - base패키지의 apply(), sapply(), lapply() 함수와 용도가 비슷함

## 간단 리스트 형식 데이터 생성
ex <- list(A = matrix(1:12, 3), B = 1:5, 
           C = matrix(1:4, 2), D = rep(c(2, 4), 3))
ex
# - 전형적인 리스트 형식객체임

######################################################################
## 리스트 형식에 대한 데이터순환사용 (1)

## 전통적 lapply() & sapply() 함수사용
lapply(ex, sum)
# - 각 리스트항목에 접근해 sum함수를 적용한 결과를 리스트형식으로 만들어줌

sapply(ex, sum)
# - 각 리스트항목에 접근해 sum함수를 적용한 결과를 벡터형식으로 만들어줌

# --------------------------------------
## 데이터 순환사용 purr패키지 사용
## install.packages("purrr")
library(purrr)

map(ex, sum)
# - 리스트객체인 ex의 각 리스트항목에 접근해 sum함수를 적용(mapping)해서
#   그 결과를 리스트 형식으로 만들어 줌
# - 출력결과가 lapply()와 비슷함

identical(map(ex, sum), lapply(ex, sum))

# --------------------------------------
map_df(ex, sum)
# - 리스트객체인 ex의 각 리스트항목에 접근해 sum함수를 적용(mapping)해서
#   그 결과를 데이터프레임 형식으로 만들어 줌

map_int(ex, sum)
# - ex리스트 객체의 각 리스트항목에 sum을 적용한 결과, 
#   실수형 합이 계산되는데 정수로 반환받을 수 없어 에러발생

map_dbl(ex, sum)
# - ex리스트 객체의 각 리스트항목에 sum을 적용한 결과, 
#   실수형 합이 계산되므로 그대로 실수벡터형으로 반환받을 수 있음

map_chr(ex, sum)
# - ex리스트 객체의 각 리스트항목에 sum을 적용한 결과, 
#   실수형 합이 계산되는데 이를 강제로 문자벡터형식으로 변환해 출력해 줌

map_lgl(ex, sum)
# - ex리스트 객체의 각 리스트항목에 sum을 적용한 결과, 
#   실수형 합이 계산되는데 논리형으로 받환받을 수 없어 에러발생

# --------------------------------------
map_int(ex, NROW)
# - ex리스트 객체의 각 리스트항목에 NROW() 함수를 적용한 결과, 
#   각 리스트항목에 속한 요소갯수를 산출해 숫자벡터형식으로 반환해줌

map_lgl(ex, is.numeric)
# - ex리스트 객체의 각 리스트항목에 numeric() 함수를 적용한 결과, 
#   각 리스트항목에 속한 요소들이 숫자인지를 파악해 
#   논리벡터 형식으로 반환해줌

map_if(ex, is.matrix, function(x) {x * 2}) # 익명/무명 함수방식
map_if(ex, is.matrix, ~ .x * 2) # 관계식(formula) 설정방식
# - ex리스트 객체의 각 리스트항목에 is.matrix() 함수를 적용한 결과, 
#   각 리스트항목 중에서 행렬(매트릭스) 형식에만 곱하기 2를 하고
#   그대로 리스트 형식으로 반환해줌

map_if(ex, is.vector, function(x) {x * 3}) # 익명/무명 함수방식
map_if(ex, is.vector, ~ .x * 3) # 관계식(formula) 설정방식
# - ex리스트 객체의 각 리스트항목에 is.vector() 함수를 적용한 결과, 
#   각 리스트항목 중에서 벡터형식에만 곱하기 3을 하고
#   그대로 리스트 형식으로 반환해줌

##################################################
## 리스트 형식에 대한 데이터순환사용 (2)
# - 리스트데이터에 결측치(NA)가 포함되어 있는 경우

##추출 []$, subset, dplyr

## ex리스트객체에 A라는 행렬 리스트항목에 접근하기
ex$A 
ex[["A"]]
ex[[1]]
ex["A"]
# - ex리스트객체에서 A라는 리스트항목을 출력

ex$A[2, ]
ex[["A"]][2, ]
ex[[1]][2, ]
# - ex리스트객체에서 A라는 리스트항목 중 2행에 있는 요소를 출력 

ex$A[ , 3]
ex[["A"]][ , 3]
ex[[1]][ , 3]
# - ex리스트객체에서 A라는 리스트항목 중 3열에 있는 요소를 출력 

ex$A[2, 3]
ex[["A"]][2, 3]
ex[[1]][2, 3]
# - ex리스트객체에서 A라는 리스트항목 중 2행, 3열에 있는 요소를 출력 

ex$A[2, 3] <- NA
ex[["A"]][2, 3] <- NA
ex[[1]][2, 3] <- NA
# - ex리스트객체에서 A라는 리스트항목 중 2행, 3열에 있는 요소에 NA를 입력 

ex$A 
ex[["A"]]
ex[[1]]
# - ex리스트객체에서 A라는 리스트항목을 출력해 NA입력부분 반영여부 확인

# --------------------------------------
## ex리스트객체에 D라는 벡터항목에 접근하기
ex$D
ex[["D"]]
ex[[4]]
# - ex리스트객체에서 D라는 리스트항목을 출력

ex$D[5]
ex[["D"]][5]
ex[[4]][5]
# - ex리스트객체에서 D라는 리스트항목 중 5번째에 있는 요소를 출력 

ex$D[5] <- NA
ex[["D"]][5] <- NA
ex[[4]][5] <- NA
# - 리스트객체ex에서 D라는 리스트항목의 5번째 요소값에 대해서 
#   NA처리 후 반영여부를 확인

ex
# - 전체적인 NA반영 현황 재확인

# --------------------------------------
## 리스트객체에 NA값이 포함되어 있는 리스트항목이 존재하는 경우
lapply(ex, sum)
# - 각 리스트항목에 접근해 sum함수를 적용한 결과를 리스트형식으로 만들어줌
# - 리스트항목 B, C를 활용해서 정상적으로 합계 출력됨
# - NA요소를 가지고 있는 A와 D 리스트 항목에 대한 합계계산 결과는 NA로 출력됨

lapply(ex, sum, na.rm = TRUE)
# - ex리스트객체의 각 리스트항목에 접근해 sum() 적용시 NA요소가 있을 경우
#   이를 제외하고 sum() 함수를 적용하도록 na.rm = TRUE 옵션을 사용함

lapply(ex, function(x) {sum(x, na.rm = TRUE)})
# - 익명/무명함수(the anonymous functions)라고 부르는 형식을 이용해 
#   sum() 함수 적용시 na.rm = TRUE 옵션을 반영해 NA요소에 대해 제외시킴

# --------------------------------------
sapply(ex, sum)
sapply(ex, sum, na.rm = TRUE)
sapply(ex, function(x) {sum(x, na.rm = TRUE)})
# - sapply() 함수사용시 리스트객체에 접근해 각 리스트항목별로 
#   sum()함수를 적용하고 이를 숫자벡터로 반환함

# --------------------------------------
## purrr패키지의 map() 계열 함수이용

map(ex, sum)
map(ex, sum, na.rm = TRUE)
map(ex, function(x) {sum(x, na.rm = TRUE)})
# - 리스트객체인 ex의 각 리스트항목에 접근해 sum함수를 적용(mapping)해서
#   그 결과를 리스트 형식으로 만들어 줌

map_df(ex, sum)
map_df(ex, sum, na.rm = TRUE)
map_df(ex, function(x) {sum(x, na.rm = TRUE)})
# - 리스트객체인 ex의 각 리스트항목에 접근해 sum함수를 적용(mapping)해서
#   그 결과를 데이터프레임 형식으로 만들어 줌

map_int(ex, sum)
map_int(ex, sum, na.rm = TRUE)
map_int(ex, function(x) {sum(x, na.rm = TRUE)})
# - ex리스트 객체의 각 리스트항목에 sum을 적용한 결과, 
#   실수형 합이 계산되는데 정수로 반환받을 수 없어 에러발생

map_dbl(ex, sum)
map_dbl(ex, sum, na.rm = TRUE)
map_dbl(ex, function(x) {sum(x, na.rm = TRUE)})
# - ex리스트 객체의 각 리스트항목에 sum을 적용한 결과, 
#   실수형 합이 계산되므로 그대로 실수벡터형으로 반환받을 수 있음

map_chr(ex, sum)
map_chr(ex, sum, na.rm = TRUE)
map_chr(ex, function(x) {sum(x, na.rm = TRUE)})
# - ex리스트 객체의 각 리스트항목에 sum을 적용한 결과, 
#   실수형 합이 계산되는데 이를 강제로 문자벡터형식으로 변환해 출력해 줌

map_lgl(ex, sum)
map_lgl(ex, sum, na.rm = TRUE)
map_lgl(ex, function(x) {sum(x, na.rm = TRUE)})
# - ex리스트 객체의 각 리스트항목에 sum을 적용한 결과, 
#   실수형 합이 계산되는데 논리형으로 받환받을 수 없어 에러발생

map_if(ex, is.matrix, function(x) {x * 2})
map_if(ex, is.matrix, ~.x * 2)
# - ex리스트 객체의 각 리스트항목에 is.matrix() 함수를 적용한 결과, 
#   각 리스트항목 중에서 행렬(매트릭스) 형식에만 곱하기 2를 하고
#   그대로 리스트 형식으로 반환해줌

map_if(ex, is.vector, function(x) {x * 3})
map_if(ex, is.matrix, ~.x * 3)
# - ex리스트 객체의 각 리스트항목에 is.vector() 함수를 적용한 결과, 
#   각 리스트항목 중에서 벡터형식에만 곱하기 3을 하고
#   그대로 리스트 형식으로 반환해줌

### End of Source ####################################################


map_if(ex, is.matrix, function(x) {x + 2})
map_if(ex, is.vector, mean, na.rm=TRUE )
map_if(ex, is.vector, max, na.rm=TRUE )
map_if(ex, is.vector, min, na.rm=TRUE )


######################################################################
### 데이터 재구조화(Data Reshaping): 데이터셋간 결합 
######################################################################
## 컬럼의 명칭 변경, 컬럼의 위치 변경도 재구조화가 될수 있다. 
## DML - Data manuplation Language : select, update, insert, delete
## DDL - Data Definition Language  : drop, alter, create
## DCL - Data Controll Language : rollback, commit


## 1. 데이터프레임간 결합
# - base::rbind()와 bae::cbind() 이용 
# - dplyr::bind_rows()와 dplyr::bind_cols() 이용

# install.packages("dplyr")
library(dplyr)

## 1.1 base::rbind()와 dplyr::bind_rows()를 이용한 결합
# - 데이터프레임 간 행을 기준으로 (위 + 아래)를 결합시킴
# - 결합시 행의 갯수는 중요하지 않음
# - 결합되는 데이터프레임 간의 변수컬럼 갯수/이름/특성 일치가 중요
# - 위아래 결합순서는 크게 상관이 없음
# - 어차피 길동이가 1번이든, 철수가 1번이든 조회하기 나름임

# --------------------------------
## rbind(), bind_rows() 함수용 예제데이터셋 생성

A <- data.frame(id=c("c01","c02","c03","c04"), 
                last=c("Kim", "Lee", "Choi", "Park"),
                gender = c("F", "M", "F", "M"), 
                stringsAsFactors = FALSE) 
A.1 <- tibble(id=c("c01","c02","c03","c04"), 
                last=c("Kim", "Lee", "Choi", "Park"),
                gender = c("F", "M", "F", "M") 
                ) 

## 문자열 frame으로 만들면 Factor형태여서 FALSE로 선언

B <- data.frame(id = c("c05", "c06", "c07"), 
                gender = c("F", "F", "M"),
                last = c("Bae", "Kim", "Lim"),
                stringsAsFactors = FALSE)

C <- data.frame(id = c("c08", "c09"), 
                last = c("Lee", "Park"), 
                stringsAsFactors = FALSE)

D <- data.frame(id = c("c10", "c11", "c12"), 
                last = c("Bang", "Kang", "Rim"),
                gender = c("M", "F", "M"),
                job = c(4, 3, 1), 
                stringsAsFactors = FALSE)

E <- data.frame(id = c("c13", "c14", "c15"), 
                first = c("Sangmin", "Hyori", "Daniel"),
                gender = c("M", "M", "F"), 
                stringsAsFactors = FALSE)

A # id, last, gender, n = 4
B # id, gender, last, n = 3
C # id, last, n = 2
D # id, last, gender, job, n = 3
E # id, first, gender, n = 3

# --------------------------------
rbind(A, B)  
bind_rows(A, B)
identical(rbind(A, B), bind_rows(A, B))
# - id, last, gender ==정상결합== id, gender, last

rbind(B, A)
bind_rows(B, A)
identical(rbind(B, A), bind_rows(B, A))
# - id, gender, last ==정상결합== id, last, gender

rbind(A, C) 
bind_cols(A, C)
# - id, last, gender <=에러발생=> id, last

rbind(A, D) 
bind_rows(A, D) 
# - id, last, gender <=에러발생=> id, last, gender, job

rbind(A, E) 
bind_rows(A, E)
# - id, last, gender <=에러발생=> id, first, gender
## join 기법을 사용하면 전처리 가능하다

######################################################################
## 1.2 base::cbind()와 dplyr::bind_cols()를 이용한 결합

## base::cbind()와 dplyr::bind_cols()를 이용한 결합
# - 데이터프레임 간 열을 기준으로 (좌 + 우)를 결합시킴
# - 결합시 변수컬럼의 갯수는 중요하지 않음
# - 결합되는 데이터프레임 간의 행(레코드;관찰치) 갯수 일치가 중요
# - 행의 갯수가 같아도 서로 동일 개체끼리 결합이 되어야 논리적 오류가 없음

## cbind()와 bind_cols()의 경우에는 결합순서가 중요함
# - 주로 왼쪽(먼저) 있는 데이터프레임는 식별자의 프로필 데이터늘 놓고,
#   오른쪽(나중에) 결합시키는 데이터프레임는 식별자의 활동정보른 놓는 것이 필요함
# - 왼쪽(고객 인구통계학) + 오른쪽(고객 구매이력)
# - 왼쪽(제품 프로필: 제품명, 카테고리, 가격, 규격) + 오른쪽(제품 판매이력)

# --------------------------------
## cbind(), bind_cols() 함수용 예제데이터셋 생성

P <- data.frame(age = c(20, 25, 19, 40), 
                income = c(2500, 2700, 0, 7000), 
                stringsAsFactors = FALSE)

Q <- data.frame(age = c(20, 25, 19, 40, 32, 39, 28), 
                income = c(2500, 2700, 0, 7000, 3400, 3600, 2900), 
                stringsAsFactors = FALSE)

R <- data.frame(id=c("c01","c02","c03","c04"),
                age = c(20, 25, 19, 40), 
                income = c(2500, 2700, 0, 7000), 
                stringsAsFactors = FALSE)

S <- data.frame(id=c("c03","c04","c07","c08"),
                age = c(19, 40, 29, 30), 
                income = c(1500, 3400, 3020, 4500), 
                stringsAsFactors = FALSE)

P # age, income, n=4
Q # age, income, n=7
R # age, income, gender, n=4
S # id, age, income, n=4

A # id, last, gender, n = 4
B # id, last, gender, n = 3
C # id, last, n = 2
D # id, last, gender, job, n = 3
E # id, first, gender, n = 3

cbind(A, P) 
bind_cols(A, P)
identical(cbind(A, P), bind_cols(A, P))
# - 물리적 결합성공, 그러나 논리적 에러! 
# - P데이터셋에 pk변수가 없어 연결된 레코드가 
#   실제 A데이터셋의 id번호고객인지 불확실함

cbind(P, A) 
bind_cols(P, A) 
# - 상동

cbind(A, Q) 
bind_cols(A, Q) 
# - 레코드 갯수가 달라서 물리적으로 우선 에러발생

cbind(A, R)
bind_cols(A, R) 
# - 물리적 & 논리적 정상결합
# - 양쪽 데이터셋에 pk변수가 있고 실제 고객 id번호도 일치함

cbind(A, S)
bind_cols(A, S) 
# - 물리적 결합성공, 그러나 논리적 에러!
# - 양쪽 데이터셋에 pk변수가 있지만 실제 고객 id번호가 일치하지 않음 

######################################################################
## 2. base::merge()와 dplyr::join 계열 함수를 이용한 데이터프레임간 결합

# - 데이터프레임 간 key(결합용 변수컬럼) 기준으로 결합(상+하+좌+우)
# - 특히 결합용 변수컬럼은 각 데이터프레임마다의 
#   식별자(key변수컬럼)에 해당하는 변수컬럼을 선정해야 함
# - 보통 결합기준이 되는 변수컬럼을 by = 이라는 옵션으로 설정함
# - 그렇지 않으면 무엇이 중복되었는지, 제대로 연결되었는지 구별이 안감
# - 식별자끼리 결합을 해야 정확히 1개 레코드에 대한 안정적인 결합이 되는 것임
# - 예로 name으로 결합하면 A에도 kim, S에도 kim 있을 때 
#   같은 사람인지, 다른사람인지 구별이 안가게 됨

# - age나 address도 마찬가지임
#   ==> 조인해서 문자형변수에 결측치는 <NA>라고 나오며, 숫자변수는 NA라고 표시됨

# - 양쪽에 식별자가 같이 있는데, 식별자 이름이 다른경우 
#   by = c("cusid" = "cusID") 처럼 설정하면 됨

# - 양쪽에 식별자가 1개가 아닌 2개 이상의 변수컬럼으로 연결해야 하는 경우에는
#   by = c("first", "last") 처럼 설정하면 됨

# install.packages("dplyr")
library(dplyr)

# --------------------------------
## 내부조인(Inner Join)
# - 양쪽 데이터셋에 같이 들어 있는 레코드를 기준으로 결합함
# - 결합된 레코드는 양쪽 데이터셋에 있는 모든 변수컬럼들로 표현됨

## 내부조인 대상 2개 데이터셋
A
S

## 기본 base::merge()함수 이용
merge(x=A,  y=S)
merge(x=A,  y=S,  by='id')

## dplyr::join 계열함수 이용
inner_join(x=A,  y=S)
inner_join(x=A,  y=S,  by='id')
A %>% inner_join(S)
A %>% inner_join(S,  by='id')
# - 이 결과는 양쪽에 같이 있는 사람들간에 결합
# - 어느 한쪽 데이터가 없는 경우 그 사람을 날려도 괜찮은 문제상황
# - 주로 그룹간 분석시 용이함
# - by라는 옵션은 명시적으로 사용해주는 것이 좋음

# --------------------------------
## 외부조인(Outer Join)
# - 양쪽 데이터셋에 같이 있든, 어느 한쪽에 있든 모든 레코드들을 사용해 결합함
# - 양쪽에 있는 모든 변수컬럼이 결합되지만, 일부 레코드이 경우 셀값이 없을 수 있음

## 외부조인 대상 2개 데이터셋
A
S

## 기본 base::merge()함수 이용
merge(x=A,  y=S, all = TRUE)
merge(x=A,  y=S,  by='id', all = TRUE)

## dplyr::join 계열함수 이용
full_join(x=A,  y=S)
full_join(x=A,  y=S,  by='id')
A %>% full_join(S)
A %>% full_join(S,  by='id')
# - 이 결과는 양쪽에 상관없이 있으면있는 대로, 없으면 없는대로 모두 결합
# - 주로 한사람 한사람이 중요해서 일단 결합해 놓고, NA도 적절히 대체하면 되므로
#   특히 한사람 한사람을 파악해서 마케팅을 하려고 할 때 이게 내부조인보다 더 좋음
# - by라는 옵션은 명시적으로 사용해주는 것이 좋음

# --------------------------------
## 왼쪽 외부조인(Left Outer Join)
# - 왼쪽 데이터셋을 기준자료로 삼아 해당 레코드를 모두 사용하며, 
#   오른쪽 데이터셋은 왼쪽 데이터셋과 일치하는 레코드만 결합함
# - 왼쪽에만 존재하는 일부 레코드의 경우 
#   오른쪽 변수컬럼이 결합되면서 셀값이 없을 수 있음

## 왼쪽 외부조인 대상 2개 데이터셋
A
S

## 기본 base::merge()함수 이용
merge(x=A,  y=S, all.x = TRUE)
merge(x=A,  y=S,  by='id', all.x = TRUE)

## dplyr::join 계열함수 이용
left_join(x=A, y=S)
left_join(x=A, y=S, by='id')

A %>% left_join(S)
A %>% left_join(S, by='id')
# - 이 경우는 왼쪽의 키(식별자)가 모두 포함되는 게 좋을 경우
# - 주로 이쪽에 각 레코드를 구별할 수 있는 프로필 정보가 있다거나/많다거나
#   또는 구매이력 정보가 있다거나/ 많다 거나 하는 경우임
# - by라는 옵션은 명시적으로 사용해주는 것이 좋음

# --------------------------------
## 오른쪽 외부조인(Right Outer Join)
# - 오른쪽 데이터셋을 기준자료로 삼아 해당 레코드를 모두 사용하며, 
#   왼쪽 데이터셋은 오른쪽 데이터셋과 일치하는 레코드만 결합함
# - 오른쪽에만 존재하는 일부 레코드의 경우 
#   왼쪽 변수컬럼이 결합되면서 셀값이 없을 수 있음

## 오른쪽 외부조인 대상 2개 데이터셋
A
S

## 기본 base::merge()함수 이용
merge(x=A,  y=S, all.y = TRUE)
merge(x=A,  y=S,  by='id', all.y = TRUE)

## dplyr::join 계열함수 이용
right_join(x=A,  y=S)
right_join(x=A,  y=S,  by='id')

A %>% right_join(S)
A %>% right_join(S,  by='id')
# - 이 경우도 상동임

# --------------------------------
## 기타 조건조인(Filtering Join)
# - dplyr패키지를 사용해 semi조건조인과 anti조건조인이 있음

## 기타 조건조인 대상 2개 데이터셋
A
S

## dplyr::join 계열함수 이용
semi_join(x=A,  y=S)
semi_join(x=A,  y=S,  by='id')

A %>% semi_join(S)
A %>% semi_join(S,  by='id')
# - 내부조인처럼 양쪽에서 id가 일치하는 레코드를 찾는 것은 동일하지만
#   변수컬럼은 x 데이터셋에 존재하는 변수컬럼만 사용함
# - by라는 옵션은 명시적으로 사용해주는 것이 좋음

## dplyr::join 계열함수 이용
anti_join(x=A,  y=S)
anti_join(x=A,  y=S,  by='id')

A %>% anti_join(S)
A %>% anti_join(S,  by='id')
# - 내부조인과 반대로 x데이터셋에서 y데이터셋과 비교해 
#   id가 일치하지 않는 레코드만을 찾으며,
#   변수컬럼은 x데이터셋에 존재하는 변수컬럼만 사용함
v <- data.frame(cusid =c("c03","c04","c07","c08"),
                age = c(19, 40, 29, 30), 
                income = c(1500, 3400, 3020, 4500), 
                stringsAsFactors = FALSE) 

merge(x=A, y=v, by.x= 'id', by.y="cusid")

######################################################################
## (3) 2개 이상의 다중연결키(Multi-variable keys)를 이용한 조인

## 예제 데이터셋 생성
artists0 <- ('
             first last instrument
             Jimmy Buffett Guitar
             George Harrison Guitar
             Mick Jagger Vocals
             Tom Jones Vocals
             Davy Jones Vocals
             John Lennon Guitar
             ')
# - 양쪽에 작은따옴표로 묶은 단순한 문자열 1개로 데이터셋 내용을 준비함

bands0 <- ('
           first last band
           John Bonham "Led Zeppelin"
           "John Paul" Jones "Led Zeppelin"
           Jimmy Page "Led Zeppelin"
           Robert Plant "Led Zeppelin"
           George Harrison "The Beatles"
           John Lennon "The Beatles"
           ')
# - 요소값 중에 공백을 포함하는 경우에는 큰따옴표로 묶어주어야 함

songs0 <- ('
           song album First Last
           "Come Together" "Abbey Road" John Lennon
           "Dream On" Aerosmith Steven Tyler
           "Hello, Goodbye" "Magical Mystery Tour" Paul McCartney
           "It\'s Not Unusual" "Along Came Jones" Tom Jones
           ')
# - 요소값 중에 작은따옴표를 포함하는 경우에는 탈출문자인 \기호를 사용함

albums0 <- ('
            album band year
            "A Hard Day\'s Night" "The Beatles" 1964
            "Magical Mystery Tour" "The Beatles" 1967
            "Beggar\'s Banquet" "The Rolling Stones" 1968
            "Abbey Road" "The Beatles" 1969
            "Led Zeppelin IV" "Led Zeppelin" 1971
            "The Dark Side of the Moon" "Pink Floyd" 1973
            ')
# - 요소값 중에 작은따옴표를 포함하는 경우에는 탈출문자인 \기호를 사용함

## 문자열 방식의 데이터소스를 일반 데이터셋 형식으로 로딩
# - base::textConnection() 함수이용 데이터셋 만들기

artists <- read.table(textConnection(artists0), header = TRUE,
                      stringsAsFactors = FALSE)
bands <- read.table(textConnection(bands0), header = TRUE,
                    stringsAsFactors = FALSE)
songs <- read.table(textConnection(songs0), header = TRUE,
                    stringsAsFactors = FALSE)
albums <- read.table(textConnection(albums0), header = TRUE,
                     stringsAsFactors = FALSE)
## read.table(file명, .. ) file명 대신에 textConnection 함수 사용 
## header = TRUE - 첫째줄이 헤더이다

str(artists)
str(bands)
str(songs)
str(albums)

artists # first, last, instrument
bands # first, last, band
songs # song, album, First, Last
albums # album, band, year


## 다중 연결키를 이용한 조인
library(dplyr)
inner_join(artists, bands, by = c("first", "last"))
full_join(artists, bands, by = c("first", "last"))
left_join(artists, bands, by = c("first", "last"))
right_join(artists, bands, by = c("first", "last"))

## 다중 및 상이한 이름을 가진 연결키를 이용한 조인
## R은 대소문자 구분이 되므로 각각 다른 이름을 맵핑한 것
library(dplyr)
inner_join(artists, songs, by = c("first"="First", "last"="Last"))
full_join(artists, songs, by = c("first"="First", "last"="Last"))
left_join(artists, songs, by = c("first"="First", "last"="Last"))
right_join(artists, songs, by = c("first"="First", "last"="Last"))

## songs, band 
## - song album First Last
## - first last band
inner_join(songs, bands, by = c("First"="first", "Last"="last"))
full_join(songs, bands, by = c("First"="first", "Last"="last"))
left_join(songs, bands, by = c("First"="first", "Last"="last"))
right_join(songs, bands, by = c("First"="first", "Last"="last"))

songs.bands <- left_join(songs, bands, by = c("First"="first", "Last"="last"))
## song-album-First-Last-band
## album, band, year
inner_join(albums,songs.bands, by = c("album"="album","band","band"))
left_join(albums,songs.bands, by = c("album"="album","band","band"))

artists # first, last, instrument
bands # first, last, band
songs # song, album, First, Last
albums # album, band, year

### End of Source ####################################################

raw <- tibble(cusid = c("c01", "c02", "c03", "c04", "c05"),
              gender = c(2, 1, 1, 2, 1), 
              wk1 = c(4, NA, 15, 3, 6),
              wk2 = c(NA, NA, 8, 15, 22),
              wk3 = c(11, 2, 14, 23, NA),
              wk4 = c(19, 25, 28, 13, 6),
              wk5 = c(22, 18, NA, 19, 14),
              wk6 = c(5, 13, NA, 7, NA),
              wk7 = c(12, 8, NA, 10, 30))
raw

library(tidyr)

raw_long <- gather(data = raw,
                   key = week, value = result,
                   wk1, wk2, wk3, wk4, wk5, wk6, wk7) 

View(raw_long)
## 열거식 선언 -> wk1:wk7 변경가능
# raw_long <- gather(data = raw,
#                    key = week, value = result,
#                    wk1:wk7)
## tidyr::gather -> 변수를 모아 상위레벨로 올릴수 있는 것을 찾아 long 포맷으로 변경
## key는 cid, gender, Week가 된것을 알수 있다. 
## long(=스택형) format으로 변경
## 원래 있던 값 -> result로 선언하여 뿌려줌 

## pipe 연산 
library(magrittr)
## arrange 함수 
library(dplyr)
raw_long %<>% dplyr::arrange(cusid)

## recodeVar 함
library(doBy)
raw_long$week %<>% recodeVar(src = c("wk1","wk2","wk3","wk4","wk5","wk6","wk7"),
                             tgt = c(1,2,3,4,5,6,7))

## Wide형(스프레드형 = unstacked) 구조로 변경
library(tidyr)
raw_wide <- spread(data = raw_long,
                   key = week,
                   value = result)

## value = 그것을 묶어주는 대표 변수 
## long, wide로 변경시 세분화되는 변수, 세분화된 결과값 변수만 신경쓰면됨 
## unique key로 사용되는 것은 자동지정

## 컬럼 명칭 변경 
## 최종명칭 = 변경대상명칭
raw_wide %<>% dplyr::rename(wk1="1",wk2 = "2",
                            wk3="3",wk4 = "4",
                            wk5="5",wk6 = "6",
                            wk7="7"
                            )

## 컬럼명 구조일치여부 확인 
identical(raw, raw_wide)



###############################################################################
## 데이터셋 재구조화(reshaping): tidyr패키지 gather() & spread() 함수  
# - 데이터셋을 가로&세로 방향으로 자유롭게 재구조화함
###############################################################################

## 데이터셋 구조 관련 2가지 유형
# (1) 가로형
# - 숏(short)포맷, 언스택형(unstacked), 
#   컬럼-와이즈형(column-wise), 와이드(wide)포맷이라고 부름
# - 데이터셋을 구성하는 변수컬럼들을 보다 상위레벨로 보았을 때
#   동일한 주제로 묶을 수 있는 구조
# - 쌍대/대응/짝을이루는(paired sample), 
#   또는 반복측정(repeated measured) 데이터셋을 지칭함
# - 주로 인간(분석가)이 이해/처리하기 좋은 구조

# (2) 세로형
# - 롱(long)포맷, 스택형(stacked),
#   로우-와이즈형(row-wise), 집합(gather)포맷이라고 부름
# - 데이터셋을 구성하는 변수컬럼들이 동일한 주제가 아닌 독립적인 주제로 구성됨
# - 독립적 주제를 가지는 변수컬럼별 데이터가 세로방향으로 길게 쌓여있는 구조
# - 주로 컴퓨터(알고리즘)이 연산/처리하기 좋은 구조

## 주요 패키지와 기능함수 비교
# tidyr 패키지:: gather(롱포맷으로변환) <--> spread(와이드포맷으로변환)
# reshape 패키지:: melt(롱포맷으로변환) <--> cast(와이드포맷으로변환)
# reshape2 패키지:: melt(롱포맷으로변환) <--> dcast(와이드포맷으로변환)
# - reshape 관련패키지에서는 분해(melt)를 통해 와이드형을 롱포맷으로 변환하며,
#   재구조화(cast)를 통해 롱포맷을 와이드포맷으로 변환한다는 표현을 사용함
# - long형식이든 wide형식이든 자유롭게 변환이 가능해야 함

# --------------------------------
## raw 데이터 준비
# install.packages("tibble")
library(tibble)

raw <- tibble(cusid = c("c01", "c02", "c03", "c04", "c05"),
              gender = c(2, 1, 1, 2, 1), 
              wk1 = c(4, NA, 15, 3, 6),
              wk2 = c(NA, NA, 8, 15, 22),
              wk3 = c(11, 2, 14, 23, NA),
              wk4 = c(19, 25, 28, 13, 6),
              wk5 = c(22, 18, NA, 19, 14),
              wk6 = c(5, 13, NA, 7, NA),
              wk7 = c(12, 8, NA, 10, 30))
raw
# - 준비된 데이터셋은 전형적인 와이드(언스택) 포맷임
# - cusid별로 1주차부터 ~ 7주차까지의 이용실적(카드결제빈도)을 의미하는 
#   wk1 ~ wk7 변수컬럼이 가로방향으로 이어져 있는 구조임
# - 즉, wk1 ~ wk7이라는 7개 변수컬럼을 보다 상위개념인 
#   이용실적이라는 1개 변수컬럼으로 결합해 정리할 수 있다는 의미임

# --------------------------------
## 전반적인 raw 데이터 스캐닝
str(raw)
summary(raw)

###############################################################################
## (1) wide(unstack) to long(stack)
# - 와이드형으로 되어 있는 데이터를 롱형으로 변환하는 방법

raw 
# - 현재의 와이드형 데이터셋 재확인

## tidyr::gather() 함수이용 와이드형에서 롱형으로 데이터구조 변환
# install.packages("tidyr")
library(tidyr)

raw_long <- gather(data = raw, 
                   key = week, value = result, 
                   wk1, wk2, wk3, wk4, wk5, wk6, wk7)
# - raw라는 와이드포맷  데이터셋을 대상(data=)으로 함
# - 대응/쌍대/짝을이룬/반복측정된 wk1 ~ wk7이라는 7개 변수컬럼명들을 
#   새로운 통합변수(key=)인 week 변수컬럼으로 합쳐서(gather)
#   아래로 길게(long) 쌓아놓은(stacked) 형태로 배치함
# - 원래 wk1 ~ wk7 변수컬럼에 들어 있었떤 실제 요소값(value=)들도
#   result라는 새로운 통합변수로 합쳐서 아래로 길게 배치함 
# - gather()함수에 입력하는 대응/쌍대/짝을이룬/반복측정된 변수컬럼을 의미하는
#   wk1 ~ wk7이라는 코딩부분은 원본 raw데이터셋에 7개 변수컬럼이 
#   연속으로 위치하고 있으므로 wk1:wk7라고 간단하게 코딩해도 됨
# - gather()함수에 입력되지 않은 원래 raw 데이터셋의 cusid와 gender 변수컬럼은
#   그대로 롱포맷 데이터셋에 독립적인 변수컬럼으로 나타나게 되며, 
#   새로운 통합변수인 week와 새로운 통합변수의 요소값 변수인 result에 맞추어
#   반복해서 레코드를 구성하게 됨  

## 와이드형에서 롱포맷으로 재구조화된 데이터셋 확인
raw_long
str(raw_long) 

# --------------------------------
## cusid로 소팅
library(magrittr)
library(dplyr)
raw_long %<>% arrange(cusid)
raw_long
# - dplyr::arrange() 함수이용

# --------------------------------
## 와이드포맷에서 롱포맷으로 변환된 변수컬럼 레이블 변경
library(doBy)
raw_long$week %<>% recodeVar(src = c("wk1", "wk2", "wk3", "wk4", 
                                     "wk5", "wk6", "wk7"),
                             tgt = c(1, 2, 3, 4, 5, 6, 7))

raw_long
str(raw_long)

###############################################################################
## (2) long(stack) to wide(unstack) 
# - 롱포맷으로 되어 있는 데이터셋을 와이드형으로 변환하는 방법

raw_long # 현재의 롱형 데이터셋 재확인

## tidyr::spread() 함수이용 롱형에서 와이드형으로 데이터구조 변환
# install.packages("tidyr")
library(tidyr)

raw_wide <- spread(data = raw_long,
                   key = week, value = result)
# - raw_long이라는 롱포맷 데이터셋을 대상(data=)으로 함 
# - 통합변수(key=)인 week 변수컬럼의 데이터인 1 ~7을 펼쳐서(spread)
#   원래 대응/쌍대/짝을이룬/반복측정된 변수컬럼처럼 
#   가로방향으로 넓게(wide) 곁에놓은(unstacked) 형태로 배치함
# - result라는 통합변수 아래 합쳐져 있는 실제 요소값(value=)들도
#   와이드형태로 펼쳐진 1 ~ 7이라는 변수컬럼에 각각 배치함 
# - spread()함수에 입력되지 않은 raw_wide 데이터셋의 cusid와 gender 변수컬럼은
#   그대로 와이드포맷 데이터셋에 독립적인 변수컬럼으로 나타나게 되며, 
#   와이드포맷으로 펼쳐진 1 ~ 7 변수컬럼에 맞추어 레코드를 구성하게 됨  

## 롱포맷에서 와이드형으로 재구조화된 데이터셋 확인
raw_wide
str(raw_wide)

# --------------------------------
## 와이드형으로 변환된 데이터셋의 변수컬럼명 지정
raw_wide %<>% dplyr::rename(wk1 = "1", wk2 = "2", 
                            wk3 = "3", wk4 = "4",
                            wk5 = "5", wk6 = "6", 
                            wk7 = "7")

raw_wide
str(raw_wide)

# --------------------------------
## 데이터셋 일치성 점검
identical(raw, raw_wide)
# - 최초 와이드형 데이터셋(raw)과 
#   방금 다시 원상태로 변환한 와이드형 데이터셋(raw_wide)간의 일치성 점검

###############################################################################
## 롱포맷 데이터셋을 활용한 요약집계(aggreagation) 실시

## 데이터셋 재확인
raw 
# - 원본 와이드포맷 데이터셋
raw_long 
# - 롱포맷 데이터셋

raw_final <- raw_long %>% group_by(cusid, gender) %>%
  dplyr::summarize(result_n = sum(!is.na(result)),
                   result_sum = sum(result, na.rm = TRUE),
                   result_avg = mean(result, na.rm = TRUE),
                   result_median = median(result, na.rm = TRUE),
                   result_sd = sd(result, na.rm = TRUE),
                   result_min = min(result, na.rm = TRUE),
                   result_max = max(result, na.rm = TRUE))
# - 집계기준변수: cusid, gender
# - 집계결과변수: result
# - 집계연산함수: length(), sum(), mean(), median(), sd(), min, max()
# - 집계연산함수 중에서 length()는 sum(!is.na(result)) 코드부분을 의미하는데,
#   7주동안의 기간동안 NA가 아닌 정상적인 거래실적인 존재하는 주간이 
#   몇주간인지를 TRUE/FALSE --> 1과 0으로 계산해 이를 sum()함수로 합한것임
# - 다양한 집계기준에 따라 다양한 집계결과변수의 특성비교를
#   다양한 집계연산함수를 동시에 적용할 수 있음

## 요약집계 내용 정렬
raw_final
raw_final %>% 
  arrange(desc(result_sum), # 7주간 실적총합을 1순위로 내림차순 정렬 
          desc(result_avg), # 주당 거래실적 평균값을 2순위로 내림차순 정렬 
          result_sd) # 주당 거래실적 표준편차를 3순위로 오름차순 정렬

### End of Source #############################################################

raw_gen <- raw_long %>% group_by(gender) %>%
  dplyr::summarize(result_n = sum(!is.na(result)),
                   result_sum = sum(result, na.rm = TRUE),
                   result_avg = mean(result, na.rm = TRUE),
                   result_median = median(result, na.rm = TRUE),
                   result_sd = sd(result, na.rm = TRUE),
                   result_min = min(result, na.rm = TRUE),
                   result_max = max(result, na.rm = TRUE))


## trans 데이터 준비
# install.packages("tibble")
library(tibble)

## 가상 데이터 생성
# - customID: 고객번호
# - buyDate: 구매일
# - pruduct: 상품1 구매갯수
# - pruduct2: 상품2 구매갯수

trans <- tibble(customID = c("KD257", "KD257", "KD257", 
                             "CT303", "CT303", "AQ115", "AQ115"),
                buyDate = c(170720, 170815, 170720, 
                            170815, 170720, 170720, 170815),
                product1 = c(15, 23, 9, 42, 12, 31, 51),
                product2 = c(16, 7, 21, 34, 9, 65, 27))

trans
## short format = column wise(컬럼을 늘려서 구성)
## <-> stacked format = row wise
install.packages("reshape2")
library(reshape2)

trans.long <- reshape2::melt(data = trans, 
                   id.vars = c("customID","buyDate"), ## id역할, 구조를 유지위한 변수
                   measure.vars = c("product1","product2"), ## 결합하고자하는 - 위아래로 붙여서 만들고 싶은 변수 
                   variable.name = "pd",  ## 대표변수 컬럼 이름
                   value.name = "output"  ## 결과값 컬럼 이름 
                   )

melt(trans, id.vars = c("customID"))
melt(trans, id.vars = c("buyDate"))

## 묶이지 않을 변수는 reshape에서 식별키로 따로 해놓아야 한다. 


library(magrittr)
library(dplyr)
trans.long %<>% arrange(customID)
trans.long

library(reshape2)

dcast(data = trans.long,
      formula = customID ~ pd, ## 프로덕트 타입에 따라 아이디로 구분하여 구조화 (종속(결과) ~ 독립(예측))
      value.var = "output")

dcast(data = trans.long,
      formula = customID ~ pd, ## 프로덕트 타입에 따라 아이디로 구분하여 구조화 (종속(결과) ~ 독립(예측))
      value.var = "output",
      fun.aggregate = mean)



###############################################################################
## 데이터셋 재구조화(reshaping): reshape2패키지 melt() & dcast() 함수 
# - 데이터셋을 가로&세로 방향으로 자유롭게 재구조화함
###############################################################################

## 데이터셋 구조 관련 2가지 유형
# (1) 가로형
# - 숏(short)포맷, 언스택형(unstacked), 
#   컬럼-와이즈형(column-wise), 와이드(wide)포맷이라고 부름
# - 데이터셋을 구성하는 변수컬럼들을 보다 상위레벨로 보았을 때
#   동일한 주제로 묶을 수 있는 구조
# - 쌍대/대응/짝을이루는(paired sample), 
#   또는 반복측정(repeated measured) 데이터셋을 지칭함
# - 주로 인간(분석가)이 이해/처리하기 좋은 구조

# (2) 세로형
# - 롱(long)포맷, 스택형(stacked),
#   로우-와이즈형(row-wise), 집합(gather)포맷이라고 부름
# - 데이터셋을 구성하는 변수컬럼들이 동일한 주제가 아닌 독립적인 주제로 구성됨
# - 독립적 주제를 가지는 변수컬럼별 데이터가 세로방향으로 길게 쌓여있는 구조
# - 주로 컴퓨터(알고리즘)이 연산/처리하기 좋은 구조

## 주요 패키지와 기능함수 비교
# tidyr 패키지:: gather(롱포맷으로변환) <--> spread(와이드포맷으로변환)
# reshape 패키지:: melt(롱포맷으로변환) <--> cast(와이드포맷으로변환)
# reshape2 패키지:: melt(롱포맷으로변환) <--> dcast(와이드포맷으로변환)
# - reshape 관련패키지에서는 분해(melt)를 통해 와이드형을 롱포맷으로 변환하며,
#   재구조화(cast)를 통해 롱포맷을 와이드포맷으로 변환한다는 표현을 사용함
# - long형식이든 wide형식이든 자유롭게 변환이 가능해야 함

# --------------------------------
## trans 데이터 준비
# install.packages("tibble")
library(tibble)

## 가상 데이터 생성
# - customID: 고객번호
# - buyDate: 구매일
# - pruduct: 상품1 구매갯수
# - pruduct2: 상품2 구매갯수

trans <- tibble(customID = c("KD257", "KD257", "KD257", 
                             "CT303", "CT303", "AQ115", "AQ115"),
                buyDate = c(170720, 170815, 170720, 
                            170815, 170720, 170720, 170815),
                product1 = c(15, 23, 9, 42, 12, 31, 51),
                product2 = c(16, 7, 21, 34, 9, 65, 27))

trans
# - trans 데이터셋에서 요약집계분석의 기준변수로 사용될만한, 
#   범주형/그룹핑 형태로 될 수 있는 변수를 찾음
# - 현재로서는 cutomID가 고객ID를 기준으로, buyDate가 구매날짜를 기준으로 
#   범주화/그룹핑화/집계가 가능한 요약집계 기준변수임

# - 반면에 product1과 product2는 제품이라는 하나의 주제를 가진 데이터인데, 
#   숏포맷으로, 언스택방식으로 들어 있는 변수컬럼으로 볼 수 있음 
# - 이 2개 변수에 들어 있는 데이터는 상품구매갯수라는 동일한 주제의 데이터인데,
#   상품1과 2에 따라 별도컬럼으로 정리된 상태임
# - 따라서 이 2개 변수를 하나의 변수컬럼에 길게 연결/결합/묶어서 관리해도되는
#   요약집계 결과변수임

###############################################################################
## (1) wide(unstack) to long(stack)
# - 와이드형으로 되어 있는 데이터를 롱형으로 변환하는 방법

trans 
# - 현재의 와이드형 데이터셋 재확인

## reshape::melt() 함수이용 와이드형에서 롱형으로 데이터구조 변환
# install.packages("reshape2")
library(reshape2)

# ---------------------------------------
trans.long <- melt(data = trans, 
                   id.vars = c("customID", "buyDate"),
                   measure.vars = c("product1", "product2"),
                   variable.name = "pd",
                   value.name = "output") 
# - trans라는 와이드포맷  데이터셋을 대상(data=)으로 하며, 
#   customID와 buyDate 변수컬럼을 일종의 기본키(id.vars=)로 설정함
# - 나머지 product1, product2라는 2개 변수컬럼들은 
#   대응/쌍대/짝을이룬/반복측정된 데이터(measure.vars)로   
#   와이드포맷으로 옆으로 나열되어 있는데, 
#   이를 분해(melt)해서 아래로 길게(long) 쌓아놓은(stacked) 형태로 배치함
# - product1, product2라는 2개 변수컬럼들을 하나로 결합한 
#   통합변수명(variable.name=)을 pd로 설정함
#   (이 옵션을 별도로 지정하지 않으면, 기본변수명으로 variable을 사용함)
# - product1, product2라는 2개 변수컬럼들에 들어 있던 실제 요소값들로 
#   통합변수명(value.name)으로 output을 설정해서 분해함
#   (이 옵션을 별도로 지정하지 않으면, 기본변수명으로 value를 사용함)

# --------------------------------
## 와이드형에서 롱포맷으로 재구조화된 데이터셋 확인
trans.long
str(trans.long) 
# - 원래 trans데이터셋의 객체유형은 tibble구조였으나
#   reshape2::melt()함수를 사용한 결과, 일반 data.frame구조로 변경됨

# --------------------------------
## reshape::melt()함수 사용시 기본키(id.vars=) 설정이 중요한 이유
melt(trans, id.vars = c("customID")) # 이렇게 설정하면
# - 집계/그룹/요약기준 변수로 custonID만 사용하고,
#   나머지 buyDate, product1, produc2를 동일한 주제의 변수컬럼으로 간주해서
#   하나의 변수에 연결, 결합시키게 되므로 다루기 어려움
# - 상이한 주제가 한 변수컬럼에 섞여 있는 상태로 출력은 되지만 
#   완전한 스택형이라 볼 수 없음

melt(trans, id.vars = c("buyDate"))
# - 마찬가지 상황
# - 이 결과도 출력은 되지만 완전한 스택형이라 볼 수 없음

# --------------------------------
## 분해(melt)되어 롱포맷으로 변환된 데이터셋을 cusid로 소팅
library(magrittr)
library(dplyr)

trans.long %<>% arrange(customID)
trans.long
# - dplyr::arrange() 함수이용

###############################################################################
## (2) long(stack) to wide(unstack) 
# - 롱포맷으로 되어 있는 데이터셋을 와이드형으로 변환하는 방법

trans.long # 현재의 롱형 데이터셋 재확인

## reshape2::dcast() 함수이용 롱형에서 와이드형으로 데이터구조 변환
# install.packages("reshape2")
library(reshape2)

# ---------------------------------------
## 롱포맷에서 와이드로 재구조화 + 집계함수가 없는 방식
dcast(data = trans.long, 
      formula = customID ~ pd, 
      value.var = "output") 

# - 집계함수가 없으면 데이터 재구조화만 진행함
# - 틸드(~)기호를 중심으로 
#   왼쪽(집계기준변수, 행방향) ~ 오른쪽(집계결과변수: 열방향)
# - 그러나 별도의 집계를 위한 구체적인 집계함수를 설정 하지 않아
#   단순하게 발생했던 거래빈도 수치만 나옴

# ---------------------------------------
## 롱포맷에서 와이드로 재구조화 + 집계함수가 설정방식
dcast(data = trans.long, 
      formula = customID ~ pd, 
      value.var = "output",
      fun.aggregate = mean) 

# - 집계함수를 설정하면 데이터 재구조화와 그에 따른 집계가 동시에 작동함
# - 틸드(~)기호를 중심으로 
#   왼쪽(집계기준변수, 행방향) ~ 오른쪽(집계결과변수: 열방향)
# - 그리고 집계함수 사용으로 구체적인 집계기준에 따른 집계결과가 나옴


# ---------------------------------------
## 다양한 포뮬러(관계식) 설정을 통한 데이터재구조화 + 집계
# - reshape::dcast() 함수 이용
# - data =, formaula = , value.var = , fun.aggregate = 옵션 생략가능
dcast(trans.long, customID ~ pd)
dcast(trans.long, customID ~ pd, mean)

dcast(trans.long, customID ~ buyDate)
dcast(trans.long, customID ~ buyDate, mean)

dcast(trans.long, buyDate ~ pd)
dcast(trans.long, buyDate ~ pd, mean)

dcast(trans.long, buyDate ~ customID)
dcast(trans.long, buyDate ~ customID, mean)

dcast(trans.long, customID + buyDate ~ pd)
dcast(trans.long, customID + buyDate ~ pd, mean)

dcast(trans.long, buyDate + customID ~ pd)
dcast(trans.long, buyDate + customID ~ pd, mean)

dcast(trans.long, customID + pd ~ buyDate)
dcast(trans.long, customID + pd ~ buyDate, mean)

dcast(trans.long, pd + customID ~ buyDate)
dcast(trans.long, pd + customID ~ buyDate, mean)

dcast(trans.long, buyDate + pd ~ customID)
dcast(trans.long, buyDate + pd ~ customID, mean)

dcast(trans.long, pd + buyDate ~ customID)
dcast(trans.long, pd + buyDate ~ customID, mean)

dcast(trans.long, customID ~ pd + buyDate)
dcast(trans.long, customID ~ pd + buyDate, mean)

dcast(trans.long, customID ~ buyDate + pd)
dcast(trans.long, customID ~ buyDate + pd, mean)

dcast(trans.long, buyDate ~ pd + customID)
dcast(trans.long, buyDate ~ pd + customID, mean)

dcast(trans.long, buyDate ~ customID + pd)
dcast(trans.long, buyDate ~ customID + pd, mean)

# ---------------------------------------
## 다양한 관점의 집계
# - dplyr::group_by(), summarize() 함수 이용
# - 다양한 집계기준에 따라 다양한 집계결과변수의 특성비교를
#   다양한 집계연산함수를 동시에 적용할 수 있음

## 개별 고객별 실적비교
trans.long %>% group_by(customID) %>%
  dplyr::summarize(output_n = sum(!is.na(output)),
                   output_sum = sum(output, na.rm = TRUE),
                   output_avg = mean(output, na.rm = TRUE),
                   outputmedian = median(output, na.rm = TRUE),
                   output_sd = sd(output, na.rm = TRUE),
                   output_min = min(output, na.rm = TRUE),
                   output_max = max(output, na.rm = TRUE))

## 개별고객 + 일자별 실적비교
trans.long %>% group_by(customID, buyDate) %>%
  dplyr::summarize(output_n = sum(!is.na(output)),
                   output_sum = sum(output, na.rm = TRUE),
                   output_avg = mean(output, na.rm = TRUE),
                   outputmedian = median(output, na.rm = TRUE),
                   output_sd = sd(output, na.rm = TRUE),
                   output_min = min(output, na.rm = TRUE),
                   output_max = max(output, na.rm = TRUE))

### End of Source ####################################################


## if구문은 벡터 연산이 안됨
## ifelse는 벡터 연산 처리르 위해 생성
num <- 4
if (num %% 2 == 0) {
  out = c("Even Number")
  print(out)
} else {
  out = c("Odd Number")
  print(out)
}

if (is.numeric(num)) {
  out = c("숫자를 입력해 주세요.")
  print(out)
} else {
  out = "이건 숫자가 아니야!"
  print(out)
}
num.v <- "A"
myfun <- function (num.v){
          if (is.numeric(num.v)) {
            out = c("숫자를 입력해 주세요.")
            print(out)
          } else {
            out = "이건 숫자가 아니야!"
            print(out)
          }
        }

myfun(num.v)

## ifelse
## vector로 if문 구현
p <- c(13,24,66,88,22,34)
q <- ifelse (p %% 2 == 0, yes = "Even", no= "Odd")
p
q
## 다중 if문 구현가능
ifelse ( sapply(p, is.numeric),
         yes = "숫자아님",
         no = ifelse (p %% 2 == 0, yes = "짝수", no = "홀수"))


##########################################################################################
## 조건비교 if 관련 구문

## if 조건문을 활용한 홀·짝수 판단

num <- 4
if (num %% 2 == 0) {
  out = c("Even Number")
  print(out)
} else {
  out = c("Odd Number")
  print(out)
}

# ----------------------------------------
## 숫자대신 문자를 입력했을 때 이를 체크하기

num <- "4"

if (!is.numeric(num)) {
  out = c("숫자를 입력해 주세요!")
  print(out)
} else if (num %% 2 == 0) {
  out = c("Even Number")
  print(out)
} else {
  out = c("Odd Number")
  print(out)
}

# num 변수에 복수데이터를 입력해 벡터로 만들어서 체크하기
num <- c(4, 3, -5, 11, 6)
# - 위에작 작성한 if 함수구문은 한번에 1개 값만 처리할 수 있는 스칼라 함수임

##########################################################################################
## 과제 
## 임의의 데이터를 한개 입력했을 때 다음과 같이 처리하는 사용자정의함수를 만드시오. 
# - (1) 짝수를 입력하면, "입력한 숫자 OO은 짝수입니다."라는 문자열 출력
# - (2) 홀수를 입력하면, "입력한 숫자 OO은 홀수입니다."라는 문자열 출력
# - (3) 숫자이외의 데이터를 입력하면, "입력한 OO는 숫자가 아닙니다."라는 문자열 출력
#----------------------------------------------------------------------------------------
num.v <- "A"
myfun <- function (num.v){
  if (is.numeric(num.v)) {
    out = "입력한 숫자 "
    if(num.v %% 2 ==0){
      out = paste(out,num.v,"는 짝수입니다.")
    } else {
      out = paste(out,num.v,"는 홀수입니다.")
    }
  } else {
    out = paste("입력한 ",num.v,"는 숫자가 압니다.")
  }
  print(out)
}

myfun(num.v)

##########################################################################################
## 벡터연산(복수데이터를 처리) 할 수 있는 ifelse 함수구문
# ifelse 조건문을 활용한 홀·짝수 판단

p <- c(11, 20, 13, 24, 106)

q <- ifelse (p %% 2 == 0, yes = "짝수", no = "홀수")

p
q

r <- data.frame(데이터 = p, 홀짝판단 = q)
r

ifelse (!sapply(p, is.numeric), 
        yes = "숫자가 아닙니다.", 
        no = ifelse(p %% 2 == 0, yes = "짝수", no = "홀수"))


##########################################################################################

## 과제
# - 학생명부(roster)에서 3과목의 평균점수를 계산하시오.
# - A: 90점이상, B: 80점이상, C: 70점이상, D: 60점이상, E: 60점미만을 기준으로 
#   파생변수 grade를 만드시오.

# 단, grade 파생변수를 만들때 다음과 같이 3가지 방식으로 만드시오
# (1) 기본적인 대괄호[]연산자와 달러$연산자를 사용한 방식
# (2) base::cut 함수를 이용한 방식, 단방향 파이프연산자도 사용할 것
# (3) if ~ else 또는 ifelse 관련 구문을 사용한 방식
#     dplyr::mutate()와 단방향 또는 양방향 파이프연산자를 사용할 것

student <- c("John Davis","Angela Williams","Bullwinkle Moose",
             "David Jones","Janice Markhammer", "Cheryl Cushing",
             "Reuven Ytzrhak", "Greg Knox","Joel England","Mary Rayburn")
math <- c(502, 600, 412, 358, 495, 512, 410, 625, 573, 522)
science <- c(95, 99, 80, 82, 75, 85, 80, 95, 89, 86)
english <- c(25, 22, 18, 15, 20, 28, 15, 30, 27, 18)

# first name 또는 Last name만 따서
# ~~님 반갑습니다. 라는 letter에 집어넣기
library(tibble)
roster <- tibble(student, math, science, english)
roster
library(doBy)
roster$avg.tot <- aggregate(x = roster,
                            by = list(Math=roster$math, SC=roster$science, ENG=roster$english),
                            FUN = mean, na.nm=TRUE)

roster$avg.tot <- tapply(c(roster$math,roster$science,roster$english),roster$student,mean)


roster$avg.tot <- cut(mean((roster$math+roster$science+roster$english)/3),
                  breaks = c(-Inf, 60, 70, 80, 90, Inf),
                  include.lowest = FALSE, right = TRUE, 
                  labels = c("E", "D", "C", "B", "A")) 

roster %<>% mutate(avg.tot = 
                 dplyr::recode(dd$cut,
                               "Fair"="Normal",
                               "Good"="Normal",
                               "Very Good"="Normal",
                               "Premium"="Special",
                               "Ideal"="Special"))


lapply(ex, sum)

rep(x = 3, times = 4) ## 3을 4번 반복
rep(3,4)
# [1] 3 3 3 3

rep(2:4, time=2)
# [1] 2 3 4 2 3 4

rep(2:4, 2)
# > rep(2:4, 2)
# [1] 2 3 4 2 3 4

rep(2:4, each=3)
# > rep(2:4, each=3)
# [1] 2 2 2 3 3 3 4 4 4

rep("a", times =5)
# [1] "a" "a" "a" "a" "a"

rep(c("a",1),3)
# [1] "a" "1" "a" "1" "a" "1"

rep(c("a",1),c(3,5))
# [1] "a" "a" "a" "1" "1" "1" "1" "1"


seq(1:10)
# > seq(1:10)
# [1]  1  2  3  4  5  6  7  8  9 10

seq(1,10)
# > seq(1,10)
# [1]  1  2  3  4  5  6  7  8  9 10

seq(from=1, to=10)
# > seq(from=1, to=10)
# [1]  1  2  3  4  5  6  7  8  9 10

seq(1,10,2)
#   > seq(1,10,2)
# [1] 1 3 5 7 9

seq(from =1, to=10, by=2)
# > seq(from =1, to=10, by=2)
# [1] 1 3 5 7 9

seq(1,10, length = 4)
# > seq(1,10, length = 4)
# [1]  1  4  7 10

seq(1,10, length = 5)
# > seq(1,10, length = 5)
# [1]  1.00  3.25  5.50  7.75 10.00

##########################################################################################
## 반복·수열·순차 데이터 생성: rep( ) 함수

# 숫자 3을 4번 반복
rep(x = 3, times = 4)
rep(3, 4)

# 숫자벡터 2~4까지를 2번 반복
rep(2:4, times=2)
rep(2:4, 2)

# 숫자벡터 2~4까지에서 각 원소별로 3번씩 반복
rep(2:4, each=3)

# 숫자벡터 2~4까지에서 각 원소별로 2번씩 반복하고, 전체적으로 3번 반복
rep(2:4, each=2, times=3)

## 문자 "a"를 5번 반복
rep("a", times = 5)
rep("a", 5)

## 문자 "a"와 숫자 1을 3번 반복
rep( c("a", 1), 3)

## 문자 "a" 먼저 3번 반복, 숫자 1을 5번 반복
rep( c("a", 1), c(3, 5))


##########################################################################################
## 반복·수열·순차 데이터 생성: seq( ) 함수

## 숫자 1부터 10까지 입력
1:10
(1:10)
c(1:10)

## seq()를 이용한 숫자 1부터 10까지 입력
seq(1:10)
seq(1, 10)
seq(from=1, to=10)

## by를 이용한 증가 단위 지정
seq(1, 10, 2)
seq(from = 1, to=10, by = 2)

## 1~10까지 숫자 중 지정된 개수 만큼의 일정간격 숫자 생성
seq(1, 10, length = 4)
seq(1, 10, length = 5)

### End of Soource #######################################################################


paste("a",1,2,"b","c")
# [1] "a 1 2 b c"
paste("A",1:6,sep=)
# [1] "A 1" "A 2" "A 3" "A 4" "A 5" "A 6"
paste("A",1:6,sep="")
# [1] "A1" "A2" "A3" "A4" "A5" "A6"

name <- "Julia"
greeting <-"안녕하세요,"
greeting.end <-"반가워요!"
key.ent <- "\n"
paste(greeting,name,greeting.end)
# [1] "안녕하세요, Julia 반가워요!"
cat(greeting,name,greeting.end)
# 안녕하세요, Julia 반가워요!

pp <- paste(greeting,name,greeting.end)
str(pp) 
# chr
qq <-cat(greeting,name,greeting.end)
str(qq)
# NULL



##########################################################################################
## 문자열 다루기: paste( )

# 주어진 데이터를 하나의 문자열로 연결해 출력
# 사이에 공백존재
paste("a", 1, 2, "b", "c")

# 문자열과 변수데이터 연결
name <- "Julia"
paste("안녕하세요,", name, "반가워요!")

# 문자 "A"와 1~6까지의 숫자를 각각 연결함(사이에 공백존재)
paste("A", 1:6)

# sep = "" 옵션을 통해 사이에 공백없앰
paste("A", 1:6, sep = "")

# 바로 위의 내용과 동일
paste0("A", 1:6)

# sep = "-" 옵션을 통해 사이에 하이픈(-)기호로 연결함
paste("A", 1:6, sep = "-")

# collapse = "" 옵션을 통해 하나의 문자열로 만듦
paste("A", 1:6, sep = "", collapse = "")

# collapse = "," 옵션을 통해 콤마(,)기호가 들어간 하나의 문자열로 만듬
paste("A", 1:6, sep = "", collapse = ",")

##########################################################################################

# 주어진 데이터를 하나의 문자열로 연결해 출력(사이에 공백)
paste("a", 1, 2, "b", "c")
cat("a", 1, 2, "b", "c")

# 문자열과 변수값 연결해 출
name <- "Julia"
paste("안녕하세요,", name, "반가워요!")
cat("안녕하세요,", name, "반가워요!")

# 줄바꿈 기능작동여부
paste("안녕하세요,", name, "\n", "반가워요!")
cat("안녕하세요,", name, "\n", "반가워요!")
M<- cat("안녕하세요,", name, "반가워요!")
str(M)

# 문자 "A"와 1~6까지의 숫자를 연결하는 경우
paste("A", 1:6)
cat("A", 1:6)

# sep = "" 옵션을 통해 사이에 공백없앰
paste("A", 1:6, sep = "")
cat("A", 1:6, sep = "")

# sep = "-" 옵션을 통해 사이에 하이픈(-)기호로 연결함
paste("A", 1:6, sep = "-")
cat("A", 1:6, sep = "-")


##########################################################################################
# 문자열 다루기: nchar( ), substr( )

# nchar() 함수로 문자열의 글자수 알아내
x <- c("Seoul", "New York", "London", "1234")
nchar(x)

# substr() 함수로 문자열의 일부분 선택하기
time_stamp <- c("201503201040", "201504211041", "201507251042", "201508071043")
substr(time_stamp, 1, 6)
substr(time_stamp, 5, 8)

country <- c("Korea", "Japan", "China", "Singapore", "Russia")
substr(country, 1, 3)

### End of Source ########################################################################


## 상수함수 - 미리 언어 자체에서 선언되어 있는 함수
## 일정한 값을 미리 가지고 있다. 
letters
LETTERS
month.abb
month.name
pi


str(letters)
str(LETTERS)
str(month.abb)
str(month.name)
str(pi)

sample(letters[1:5],10, replace=TRUE)
sample(LETTERS[1:20],10, replace=TRUE)


sample(letters,10, replace=TRUE)
sample(100:999,10)

id1 <- sample(letters,10, replace=TRUE)
id2 <- sample(100:999,10)

paste(id1, id2, sep="")

########################################################################
## R에 있는 상수함수
########################################################################

letters # 알파벳 소문자
LETTERS # 알파벳 대문자
month.abb # 월이름 약어
month.name # 월이름 풀네임
pi # 원주율

########################################################################
length(letters); nrow(letters); NROW(letters) # 갯수확인
length(LETTERS); nrow(LETTERS); NROW(LETTERS) # 갯수확인

str(letters) # 구조확인
str(LETTERS) # 구조확인

letters[1:5] # 일부 소문자 추출
LETTERS[3:7] # 일부 대문자 추출

sample(letters[1:5], 10, replace = TRUE) # 무작위 소문자 복원 추출
sample(LETTERS[1:20], 10, replace = FALSE) # 무작위 대문자 비복원 추출

########################################################################
## 알파벳 상수를 이용한 무작위 ID만들기
sample(letters, 10, replace = TRUE) # 무작위 10개 소문자 복원 추출
sample(100:999, 10) # 무작위 100~999 중 10개 숫자 비복원 추출

id1 <- sample(letters, 10, replace = TRUE) # 무작위 10개 소문자 복원 추출
id2 <- sample(100:999, 10) # 무작위 100~999 중 10개 숫자 비복원 추출

paste(id1, id2, sep = "") # 영문명과 숫자를 결합한 무작위 10개 ID생성

### End of Code ########################################################


say.hello <- function(){
  print("Hello, world!")
}
say.hello()


########################################################################
### 사용자 정의함수 만들기(User defined function)
########################################################################

## 간단한 사용자 정의함수 만들기

say.hello <- function() { 
  print("Hello, World!")
}
# - 사용자정의함수에 특별한 인수설정없음 
# - say.hello() 괄호안에 아무것도 안넣으면, 준비되어 있는 코드 실행
# - say.hello() 괄호안에 어떤 것을 넣으면, 
#               이를 받아주는 인수가 코딩되어 있지 않으므로 에러발생

say.hello() 
# - 특별한 인수를 입력하지 않아도 정해져 있는 함수기능이 실행됨

say.hello("aaa") 
# - 에러발생: 사용자정의함수에 어떤 값을 받아들이는 인수설정 코드가 없으므로 

say.hello(bbb)
# - 에러발생: 사용자정의함수에 어떤 값을 받아들이는 인수설정 코드가 없으므로 

## 이렇게 해도 출력이 됨(1)
say.hello <- function() { 
  "Hello, World!!!!!!!!" # 이 값이 유일한 리턴값이므로 출력됨
}

say.hello()

## 이렇게 해도 출력이 됨(2)
say.hello <- function() { 
  "Hello, World!!!!!!!!"
  print("Hello, World!22222") # 이 값이 마지막 실행결과값이므로 리턴됨 
}

say.hello()

########################################################################
## 또다른 사용자 정의함수 만들기

## sprintf(): 문자열과 변수를 결합해 하나의 문자열로 만들어 줌
# - 사용자정의함수 본문에 사용해 인수값 변화에 따라 
#   약속된 문장이 출력되도록 하는데 편리함

sprintf("Hello, %s!", "Jared") 
# - %s 코드는 변수값을 받는 부분
# - 뒤에 있는 "Jared"가 %s에 들어갈 변수값임

sprintf("Hello %s, today is %s.", "Jared", "Sunday")
# - 2개의 %s 코드 모두 변수값을 받는 부분
# - 뒤에 있는 "Jared"가 첫번째 %s에 들어가고, 
#   "Sunday"가 두번째 %s에 들어가는 변수값임

# --------------------------------------------------
## 사용자정의함수(1): 인수 1개설정

hello.person <- function(name) {
  print(sprintf("Hello, %s!", name))
}
# - name이라는 인수를 사용자정의 함수에 설정함

hello.person("Jared")
# - 괄호안에 "Jared"

hello.person 
# - 괄호가 없어서 함수코드가 그대로 출력됨

hello.person() 
# - 약속된 name인수에 입력된 값이 없어서 에러발생

hello.person(2321) 
# - 숫자가 입력됐지만 name인수의 입력값으로 인식해 작동함

hello.person("!@$!@$@") 
# - 여러 기호들을 입력했지만 name인수의 입력값으로 인식해 작동함

# --------------------------------------------------
## 여러작업을 순차적으로 진행할 때 관련 함수들의 사용방식

# i) 함수에 함수를 중첩시킴 
hello.friend <- function(name) {
  print(sprintf("Hello, %s!", name))
}

hello.friend("마이클")

# ii) 함수작업을 임시변수에 넘겨받아 그 다음작업에 활용
hello.friend <- function(name) {
  result <- sprintf("Hello, %s!", name)
  print(result)
}

hello.friend("마이클")

# iii) magrittr패키지의 %>% 파이프연산자 이용
library(magrittr)

hello.friend <- function(name) {
  sprintf("Hello, %s!", name) %>% 
    print
}

hello.friend("마이클")

# --------------------------------------------------
## 사용자정의함수(2): 인수 2개설정

hello.person2 <- function(first, last) {
  print(sprintf("Hello, %s %s!", first, last))
}
# - 사용자정의함수에 first와 last라는 인수 2개를 설정함

## 사용자정의함수 사용시 인수입력에 따라 정상/오류 결과 
hello.person2()
hello.person2("Jared") 
hello.person2("Lander")
hello.person2("Jared", Lander) 
hello.person2(Jared, "Lander") 
hello.person2(Jared, Lander)  

hello.person2("Jared", "Lander")
hello.person2("Lander", "Jared")

hello.person2(first = "Jared", last = "Lander")
hello.person2(last = "Lander", first = "Jared")

hello.person2(first = "Jared", "Lander")
hello.person2("Jared", last = "Lander")

hello.person2(last = "Lander", "Jared")
hello.person2("Lander", first = "Jared")

hello.person2(fir = "Jared", l = "Lander")
hello.person2(f = "Jared", "Lander")
hello.person2("Jared", la = "Lander")

hello.person2(123, "Lander") 
# - 2개 인수중 어느 하나를 숫자로 입력하면 문자로 변환됨

hello.person2(123, 2234) 
# - 2개 인수 모두 숫자입력했지만 sprint에 의해서 문자열로 바뀜

# --------------------------------------------------
## 사용자정의함수(3): 인수 2개설정 & 디폴트 인수1개설정

hello.person3 <- function(first, last = "Doe") {
  print(sprintf("Hello, %s %s!", first, last))
}

hello.person3()
hello.person3("Jared")
hello.person3("Lander")

hello.person3("Jared", "Lander")
hello.person3("Lander", "Jared")

hello.person3(first = "Jared", last = "Lander")
hello.person3(first = "Jared")
hello.person3(fir = "Jared")
hello.person3(last = "Lander")
hello.person3(l = "Lander")

# --------------------------------------------------
## 사용자정의함수(4): 인수 2개설정 & 미정의 인수 1개 설정

hello.person3("Jared", "Lander", extra = "Goodbye")
hello.person3("Jared", "Lander", "Goodbye")

hello.person4 <- function(first, last = "Doe", ...) {
  print(sprintf("Hello, %s %s!", first, last))
}

hello.person4("Jared", "Lander", extra = "Goodbye")
hello.person4("Jared", "Lander", "Goodbye")
# -  미정의 인수를 설정해 놓으면, 사용자가 공식설정된 인수 이외에
#    엉뚱한 인수를 사용자정의함수에 입력해도 문제없이 출력되도록 해줌

# --------------------------------------------------
## 현재까지 생성되어 메모리에 로딩된 사용자정의함수 조회
ls() # 메모리상의 전체 객체목록 조회
ls(pattern = "hello") 
# - 메모리상의 전체 객체목록 중 "hello"라는 이름을 가진 객체만 출력

########################################################################
## 사용자정의함수의 자동화 사용(1)

## do.call 함수의 이용
do.call("hello.person2", args = list(first = "Jared", last = "Lander"))
do.call(hello.person2, args = list(first = "James", last = "Bond"))

## 학생명부 데이터프레임 생성
f.name <- c("John", "Ang", "Bull", "David", "Janice", 
            "Cheryl", "Reuven", "Greg", "Joel", "Mary")
l.name <- c("Da", "ela", "winkle", "Jones", "Markhammer",
            "Cushing", "Ytzrhak", "Knox", "England", "Rayburn")
roster <- data.frame(f.name, l.name, 
                     stringsAsFactors=FALSE)
roster

## 특정함수 반복시 사용
## 학생성명들을 성과 이름으로 분리한 데이터를 입력해 사용자정의함수를 자동반복시
do.call(hello.person2, ## "hello.person2" 이런 표기도 무
        args = list(first = roster$f.name, 
                    last = roster$l.name))

########################################################################
## 사용자정의함수의 자동화 사용(2)

# 일련의 데이터와 원하는 R함수를 인수값으로 입력하면 계산이 되도록 
calc <- function(x, func = mean) {
  do.call(func, args = list(x))
}

calc(1:10)
calc(1:10, mean)
calc(1:10, sum)
calc(1:10, sd)

### End of Code ########################################################

########################################################################
### 사용자 정의함수 만들기(User defined function)
########################################################################

## 간단 내장데이터 로딩

# install.packages("MASS")
library(MASS)
# - MASS패키지에 내장된 Animals 데이터 이용

library(help = MASS) # 패키지 관련 도움말 뷰어
help(package = MASS) # 패키지 관련 알파벳 순서 도움말
data(package = "MASS") # 패키지내 예제데이터 목록 조회

data(Animals, package = "MASS") # 패키지내 특정 예제데이터 메모리로딩
help(Animals) # 특정 예제데이터 코딩북 도움말 확인

Animals # 특정 예제데이터 내용조회

## summary() 이용 요약
summary(Animals) # 벡터연산가능
Hmisc::describe(Animals)
prettyR::describe(Animals)
psych::describe(Animals)
skimr::skim(Animals)


## 함수마다 벡터연산 가능여부가 다양함
mean(Animals) # 벡터연산 불가능
median(Animals) # 벡터연산 불가능
var(Animals) # 벡터연산 가능
sd(Animals) # 벡터연산 불가
# - 벡터연산가능: 한번에 어러개의 변수컬럼에 대해 함수적용가능
# - 벡터연산불가능: 한번에 하나의 변수컬럼에만 함수사용가능

## 데이터순환을 통한 벡터연산함수화
# - Animals 데이터셋에 있는 모든 변수컬럼단위로 기술통계구하기
# - sapply()는 결과를 벡터형태로, lapply()는 결과를 리스트형태로 만들어줌
sapply(Animals, mean)
lapply(Animals, mean)

sapply(Animals, median)
lapply(Animals, median)

sapply(Animals, var)
lapply(Animals, var)

sapply(Animals, sd) ## vector
lapply(Animals, sd) ## list

########################################################################
## 사용자정의함수를 이용한 종합 기술통계 분석함수 만들기
detail <- function(x) {
  
  ## 나만의 기술통계분석
  a1 <- length(x) # 요소갯수
  a2 <- sum(is.na(x)) # 결측치갯수 NA면 1(TRUE) 
  a3 <- length(unique(x)) # 항목갯수
  a4 <- mean(x, na.rm = TRUE) # 산술평균
  a5 <- median(x, na.rm = TRUE) # 중앙값
  a6 <- var(x, na.rm = TRUE) # 분산
  a7 <- sd(x, na.rm = TRUE) # 표준편차
  a8 <- min(x, na.rm = TRUE) # 최소값
  a9 <- max(x, na.rm = TRUE) # 최대값
  a10 <- quantile(x, 1/4, na.rm = TRUE) # 1분위수 - 25%지점
  a11 <- quantile(x, 3/4, na.rm = TRUE) # 3분위수 - 75%지점
  
  ## 왜도와 첨도를 구하는 별도 패키지 인스톨체크(require-메모리로딩확인)와 로딩
  if (!require(moments)) {install.packages('moments')}
  library(moments)
  a12 <- skewness(x) # 왜도
  a13 <- kurtosis(x) # 첨도
  
  ## 기술통계 결과: 데이터프레임형식
  item <- c("요소갯수","결측치갯수","항목갯수", 
            "산술평균", "중앙값", "분산", "표준편차", 
            "최소값", "최대값", "1분위수", "3분위수", "왜도", "첨도")
  out <- c(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13)
  final.df <- data.frame(기술통계항목 = item, 
                               기술통계량 = round(out, 1)) 
                              ## round(x,1) - 소수 첫째자리로 반올림
  
  ## 기술통계 결과: 리스트형식
  final.lt <- list("요소갯수" = a1,"결측치갯수" = a2,"항목갯수" = a3, 
                   "산술평균" = a4, "중앙값" = a5, "분산" = a6, "표준편차" = a7, 
                   "최소값" = a8, "최대값" = a9, "1분위수" = a10, "3분위수" = a11, 
                   "왜도" = a12, "첨도" = a13)
  
  ## 최종 리턴값을 데이터프레임으로 선택하는 경우
  return(final.df)
  
  ## 최종 리턴값을 리스트로 선택하는 경우
  # return(final.lt)
}

## 사용자정의함수를 이용한 기술통계분석
detail(Animals$body)
detail(Animals$brain)
# - 변수컬럼 하나씩만 기술통계분석이 되는 벡터연산 불가능한 사용자정의함수

detail(Animals)
# - detail 함수는 벡터연산이 안되어서, 에러발생 

lapply(Animals, detail)
# - Animals 데이터셋에 있는 모든 변수컬럼을 
#   하나씩 읽어들여서 병행작업해주는 벡터함수로 작동

median(Animals[,], na.rm = TRUE)


### End of Code ########################################################
#stringr::str_length()

#문자열마다의 글자수를 계산함

#base::nchar() number of character



nchar(c("i", "like","안녕!", NA, "Tobig's","NA",3846))

#텍스트마이닝에서 (그,것,이,저) =불용어



library(stringr)

str_length(c("i", "like","안녕!", NA, "Tobig's","NA",7429751657268))

#자릿수 카운팅



#------------------------------------------------

#str_sub()

#지정된 범위만큼 부분문자열을 추출함

#base::substr()



x <- "사랑해요, Jason Bourne!"



substr(x, start = 3, stop = 9)



str_sub(x, start=3, end=9)

str_sub(x, end=9)

#start=1라는 디폴트값이 적용되어 있음

#옵션명은 생략가능

str_sub(x, 1, 9)



str_sub(x, -7)

# -는 거꾸로 역산해서 7자리를 잘라낸다.
## index > 0 -> 해당위치 
## index < -n -> 해당위치 글자만 제외
## -26 <= index <= 26
## 소문자 
letters
# [1] "a" "b" "c" "d" "e" "f" "g" "h" "i" "j" "k" "l" "m" "n" "o" "p" "q" "r" "s" "t"
# [21] "u" "v" "w" "x" "y" "z"
letters[1]
# [1] "a"
letters[-1]
# [1] "b" "c" "d" "e" "f" "g" "h" "i" "j" "k" "l" "m" "n" "o" "p" "q" "r" "s" "t" "u"
# [21] "v" "w" "x" "y" "z"
letters[26]
letters[-26]
# [1] "a" "b" "c" "d" "e" "f" "g" "h" "i" "j" "k" "l" "m" "n" "o" "p" "q" "r" "s" "t"
# [21] "u" "v" "w" "x" "y"

## 대문자
LETTERS
LETTERS[1]
LETTERS[-1]
LETTERS[26]
LETTERS[-26]




## paste0 -> sep="" default
paste0(letters[-26],"comes before",letters[-1])
paste(letters[-26],"comes before",letters[-1], sep=" ")

library(stringr)
str_c(letters[-26],"comes before",letters[-1],sep=" ")


raw <- c("881113-2788212-00123","920301-2081777-22913")
## 문자열 쪼개기
strsplit(raw,"-") ## list 형식으로 분

strspilt(raw,"-",fixed = FALSE, perl = FALSE, useBytes=TRUE)
## 문자열 쪼개
str_split(raw,"-")
## 분리개수 출력 옵션 n
str_split(raw,"-",n=2)


x <- c(as = "asfef", qu = "qwerty", "yuiop[", "b", "stuff.blah.yech")
# split x on the letter e
strsplit(x, "e")

unlist(strsplit("a.b.c", "."))
## [1] "" "" "" "" ""
## Note that 'split' is a regexp!
## If you really want to split on '.', use
unlist(strsplit("a.b.c", "[.]"))
## [1] "a" "b" "c"
## or
unlist(strsplit("a.b.c", ".", fixed = TRUE))

## a useful function: rev() for strings
strReverse <- function(x)
  sapply(lapply(strsplit(x, NULL), rev), paste, collapse = "")
strReverse(c("abc", "Statistics"))

## get the first names of the members of R-core
a <- readLines(file.path(R.home("doc"),"AUTHORS"))[-(1:8)]
a <- a[(0:2)-length(a)]
(a <- sub(" .*","", a))
# and reverse them
strReverse(a)

## Note that final empty strings are not produced:
strsplit(paste(c("", "a", ""), collapse="#"), split="#")[[1]]
# [1] ""  "a"
## and also an empty string is only produced before a definite match:
strsplit("", " ")[[1]]    # character(0)
strsplit(" ", " ")[[1]]   # [1] ""


celeb <- c("장그래","김이준","유시인","서서원","흥부자","간그네","장돈건")

## 문자열 찾기 -> grep과 동일 
str_detect(celeb, "그")
k <- str_detect(celeb, "그")
which(k)
celeb[c(1,6)]
celeb[str_detect(celeb,"그")]

str_detect(celeb, "그") %>% which %>% (function(x){celeb(x)})

# install.packages("stringr")
library(stringr)

##########################################################################
## stringr::str_length() 
# - 문자열마다의 글자수를 계산함
# - base::nchar()

nchar(c("i", "like","안녕!", NA, "Tobig's", "NA"))

str_length(c("i", "like","안녕!", NA, "Tobig's", "NA"))
# - NA에 대해서는 문자길이값 2가 아닌 그대로 NA를 출력해줌

##########################################################################
## str_sub()
# - 지정된 범위만큼 부분문자열을 추출함
# - base::substr()

x <- "사랑해요, Jason Bourne!"

substr(x, start = 3, stop = 9)

str_sub(x, start = 3, end = 9)
str_sub(x, end = 9)
str_sub(x, 1, 9)
# - x에 들어 있는 문자열 내용 중 띄어쓰기까지 포함해 9번째 문자까지 반환해줌
# - start 값을 지정해주지 않으면, default 값인 1로 지정됨 

str_sub(x, -7)
# - 음수를 사용하여 문자열의 끝에서부터 거꾸로 위치를 지정할 수 있음

##########################################################################
## str_c()
# - 문자열을 통합해주는 함수
# - base::paste0()
# - base::paste(sep = "")

## 알파벳 소문자 상수함수
letters # 전체 26개 알파벳 소문자 출력
letters[1] # 전체 26개 소문자 알파벳 중 첫번째 알파벳인 "a"만 출력
letters[-1] # 전체 26개 소문자 알파벳 중 첫번째 알파벳인 "a"를 제외하고 모두 출력
letters[26] # 전체 26개 소문자 알파벳 중 첫번째 알파벳인 "z"만 출력
letters[-26] # 전체 26개 소문자 알파벳 중 마지막 알파벳인 "z"를 제외하고 모두 출력

## 알파벳 대문자 상수함수
LETTERS
LETTERS[1]
LETTERS[-1]
LETTERS[26]
LETTERS[-26]

paste0(letters[-26], "comes before", letters[-1])
paste(letters[-26], "comes before", letters[-1], sep = " ")

str_c(letters[-26], "comes before", letters[-1], sep = " ")
atoz <- str_c(letters[-26], "comes before", letters[-1], sep = " ")
atoz
as.data.frame(atoz)

##########################################################################
## str_split()
# - 문자열을 분리해주는 함수
# - 최대 n 개의 분할을 지정할 수 있고, 결과값은 list객체임
# - base::strsplit(x, split)

raw <- c("781031-1067121-00375", "923017-2048239-77206")

strsplit(raw, "-")

str_split(raw, "-")
str_split(raw, "-", n = 2)
# - 앞에서부터 순차적으로 나누면서 2개로 분할 될 때까지 나누어줌 

##########################################################################
## str_detect()
# - 지정된 문자가 들어 있는지 logical 값으로 반환해줌 

celeb <- c("손석휘", "김이준", "유시인", "흥부자", "원동원",
           "장그래", "서서원", "손사자", "방탄단", "트둥이")

str_detect(celeb, "그")
k <- str_detect(celeb, "그")
which(k)
celeb[6]
celeb[str_detect(celeb, "그")]

str_detect(celeb, "그") %>% which %>% (function(x) {celeb[x]})

str_detect(celeb, "이")
str_detect(celeb, "이") %>% which %>% (function(x) {celeb[x]})

str_detect(celeb, "^손")
str_detect(celeb, "^손") %>% which %>% (function(x) {celeb[x]})
# - "손" 이라는 글자로 시작하는 데이터 찾기

str_detect(celeb, "자$")
str_detect(celeb, "자$") %>% which %>% (function(x) {celeb[x]})
# - "자"라는 글자로 끝나는 데이터 찾기

str_detect(celeb, "[시탄트]")
str_detect(celeb, "[시탄트]") %>% which %>% (function(x) {celeb[x]})
# - 시, 탄, 트 라는 글자가 하나라도 들어 있는 데이터 찾기 

##########################################################################
## str_count()
# - 특정한 글자가 몇 개 들어 있는지 찾아 줌

str_count(celeb,"원")

##########################################################################
## str_extract()
# - 지정된 글자와 매칭된 데이터를 추출하며, 매칭되지 않는 요소는 NA로 출력함
# - base::grep()

wishlist <- c("apples x4", "5flour2", "sugar", "milk x2")

str_extract(wishlist, "\\d") 
# - "\\d"는 숫자 출력

str_extract(wishlist, "[a-z]+")
# - "[a-z]+"는 영어소문자가 들어 있는, 갯수에 상관없이 찾아달라는 의미

grep("\\d", wishlist, value = TRUE)
grep("[a-z]+", wishlist, value = TRUE)

##########################################################################
## str_replace()
# - 매칭되는 부분에 대해서 새로운 글자로 교체함
# - base::sub()와 같은 기능을 수행함

fruits <- c("one apple", "two pears", "three bananas", 
            "pineapple", "red mango", "blue grape")
fruits

str_replace(string = fruits, pattern = "[aeiou]", replacement = "-") ## 1개만
str_replace_all(string = fruits, pattern = "[aeiou]", replacement = "-") ## 개수상관없이
str_replace(string = fruits, pattern = "apple", replacement = "diamond")

##########################################################################
## str_trim
# - 데이터 좌우에 존재하는 공백문자를 제거해주는 함수

frs <- c(" one apple", "two pears ", " three bananas ", 
         "pineapple  ", "  red mango", "   blue grape   ")
frs

str_trim(frs, side="left")
str_trim(frs, side="right")
str_trim(frs, side="both")

### End of Source ########################################################

install.packages("knitr")


#2018년 9월 21일 필기
##############################################################################
#### ggplot {gglot2}를 이용한 개별 변수에 대한 분포특성 분석
##############################################################################

## --------------------------------------
## ggplot2 패키지 설치 및 로딩
# install.packages("ggplot2")
library(ggplot2)

## ggplot2 패키지에 대한 도움말
library(help = ggplot2) # 간단 도움말 뷰어 오픈
help(package = ggplot2) # 알파벳순서 도움말 탭 오픈
data(package = "ggplot2") # 해당 패키지에 들어 있는 예제데이터셋 목록확인

## --------------------------------------
## ggplot2 패키지에 들어 있는 mpg데이터셋 로딩
data(mpg, package = "ggplot2") # mpg 데이터셋 메모리로 로딩
help(mpg) # mpg 데이터셋 도움말(코딩북 확인)

## --------------------------------------
## mpg데이터셋 내용조회
library(psych)
psych::headTail(mpg)
mpg # mpg 데이터셋 내용조회, tibble 형식이라 간단하게 조회됨

## --------------------------------------
## mpg 데이터셋 구조파악 및 기술통계분석
str(mpg) # 기본 구조

# install.packages("dplyr")
library(dplyr)
glimpse(mpg) # tibble 구조

library(Hmisc)
Hmisc::describe(mpg) # 상세 기술통계분포

##############################################################################
## (1) 하나의 연속형 변수에 대한 분포파악

## --------------------------------------
## 고속도로 연비(hwy)에 대한 기본 플롯팅
ggplot(data = mpg, aes(x = rownames(mpg), y = hwy)) + geom_point()
# - ggplot() 함수의 기본코딩형식
#aes(x = rownames(mpg), y = hwy) x축에는 뭘 뿌린다. y축에는 뭘 뿌린다.
#어떻게 시각화할지는 +로 추가한다. geom_point()는 산점도
#더하기 다음에 엔터 쳐야해요

ggplot(mpg, aes(rownames(mpg), hwy)) +
  geom_point()
# - 인수명생략과 플러스(+) 기호를 이용한 줄바꿈
# 위와 상동한 코드

p <- ggplot(mpg, aes(rownames(mpg), hwy)) # 대상데이터셋과 대상 X축 & Y축 변수설정
p <- p + geom_point() # 설정된 X축 & Y축 변수를 이용해 어떤 기하학적 구조로 표현할지 결정
p # 플러스(+) 기호를 이용해 연결된 ggplot() 그래픽 코딩문들을 모두 합쳐서 실행/출력함
# 위와 상동한 코드
# 그림 전체를 알파벳 하나로 메모리에 저장할수 있음
## --------------------------------------
# histogram을 이용한 연속변수 분포확인
# - 전체 데이터 범위를 일정한 구간단위(bin)으로 나누어 빈도수를 카운팅해 막대그래프로 표현
ggplot(mpg, aes(hwy)) + geom_histogram() # 기본적으로 구간을 30개 막대로 표현함
ggplot(mpg, aes(hwy)) +
  geom_histogram(bins = 10)
# - 구간을 10개 막대로 구성해 막대의 폭을 상대적으로 넓게 표현함
# bins= 간격, 구간
ggplot(mpg, aes(hwy)) +
  geom_histogram(bins = 100)
# - 구간을 100개 막대로 구성해 막대의 폭이 상대적으로 촘촘하게 표현함

## --------------------------------------
# density를 이용한 연속변수 분포확인
# - 히스토그램의 빈도수를 비율(발생가능 확률)로 계산해 표현
ggplot(mpg, aes(hwy)) + geom_density() # 기본 밀도 곡선
ggplot(mpg, aes(hwy)) + geom_density(fill = "grey50")
# - 기본 밀도곡선 영역에 색상을 채움(fill)
ggplot(mpg, aes(hwy)) + geom_density(fill = "blue", alpha = 0.2)
# - 기본 밀도곡선 영역에 색상을 표현하며, alpha는 불투명도
# 1에 가까울수록 원색에 가까워져 진해짐

## --------------------------------------
# freqpoly를 이용한 연속변수 분포확인
#- 빈도수(frequency)를 다각형곡선(polygonal)으로 표현
ggplot(mpg, aes(hwy)) + geom_freqpoly() # 기본 빈도기반 다각형곡선
ggplot(mpg, aes(hwy)) +
  geom_freqpoly(binwidth = 2.5) # 구간간격을 2.5간격으로 상대적으로 넓게
ggplot(mpg, aes(hwy)) +
  geom_freqpoly(binwidth = 0.2) # 구간간격을 0.2간격으로 상대적으로 촘촘하게
# 범주 + 범주 = 교차/연관
# 연속 + 연속 = 상관성 -> 산점도
# 범주 + 연속 = 요약집계
# 그림 그리는 것이 중요한 것이 아니라,
# 어떤 점을 활용해서 의사결정에 활용할 것이냐가 중요
# 적용, 해석은 매우 다양할 수 있어
#
##############################################################################
## (2) 하나의 연속형 변수에 그룹핑변수를 적용해 요약집계(aggregation) 분포파악

## ---------------------------------------
## 그룹핑(집단구분) 변수로 drv(구동방식) 변수를 선정해 팩터화
mpg$drv.f <- factor(mpg$drv, levels = c("4", "f", "r"),
                    labels = c("4륜구동", "전륜구동", "후륜구동"))
library(psych)
psych::headTail(mpg)
psych::headTail(mpg[c("drv", "drv.f")])

table(mpg$drv.f)

## --------------------------------------
## 히스토그램 이용
ggplot(mpg, aes(displ, fill = drv.f)) +
  geom_histogram(binwidth = 0.1)
# - displ(엔진배기량)에 대한 히스토그램분포를
#   drv.f(구동방식)별로 하나의 그래프 상에 통합해 분포파악
# 요약집계를 시각적으로 보여줌
# mpg를 대상으로하고 x축과 y축의 변수를 aes로 설정
# x축에는 dsipl 배기량, y축에는 drv.f를 집어넣은 것
# fill 옵션 : 구동방식을 y축에 세팅할 때,
# 배기량의 종류에 따라 빈도만큼 색깔로 채워달라는 뜻
# + 히스토그램의 형태(막대 넓이 = 0.1)
# 위의 그래프는 하나의 바디에 그룹변수를 녹인 것

ggplot(mpg, aes(displ, fill = drv.f)) +
  geom_histogram(binwidth = 0.1) +
  facet_wrap(~ drv, ncol = 1)
# - ncol = 1: 세분화된 그래프창을 여러개로 분할 할 때 컬럼을 1칸으로 설정함   
# - 그 1칸에 drv.f(구동방식)별로 행을 여러 줄로 나누어 그래프를 표현하겠다는 의미
#막대에 영역을 record갯수만큼 나눠서 색깔을 채우겠다.
#facet_wrap 옵션 : 단면을 잘라서 묶어서 보여달라는 뜻
#단면을 자르는 기준으로 drv, ncol=1 컬럼을 한칸만 두고
#위 아래로 그래프가 만들어짐 컬럼하나에 그래프 3개 다.



p1 <-ggplot(mpg, aes(displ, fill = drv.f)) +
  geom_histogram(binwidth = 0.1)
p1
install.packages("plotly")
library(plotly)

p2<- ggplotly(p1)
p2
#정적인 그래프는 p1, 변형된 그래프는 p2
# plotly로는 그래프를 동적으로 볼 수 있음
# 프레젠테이션 할 때는 ggplotly가 좋다.

## --------------------------------------
## 빈도다각형곡선(freqpoly) 이용
# displ(엔진배기량)에 대한 빈도다각형분포를
# drv(구동방식)별로 하나의 그래프 상에서 그룹핑해 분포파악
ggplot(mpg, aes(displ, colour = drv.f)) +
  geom_freqpoly(binwidth = 0.5)

# displ(엔진배기량)에 대한 빈도다각형분포를
# drv(구동방식)별로 세분화된 분할그래프 상에서 분포파악
ggplot(mpg, aes(displ, colour = drv.f)) +
  geom_freqpoly(binwidth = 0.5) +
  facet_wrap(~drv, nrow = 1)
# - nrow = 1: 세분화된 그래프창을 여러개로 분할 할 때 행을 1줄로 설정함   
# - 그 1줄에 drv(구동방식)별로 컬럼을 여러 칸으로 나누어 그래프를 표현하겠다는 의미

##############################################################################
## (3) 하나의 범주형 변수에 대한 분포파악

## 차량 제조사(manufacturer) raw데이터 확인
#히스토그램이 아니라, 바차트나 파이차트로 표현을 함
psych::headTail(mpg)
mpg$manufacturer

## --------------------------------------
## 제조사(manufacturer) 변수에 대한 빈도수 분포
ggplot(mpg, aes(manufacturer)) +
  geom_bar()
# - 기본 막대그래프

ggplot(mpg, aes(manufacturer)) +
  geom_bar(stat = "count")
# - stat = "count": 빈도수 카운팅을 통해 막대그래프를 그린다는 것을 명시적으로 코딩

ggplot(mpg, aes(manufacturer, fill = manufacturer)) +
  geom_bar()
# - 제조사별 색상표현과 레전드(가이드 표시)
# 막대그래프에 fill 옵션이 오면 채워진다.

ggplot(mpg, aes(manufacturer)) +  
  geom_bar() + coord_flip()
# - 축을 변환해 가로방향으로 기본 막대그래프 표현
# coord_flip() 각도 꺾어서 표현

ggplot(mpg, aes(manufacturer, fill = manufacturer)) +  
  geom_bar() + coord_flip()
# 축을 변환해 가로방향으로 표현하고, 제조사별 색상표현과 레전드(가이드) 표시

## --------------------------------------
## 제조사(manufacturer)별 차량 빈도수를 별도의 테이블로 생성  
mf.counts <- xtabs(~ mpg$manufacturer)
mf.counts
mf.counts <- as.data.frame(mf.counts)
mf.counts
names(mf.counts)[1] <- c("company") # 빈도테이블의 첫번째 컬럼명 변경
mf.counts

## --------------------------------------
ggplot(data = mf.counts, aes(x = company, y = Freq)) +  
  geom_bar(stat = "identity")
# - 범주형 항목들과 각 항목별 수치(빈도수) 데이터셋을 활용한 기본 막대그래프
# - 특별한 정렬기준이 없으므로 범주항목들의 알파벳 순으로 막대가 나열됨
# - "identity" 는 확인이라는 뜻
ggplot(data=mf.counts,
       aes(x = reorder(company,- Freq), y = Freq)) +
  geom_bar(stat="identity")
#company를 정렬하는데, 정렬할 때에 Freq변수에 있는 걸로 정렬하되
# - 마이너스가 있으니까 내림차순으로 배열해달라

ggplot(mf.counts, aes(reorder(company, - Freq), Freq)) +  
  geom_bar(stat = "identity")
# - 막대그래프를 수치(빈도수)를 기준으로 내림차순으로 정렬을 함

ggplot(mf.counts, aes(reorder(company, + Freq), Freq)) +
  geom_bar(stat= "identity")
#오름차순


ggplot(mf.counts, aes(reorder(company, - Freq), Freq, fill = company)) +  
  geom_bar(stat = "identity")
# - fill = company: 범주형 변수인 company에 들어 있는 각 항목들로
#   가이드(레전드)를 설정하고, 이 항목수만틈 색상을 각 막대에 표현함

ggplot(mf.counts, aes(company, Freq)) +  
  geom_bar(stat = "identity") +
  coord_flip()
# - 가로방향으로 출력, 범주항목 알파벳순으로 밑에서부터 위로 막대가 표현됨

ggplot(mf.counts, aes(reorder(company, Freq), Freq)) +  
  geom_bar(stat = "identity") +
  coord_flip()
# - company에 들어 있는 항목별 Freq(빈도) 크기순으로 오름차순 정렬를 통해
#   막대그래프들을 표현함

ggplot(mf.counts, aes(reorder(company, Freq), Freq)) +  
  geom_bar(stat = "identity", fill = rainbow(NROW(mf.counts))) +
  coord_flip()
# - geom_bar()를 통해 각 막대의 색상을 직접입력함

### End of Source ############################################################


##############################################################################
### ggplot {gglot2}를 활용한 변수간 관련성 분석
##############################################################################

## ggplot2 패키지 설치 및 로딩
# install.packages("ggplot2")
library(ggplot2)

## ggplot2 패키지에 들어 있는 mpg데이터셋 로딩
data(mpg, package = "ggplot2") # mpg 데이터셋 메모리로 로딩
help(mpg) # mpg 데이터셋 도움말(코딩북 확인)

## mpg데이터셋 내용조회

## mpg 데이터셋 구조파악 및 기술통계분석
library(dplyr)
glimpse(mpg) # tibble 구조

library(Hmisc)
Hmisc::describe(mpg) # 상세 기술통계분포

##############################################################################
#### (1) 연속형-연속형 변수간 관련성 분석
##############################################################################

## 연속형-연속형 변수간 관련성은 산점도(scatterplot) 형태로 보통 표현

## ggplot() 함수를 이용한 기본플롯팅
# - displ(엔진배기량)에 따른 hwy(고속도로 환경에서 연비)의 변화를 관찰
ggplot(data = mpg, aes(x = displ, y = hwy)) + geom_point()
# - data: ggplot에 입력할 데이터셋
# - aes: 시각화 대상 변수와 시각적 속성입력
# - geom_OOO: 다양한 기하학적 요소 입력
# x값에 따른 y값을 예측하고 싶은 것
# 직선을 그었을 때 직선과 차이나는 부분이 적을 수록 오차가 적다.

## 함수옵션명(인수, 파라미터) 생략가능
## 세부적인 그래프 설정을 + 기호를 이용해 다음줄에 들여쓰기 가능
ggplot(mpg, aes(displ, hwy)) +
  geom_point() +
  labs(title = "엔진배기량(displ)에 따른 고속도로상 연비(hwy)",
       x = "엔진배기량(displ)",
       y = "고속도로상 차량연비(hwy)")

## 점대신 라인으로 표현
ggplot(mpg, aes(displ, hwy)) +
  geom_point() +
  geom_line()

##############################################################################
## displ(엔진배기량)에 따른 hwy(고속도로 환경에서 연비) 변화특성에 대한 최적합선 표현

# 기본 plot() 함수이용: 직선과 곡선 최적합화선 추가
plot(hwy ~ displ, data = mpg, pch=19)
abline(lm(hwy ~ displ, data = mpg), col="red", lwd=2, lty=1) # 최적의 직선추가
lines(lowess(mpg$hwy ~ mpg$displ), col="blue", lwd=2, lty=2) # 최적의 곡선추가
#lm은 회귀분석을 나타냄 linear model
#lowess() 연속형의 가장 적합한 예측선을 제시해줌 국소 부분별로 예측


# ggplot() 함수이용: 최적합화선 추가
ggplot(mpg, aes(displ, hwy)) +
  geom_point()

## 국소회귀(loess)를 이용한 평활화(smotting) 플롯팅
# - 국소회귀(local regression, locally Weighted scatter-plot smoother)
# - 2개 변수간의 지배적인 패턴(관련성)을 보기 위해
#   국소적으로(부분적으로, 일정구간별로) 최소자승회귀분석을 실시해
#   데이터의 선형적 변화패턴을 파악해 이른바 최적합선을 만들어 줌
# - 이 최적합선을 구하는 알고리즘을 method = "OOO"으로 설정할 수 있음
#   method --> loess(1000개 이하 데이터셋), gam(1000개 이상 데이터셋)
#          --> lm(데이터셋이 선형관계에 가까울 경우), rlm(데이터셋에 이상치가 있을 경우)
#          --> default 설정은 method = "loess"이며, 생략가능함
# - 이 최적합선 주위에 일종의 신뢰구간형태로 회색으로 불확실성(오류가능성) 정도를 표현함

ggplot(mpg, aes(displ, hwy)) +
  geom_point() +
  geom_smooth() # 최적합선과 오차범위를 표현
#smooth는 lowess보다 더 정교하게 기울기가 꺾이면서
#더 예측률을 높이고 오차를 줄이고 있다.
#회색구간은 표준오차범위
ggplot(mpg, aes(displ, hwy)) +
  geom_point() +
  geom_smooth(se = FALSE) # 최적합선만 표현
#회색부분을 없애서 보는 옵션
#파란선만 보겠다는 옵션

ggplot(mpg, aes(displ, hwy)) +
  geom_point() +
  geom_smooth(se = TRUE) # 최적합선과 오차범위를 표현
#파란색 선 주위에 데이터가 얼마 없으면
#변동폭이 크다는 것을 의미함

##############################################################################
## 최적합선을 그릴 때 적합정도를 다양하게 표현할 수 있음
# sapn 값이 증가할 수록 평활화 정도는 증가되는데, 데이터를 잇는 곡선이 더욱 부드러워 짐
# 평활(smoothing)이란 들쑥날쭉한 자료를 평탄하고 변화가 완만한 값으로 변환시키는 것을 의미함
# 아래 3개의 그래프 동시에 띄우는 것 어떻게 함?
# ->install.packages("gridExtra") 패키지를 이용,
# ->grid.arrage()함수 이용,

ggplot(mpg, aes(displ, hwy)) +
  geom_point() +
  geom_smooth(span = 0.2)
# - 과대적합상태(over-fitting)
#   --> 모델이 너무 특정 데이터셋에만 최적화되어 다른 데이터셋에는 적용 어려움
# span은 폭을 의미
# x구간, sapn range를 단위별로 구간을 좁게 설정해서
# 기울기 자체가 왔다갔다함
# 예리하게 찾음(span의 범위가 좁을수록)
# 그러나, 과적합임 overfitting
# 과적합 : 모델이 학습 데이터셋 안에서는 일정 수준 이상의
#          예측 정확도를 보이지만, 새로운 데이터에 적용하면
#          잘 맞지 않는 것을 말함

ggplot(mpg, aes(displ, hwy)) +
  geom_point() +
  geom_smooth(span = 0.5)
# - 일반화/적정적합상태(generalization/right-fitting)
#   --> 모델이 특정 데이터셋과 다른 데이터셋에도 적용가능해 범용사용성이 충분함
# span의 범위를 넓게 함 -> 완만한 그래프


ggplot(mpg, aes(displ, hwy)) +
  geom_point() +
  geom_smooth(span = 1)
# - 과소적합상태(under-fitting)
# 주어진 데이터조차도 잘 예측하지 못하는, 들어맞지 못함
#   --> 모델이 너무 단순해 특정 데이터셋이나 다른 데이터셋에 적용하기 모두 어려움

##############################################################################
# install.packages("gridExtra") 패키지를 이용한
# ggplot2용 멀티프레임 생성
library(gridExtra)

# 멀티프레임에 배치할 개별 그래프 준비
p1 <- ggplot(mpg, aes(displ, hwy)) +
  geom_point() +
  geom_smooth(span = 0.2) +
  labs(title = "과대적합상태(over-fitting)",
       x = "차량배기량(displ)",
       y = "고속도로 차량연비(hwy)")
# smooth() 튀는 데이터들을 가운데 지점, 완만하게 만들어서
# 평균같은걸 찾아서 가운데지점을 찾는다는 것

p2 <- ggplot(mpg, aes(displ, hwy)) +
  geom_point() +
  geom_smooth(span = 0.5) +
  labs(title = "적정적합(right-fitting)상태",
       x = "차량배기량(displ)",
       y = "고속도로 차량연비(hwy)")

p3 <- ggplot(mpg, aes(displ, hwy)) +
  geom_point() +
  geom_smooth(span = 1.0) +
  labs(title = "과소적합상태(under-fitting)",
       x = "차량배기량(displ)",
       y = "고속도로 차량연비(hwy)")

# 그래픽디바이스를 2개 컬럼(열)로 나누어 그래프를 배열
grid.arrange(p1, p2, p3, ncol = 3)
# ncol = 3세칸으로 나눠달라는 뜻
# nraw 도 할 수 있음
# 숫자by숫자 로도 할 수 있음

library(plotly)
p4 <- ggplotly(p1)


##############################################################################
#### (2) 범주형-범주형 변수간 관련성 분석
##############################################################################
## 범주형-범주형 변수간 관련성은 교차 막대그래프형태로 보통 표현

## 두 명목 변수간의 간단 플롯팅
ggplot(mpg, aes(model, manufacturer)) + geom_point()
ggplot(mpg, aes(manufacturer, model)) + geom_point()

# --------------------------------------------------
## 팩터화를 통해 그룹변수와 세분화변수 설정
# --------------------------------------------------

## cyl(실린더 유형) 변수 팩터화
table(mpg$cyl) #범주데이터이면서 서열형
mpg$cyl.f <- factor(mpg$cyl, levels = c(4, 5, 6, 8),
                    labels = c("4기통", "5기통", "6기통", "8기통"),
                    ordered = TRUE)

## drv(구동방식) 변수 팩터화
table(mpg$drv)
mpg$drv.f <- factor(mpg$drv, levels = c("4", "f", "r"),
                    labels = c("4륜구동", "전륜구동", "후륜구동"),
                    ordered = TRUE)

## fl(연료유형) 변수 팩터화
table(mpg$fl)
mpg$fl.f <- factor(mpg$fl, levels = c("c", "d", "e","p", "r"),
                   labels = c("압축천연가스", "디젤", "에타놀", "프리미엄", "일반"),
                   ordered = TRUE)

## class(차량유형) 변수 팩터화
table(mpg$class)
mpg$class.f <- factor(mpg$class,
                      levels = c("2seater", "subcompact", "compact",
                                 "midsize", "suv", "minivan", "pickup"),
                      labels = c("2인승", "경차", "소형차",
                                 "중형차", "SUV", "미니밴", "픽업트럭"),
                      ordered = TRUE)

## trans(기어방식) 변수 범주화 & 팩터화
table(mpg$trans)
# install.packages("doBy")
library(doBy)
mpg$trans.c <- recodeVar(mpg$trans,
                         src = list(c("auto(av)", "auto(l3)", "auto(l4)",
                                      "auto(l5)", "auto(l6)", "auto(s4)",
                                      "auto(s5)", "auto(s6)"),
                                    c("manual(m5)", "manual(m6)")),
                         tgt = list("자동기어", "수동기어"))

str(mpg$trans.c)
# - 문자열(chr) 형식으로 단순 리코딩된 데이터

mpg$trans.f <- factor(mpg$trans.c,
                      levels = c("자동기어", "수동기어"),
                      ordered =  TRUE)
# - 팩터형으로 추가작업한 결과

str(mpg$trans.f)

# --------------------------------------------------
## 팩터형으로 만든 집계기준 변수 확인
# - cyl.f(실린더유형), drv.f(구동방식), fl.f(연료유형),
#   class.f(차량유형), trans.f(기어방식) 변수

str(mpg)

##############################################################################
## 차량유형(class)에 따른 기어유형(drv) 빈도교차분석

# 차량유형(class)별 그래프구조 생성
g <- ggplot(mpg, aes(class))
g <- ggplot(mpg, aes(class.f))
g

# 차량유형(class)별 막대그래프 생성
g + geom_bar()
#막대그래프 만듦


# 차량유형(class)별 기어유형(drv) 빈도교차분석 실시
g + geom_bar(aes(fill = drv)) # 단순한 class막대에 drv데이터를 채워달라
#덩그러니 있던 막대그래프 안에 4륜, 전륜, 후륜 어느것인지 채워넣어달라

g + geom_bar(aes(fill = drv), position = position_stack(reverse = TRUE)) +
  coord_flip() +
  theme(legend.position = "top") # 레전드를 탑으로 배치해 가로방향 플롯 해석순서를 자연스럽게

g + geom_bar(aes(fill = drv), position = position_stack(reverse = TRUE)) +
  coord_flip() +
  theme(legend.position = "top")
#(reverse = TRUE)로 레전드(범위)의 방향을 바
#색깔 파레트 어떻게 적용한다고용?

## 빈도교차그래프와 비율교차그래프
# 구동방식(drv)에 따른 실린더유형(cyl.f)
# 빈도개념
ggplot(data=mpg, aes(x = drv.f, fill = cyl.f)) +
  geom_bar()
#주어진 카운트대로 만들어짐


#비율면에서 1.0 (100%를 기준으로 봄)
#상대적인 것 비교하기 좋음
ggplot(data=mpg, aes(x = drv.f, fill = cyl.f)) +
  geom_bar(position="fill") +
  labs(title = "구동방식(drv)에 따른 실린더유형(cyl.f)",
       x = "차량구동방식(drv)",
       y = "비율(Portion)")
#geom_bar(position="fill") 옵션 : 막대그래프를 위치를 꽉 채워서 보여달라
#
#범주형 그래프 그릴때는 빈도와 비율그래프 두개 놓는 경우가 많음


# 범주 x 범주 => 교차, 연관
# 연속 x 연속 => 상관, 산점
# 범주 x 연속 => 집계, 요약집계


# install.packages("gridExtra") 패키지를 이용한
# ggplot2용 멀티프레임 생성
library(gridExtra)

# 멀티프레임에 배치할 개별 그래프 준비
p1 <- ggplot(data=mpg, aes(x = drv, fill = cyl.f)) +
  geom_bar() +
  labs(title = "구동방식(drv)에 따른 실린더유형(cyl.f) 빈도분포",
       x = "차량구동방식(drv)",
       y = "빈도(Frequency)") +
  theme(legend.position='none')

p2 <- ggplot(data=mpg, aes(x = drv, fill = cyl.f)) +
  geom_bar(position="fill") +
  labs(title = "구동방식(drv)에 따른 실린더유형(cyl.f) 비율분포",
       x = "차량구동방식(drv)",
       y = "비율(Portion)")

# 그래픽디바이스를 2개 컬럼(열)로 나누어 그래프를 배열
grid.arrange(p1, p2, ncol = 2)

##############################################################################
#### 범주형-연속형 변수간 관련성 분석
##############################################################################

## 일종의 범주형 그룹(집단)에 따른 연속형변수의 분포를 요약집계하는 타입임

# 구동방식(drv)에 따른 고속도로상 연비(hwy) 비교
ggplot(mpg, aes(drv, hwy)) +
  geom_point() # 단순 플롯팅
#포인트는 점만 찍음
#데이터가 많이 겹침

ggplot(mpg, aes(drv, hwy)) +
  geom_jitter() # 모든 데이터를 플로팅하는 형태로 분포모양을 나타냄
#흙뿌리기 기능
#중심위치가 어딘지 볼 수 있음

ggplot(mpg, aes(drv, hwy)) +
  geom_boxplot() # 박스플롯 형태로 분포모양을 나타냄
#중앙값을 기준으로 위아래 25를 보여줌
#50%의 데이터는 박스 안에 들어가있다. (main stream)
#그리고 세로 선은 1.5배 선을 벗어나면 아웃라이어
#상한선 하한선
#네모로 그리면 박스, 유선형으로 그리면 바이올렛
#가운데 굵은 선은 평균값이 아니라 중앙값
#박스를 벗어난 점은 아웃라이어


ggplot(mpg, aes(drv, hwy)) +
  geom_violin() # 바이올린 플롯형태로 분포모양을 나타냄
#면적이 넓은 쪽이 중앙값


# install.packages("gridExtra") 패키지를 이용한
# ggplot2용 멀티프레임 생성
library(gridExtra)

# 멀티프레임에 배치할 개별 그래프 준비
p1 <- ggplot(mpg, aes(drv, hwy)) +
  geom_point(color = "red", shape = 20, size = 2) # 단순 플롯팅

p2 <- ggplot(mpg, aes(drv, hwy)) +
  geom_jitter(color = "blue", shape = 8, size = 0.8) # 모든 데이터를 플로팅하는 형태로 분포모양을 나타냄

p3 <- ggplot(mpg, aes(drv, hwy)) +
  geom_boxplot(fill = "lightblue", outlier.color ="orange", outlier.shape = 17,
               outlier.size = 2, notch = TRUE) # 박스플롯 형태로 분포모양을 나타냄

p4 <- ggplot(mpg, aes(drv, hwy)) +
  geom_violin(fill = "lightpink") # 바이올린 플롯형태로 분포모양을 나타냄

# 그래픽디바이스를 2개 컬럼(열)로 나누어 그래프를 배열
grid.arrange(p1, p2, p3, p4, nrow = 2, ncol = 2)

# ------------------------------------------------------------------------
##  drv(구동방식)에 따른 trans(기어방식)간 교차분석
ggplot(data=mpg, aes(x=drv, y=hwy, fill=trans)) +
  geom_bar(stat="identity")
# - state = "identity" 변수의 빈도수를 가지고 막대그래프를 그리는 옵션
# - 기본 범주형-범주형 간의 빈도교차분석은 스택형, 롱포맷형태로 막대를 표현함
# Bar graph, time on x-axis, color fill grouped by sex -- use position_dodge()
ggplot(data=mpg, aes(x=drv, y=hwy, fill=trans)) +
  geom_bar(stat="identity", position=position_dodge())
# - postion=postion_dodge() 스택형/롱포맷형 빈도교차분석 막대그래프를
#   와이드포맷, 언스택형으로 막대를 옆으로 나열해서 표현함

### End of Source ############################################################


##############################################################################
### ggplot {gglot2}를 활용한 변수간 관련성 분석2
##############################################################################

## ggplot2 패키지 설치 및 로딩
# install.packages("ggplot2")
library(ggplot2)

## ggplot2 패키지에 들어 있는 mpg데이터셋 로딩
data(mpg, package = "ggplot2") # mpg 데이터셋 메모리로 로딩
help(mpg) # mpg 데이터셋 도움말(코딩북 확인)

## mpg데이터셋 내용조회

## mpg 데이터셋 구조파악 및 기술통계분석
library(dplyr)
glimpse(mpg) # tibble 구조

library(Hmisc)
Hmisc::describe(mpg) # 상세 기술통계분포

##############################################################################
#### 제3의 변수를 활용한 2개변수간 관련성 분석
##############################################################################

# (1) 2개 변수간 관계그래프 상에
#     제3의 변수를 색상, 모양, 점크기로 그룹핑/집단화(grouping) 하여 표현하는 방법
# (2) 2개 변수간 관계그래프를
#     제3의 변수를 기준으로 세분화/분할화(faceting)하여 표현하는 방법

##############################################################################
## (1) 그룹핑/집단화(grouping)를 통한 제3의 변수에 따른 2개 변수간 관련성 플로팅
##############################################################################
# - 2개 변수간 관련성을 그룹(집단)별로 보다 상세하게 파악하기 위하여
#   제3의 변수를 색상(color), 모양(shape), 점크기(size)로 표현해 플롯팅
# - displ(엔진배기량)에 따라 hwy(고속도로 환경에서 연비)가 달라지는 패턴을
#   제3의 변수인 class(차량유형)별로 살펴봄

# 차량유형(class)을 색상(color)으로 구별
ggplot(mpg, aes(displ, hwy, color = class)) +
  geom_point()
#class변수(차량유형)를 넣음.  
#x축과 y축의 변수를 제 3의 조절변수(차량유형)으로 보겠다.
#제3의 조절변수(차량유형)에 색깔효과를 적용


# 차량유형(class)을 모양(shape)으로 구별
ggplot(mpg, aes(displ, hwy, shape = class)) +
  geom_point()
#제 3의 조절변수(차량유형)에 점 모양으로 구별
#shape로는 최대 6가지종류만 다룰 수 있다.
#7개면 마지막 하나는 표기가 안됨.
#범주가 너무 많을 때는 범주를 유형별로 묶어서 파생변수 만들어도 됨
#ex) a2,a4,a9 -> auto 등


# 차량유형(class)을 점크기(size)로 구별
ggplot(mpg, aes(displ, hwy, size = class)) +
  geom_point()
#겹치지 않게 데이터가 분포할 때는 쓸만함


# install.packages("gridExtra") 패키지를 이용한
# ggplot2용 멀티프레임 생성
# 여러개의 그래프를 종합적으로 한꺼번에 볼 수 있음
library(gridExtra)

# 멀티프레임에 배치할 개별 그래프 준비
p1 <- ggplot(mpg, aes(displ, hwy, color = class)) + geom_point() +
  labs(title = "class를 color로 그룹핑")
p2 <- ggplot(mpg, aes(displ, hwy, shape = class)) + geom_point() +
  labs(title = "class를 shape로 그룹핑")
p3 <- ggplot(mpg, aes(displ, hwy, size = class)) + geom_point() +
  labs(title = "class를 size로 그룹핑")

# 그래픽디바이스를 2개 컬럼(열)로 나누어 그래프를 배열
grid.arrange(p1, p2, p3, ncol = 3)
# - 제3의 변수가 범주형 변수이면 색상(color)이나 모양(shape) 형식으로,
# - 제3의 변수가 연속형 변수이면 크기(size)로 그룹을 나타내는 것이 좋음

## plotly::ggplotly()를 이용한 동적 그래프화
library(plotly)
ggplotly(p1)
ggplotly(p2)
ggplotly(p3)

# 차량유형(class)을 색상(color)과 모양(shape)으로 이중 그룹핑하여
# displ(엔진배기량)에 따른 hwy(고속도로 환경에서 연비)의 변화패턴을 관찰
ggplot(mpg, aes(displ, hwy, color = class, shape = class)) +
  geom_point()

# 차량유형(class)을 색상(color)과 모양(shape), 점크기(size)로 삼중 그룹핑하여
# displ(엔진배기량)에 따른 hwy(고속도로 환경에서 연비)의 변화패턴을 관찰
ggplot(mpg, aes(displ, hwy, color = class, shape = class, size = class)) +
  geom_point()

# - 시각적 요소는 간결할수록 좋음
# - 색과 모양, 크기 간의 관계를 동시에 알아보기 어려움
# - 시각적 요소를 제한해 쉽게 알 수 있는 간결한 컨셉이 더 중요함

##############################################################################
## (2) 세분화/분할화(faceting)를 통한 제3의 변수에 따른 2개 변수간 관련성 플로팅
##############################################################################
# - 하나의 그래프에 2개 변수간 관련성을 플롯팅하던 것을 제3의 변수를 기준으로
#   그래프를 분할화/세분화 하여 표현하는 방법
# - i) facet_wrap() : 제3의 변수를 활용해 하나의 그래프를 여러개로 분할해
#                    2개 변수간 관련성을 개별 그래프별로 플로팅함
#sub데이터를 만들어서 독립적으로 그래프들이 나옴
# - ii) facet_grid() : 제3의 변수를 활용해 하나의 그래프를 그리드 구조로 만들어
#                     다차원분석이 가능하도록 플로팅함
#원본 바디가 쪼개져서 나옴
# - displ(엔진배기량)에 따라 hwy(고속도로 환경에서 연비)가 달라지는 패턴을
#   제3의 변수인 class(차량유형)별로 살펴봄

# -----------------------------------------------------
# i) facet_wrap() 사용: 여러개로 분할된 개별 그래프별로 관련성을 플롯
ggplot(mpg, aes(displ, hwy)) +
  geom_point() +
  facet_wrap(~ class)
# faceting기법으로 단면을 잘라서 세부적으로 보겠다는 뜻


# install.packages("gridExtra") 패키지를 이용한
# ggplot2용 멀티프레임 생성
library(gridExtra)

# 멀티프레임에 배치할 개별 그래프 준비
p1 <- ggplot(mpg, aes(displ, hwy, color = class, shape = class)) +geom_point() +
  labs(title = "하나의 그래프에 class변수를 그룹핑 표현")
p2 <- ggplot(mpg, aes(displ, hwy)) + geom_point() + facet_wrap(~ class) +
  labs(title = "class변수 항목별  분할그래프로 표현")

# 그래픽디바이스를 2개 컬럼(열)로 나누어 그래프를 배열
grid.arrange(p1, p2, ncol = 2)
# - 그룹핑/집단화(grouping) 방식과 세분화/분할화(faceting) 관련 개별그래프화 방식간 비교

# 하나의 그래프에 여러 그룹별(집단별) 특성을 종합적으로 제시가능
# 또한 그룹별(집단별) 특성을 여러가지 측면으로 세분화/단면화하여 제시가능

# -----------------------------------------------------
# ii) facet_grid() 사용: 그리드 구조로 변경된 그래프에 다차원분석이 가능하도록 함

# --------------------------------------------------
## 팩터화를 통해 그룹변수와 세분화변수 설정
# --------------------------------------------------

## cyl(실린더 유형) 변수 팩터화
table(mpg$cyl)
mpg$cyl.f <- factor(mpg$cyl, levels = c(4, 5, 6, 8),
                    labels = c("4기통", "5기통", "6기통", "8기통"),
                    ordered = TRUE)

## drv(구동방식) 변수 팩터화
table(mpg$drv)
mpg$drv.f <- factor(mpg$drv, levels = c("4", "f", "r"),
                    labels = c("4륜구동", "전륜구동", "후륜구동"),
                    ordered = TRUE)

## fl(연료유형) 변수 팩터화
table(mpg$fl)
mpg$fl.f <- factor(mpg$fl, levels = c("c", "d", "e","p", "r"),
                   labels = c("압축천연가스", "디젤", "에타놀", "프리미엄", "일반"),
                   ordered = TRUE)

## class(차량유형) 변수 팩터화
table(mpg$class)
mpg$class.f <- factor(mpg$class,
                      levels = c("2seater", "subcompact", "compact",
                                 "midsize", "suv", "minivan", "pickup"),
                      labels = c("2인승", "경차", "소형차",
                                 "중형차", "SUV", "미니밴", "픽업트럭"),
                      ordered = TRUE)

## trans(기어방식) 변수 범주화 & 팩터화
table(mpg$trans)
# install.packages("doBy")
library(doBy)
mpg$trans.c <- recodeVar(mpg$trans,
                         src = list(c("auto(av)", "auto(l3)", "auto(l4)",
                                      "auto(l5)", "auto(l6)", "auto(s4)",
                                      "auto(s5)", "auto(s6)"),
                                    c("manual(m5)", "manual(m6)")),
                         tgt = list("자동기어", "수동기어"))

str(mpg$trans.c)
# - 문자열(chr) 형식으로 단순 리코딩된 데이터

mpg$trans.f <- factor(mpg$trans.c,
                      levels = c("자동기어", "수동기어"),
                      ordered =  TRUE)
# - 팩터형으로 추가작업한 결과

str(mpg$trans.f)

# --------------------------------------------------
## 팩터형으로 만든 집계기준 변수 확인
# - cyl.f(실린더유형), drv.f(구동방식), fl.f(연료유형),
#   class.f(차량유형), trans.f(기어방식) 변수

str(mpg)

## 일반적 그룹화/집단화(grouping) 방식의 산점도
ggplot(data = mpg, aes(x = displ, y = hwy, shape = cyl.f, color = cyl.f)) +
  # cyl(기어유형) 변수를 그룹화 변수로 설정함
  geom_point(size = 3)

## facet_grid방식의 그룹화 및 세분화를 이용한 산점도 그리기
ggplot(data = mpg, aes(x = displ, y = hwy, shape = cyl.f, color = cyl.f)) +
  # cyl(기어유형) 변수를 그룹화 변수로 설정함
  geom_point(size = 3) +
  facet_grid(~ drv.f) +
  # drv(구동방식)을 세분화변수로 지정
  labs(title = "엔진유형별 자동차 특성비교",
       x = "마력", y = "1갤런당 주행거리")

ggplot(data = mpg, aes(x = displ, y = hwy, shape = cyl.f, color = cyl.f)) +
  # cyl(기어유형) 변수를 그룹화 변수로 설정함
  geom_point(size = 3) +
  facet_grid(~ trans.f) +
  # trans(기어방식)을 세분화변수로 지정
  labs(title = "엔진유형별 자동차 특성비교",
       x = "마력", y = "1갤런당 주행거리")

ggplot(data = mpg, aes(x = displ, y = hwy, shape = cyl.f, color = cyl.f)) +
  # cyl(기어유형) 변수를 그룹화 변수로 설정함
  geom_point(size = 3) +
  facet_grid(manufacturer + drv.f ~ trans.f + class) +
  # drv(구동방식)와 trans(기어방식)을 세분화변수로 지정
  labs(title = "엔진유형별 자동차 특성비교",
       x = "마력", y = "1갤런당 주행거리")

ggplot(data = mpg, aes(x = displ, y = hwy, shape = cyl.f, color = cyl.f)) +
  # cyl(기어유형) 변수를 그룹화 변수로 설정함
  geom_point(size = 3) +
  facet_grid(drv.f ~ trans.f + class) +
  # drv(구동방식)와 trans(기어방식)을 세분화변수로 지정
  labs(title = "엔진유형별 자동차 특성비교",
       x = "마력", y = "1갤런당 주행거리")

### End of Source ############################################################




###################################################################
#### ggplot()함수의 세부속성 geom() 함수이용 다양한 플롯 형태 표현
###################################################################

## singer(합창단원) 데이터 로딩
library(lattice)
help(singer)

data(singer, package = "lattice") # 메모리에 객체로 로딩
head(singer)
str(singer)

###################################################################
## geom() 함수이용 히스토그램, 박스플롯, 바이올린플롯을 각각 그려봄
library(ggplot2)

## 히스토그램 플롯
ggplot(singer, aes(x = height)) + geom_histogram()
# height(신장) 크기를 히스토그램으로 분포특성 파악

## 박스플롯1
ggplot(singer, aes(x = voice.part, y = height)) + geom_boxplot()
# voice.part(음역대)별 height(신장) 크기비교
#박스 중간에 진한 선이 중앙값이라고 하셨는데
#박스 중앙에 없고 위쪽이나 아래쪽에 치우쳐 있는 경우는 무슨 뜻이졍?

## 박스 플롯2
ggplot(singer, aes(x = voice.part, y = height)) +
  geom_boxplot(fill = "lightgreen", width = .2)
# 박스플롯의 세부 옵션 지정
#width = 1.0 이 디폴트값 높으면 다닥다닥


## 바이올린 플롯
ggplot(singer, aes(x = voice.part, y = height)) +
  geom_violin(fill = "lightblue")

# -----------------------------------------------------------------
## geom() 함수를 이용해 박스플롯과 바이올린플롯을 결합해 그려봄

ggplot(singer, aes(x = voice.part, y = height)) +
  geom_boxplot(fill = "lightgreen", width = .2) +
  geom_violin(fill = "lightblue")
# - 박스플롯을 먼저 그리고, 추가적으로 바이올린플롯을 그리는 경우
#   박스플롯이 나중에 그린 바이올린플롯에 가려서 안보임

ggplot(singer, aes(x = voice.part, y = height)) +
  geom_violin(fill = "lightblue") +
  geom_boxplot(fill = "lightgreen", width = .2)
# - 바이올린플롯을 먼저 그리고, 추가적으로 박스플롯을 그리는 경우
#   두 개가 제대로 보임

###################################################################
## Salaries(교수연봉) 데이터 로딩
library(carData)
help(Salaries)

data(Salaries, package = "carData") # 메모리에 객체로 로딩
head(Salaries)
str(Salaries)

# -----------------------------------------------------------------
## geom() 함수를 이용해 3종류의 플롯 유형을 결합해서 그려봄
library(ggplot2)

ggplot(Salaries, aes(x = rank, y = salary)) +
  geom_boxplot(fill = "cornflowerblue",
               color = "black", notch = TRUE) +
  # 톱니형 박스플롯 그리기
  
  geom_point(position = "jitter", color = "blue", alpha = .5) +
  # 산점도 플로팅
  # jitter 옵션 : 점을 흐트러트려서 퍼지게 함 겹치지 않게
  # alpha 간격
  
  geom_rug(sides = "l", color = "black")
# 깔개그림 그리기
# 쫙 압축했을 때 y값의 분포가 이렇다는 것을 알 수 있음
# 진하면 분포많다는 것

###################################################################
#### 그룹화(grouping)을 활용한 산점도
###################################################################

## 하나의 그래프에 두 개 또는 그 이상의 집단별/그룹별/유형별
#  관측치를 동시에 그려서 그 차이를 비교할 수 있음

library(ggplot2)

## 교수연봉 변수에 대한 전반적 밀도 플롯
ggplot(data = Salaries, aes(x = salary)) +
  geom_density(alpha = .3)

# -----------------------------------------------------------------
## 교수연봉 밀도 플롯을 교수직급(rank) 그룹별로 세부적으로 그림

ggplot(data = Salaries, aes(x = salary, fill = rank)) +
  geom_density(alpha = .3)
# - 교수연봉 데이터(x = salary)를 이용해
#   밀도플롯(geom_density)을 구현
# - 하나의 그래프에 세개의 밀도곡선을 직급별(fill = rank)로 그리고,
#   색을 채워서(fill = rank) 구별함
# - 중첩되는 영역이 모호하지 않도록
#   색칠을 다소 투명하게(alpha = .3), 겹치는 영역이 잘보이도록 함
# - 범례는 자동적으로 생성됨

###################################################################
## 산점도 그래프에 집단별/그룹별/유형별 변수를 추가해서 비교하기

## 박사학위취득 이후기간(yrs.since.phd)과 급여(salary) 간 산점도
ggplot(Salaries, aes(x = yrs.since.phd, y = salary)) + geom_point()

# -----------------------------------------------------------------
## 박사학위 취득 이후 기간과 급여의 관계를
## 성별(sex)과 직급(rank)으로 그룹화/집단화/유형화한 그래프

xtabs(~ rank, data = Salaries) # 직급별 빈도수
xtabs(~ sex, data = Salaries) # 성별 빈도수
#xtabs는 table함수와 비슷함

ggplot(Salaries, aes(x = yrs.since.phd, y = salary,
                     color = rank, shape = sex)) + geom_point()
# - 직급을 색상(color = rank)으로,
#   성별을 모양(shape = sex)으로 그룹화을 실시함

ggplot(Salaries, aes(x = yrs.since.phd, y = salary,
                     color = sex, shape = rank)) + geom_point()
# - 성별을 색상(color = rank)으로,
#   직급을 모양(shape = sex)으로 그룹필을 실시함

# -----------------------------------------------------------------
# install.packages("gridExtra") 패키지를 이용한
# ggplot2용 멀티프레임 생성
library(gridExtra)

p1 <- ggplot(Salaries, aes(x = yrs.since.phd, y = salary,
                           color = rank, shape = sex)) + geom_point()
p2 <- ggplot(Salaries, aes(x = yrs.since.phd, y = salary,
                           color = sex, shape = rank)) + geom_point()

grid.arrange(p1, p2, nrow = 2)
grid.arrange(p1, p2, ncol = 2)

###################################################################
## 범주형 데이터에 대한 막대그래프(barchart) 구현
###################################################################

## 단일 범주형 데이터에 대한 막대그래프 그리기
ggplot(Salaries, aes(x = rank)) + geom_bar(fill = "red")
# - 직급데이터(x = rank)에 대해서 막대그래프(geom_bar)로 나타냄
# - geom_bar() 함수 안에 직접 색상을 빨강으로 채우는
#   옵션(fill = "red")을 설정했으므로
#   막대자체에 빨간색이 진하게 나타남

ggplot(Salaries, aes(x = rank, fill = "red")) + geom_bar()
# - 직급데이터(x = rank)에 대해서 막대그래프(geom_bar)를 그리는데,
#   그 안에 "red"라는 붉은 색을 채우라는 의미가 되버림
# - 그래서 범례에 "red"가 추가되는 다소 이상한 그래프가 만들어짐

# -----------------------------
# install.packages("gridExtra") 패키지를 이용한
# ggplot2용 멀티프레임 생성
library(gridExtra)

p1 <- ggplot(Salaries, aes(x = rank)) + geom_bar(fill = "red")
p2 <- ggplot(Salaries, aes(x = rank, fill = "red")) + geom_bar()

grid.arrange(p1, p2, nrow = 2)
grid.arrange(p1, p2, ncol = 2)

# -----------------------------------------------------------------
## 직급에 따른 성별 간 교차분석을 막대그래프로 구현
#  - 직급(x = rank), 성별(fill = sex)

## 기본 막대그래프는 스택형임(세로방향)
p1 <- ggplot(Salaries, aes(x = rank, fill = sex))+ geom_bar()
p1

## 기본 막대그래프는 스택형임(가로방향)
ggplot(Salaries, aes(x = rank, fill = sex))+ geom_bar() +
  coord_flip()

## 스택형(position = "stack") 옵션사용
ggplot(Salaries, aes(x = rank, fill = sex)) +
  geom_bar(position = "stack") + labs(title = 'position = "stack"')
# - 각 범주별 빈도수를 세로방향으로 쌓아올림

## 닷지형(position = "dodge") 옵션사용
ggplot(Salaries, aes(x = rank, fill = sex)) +
  geom_bar(position = "dodge") + labs(title = 'position = "dodge"')
# - 각 범주별 빈도수를 가로방향으로 나열함
# - barplot(horiz = FALSE)로 설정한 것과 동일함

## 채우기형(position = "fill") 옵션사용
ggplot(Salaries, aes(x = rank, fill = sex)) +
  geom_bar(position = "fill") + labs(title = 'position = "fill"')
# - 각 범주별 빈도수를 1.0의 비율로 산정해 비교함


###################################################################
#### 세분화/단면화/면분할화(faceting)를 활용한 산점도
###################################################################

## 기존의 그룹화(grouping)
#  - 단일변수 분포 또는 두개변수 간의 관련성을 나타낸 그래프를
#    제3의 집단별/그룹별/유형별 변수에 따라 세분화하여
#    하나의 그래프에 동시에 그려서 그 차이를 종합 비교할 수 있음

## 단면화/세분화/면분할화(faceting)
#  - 하나의 그래프를 특정한 집단별/그룹별/유형별 변수에 따라
#    여러개의 그래프로 세분화해 그 차이를 개별 비교할 수 있음

# -----------------------------------------------------------------
## facet_wrap() 함수이용 범주수준별로 플롯을 분리세분화함
library(ggplot2)

## 합창단원 신장(height) 데이터에 대한 밀도그래프 그리기
ggplot(data = singer, aes(x = height)) +
  geom_histogram()

## 합창단원 신장(height) 밀도그래프를 음역대별로 세분화해 나타냄
# - 음역대 변수에 들어 있는 범주수준별로 플롯을 분리세분화함

ggplot(data = singer, aes(x = height)) +
  geom_histogram() +
  facet_wrap(~ voice.part, nrow = 4) # 4개 행으로 표현

ggplot(data = singer, aes(x = height)) +
  geom_histogram() +
  facet_wrap(~ voice.part, ncol = 4) # 4개 열로 표현

###################################################################
## facet_grid() 함수이용 행과 열, 격자구조로 플롯을 분리세분화함

# -----------------------------------------------------------------
## 박사학위취득 경과기간과 연봉간의 관계그래프의 옵션변화
library(ggplot2)

ggplot(Salaries, aes(x = yrs.since.phd, y = salary)) + geom_point()
# - 단순 산점도 그래프

ggplot(Salaries, aes(x = yrs.since.phd, y = salary,
                     shape = rank)) + geom_point()
# - rank(직급)를 모양으로 그룹화해서 나타냄

ggplot(Salaries, aes(x = yrs.since.phd, y = salary,
                     color = rank)) + geom_point()
# - rank(직급)를 색상으로 그룹화해서 나타냄

ggplot(Salaries, aes(x = yrs.since.phd, y = salary,
                     color = rank, shape = rank)) + geom_point()
# - rank(직급)를 색상과 모양으로 이중 그룹화해서 나타냄

ggplot(Salaries, aes(x = yrs.since.phd, y = salary,
                     color = rank, shape = rank)) +
  geom_point() + facet_grid(. ~ sex)
# - facet_grind() 함수이용 성별기준으로 열방향으로 플롯을 분리함  

# -----------------------------------------------------------------
## facet_wrap() 함수이용 범주수준별로 플롯을 분리세분화함

library(ggplot2)

ggplot(data = singer, aes(x = height)) + geom_density()
# - height(신장)을 전체적으로 밀도그래프로 표현

ggplot(data = singer, aes(x = height, fill = voice.part)) +
  geom_density()
# - height(신장) 밀도그래프를 voice.part(음역대)에 따라
#   그룹화/집단화/유형화해 그림

ggplot(data = singer, aes(x = height, fill = voice.part)) +
  geom_density() +
  facet_grid(voice.part~.)
# - height(신장) 밀도그래프를 voice.part(음역대)에 따라 그리는데,
#   facet_grid() 함수를 이용해 행방향으로 플롯을 분리함

###################################################################
#### 산점도에 평활선(smoothed lines) 활용
###################################################################

## 평활선(smoothed lines)
#- 변수간의 관련성을 선분모양으로 나타내는 시각화 방법
# 가운데 가장 이상적인 예측선을 찾는 것

# -----------------------------------------------------------------
## 박사학위취득 경과기간과 연봉간 관계그래프의 옵션 변화
library(ggplot2)

ggplot(data = Salaries, aes(x = yrs.since.phd, y = salary)) +
  geom_point()
# - 기본 산점도 그래프

ggplot(data = Salaries, aes(x = yrs.since.phd, y = salary)) +
  geom_point() + geom_smooth()
# - geom_smooth() 함수를 이용한 평활선 구현

ggplot(data = Salaries, aes(x = yrs.since.phd, y = salary,
                            shape = sex, color = sex)) +
  geom_point(size = 2)
# - 기존 산점도에 성별을 모양과 색상에 따라 그룹화하여 세부적으로 표현
# x, y 관계 그림에 제 3의 조절변수를 같이 녹임

ggplot(data = Salaries,
       aes(x = yrs.since.phd, y = salary,
           linetype = sex, shape = sex, color = sex)) +
  geom_point(size = 2) +
  geom_smooth(method = lm, formula = y ~ poly(x, 2), se = F, size = 1)
# - 기존 산점도를 성별에 따라 모양과 색상을 그룹화하여 세부적으로 표현
# - 기존 산점도에 성별에 따라 평활선 모양과 색상을 그룹화하여 세부적으로 표현

###################################################################
#### ggplot2 그래프의 세부속성 설정/조정하기
###################################################################

## plot() 함수도 다양한 저수준 그래프함수를 통해
#  세부 속성을 꾸미는 것처럼 ggplot2 그래프도 가능함

## Salaries(교수연봉) 데이터 로딩
library(car)
help(Salaries)

data(Salaries, package = "car")
head(Salaries)
str(Salaries)

###################################################################
## 축(axes) 설정하기
library(ggplot2)

ggplot(data = Salaries, aes(x = rank, y = salary)) +
  geom_boxplot() +
  labs(title = "직급별 연봉비교", x = "", y = "")
# - 직급과 연봉간 관련성을 박스플롯으로 구현
# - 그래프 제목출력, x축과 y축은 비워둠

ggplot(data = Salaries, aes(x = rank, y = salary, fill = sex)) +
  geom_boxplot() +
  labs(title = "직급별 성별에 따른 연봉비교", x = "", y = "")
# - 직급과 연봉간 관련성을 성별(fill = sex)에 따라
#   그룹화/집단화/유형화하여 비교함

ggplot(data = Salaries, aes(x = rank, y = salary, fill = sex)) +
  geom_boxplot() +
  scale_x_discrete(breaks = c("AsstProf", "AssocProf", "Prof"),
                   labels = c("Assistant\nProfessor",
                              "Associate\nProfessor",
                              "Full\nProfessor")) +
  # x축에 대한 구간분할지점(breaks) 및 사용자 레이블(lable) 반영
  # scale_x_discrete : 이산형 변수, 질적인 변수
  
  scale_y_continuous(breaks = c(50000, 100000, 150000, 200000),
                     labels = c("$50K", "$100K", "$150K", "$200K")) +
  # y축에 대한 구간분할지점(breaks) 및 사용자 레이블(lable) 반영
  
  labs(title = "직급별 성별에 따른 연봉비교", x = "", y = "")

###################################################################
## 범례(Legends) 설정하기

ggplot(data = Salaries, aes(x = rank, y = salary, fill = sex)) +
  geom_boxplot() +
  scale_x_discrete(breaks = c("AsstProf", "AssocProf", "Prof"),
                   labels = c("Assistant\nProfessor",
                              "Associate\nProfessor",
                              "Full\nProfessor")) +
  scale_y_continuous(breaks = c(50000, 100000, 150000, 200000),
                     labels = c("$50K", "$100K", "$150K", "$200K")) +
  labs(title = "Faculty Salary by Rank and Gender",
       x = "", y = "", fill = "Gender") +
  
  theme(legend.position = c(.1, .8),
        legend.direction = "horizontal") # 범례의 위치를 좌표로 지정
# - 범례의 위치는 = "left", "top", "right" (기본설정), "bottom" 등임
# - 범례의 위치를 = "none"이라고 설정하면 아예 범례출력이 생략됨

###################################################################
## 스케일(Scales) 설정하기
data(mtcars)
mtcars

ggplot(mtcars, aes(x = wt, y = mpg)) +  geom_point()
# - wt(차량무게)와 mpg(1갤론당 주행거리) 간 산점도

ggplot(mtcars, aes(x = wt, y = mpg)) +
  geom_point(shape = 21, color = "black", fill = "cornsilk")
# - 플로팅되는 점의 모양과 색상을 조정

ggplot(mtcars, aes(x = wt, y = mpg, size = disp)) +
  geom_point(shape = 21, color = "black", fill = "cornsilk") +
  labs(x = "차량무게", y = "1갤론당 주행거리",
       title = "단순산점도", size = "엔진\n배기량")
# - disp(displacement: 엔진배기량) 변수를
#   제3의 그룹화/집단화/유형화 변수로 지정하였는데,
#   size= 옵션을 통해서 그 변수의 수량적 크기변화에 따라서
#   점의 크기를 출력해달라는 의미 ==> 버블차트가 됨

###################################################################
## 색상(color) 설정하기
data(Salaries, package = "carData")

ggplot(data = Salaries, aes(x = yrs.since.phd, y = salary)) +
  geom_point(size = 2)
# - 박사학위취득 이후기간(yrs.since.phd)과 급여(salary) 간 산점도

ggplot(data = Salaries,
       aes(x = yrs.since.phd, y = salary, color = rank)) +
  geom_point(size = 2)
# - rank(직급)을 제3의 그룹화/집단화/유형화 변수로 사용해
#   2개 변수간 관계를 세부적으로 나누어 표현하기

ggplot(data = Salaries,
       aes(x = yrs.since.phd, y = salary, color = rank)) +
  geom_point(size = 2) +
  scale_color_manual(values = c("orange", "olivedrab", "navy"))+
  scale_shape_manual(values= c(6, 19, 4))
# - 플로팅 되는 색상을 직접 지정해서 표현하기

ggplot(data = Salaries,
       aes(x = yrs.since.phd, y = salary, color = rank)) +
  geom_point(size = 2) + scale_color_brewer(palette = "Set1")
# - RColorBrewer 패키지의 색상파레트에서 색상조합을 선택해서 표현하기

library(RColorBrewer)
display.brewer.all()

# brewer.pal(필요한갯수만큼,팔레트이름)
mycolor <- brewer.pal(6,"Set2")
mycolor

barplot(1:length(mycolor), col=mycolor)

###################################################################
# 테마(Themes) 설정하기
data(Salaries, package = "carData")

library(ggplot2)

ggplot(Salaries, aes(x = rank, y = salary, fill = sex)) +
  geom_boxplot() +
  labs(title = "직급별 성별에 따른 연봉비교",
       x = "직급", y = "연봉")
# - ggplot 기본 설정 함수와 옵션을 통한 그래프

# -----------------------------------------------------------------
## 테마내용 설정
mytheme <-
  theme(plot.title =
          element_text(face = "bold.italic", size = "14", color = "brown"),
        axis.title =
          element_text(face = "bold.italic", size = 10, color = "brown"),
        axis.text =
          element_text(face = "bold", size = 9, color = "darkblue"),
        panel.background =
          element_rect(fill = "white", color = "darkblue"),
        panel.grid.major.y =
          element_line(color = "grey", linetype = 1),
        panel.grid.minor.y =
          element_line(color = "grey", linetype = 2),
        panel.grid.minor.x = element_blank(),
        legend.position = "top")

## 테마내용 반영
ggplot(Salaries, aes(x = rank, y = salary, fill = sex)) +
  geom_boxplot() +
  labs(title = "직급별 성별에 따른 연봉비교",
       x = "직급", y = "연봉") +
  mytheme # 테마가 추가반영 됨

###################################################################
#### ggplot2 그래프의 멀티프레임 구현
###################################################################

data(Salaries, package = "carData")
library(ggplot2)

## ggplot() 그래프도 별도 객체에 저장이 가능함
p1 <- ggplot(data = Salaries, aes(x = rank)) + geom_bar()
p1

p2 <- ggplot(data = Salaries, aes(x = sex)) + geom_bar()
p2

p3 <- ggplot(data = Salaries,
             aes(x = yrs.since.phd, y = salary)) + geom_point()
p3

p4 <- ggplot(Salaries,
             aes(x = rank, y = salary, fill = sex)) + geom_boxplot()
p4

# install.packages("gridExtra") 패키지를 이용한
# ggplot2용 멀티프레임 생성
library(gridExtra)

grid.arrange(p1, p2, nrow = 2)
grid.arrange(p3, p4, ncol = 2)

grid.arrange(p3, p1, p2, nrow = 3)
grid.arrange(p4, p2, p3, ncol = 3)
grid.arrange(p3, p1, p4, p2, nrow = 2, ncol = 2)

###################################################################
#### ggplot2 그래프 저장하기
###################################################################

myplot <- ggplot(data=mtcars, aes(x=mpg)) + geom_histogram()
ggsave(file="mygraph.png", plot=myplot, width=5, height=4)
# - plot= 이라는 옵션을 통해서 저장할 그림객체를 지정함

ggplot(data = mtcars, aes(x = mpg)) + geom_histogram()
ggsave(file = "mygraph.pdf")
# - plot =  옵션이 없으면 가장 최근에 그린 그림을 저장함

### End of Source ############################################################

#------------------------------------------------------------------------------------------------------------------------------------
# 2018.09.19 - Graph
#------------------------------------------------------------------------------------------------------------------------------------

##########################################################
#.7 그래프 
#---------------------------------------------------------

library(datasets)
data("mtcars")
mtcars

rownames(mtcars)
row.names(mtcars)

glimpse(mtcars)

##########################################################
# plot{graphics} 
#---------------------------------------------------------
# plot options
#---------------------------------------------------------
# lty : line type 
# lwd : line with dot
# cex : character expression size
# col.lab : 변수 색
# col.main : title
# col : 선색 
# sub : 부제목
# main : 대제목 
# xlim, ylim : 축의 눈금의 범위
# y
#---------------------------------------------------------

plot(mtcars)
## univariate - 단별량, 단일함수
plot(mtcars$wt)
plot(mtcars$wt, mtcars$mpg)

## 실린더의 개수가 늘어날수록 연비가 떨어진다.
plot(mtcars$cyl, mtcars$mpg)


sort(mtcars$wt)
mean(mtcars$wt)
median(mtcars$wt)
range(mtcars$wt)

summary(mtcars$wt)
summary(mtcars)

library(psych)
psych::describe(mtcars$wt)
psych::describe(mtcars)

library(Hmisc)
Hmisc::describe(mtcars$wt)
Hmisc::describe(mtcars)

library(skimr)
skimr::skim(mtcars$wt)
skimr::skim(mtcars)

plot(mtcars$qsec, mtcars$gear)
plot(mtcars$gear, mtcars$qsec)

# 에러남!!!
#wt <- mtcars$wt
#mpg <- mtcars$mpg
plot(mpg ~wt, data = mtcars)

# ERROR 케이스 
# plot(wt, mpg, mtcars)
# plot(mpg, wt, data = mtcars)

with(mtcars, {plot(wt,mpg)})

## 코드 전역으로 선언해 놓고, $ 없이 변수로만 이용가능
attach(mtcars)
plot(wt,mpg)
## 커넥트 해제 
detach(mtcars)

## 기본함수 = high-level 고수준 작도함수 - plot 함수 

## low-level 저수준 작도함수 -> 제목,눈금 및 기타사항 변경처리

## 저수준 작도함수 앞에 타이틀 부여 
title("차량 무게에 따른 차량xxx")

plot(mtcars$wt, mtcars$mpg,
     main="Car Weight & Machine Power Gage?")



#산점도 매트릭스 관련 
##install.packages("PerformanceAnalytics")
library(PerformanceAnalytics)
chart.Correlation(mtcars, histogram = TRUE,pch=19)
## pch : plottiong character - 'pch' values => 점을 나타내는 옵션이 다름
## 19: 채운 원형

dose <- c(20,30,40,45,60)
drugA <- c(16,20,27,40,60)
drugB <- c(15,18,25,31,40)

## my favorite -> o overplotted
plot(dose, drugA, type="o")
# "p" for points,
# "l" for lines,
# "b" for both,
# "c" for the lines part alone of "b",
# "o" for both ‘overplotted’,
# "h" for ‘histogram’ like (or ‘high-density’) vertical lines,
# "s" for stair steps,
# "S" for other steps, see ‘Details’ below,
# "n" for no plotting.


plot(dose, drugA, type="b",
     lty=1,lwd=0, pch=15, cex=1,
     main="약품A의 복용량에 따른 효과변화")
# lty : line type 
# lwd : line with dot
# cex : character expression size
# col.lab : 변수 색
# col.main : title
# col : 선색 
# sub : 부제목
# main : 대제목 
# xlim, ylim : 축의 눈금의 범위

plot(dose, drugA, type="b", col.lab = "blue",
     lty=1,lwd=0, pch=15, cex=1,
     main="약품A의 복용량에 따른 효과변화",
     col.main= "red"
)


plot(dose, drugA, type="b", col = "red",
     lty=2,lwd=0, pch=15, cex=1,
     main="약품A의 복용량에 따른 효과변화",
     sub= "상세한결과는 사이트참고",
     xlab = "Dosage", ylab="Drug Response",
     xlim = c(0,60) , ylim = c(0,70)
)

lines(dose, drugB, type="b", col="blue",
      pch=17, lty=2)

abline(h=c(30,40), lwd=1.5, lty=2, col="gray")


## 범례생성
legend("topleft", inset=0.02, ## inset 위치를 떨어뜨린다.
       title="Drug Type", legend = c("A","B"),# legend :label
       lty = c(1,2), pch = c(15,17),
       col=c("red","blue"))


install.packages("shiny")  ##// 일단 shiny 패키지를 설치하도록 하고
library(shiny)  ##// 샤이니 패키지를 사용하기 위해 라이브러리에 추가!



####################################################################
### R의 기본그래픽장치인 plot {graphics} 함수 이용 기본 산점도 그리기
####################################################################

# 예제로 사용할 datasets 패키지에 대한 도움말 확인
library(help=datasets) # 별도의 퀵 도움말 탭 생성
help(package="datasets") # 알파벳 순서의 도움말 페이지 생성
data(package="datasets") # 데이터셋 목록만 확인

####################################################################
help(mtcars) # datasets패키지중 mtcart 데이터셋 도움말 확인
data(mtcars) # 데이터셋 로딩
data(mtcars, package="datasets") # 소속패키지를 명시해 데이터셋 로딩

head(mtcars) # 간단 조회
str(mtcars) # 내부구조 조회
mtcars # 전체내용 확인

rownames(mtcars) # 행이름확인, 원래는 단순 숫자로 되어 있는 인덱스 
row.names(mtcars) # 상동

colnames(mtcars) # 변수컬럼이름 확인
names(mtcars) # 상동

####################################################################
plot(mtcars) # mtcars에 있는 모든데이터를 활용한 산점도매트릭스 생성

## 차량무게에 대한 GTN접근
# - Graphic: 시각화
# - Table: 요약집계화
# - Numeric:수치화

# (1) Numeric 접근: 대표적인 기술통계치를 이용해 데이터 특성 이해
sort(mtcars$wt)
mean(mtcars$wt)
median(mtcars$wt)
range(mtcars$wt)

summary(mtcars$wt)
summary(mtcars)

# (2) Table 접근: 테이블 구조를 이용해 
# 데이터의 주요 기술통계치를 일목요연하게 정리해 특성 이해
summary(mtcars$wt) # 단별량
summary(mtcars) # 다변량

library(psych)
psych::describe(mtcars$wt)
psych::describe(mtcars)

library(Hmisc)
Hmisc::describe(mtcars$wt)
Hmisc::describe(mtcars)

library(skimr)
skim(mtcars$wt)
skim(mtcars)

# (3) Graphic 이해
plot(mtcars$wt) # mtcars에 있는 변수컬럼 중 wt를 활용한 산점도 그래프

# x축 차량무게와 y축 차량연비에 대한 산점도(scatter plot) 작성
plot(wt, mpg, data = mtcars) 
# --> (X) data= 라는 인수/옵션사용시 x, y축 데이터를 인수설정방식으로 하면 에러발생

plot(mpg ~ wt,data = mtcars) 
# --> (O) 변수간의 관계를 formular로 나타내는 것은 가능

plot(mtcars$wt, mtcars$mpg) # (O) x축 변수와 y축 변수를 지정시 
# 이 변수들이 특정 데이터프레임에 있는 변수컬럼이면 
# 데이터프레임명 명시해야 함

with(mtcars, {plot(wt, mpg)}) # (O) with를 이용한 간단 방법가능

# attach와 detatch를 이용한 간단 방법도 가능함
# 주로 참조해야 하는 데프가 여러 줄에 걸쳐 들어 있을 때 
attach(mtcars)
plot(wt, mpg)
detach(mtcars)

####################################################################
## 그래프 제목 붙이기

# 저수준작도함수로 바로 앞에서 사용한 액티브창에 그래프 제목 추가
title("차량무게에 따른 차량연비와의 관계")


# 또는 다음과 같이 plot()의 main= 옵션으로 직접 코딩해도 됨
plot(mtcars$wt, mtcars$mpg, 
     main="car weight & car mpg")


####################################################################
## 산점도 매트릭스 관련 패키지
library("PerformanceAnalytics")
chart.Correlation(mtcars, histogram = TRUE, pch = 3)
# - pch 옵션이 예전 R버전에서는 잘 작동했는데, 
#   최근 R버전(3.5.1)에서는 작동하지 않는 것 같음

####################################################################
## plot() 함수의 다양한 옵션 설정
####################################################################

## 간단 데이터 생성
dose  <- c(20, 30, 40, 45, 60)
drugA <- c(16, 20, 27, 40, 60)
drugB <- c(15, 18, 25, 31, 40)

# plot() 함수의 다양한 type 옵션들을 
# help(plot) ? plot 으로 찾아보자
# Google에서 "plot(type) in r" 이런식으로 찾아보아도 됨

## type옵션 변경에 따른 개별그래프 단독캔버스로 확인
plot(dose, drugA, type="p") # "p" for points
plot(dose, drugA, type="l") # "l" for lines
plot(dose, drugA, type="b") # "b" for both
plot(dose, drugA, type="c") # "c" for the lines part alone of "b"
plot(dose, drugA, type="o") # "o" for both ‘overplotted’
plot(dose, drugA, type="h") # "h" for ‘histogram’ like (or ‘high-density’) vertical lines,
plot(dose, drugA, type="s") # "s" for stair steps,
plot(dose, drugA, type="S") # "S" for other steps
plot(dose, drugA, type="n") # "n" for no plotting

## type옵션 변경에 따른 개별그래프 멀티캔버스로 확인
par(mfrow = c(3, 3))
# - 플롯창을 3줄 X 3칸 = 9개 셀로 분할하는 그래픽파라미터
# - 순차적으로 추가할수 있다. 9개까지 출력된후 다시 초기화 된다.
par()
# - par : parameter 
#   options :
# $`xlog`
# [1] FALSE
# 
# $ylog
# [1] FALSE
# 
# $adj
# [1] 0.5
# 
# $ann
# [1] TRUE
# 
# $ask
# [1] FALSE
# 
# $bg
# [1] "white"
# 
# $bty
# [1] "o"
# 
# $cex
# [1] 0.66
# 
# $cex.axis
# [1] 1
# 
# $cex.lab
# [1] 1
# 
# $cex.main
# [1] 1.2
# 
# $cex.sub
# [1] 1
# 
# $cin
# [1] 0.15 0.20
# 
# $col
# [1] "black"
# 
# $col.axis
# [1] "black"
# 
# $col.lab
# [1] "black"
# 
# $col.main
# [1] "black"
# 
# $col.sub
# [1] "black"
# 
# $cra
# [1] 14.4 19.2
# 
# $crt
# [1] 0
# 
# $csi
# [1] 0.132
# 
# $cxy
# [1] 4.162919 6.575696
# 
# $din
# [1] 7.125000 7.979167
# 
# $err
# [1] 0
# 
# $family
# [1] ""
# 
# $fg
# [1] "black"
# 
# $fig
# [1] 0.0000000 0.3333333 0.6666667 1.0000000
# 
# $fin
# [1] 2.375000 2.659722
# 
# $font
# [1] 1
# 
# $font.axis
# [1] 1
# 
# $font.lab
# [1] 1
# 
# $font.main
# [1] 2
# 
# $font.sub
# [1] 1
# 
# $lab
# [1] 5 5 7
# 
# $las
# [1] 0
# 
# $lend
# [1] "round"
# 
# $lheight
# [1] 1
# 
# $ljoin
# [1] "round"
# 
# $lmitre
# [1] 10
# 
# $lty
# [1] "solid"
# 
# $lwd
# [1] 1
# 
# $mai
# [1] 0.6732 0.5412 0.5412 0.2772
# 
# $mar
# [1] 5.1 4.1 4.1 2.1
# 
# $mex
# [1] 1
# 
# $mfcol
# [1] 3 3
# 
# $mfg
# [1] 1 1 3 3
# 
# $mfrow
# [1] 3 3
# 
# $mgp
# [1] 3 1 0
# 
# $mkh
# [1] 0.001
# 
# $new
# [1] FALSE
# 
# $oma
# [1] 0 0 0 0
# 
# $omd
# [1] 0 1 0 1
# 
# $omi
# [1] 0 0 0 0
# 
# $page
# [1] FALSE
# 
# $pch
# [1] 1
# 
# $pin
# [1] 1.556600 1.445322
# 
# $plt
# [1] 0.2278737 0.8832842 0.2531091 0.7965201
# 
# $ps
# [1] 12
# 
# $pty
# [1] "m"
# 
# $smo
# [1] 1
# 
# $srt
# [1] 0
# 
# $tck
# [1] NA
# 
# $tcl
# [1] -0.5
# 
# $usr
# [1] 18.40 61.60 14.24 61.76
# 
# $xaxp
# [1] 20 60  4
# 
# $xaxs
# [1] "r"
# 
# $xaxt
# [1] "s"
# 
# $xpd
# [1] FALSE
# 
# $yaxp
# [1] 20 60  4
# 
# $yaxs
# [1] "r"
# 
# $yaxt
# [1] "s"
# 
# $ylbias
# [1] 0.2   


plot(dose, drugA, type="p") # "p" for points
plot(dose, drugA, type="l") # "l" for lines
plot(dose, drugA, type="b") # "b" for both
plot(dose, drugA, type="c") # "c" for the lines part alone of "b"
plot(dose, drugA, type="o") # "o" for both ‘overplotted’
plot(dose, drugA, type="h") # "h" for ‘histogram’ like (or ‘high-density’) vertical lines,
plot(dose, drugA, type="s") # "s" for stair steps,
plot(dose, drugA, type="S") # "S" for other steps
plot(dose, drugA, type="n") # "n" for no plotting

par(mfrow = c(1, 1))
# - 플롯창을 1줄 X 1칸 = 1개 셀로 원래대로 만드는 그래픽파라미터

####################################################################
# 그래프의 축 레이블과 제목 색상을 직접 설정해 변화를 줌
plot(dose, drugA, type="b", col.lab="blue",
     lty=3, lwd=3, pch=15, cex=2,
     main="약품A의 복용량에 따른 효과변화",
     col.main="red")

# 해당 그래프에 부제목을 추가함
plot(dose, drugA, type="b", col.lab="blue",
     lty=3, lwd=3, pch=15, cex=2,
     main="약품A의 복용량에 따른 효과변화",
     col.main="red", 
     sub="약품A와 약품B 간의 비교실험 중") 

# 해당 그래프에 축 텍스트 색상변경
plot(dose, drugA, type="b", col.lab="blue",
     lty=3, lwd=3, pch=15, cex=2,
     main="약품A의 복용량에 따른 효과변화",
     col.main="red", 
     sub="약품A와 약품B 간의 비교실험 중",
     col.axis="darkgreen") 

####################################################################
# x, y축 레이블 직접입력 및 범위 지정
plot(dose, drugA, type="b",
     col="red", lty=2, pch=2, lwd=2,
     main="Clinical Trials for Drug A",
     sub="This is hypothetical data",
     xlab="Dosage", ylab="Drug Response",
     xlim=c(0, 60), ylim=c(0, 70))
# x, y축 레이블을 단순한 변수컬럼이 아닌
# 보다 이해하기 용이한 내용으로 풀어서 표기함
# x, y축의 범위도 (0,0) 부터 시작되도록 하여
# 실질적인 x, y 변수컬럼의 시작-진행-종료 변화상태를 
# 그래프로 볼 수 있도록 함 

####################################################################
## 기본그래프에 다른 그래프 겹치게 그리기
####################################################################

plot(dose, drugA, type="b",
     pch=15, lty=1, col="red", ylim=c(0, 60),
     main="Drug A vs. Drug B",
     xlab="Drug Dosage", ylab="Drug Response")

# ------------------------------
# 별도의 저수준 작도함수를 통한 그래프 세부묘사

lines(dose, drugB, type="b",
      pch=17, lty=2, col="blue")
# 기존의 복용량(dose)에 따른 약품A(drugA)의 변화 직선그래프에 
# 추가적으로 복용량(dose)에 따른 약품B(drugB)의 변화 직선을 추가함 

# ------------------------------
abline(h=c(30, 40), lwd=1.5, lty=2, col="gray")
# 2개의 직선그래프의 변화속에서 차이가 발생하는 지점을 강조하기 위해
# 별도의 가이드라인을 추가함
# h=c(30, 40)으로 설정하면 2군데 변화포인트를 강조함

# ------------------------------
# 범례표시
legend("topleft", inset=0.02, title="Drug Type", legend=c("A","B"),
       lty=c(1, 2), pch=c(15, 17), col=c("red", "blue"))
# locations 위치지정
# - 하단: "bottomright", "bottom", "bottomleft"
# - 상단: "topleft", "top", "topright"
# - 가운데: "left", "center", "right"  
# inset: legend margin inch setting 
# - 범례박스와 그래프바디 경계 간의 간격설정 0:붙음 ~ 0.5:떨어짐
# title: 범례의 제목
# legend: 범례를 구성하는 요소항목
# lty=c(1, 2): 범례 요소항목별 직선모양
# - DrugA 그래프에서 lty=1로, DrugB에서 lty=2로 설정한 것을 순서대로 매칭시킴
# pch=c(15, 17): 범례 요소항목별 텍스트모양
# - DrugA 그래프에서 pch=15로, DrugB에서 pch=17로 설정한 것을 순서대로 매칭시킴
# col=c("red", "blue"): 범례 요소항목별 표시색상
# - DrugA 그래프에서 col="red"로, DrugB에서 col="blue:로 설정한 것을 순서대로 매칭시킴
### End of Source ##################################################

# 새로운 그래프 
plot.new()

x <- c(1:10)
y <- x
z <- 10/x

# 여백조정 
par("mar")
par(mar=c(8.1,6.1,4.1,8.1))
#mar(bottom left top right)
x;y;z

plot(x = x, y = y, type = "b",
     pch = 21, col = "red",
     yaxt = "n", lty = 3, ann = TRUE) # ann=FALSE
# yaxt : y축의 눈금-> y axis ticks
# ann  : F를 통해 그래프의 주제목/부제목, 눈금의 수치값 숨김

# 저수준 작도함수라 그려진 그래프가 있어야, 
# 신규레이어로 추가되는 함수
lines(x, z, type = "b",
      pch = 22, col = "blue",
      lty = 2)

axis(side = 2, at = x, 
     labels = x, 
     col.axis = "red",
     las = 0)

# side -> 축의 위치 bottom=1, left = 2, top = 3, right = 4
# at   -> 눈금을 실제값으로 잡다달라는 뜻. 
# labels -> 값또한 실제값으로 표현 
# col.axis -> 축 색은 붉은색
# las = 눈금을 수직으로 둘건지 아닌지 0: 수직 2: 수평 

axis(side = 4, at = z, 
     labels = round(z,digits = 2), 
     col.axis = "red",
     las = 0)

# m : margin
mtext(text = "y = 1/x", side = 4, ## 오른쪽에 출력
      line = 3, cex.lab = 1, ## line - 3번째, cex.lab??? 정체가 뭐니??
      las = 0, col = "blue") ## las - label orientations - text 방향

title(main = "An Example of Creative Axes",
      cex.main = 2.0, col.main = "red",
      sub = "Various plot options",
      cex.sub = 1.5, col.sub = "green",
      xlab = "x values",
      ylab = "Y = X",
      cex.lab = 1.2, col.lab = "lightblue")



library(Hmisc)
# 눈금 비율 세분화
minor.tick(nx = 10,
           ny = 10,
           tick.ratio = 0.5)

## line -> 데이타를 통해 라인을 생성 
## abline -> 가이드 라인 생성
# h : horiz - 수평선 
# v : vertical - 수직
abline(h = c(3,6,9), 
       lty = 2,
       col = "gray")

abline(v = c(2,10,2),
       lty = 2,
       col = "gray")

# 그래픽파라미터의 디폴트 설정값을 별도로 안전하게 저장해 놓음
opar <- par(no.readonly = TRUE) 
# o-par -> orginal parameter - 임시변수
# 언제든지 par(opar)를 통해서 그래픽파라미터 값을 리셋해서 원래값으로 돌릴 수 있음

################################################################################
# raw 데이터 준비
x <- c(1:10)
y <- x
z <- 10/x

# 3개 벡터변수 값 출력조회
x; y; z

################################################################################
# 기본 그래프 그리기

par()$mar
# - 여백(margin) 관련 그래픽파라미터 설정상태 확인
par(mar = c(5, 4, 4, 8) + 0.1)

plot(x = x, y = y, type = "b",
     pch = 21, col = "red",
     yaxt = "n", lty = 3, ann = FALSE)
# yaxt = "n" -> y axes tick: y축의 눈금(tick) 표시를 나타내지 하지않음
# ann = F를 통해 그래프의 주제목/부제목, x, y축 레이블, 눈금 표시 등이 없음 

################################################################################
# 기본그래프에 저수준 작도함수를 이용한 세부묘사

lines(x = x, z = y, type = "b", pch = 22, col = "blue", lty = 2)
# lines()를 통해 기존 그래프 위에 바로 다른 변수간의 그래프를 겹치게 추가함

axis(side = 2, at = x, labels = x, col.axis = "red", las = 2)
# 특정 축의 설정을 디테일하게 변경하기 위한 설정
# side = 1:하단, 2:좌축, 3:상단, 4:우측  = > 2: 좌측, 즉 y축이 설정됨
# at: 해당 축에 눈금(tick) 표시할 위치로 벡터변수 x에 들어 있는 값을 기준으로 함
# labels: 해당 축에 눈금마다 벡터변수 x에 들어 있는 값을 레이블로 사용함 
# col.axis: 해당 축에 눈금마다 출력되는 레이블의 색상을 빨강으로 표시
# las: label orientation, 해당 축에 수평(0), 수직(2) 방향으로 레이블 표시

axis(side = 4, at = z, labels = round(z, digits = 2),
     col.axis = "blue", las = 2, cex.axis = 0.7, tck = -0.01)
# side = 4:하단, 2:좌축, 3:상단, 4:우측  = > 4: 우측에 있는 축이 설정됨
# at: 해당 축에 눈금(tick) 표시할 위치로 벡터변수 z에 들어 있는 값을 기준으로 함
# labels: 해당 축에 눈금마다 벡터변수 z에 들어 있는 값에 round() 함수를 적용해
# 소수 둘째자리까지 반올림해 표시한 수치를 레이블로 사용함 
# col.axis: 해당 축에 눈금마다 출력되는 레이블의 색상을 파랑으로 표시
# las: label orientation, 해당 축에 수평(0), 수직(2) 방향으로 레이블 표시
# cex.axis: 해당 축의 레이블을 표시할 때 표준크기 1에 비해 70%크기로 표시
# tck: 해당 축의 눈금(tick)을 표시할 때 방향
# (양수: 안쪽, 음수: 바깥쪽에 표시, 0은 눈금표시하지 않음)
# (1은 해당 위치에 격자선을 일일이 그려줌)

mtext(text = "y = 1/x", side = 4, line = 3, cex.lab = 1, las = 0, col = "blue")
# 그래프의 특정 여백위치에 텍스트를 추가함: margin text
# text: 그래프 위에 별도로 표시할 텍스트 문구
# side = 4: 별도 텍스트를 그래프 우측에 추가함
# line = 3: 별도 텍스트를 그래프에서 어느 정도 줄(line) 간격으로 
# 분리해 출력할지 설정 
# cex.lab = 1: 별도 텍스트의 크기는 기본파라미터 크기대로 1로 함
# las = 2: 별도 텍스트의 출력방향이 우측의 축에 수평이 되도록 함
# col = blue: 별도로 추가할 텍스트의 색상은 파랑

title("An Example of Creative Axes",
      xlab = "X values",
      ylab = "Y = X")
# 주제목과 x, y축 레이블을 표시함

################################################################################
# Hmisc::minor.tick()을 이용한 눈금표시 정밀묘사

# install.packages("Hmisc")
library(Hmisc)

minor.tick(nx = 10, ny = 10, tick.ratio  =  0.2)
# nx, ny: 해당 축의 기본눈금 사이에 세부 눈금을 몇개씩 넣을지 결정
# tick.ration: 해당 축의 기본눈금 크기 대비 세부눈금 크기의 비율

################################################################################
# 별도의 참조선 표시
abline(h = c(3, 6, 9), lty = 2, col = "gray")
abline(v = seq(2, 10, 2), lty = 2, col = "gray")
# 그래프에 일종의 가이드라인 표시를 해줌
# h: horizontal, v: vertical

################################################################################
# 그래픽파라미터 설정 원래대로 리셋
par(opar)

library(datasets)
data("mtcars")
mtcars


plot(mtcars$wt, mtcars$mpg)
plot(mpg ~ wt , data = mtcars)

## error
# plot(wt,mpg, data = mtcars)
plot(mtcars$mpg, mtcars$wt)
plot(wt ~ mpg , data = mtcars)

plot(mtcars$wt, mtcars$mpg,
     main = "Milege vs. Car Weight",
     xlab = "weight", ylab = "Milege",
     pch = 18, col = "blue")

# mtext -> 여백에 글씨 출력
# text -> 그래프 안에 글씨 출력
# (좌표정보 scan하여 글씨쓸 위치지정n-점기준으로 위치선정)
text(x=mtcars$wt, y=mtcars$mpg,
     labels = row.names(mtcars),
     cex = 0.6, pos = 4, col = "red")
# pos : position - 방향번호 지정 bottom=1,left=2, top=3, right=4
mtcars$carname <- row.names(mtcars)
text(x=mtcars$wt, y=mtcars$mpg,
     labels = mtcars$carname,
     cex = 0.6, pos = 4, col = "red")

text(x=mtcars$wt, y=mtcars$mpg,
     labels = mtcars$carname,
     cex = 0.6, pos = 4, col = "red",
     offset = 0.5)






plot(mtcars$gear, mtcars$wt,
     main = "Gear vs. Car Weight",
     xlab = "gear", ylab = "weight",
     pch = 18, col = "blue")

# mtext -> 여백에 글씨 출력
# text -> 그래프 안에 글씨 출력
# (좌표정보 scan하여 글씨쓸 위치지정n-점기준으로 위치선정)
text(x=mtcars$wt, y=mtcars$mpg,
     labels = row.names(mtcars),
     cex = 0.6, pos = 4, col = "red")
# pos : position - 방향번호 지정 bottom=1,left=2, top=3, right=4
mtcars$carname <- row.names(mtcars)
text(x=mtcars$wt, y=mtcars$mpg,
     labels = mtcars$carname,
     cex = 0.6, pos = 4, col = "red")

text(x=mtcars$gear, y=mtcars$wt,
     labels = mtcars$carname,
     cex = 0.6, pos = 4, col = "red",
     xlim = c(1,1000),ylim = c(1,1000),
     offset = 0.5)


## z축 value에 따라 색 변
require(ggplot2)
data(diamonds)
qplot(carat, price, data = diamonds, colour = color)

########################################################
## 현재 사용가능한 폰트패밀리 목록 확인
windowsFonts()

## 폰트패밀리 추가 등록
windowsFonts(
  AB=windowsFont("Arial Black"),
  BOS=windowsFont("Bookman Old Style"),
  CSM=windowsFont("Comic Sans MS"),
  MG=windowsFont("맑은 고딕"),
  NS=windowsFont("나눔손글씨 붓 보통")
)

## 기존 + 추가 등록된 폰트패밀리 목록 확인
windowsFonts()

names(windowsFonts())

########################################################
## 기본 그래프 그리기

plot(1:10, 1:10)#, type="n") 
# - plot()의 옵션중 type="n"이면 점이든 직선이든 
# - 그래프 바디에 아무것도 표시하지 않음

########################################################
## 플롯창 그래프 바디 특정위치에 문자열 출력

text(x=3, y=3, labels="default text")
text(x=3, y=4, labels="기본 텍스트")

text(5, 4, "mono-spaced text", family="mono", cex=1.2)
text(5, 5, "모노스페이스 텍스트", family="mono", cex=1.2)

text(9, 5, "serif text", family="serif", cex=2)
text(9, 4, "세리프 텍스트", family="serif", cex=2)

text(2, 6, "Arial Black text", family="AB")
text(2, 5, "에어리얼블랙 텍스트", family="AB")

text(3, 2, "Bookman Old Style text", family="BOS", cex=1.2)
text(3, 1, "북맨스타일 텍스트", family="BOS", cex=1.2)

text(7, 6, "Comin Sans MS text", family="CSM", cex=2)
text(7, 7, "컴인산스 텍스트", family="CSM", cex=2)

text(7, 2, "신나는 맑은 고딕", family="MG", cex=1)

text(8, 10, "재미있는 나눔손글씨", family="NS", cex=1)

### End of Documents ###################################


# CORL - Raninbow

rainbo(4)
heat.colors(4)
teerain.colors(4)
terrain.colors(4)
cm.colors(4)

## 변수 저장후 z를 색지정하여 뽑
# example("rainbow")

x <- c(11,3,7,21,4,9,15)
barplot(x, col="blue")
barplot(x, col = c("gray","red","green","lightblue", "pupple","yellow","cyan"))
barplot(x, col = rainbow(7))
barplot(x, col = rainbow(5))
barplot(x, col = rainbow(10))

barplot(x, col=heat, colors(10))
barplot(x, col=heat, colors(10))
barplot(x, col=heat, colors(10))
barplot(x, col=heat, colors(10))
barplot(x, col=heat, colors(10))


install.packages("RcolorBrewer")
library(RColorBrewer)

display.brewer.all()
brewer.pal.info
brewer.pal()


# 범주용 데이타는 4칙 연산이 아니되므로 지적자료라고 함.

# 특정한 팔래트 사용 
display.brewer.all(n=3)
display.brewer.all(n=5)



# raw 데이터 준비
data(mtcars)
help(mtcars)

str(mtcars)
head(mtcars)

############################################################
# 데이터프레임의 행이름 확인
rownames(mtcars)
row.names(mtcars)

# 데이터프레임의 열이름 확인
colnames(mtcars)
names(mtcars)

# 행이름으로 있는 차량명을 별도의 변수컬럼으로 활용
# 차량명을 carname라는 새로운 변수로 추가함
mtcars$carname <- rownames(mtcars)
head(mtcars)

# 기존의 행이름으로 있던 차량명을 숫자인덱스로 변환하는 
rownames(mtcars) <- NULL
head(mtcars)

# mtcars 변수컬럼 순서 조정
# carname 변수컬럼을 가장 앞으로 위치하게 하고,
# 요약집계 기준변수로 활용할 수 있는 변수컬럼들과
# - cyl, gear, vs, am, carb
# 요약집계 결과변수로 활용할 수 있는 변수컬럼들의
# - mpg, disp, hp, drat, wt, qsec
# 위치를 나누어서 데이터프레임 구조를 재조정 필요성
# 또한 요약집계 결과변수들도 wt에 따라 다른 변수들의 변화를
# 보는 경우가 많을 수 있으므로 wt의 위치를 결과변수 그룹의
# 제일 앞으로 위치시키는 것도 좋음
mtcars <- mtcars[c("carname",
                   "cyl", "gear", "vs", "am", "carb",
                   "wt", "mpg", "disp", "hp", "drat", "qsec")]
# - 또는 일일이 변수컬럼명을 입력하는 것이 아닌
# - 변수컬럼의 위치(인덱스) 번호를 이용하는 방법도 가능함
# - mtcars <- mtcars[c(12, 1:11)] 

head(mtcars)

########################################################
# 기본 그래프 그리기
plot(x = mtcars$wt, y = mtcars$mpg) # 정상코딩
plot(wt, mpg, data = mtcars) # 오류코딩
# - 현재 메모리상에 변수wt와 mpg가 없기 때문임

plot(mtcars$mpg ~ mtcars$wt) # 정상코딩
plot(mpg ~ wt, data = mtcars) # 정상코딩

# 기본 그래프에 변화주기
# 주제목, x, y축 레이블, 바디 텍스트와 색상
plot(mtcars$wt, mtcars$mpg,
     main="Mileage vs. Car Weight",
     xlab="Weight", ylab="Mileage",
     pch=18, col="blue")

# 그래프 바디에 별도 텍스트를 표시하는 text() 사용
text(x=mtcars$wt, y=mtcars$mpg,
     labels=row.names(mtcars),
     cex=0.6, pos=4, col="red")
# 현재 row.names(mtcars)에는 기존의 차량명을 활용해
# 별도의 carname 변수컬럼으로 보내고, 
# 숫자인덱스로 변경했으므로 숫자가 표시됨
# x, y: 레이블을 붙일 요소값의 데이터
# labels: 요소값 마다 붙여넣을 실제 레이블 목록
# cex: 레이블의 크기
# pos: posion, 레이블이 요소값 주위에 위치할 방향
# - 1:하단, 2:좌측, 3:상단, 4:우측

# 그래프 바디에 별도 텍스트를 표시하는 text() 사용
text(x=mtcars$wt, y=mtcars$mpg,
     labels=mtcars$carname,
     cex=0.6, pos=4, col="red")

text(x=mtcars$wt, y=mtcars$mpg,
     labels=mtcars$carname,
     cex=0.6, pos=2, col="purple")
# pos=2로 레이블의 위치는 요소값의 좌측에 표시

text(mtcars$wt, mtcars$mpg,
     mtcars$carname,
     cex=0.6, pos=4, col="red", 
     offset = 0.5)
# pos=4로 레이블의 위치는 요소값의 좌측에 표시
# offset=0.5로 요소값과 레이블의 거리를 의미 
#############################################################################
colors() # 모든사용가능한 색상명(name) 조회

length(colors()) # 657개
NROW(colors()) # 657개

example(colors) # colors() 함수를 이용한 예시내용 조회
demo(colors) # 상동

#############################################################################
### 색상 파레트(스펙트럼)의 이용
# 인접한, 근접한 색상이 필요한 이유
# 색을 아무거나 선택해서 그리면, 색상 간에 반감효과가 나타날 수 있음
# 서로 잘 대조(contrasting)를 이루거나 보완(complementing) 될 수 있는 색상들을 가지고 
# 연속스펙트럼 형태로 보이는 색상으로 그래프를 묘사해야 가독성과 안정감이 올라감
# 이를 위해 서로 보완되거나 대조를 이루는 색상들을 미리 파레트 형식으로 정의해 놓음

# 인접한 색상 벡터를 16진수로 만들어 내는 방법
# 5개 색상파레트 기능함수마다 만들어 내는 색상들이 다름
# 어떤 함수는 색상이 연속스펙트럼 형태로, 
# 어떤 함수는 그냥 무작위로 색을 도출해 줌
# ( ) 안의 숫자를 2000으로 해도 생성됨; 제한이 없는 듯 함

# 각각의 색상파레트 함수를 이용해서 4개 정도의 색상값을 도출할 수 있음
rainbow(4) # 무지개 색상을 활용한 스펙트럼
heat.colors(4) # 온도/열기/더위를 표현하는 색상중심
terrain.colors(4) # 지형/지역/지대를 표현하는 색상중심
topo.colors(4) # 지질/지도를 표현하는 색상 중심
cm.colors(4) # Cyan(청록:B+G), Magenta(자홍:B+R) 색상간 스펙트럼

example(rainbow()) # 작동하지 않음
example(rainbow) # 작동함
# 이 예제실행결과 내용에 
# heat.colors, terrain.colors, topo.colors, cm.colors 내용이 모두 들어 있음

################################################################################
# 색상파레트가 없을 때 그래프에 색을 표현하는 방법
x <- c(11, 3, 7, 21, 4, 9, 15)

barplot(x) # 색상이 지정된 옵션이 없으므로 기본 그래픽파라미터중에서 
# par()$col에 설정되어 있는 "black"값으로 그림이 그려짐

barplot(x, col="blue") # col 옵션을 통해 모든 막대를 파란색으로 표현
barplot(x, col=c("gray", "red", "green", 
                 "lightblue", "purple", 
                 "yellow", "cyan"))
# 벡터변수 x에 들어 있는 7개 막대마다 개별적인 색을 일일이 지정해 줌
# x의 요소값도 7개, col=c()에 설정된 색상도 7개
# 물론 벡터변수 x의 요소갯수와 col=c()에 설정된 색상갯수가 서로 일치하지 않아도
# 색상벡터의 재순환/재활용(리사이클링; recycling)을 통해 
# 벡터변수 x의 요소순서와 col=c()의 색상순서가 서로 하나씩 대응하며 색을 반영함

################################################################################
# 색상벡터의 재활용/재순환(recycling)을 이용하는 방법
x <- c(11, 3, 7, 21, 4, 9, 15)
barplot(x, col=rainbow(7)) # 표현대상 요소갯수 = 색상갯수
barplot(x, col=rainbow(5)) # 표현대상 요소갯수 > 색상갯수
barplot(x, col=rainbow(10)) # 표현대상 요소갯수 < 색상갯수


barplot(x, col=heat.colors(10)) 
barplot(x, col=terrain.colors(10)) 
barplot(x, col=topo.colors(10)) 
barplot(x, col=cm.colors(10)) 

#############################################################################
#### ggplot {gglot2}를 이용한 개별 변수에 대한 분포특성 분석
##############################################################################

## --------------------------------------
## ggplot2 패키지 설치 및 로딩
# install.packages("ggplot2")
library(ggplot2)

## ggplot2 패키지에 대한 도움말
library(help = ggplot2) # 간단 도움말 뷰어 오픈
help(package = ggplot2) # 알파벳순서 도움말 탭 오픈
data(package = "ggplot2") # 해당 패키지에 들어 있는 예제데이터셋 목록확인

## --------------------------------------
## ggplot2 패키지에 들어 있는 mpg데이터셋 로딩
data(mpg, package = "ggplot2") # mpg 데이터셋 메모리로 로딩
help(mpg) # mpg 데이터셋 도움말(코딩북 확인)

## --------------------------------------
## mpg데이터셋 내용조회
library(psych)
psych::headTail(mpg)
mpg # mpg 데이터셋 내용조회, tibble 형식이라 간단하게 조회됨
## mpg : 도심속 연비율

## --------------------------------------
## mpg 데이터셋 구조파악 및 기술통계분석
str(mpg) # 기본 구조

# install.packages("dplyr")
library(dplyr)
glimpse(mpg) # tibble 구조

library(Hmisc)
Hmisc::describe(mpg) # 상세 기술통계분포

##############################################################################
## (1) 하나의 연속형 변수에 대한 분포파악

## --------------------------------------
## 고속도로 연비(hwy)에 대한 기본 플롯팅
ggplot(data = mpg, aes(x = rownames(mpg), y = hwy)) + geom_point()
# - ggplot() 함수의 기본코딩형식
# - style은 +geom_point() 이런식으로 계속 더하여 표현한다

ggplot(mpg, aes(rownames(mpg), hwy)) +
  geom_point()
# - 인수명생략과 플러스(+) 기호를 이용한 줄바꿈

p <- ggplot(mpg, aes(rownames(mpg), hwy)) # 대상데이터셋과 대상 X축 & Y축 변수설정 
p <- p + geom_point() # 설정된 X축 & Y축 변수를 이용해 어떤 기하학적 구조로 표현할지 결정
p # 플러스(+) 기호를 이용해 연결된 ggplot() 그래픽 코딩문들을 모두 합쳐서 실행/출력함

## --------------------------------------
# histogram을 이용한 연속변수 분포확인
# - 전체 데이터 범위를 일정한 구간단위(bin)으로 나누어 빈도수를 카운팅해 막대그래프로 표현
ggplot(mpg, aes(hwy)) + geom_histogram() # 기본적으로 구간을 30개 막대로 표현함
ggplot(mpg, aes(hwy)) + 
  geom_histogram(bins = 10) 
# - 구간을 10개 막대로 구성해 막대의 폭을 상대적으로 넓게 표현함
ggplot(mpg, aes(hwy)) + 
  geom_histogram(bins = 100) 
# - 구간을 100개 막대로 구성해 막대의 폭이 상대적으로 촘촘하게 표현함

## --------------------------------------
# density를 이용한 연속변수 분포확인
# - 히스토그램의 빈도수를 비율(발생가능 확률)로 계산해 표현
ggplot(mpg, aes(hwy)) + geom_density() # 기본 밀도 곡선
ggplot(mpg, aes(hwy)) + geom_density(fill = "grey50") 
# - 기본 밀도곡선 영역에 색상을 채움(fill)
ggplot(mpg, aes(hwy)) + geom_density(fill = "blue", alpha = 0.2) 
# - 기본 밀도곡선 영역에 색상을 표현하며, alpha는 불투명도

## --------------------------------------
# freqpoly를 이용한 연속변수 분포확인
#- 빈도수(frequency)를 다각형곡선(polygonal)으로 표현
ggplot(mpg, aes(hwy)) + geom_freqpoly() # 기본 빈도기반 다각형곡선
ggplot(mpg, aes(hwy)) + 
  geom_freqpoly(binwidth = 2.5) # 구간간격을 2.5간격으로 상대적으로 넓게
ggplot(mpg, aes(hwy)) + 
  geom_freqpoly(binwidth = 0.2) # 구간간격을 0.2간격으로 상대적으로 촘촘하게

##############################################################################
## (2) 하나의 연속형 변수에 그룹핑변수를 적용해 요약집계(aggregation) 분포파악

## ---------------------------------------
## 그룹핑(집단구분) 변수로 drv(구동방식) 변수를 선정해 팩터화 
mpg$drv.f <- factor(mpg$drv, levels = c("4", "f", "r"), 
                    labels = c("4륜구동", "전륜구동", "후륜구동"))
library(psych)
psych::headTail(mpg)
psych::headTail(mpg[c("drv", "drv.f")])

table(mpg$drv.f)

## --------------------------------------
## 히스토그램 이용
ggplot(mpg, aes(displ, fill = drv.f)) + 
  geom_histogram(binwidth = 0.1)
# - displ(엔진배기량)에 대한 히스토그램분포를 
#   drv.f(구동방식)별로 하나의 그래프 상에 통합해 분포파악

ggplot(mpg, aes(displ, fill = drv.f)) + 
  geom_histogram(binwidth = 0.1) + 
  facet_wrap(~ drv, ncol = 1) 
# - ncol = 1: 세분화된 그래프창을 여러개로 분할 할 때 컬럼을 1칸으로 설정함   
# - 그 1칸에 drv.f(구동방식)별로 행을 여러 줄로 나누어 그래프를 표현하겠다는 의미

## --------------------------------------
## 빈도다각형곡선(freqpoly) 이용
# displ(엔진배기량)에 대한 빈도다각형분포를 
# drv(구동방식)별로 하나의 그래프 상에서 그룹핑해 분포파악
ggplot(mpg, aes(displ, colour = drv.f)) + 
  geom_freqpoly(binwidth = 0.5)

# displ(엔진배기량)에 대한 빈도다각형분포를 
# drv(구동방식)별로 세분화된 분할그래프 상에서 분포파악
ggplot(mpg, aes(displ, colour = drv.f)) + 
  geom_freqpoly(binwidth = 0.5) + 
  facet_wrap(~drv, nrow = 1)
# - nrow = 1: 세분화된 그래프창을 여러개로 분할 할 때 행을 1줄로 설정함   
# - 그 1줄에 drv(구동방식)별로 컬럼을 여러 칸으로 나누어 그래프를 표현하겠다는 의미

##############################################################################
## (3) 하나의 범주형 변수에 대한 분포파악

## 차량 제조사(manufacturer) raw데이터 확인 
psych::headTail(mpg)
mpg$manufacturer

## --------------------------------------
## 제조사(manufacturer) 변수에 대한 빈도수 분포 
ggplot(mpg, aes(manufacturer)) + 
  geom_bar()
# - 기본 막대그래프

ggplot(mpg, aes(manufacturer)) + 
  geom_bar(stat = "count")
# - stat = "count": 빈도수 카운팅을 통해 막대그래프를 그린다는 것을 명시적으로 코딩

ggplot(mpg, aes(manufacturer, fill = manufacturer)) +
  geom_bar()
# - 제조사별 색상표현과 레전드(가이드 표시)

ggplot(mpg, aes(manufacturer)) +  
  geom_bar() + coord_flip()
# - 축을 변환해 가로방향으로 기본 막대그래프 표현

ggplot(mpg, aes(manufacturer, fill = manufacturer)) +  
  geom_bar() + coord_flip() 
# 축을 변환해 가로방향으로 표현하고, 제조사별 색상표현과 레전드(가이드) 표시

## --------------------------------------
## 제조사(manufacturer)별 차량 빈도수를 별도의 테이블로 생성
## xtabs = crosstabs
mf.counts <- xtabs(~ mpg$manufacturer)
mf.counts
mf.counts <- as.data.frame(mf.counts)
mf.counts
names(mf.counts)[1] <- c("company") # 빈도테이블의 첫번째 컬럼명 변경
mf.counts

## --------------------------------------
ggplot(data = mf.counts, aes(x = company, y = Freq)) +  
  geom_bar(stat = "identity")
# - 범주형 항목들과 각 항목별 수치(빈도수) 데이터셋을 활용한 기본 막대그래프
# - 특별한 정렬기준이 없으므로 범주항목들의 알파벳 순으로 막대가 나열됨

ggplot(mf.counts, aes(reorder(company, - Freq), Freq)) +  
  geom_bar(stat = "identity")
# - 막대그래프를 수치(빈도수)를 기준으로 내림차순으로 정렬을 함

ggplot(mf.counts, aes(reorder(company, - Freq), Freq, fill = company)) +  
  geom_bar(stat = "identity")
# - fill = company: 범주형 변수인 company에 들어 있는 각 항목들로 
#   가이드(레전드)를 설정하고, 이 항목수만틈 색상을 각 막대에 표현함

ggplot(mf.counts, aes(company, Freq)) +  
  geom_bar(stat = "identity") +
  coord_flip() 
# - 가로방향으로 출력, 범주항목 알파벳순으로 밑에서부터 위로 막대가 표현됨

ggplot(mf.counts, aes(reorder(company, Freq), Freq)) +  
  geom_bar(stat = "identity") +
  coord_flip()
# - company에 들어 있는 항목별 Freq(빈도) 크기순으로 오름차순 정렬를 통해
#   막대그래프들을 표현함

ggplot(mf.counts, aes(reorder(company, Freq), Freq)) +  
  geom_bar(stat = "identity", fill = rainbow(NROW(mf.counts))) +
  coord_flip()
# - geom_bar()를 통해 각 막대의 색상을 직접입력함 

### End of Source ############################################################
######################################################################
## RColorBrewer 색상파레트

install.packages("RColorBrewer")
library(RColorBrewer)

# example()을 통해 기능함수, 데이터셋, 패키지에 대한 예시를 볼 수 있음
example("RColorBrewer") # 실행됨

######################################################################
# RcolorBrewer 패키지에서 보유한 3가지 파레트 그룹 출력
# Sequential: 18종, Qualitative: 8종, Diverging: 9종
display.brewer.all() 

# RColorBrewer 파레트의 색상그룹별 최대색상갯수 확인
# 각 파레트그룹 - 단위 파레트별로 설정된 최대색상갯수를 
# 넘어서는 색상 추출을 하면 에러발생

brewer.pal.info # maxcolors, category, colorblind 컬럼 있음
# maxcolors: 각 파레트그룹 및 세부파레트별 최대색상수
# category: div, qual, seq 3종류의 파레트 그룹이 있음을 알 수 있음
# colorblind: 색맹을 위한 파레트 설정 존재유무

x <- brewer.pal.info
mode(x); class(x) # list; data.frame으로 나옴

x["Blues",] # Blues 색상종에 대한 레코드 확인
x["Blues",]$maxcolors # Blues 색상종의 최대색상 갯수 확인

######################################################################

display.brewer.all(type="seq")
subset(brewer.pal.info, category=="seq")
# Sequential palettes 순차파레트
# 18종 세부 파레트별 3~9개 색상보유
# RColorBrewer 색상파레트 중 첫번째(가장상위) 영역 파레트
# 낮은 값에서 높은 값으로 진행되는 정렬 된 데이터에 적합!!!

display.brewer.all(type="qual") 
subset(brewer.pal.info, category=="qual")
# Qualitative palettes 정성적(범주형) 파레트
# RColorBrewer 색상파레트 중 두번째(가운데) 영역 파레트
# 8종 세부 파레트별 3개~다양한 갯수 범위를 가짐
# Set3(12개), Set2(8개), Set1(9개)
# Pastel2(8개), Pastel1(9개), Paired(12개)
# Dark2(8개), Accent(8개)
# 범례 클래스 간의 크기(양적) 차이를 의미하지 않음
# 범주형 데이터 간의 기본적인 시각적 차이를 나타내는 데 적합함!!!

display.brewer.all(type="div")
subset(brewer.pal.info, category=="div")
# Diverging palettes 분산파레트
# 9종 세부 파레트별 3~11개 색상보유
# RColorBrewer 색상파레트 중 세번째(가장하위) 영역 파레트
# 데이터 범위내 중간 임계값(중요 클래스, 중단점)은 밝게 강조
# 데이터 양쪽의 높고/낮은 극한값은 어둡게 강조!!!

######################################################################

# RColorBrewer 파레트에서 3개 그룹별로 3개씩만 인접색상을 조회
display.brewer.all(n=3)

# RColorBrewer 파레트에서 3개 그룹별로 5개씩만 인접색상을 조회
display.brewer.all(n=5)


# RColorBrewer 파레트에서 각 그룹별로 5개씩만 인접색상을 조회
display.brewer.all(n=5, type="seq")
display.brewer.all(n=5, type="qual")
display.brewer.all(n=5, type="div")

display.brewer.all() # 모든 색상그룹의 색상파레트 조회
display.brewer.all(colorblindFriendly=TRUE) # Qual 그룹 갯수가 3개만 나옴
# 여러 파레트 중에서 색맹 사용자를 위한 색상파레트만 조회


#############################################################################
### ggplot {gglot2}를 활용한 변수간 관련성 분석
##############################################################################

## ggplot2 패키지 설치 및 로딩
# install.packages("ggplot2")
library(ggplot2)

## ggplot2 패키지에 들어 있는 mpg데이터셋 로딩
data(mpg, package = "ggplot2") # mpg 데이터셋 메모리로 로딩
help(mpg) # mpg 데이터셋 도움말(코딩북 확인)

## mpg데이터셋 내용조회

## mpg 데이터셋 구조파악 및 기술통계분석
library(dplyr)
glimpse(mpg) # tibble 구조

library(Hmisc)
Hmisc::describe(mpg) # 상세 기술통계분포

##############################################################################
#### (1) 연속형-연속형 변수간 관련성 분석
##############################################################################

## 연속형-연속형 변수간 관련성은 산점도(scatterplot) 형태로 보통 표현

## ggplot() 함수를 이용한 기본플롯팅
# - displ(엔진배기량)에 따른 hwy(고속도로 환경에서 연비)의 변화를 관찰
ggplot(data = mpg, aes(x = displ, y = hwy)) + geom_point()
# - data: ggplot에 입력할 데이터셋
# - aes: 시각화 대상 변수와 시각적 속성입력
# - geom_OOO: 다양한 기하학적 요소 입력

## 함수옵션명(인수, 파라미터) 생략가능
## 세부적인 그래프 설정을 + 기호를 이용해 다음줄에 들여쓰기 가능
ggplot(mpg, aes(displ, hwy)) +
  geom_point() + 
  labs(title = "엔진배기량(displ)에 따른 고속도로상 연비(hwy)", 
       x = "엔진배기량(displ)", 
       y = "고속도로상 차량연비(hwy)")

## 점대신 라인으로 표현
ggplot(mpg, aes(displ, hwy)) + 
  geom_point() +
  geom_line() 

##############################################################################
## displ(엔진배기량)에 따른 hwy(고속도로 환경에서 연비) 변화특성에 대한 최적합선 표현

# 기본 plot() 함수이용: 직선과 곡선 최적합화선 추가
plot(hwy ~ displ, data = mpg, pch=19)
abline(lm(hwy ~ displ, data = mpg), col="red", lwd=2, lty=1) # 최적의 직선추가
lines(lowess(mpg$hwy ~ mpg$displ), col="blue", lwd=2, lty=2) # 최적의 곡선추가

# ggplot() 함수이용: 최적합화선 추가
ggplot(mpg, aes(displ, hwy)) + 
  geom_point()

## 국소회귀(loess)를 이용한 평활화(smotting) 플롯팅
# - 국소회귀(local regression, locally Weighted scatter-plot smoother)
# - 2개 변수간의 지배적인 패턴(관련성)을 보기 위해 
#   국소적으로(부분적으로, 일정구간별로) 최소자승회귀분석을 실시해
#   데이터의 선형적 변화패턴을 파악해 이른바 최적합선을 만들어 줌
# - 이 최적합선을 구하는 알고리즘을 method = "OOO"으로 설정할 수 있음
#   method --> loess(1000개 이하 데이터셋), gam(1000개 이상 데이터셋)
#          --> lm(데이터셋이 선형관계에 가까울 경우), rlm(데이터셋에 이상치가 있을 경우)
#          --> default 설정은 method = "loess"이며, 생략가능함
# - 이 최적합선 주위에 일종의 신뢰구간형태로 회색으로 불확실성(오류가능성) 정도를 표현함

ggplot(mpg, aes(displ, hwy)) + 
  geom_point() + 
  geom_smooth() # 최적합선과 오차범위를 표현

ggplot(mpg, aes(displ, hwy)) + 
  geom_point() + 
  geom_smooth(se = FALSE) # 최적합선만 표현

ggplot(mpg, aes(displ, hwy)) + 
  geom_point() + 
  geom_smooth(se = TRUE) # 최적합선과 오차범위를 표현

##############################################################################
## 최적합선을 그릴 때 적합정도를 다양하게 표현할 수 있음
# sapn 값이 증가할 수록 평활화 정도는 증가되는데, 데이터를 잇는 곡선이 더욱 부드러워 짐
# 평활(smoothing)이란 들쑥날쭉한 자료를 평탄하고 변화가 완만한 값으로 변환시키는 것을 의미함

ggplot(mpg, aes(displ, hwy)) + 
  geom_point() + 
  geom_smooth(span = 0.2) 
# - 과대적합상태(over-fitting) 
#   --> 모델이 너무 특정 데이터셋에만 최적화되어 다른 데이터셋에는 적용 어려움

ggplot(mpg, aes(displ, hwy)) + 
  geom_point() + 
  geom_smooth(span = 0.5) 
# - 일반화/적정적합상태(generalization/right-fitting) 
#   --> 모델이 특정 데이터셋과 다른 데이터셋에도 적용가능해 범용사용성이 충분함

ggplot(mpg, aes(displ, hwy)) + 
  geom_point() + 
  geom_smooth(span = 1)
# - 과소적합상태(under-fitting) 
#   --> 모델이 너무 단순해 특정 데이터셋이나 다른 데이터셋에 적용하기 모두 어려움

##############################################################################
# install.packages("gridExtra") 패키지를 이용한
# ggplot2용 멀티프레임 생성
library(gridExtra)

# 멀티프레임에 배치할 개별 그래프 준비
p1 <- ggplot(mpg, aes(displ, hwy)) + 
  geom_point() + 
  geom_smooth(span = 0.2) + 
  labs(title = "과대적합상태(over-fitting)", 
       x = "차량배기량(displ)", 
       y = "고속도로 차량연비(hwy)")

p2 <- ggplot(mpg, aes(displ, hwy)) + 
  geom_point() + 
  geom_smooth(span = 0.5) + 
  labs(title = "적정적합(right-fitting)상태", 
       x = "차량배기량(displ)", 
       y = "고속도로 차량연비(hwy)")

p3 <- ggplot(mpg, aes(displ, hwy)) + 
  geom_point() + 
  geom_smooth(span = 1.0) + 
  labs(title = "과소적합상태(under-fitting)", 
       x = "차량배기량(displ)", 
       y = "고속도로 차량연비(hwy)")

# 그래픽디바이스를 2개 컬럼(열)로 나누어 그래프를 배열
grid.arrange(p1, p2, p3, ncol = 3) 

##############################################################################
#### (2) 범주형-범주형 변수간 관련성 분석
##############################################################################
## 범주형-범주형 변수간 관련성은 교차 막대그래프형태로 보통 표현

## 두 명목 변수간의 간단 플롯팅
ggplot(mpg, aes(model, manufacturer)) + geom_point()
ggplot(mpg, aes(manufacturer, model)) + geom_point()

# --------------------------------------------------
## 팩터화를 통해 그룹변수와 세분화변수 설정
# --------------------------------------------------

## cyl(실린더 유형) 변수 팩터화
table(mpg$cyl)
mpg$cyl.f <- factor(mpg$cyl, levels = c(4, 5, 6, 8),
                    labels = c("4기통", "5기통", "6기통", "8기통"),
                    ordered = TRUE)

## drv(구동방식) 변수 팩터화
table(mpg$drv)
mpg$drv.f <- factor(mpg$drv, levels = c("4", "f", "r"),
                    labels = c("4륜구동", "전륜구동", "후륜구동"),
                    ordered = TRUE)

## fl(연료유형) 변수 팩터화
table(mpg$fl)
mpg$fl.f <- factor(mpg$fl, levels = c("c", "d", "e","p", "r"),
                   labels = c("압축천연가스", "디젤", "에타놀", "프리미엄", "일반"),
                   ordered = TRUE)

## class(차량유형) 변수 팩터화
table(mpg$class)
mpg$class.f <- factor(mpg$class, 
                      levels = c("2seater", "subcompact", "compact", 
                                 "midsize", "suv", "minivan", "pickup"),
                      labels = c("2인승", "경차", "소형차",
                                 "중형차", "SUV", "미니밴", "픽업트럭"),
                      ordered = TRUE)

## trans(기어방식) 변수 범주화 & 팩터화 
table(mpg$trans)
# install.packages("doBy")
library(doBy)
mpg$trans.c <- recodeVar(mpg$trans,
                         src = list(c("auto(av)", "auto(l3)", "auto(l4)",
                                      "auto(l5)", "auto(l6)", "auto(s4)",
                                      "auto(s5)", "auto(s6)"),
                                    c("manual(m5)", "manual(m6)")),
                         tgt = list("자동기어", "수동기어"))

str(mpg$trans.c) 
# - 문자열(chr) 형식으로 단순 리코딩된 데이터

mpg$trans.f <- factor(mpg$trans.c, 
                      levels = c("자동기어", "수동기어"),
                      ordered =  TRUE)
# - 팩터형으로 추가작업한 결과

str(mpg$trans.f) 

# --------------------------------------------------
## 팩터형으로 만든 집계기준 변수 확인
# - cyl.f(실린더유형), drv.f(구동방식), fl.f(연료유형), 
#   class.f(차량유형), trans.f(기어방식) 변수

str(mpg)

##############################################################################
## 차량유형(class)에 따른 기어유형(drv) 빈도교차분석

# 차량유형(class)별 그래프구조 생성
g <- ggplot(mpg, aes(class))
g

# 차량유형(class)별 막대그래프 생성
g + geom_bar()

# 차량유형(class)별 기어유형(drv) 빈도교차분석 실시
g + geom_bar(aes(fill = drv)) # 단순한 class막대에 drv데이터를 채워달라

g + geom_bar(aes(fill = drv), position = position_stack(reverse = TRUE)) +
  coord_flip() +
  theme(legend.position = "top") # 레전드를 탑으로 배치해 가로방향 플롯 해석순서를 자연스럽게

g + geom_bar(aes(fill = drv), position = position_stack(reverse = TRUE)) +
  coord_flip() +
  theme(legend.position = "top")

## 빈도교차그래프와 비율교차그래프 
# 구동방식(drv)에 따른 실린더유형(cyl.f)
ggplot(data=mpg, aes(x = drv, fill = cyl.f)) +
  geom_bar()

ggplot(data=mpg, aes(x = drv, fill = cyl.f)) +
  geom_bar(position="fill") + 
  labs(title = "구동방식(drv)에 따른 실린더유형(cyl.f)", 
       x = "차량구동방식(drv)", 
       y = "비율(Portion)")

# install.packages("gridExtra") 패키지를 이용한
# ggplot2용 멀티프레임 생성
library(gridExtra)

# 멀티프레임에 배치할 개별 그래프 준비
p1 <- ggplot(data=mpg, aes(x = drv, fill = cyl.f)) + 
  geom_bar() + 
  labs(title = "구동방식(drv)에 따른 실린더유형(cyl.f) 빈도분포", 
       x = "차량구동방식(drv)", 
       y = "빈도(Frequency)") + 
  theme(legend.position='none')

p2 <- ggplot(data=mpg, aes(x = drv, fill = cyl.f)) +
  geom_bar(position="fill") + 
  labs(title = "구동방식(drv)에 따른 실린더유형(cyl.f) 비율분포", 
       x = "차량구동방식(drv)", 
       y = "비율(Portion)")

# 그래픽디바이스를 2개 컬럼(열)로 나누어 그래프를 배열
grid.arrange(p1, p2, ncol = 2) 

##############################################################################
#### 범주형-연속형 변수간 관련성 분석
##############################################################################

## 일종의 범주형 그룹(집단)에 따른 연속형변수의 분포를 요약집계하는 타입임

# 구동방식(drv)에 따른 고속도로상 연비(hwy) 비교
ggplot(mpg, aes(drv, hwy)) + 
  geom_point() # 단순 플롯팅 

ggplot(mpg, aes(drv, hwy)) + 
  geom_jitter() # 모든 데이터를 플로팅하는 형태로 분포모양을 나타냄

ggplot(mpg, aes(drv, hwy)) + 
  geom_boxplot() # 박스플롯 형태로 분포모양을 나타냄

ggplot(mpg, aes(drv, hwy)) + 
  geom_violin() # 바이올린 플롯형태로 분포모양을 나타냄

# install.packages("gridExtra") 패키지를 이용한
# ggplot2용 멀티프레임 생성
library(gridExtra)

# 멀티프레임에 배치할 개별 그래프 준비
p1 <- ggplot(mpg, aes(drv, hwy)) + 
  geom_point(color = "red", shape = 20, size = 2) # 단순 플롯팅 

p2 <- ggplot(mpg, aes(drv, hwy)) + 
  geom_jitter(color = "blue", shape = 8, size = 0.8) # 모든 데이터를 플로팅하는 형태로 분포모양을 나타냄

p3 <- ggplot(mpg, aes(drv, hwy)) + 
  geom_boxplot(fill = "lightblue", outlier.color ="orange", outlier.shape = 17,
               outlier.size = 2, notch = TRUE) # 박스플롯 형태로 분포모양을 나타냄

p4 <- ggplot(mpg, aes(drv, hwy)) + 
  geom_violin(fill = "lightpink") # 바이올린 플롯형태로 분포모양을 나타냄

# 그래픽디바이스를 2개 컬럼(열)로 나누어 그래프를 배열
grid.arrange(p1, p2, p3, p4, nrow = 2, ncol = 2) 

# ------------------------------------------------------------------------
##  drv(구동방식)에 따른 trans(기어방식)간 교차분석
ggplot(data=mpg, aes(x=drv, y=hwy, fill=trans)) +
  geom_bar(stat="identity")
# - state = "identity" 변수의 빈도수를 가지고 막대그래프를 그리는 옵션
# - 기본 범주형-범주형 간의 빈도교차분석은 스택형, 롱포맷형태로 막대를 표현함
# Bar graph, time on x-axis, color fill grouped by sex -- use position_dodge()
ggplot(data=mpg, aes(x=drv, y=hwy, fill=trans)) +
  geom_bar(stat="identity", position=position_dodge())
# - postion=postion_dodge() 스택형/롱포맷형 빈도교차분석 막대그래프를
#   와이드포맷, 언스택형으로 막대를 옆으로 나열해서 표현함

### End of Source ############################################################


### 히스토그램 vs 막대그래프 
# 히스토그램은 연속형 
# 산점도를 개별변수로 그린것을 일정한 간격으로 묶고 
# 빈도수를 세어서 히스토그램 빈을 생성
# 평균을 어디로 봐야할지가 중요해서 순서를 바꿀수 없다.

# 막대그래프 
# x축 범주형
# 서열의 의미가 있을 경우 그룹단위는 중요할수 있으나, 
# 순서는 상관없다. 

#------------------------------------------------------------------------------------------------------------------------------------
# 2018.09.27
#------------------------------------------------------------------------------------------------------------------------------------
##########################################################################################
# R note 작성을 위한 환경설정
##########################################################################################
## 재현가능문서작업(reproducible document)을 위한 R마크다운(Rmarkdown)
# - R에서 재현가능하고 동적인 보고서를 작성하는 방법
# - R코드와 실행결과를 html, pdf, word 등 다양한 문서포맷을 저장/재이용 할 수 있음

##########################################################################################
## 1. 사전 2가지 패키지 설치

## 1.1 니터(knitr) 패키지
install.packages("knitr") 
library(knitr)
# - R코드와 주석구문 해석해 마크다운 포맷을 만들어주는 패키지

## 1.2 R마크다운 패키지
install.packages("rmarkdown")
library(rmarkdown)
# - 마크다운 포맷문서를 팬독(pandoc)이라는 패키지를 활용해 
#   HTML, PDF, Word, Slides 등 다양한 문서포맷으로 변환해주는 패키지

##########################################################################################
## 2. pdf파일 변환을 위한 miktex을 해당 URL접속후 다운&설치
# - 컴퓨터 기종에 상관없이 똑같은 파일결과물을 얻을 수 있도록 해주는 프로그램

## 2.1 Windows OS용: 믹텍(Miktex)
browseURL("https://miktex.org/")
# - 해당사이트에서 MacOS용 믹텍설치가능

## 2.1 Mac OS용: 맥텍(Mactex)
browseURL("http://www.tug.org/mactex/")

## 2.2 타이니텍스(tinytex) 패키지 설치
install.packages("tinytex")
library(tinytex)
tinytex::install_tinytex(force = TRUE)
# - miktex 프로그램의 업그레이드를 위한 패키지 

##########################################################################################
## 3. pdf파일 변환을 위한 한글폰트 설치
# - 컴퓨터에 설치되어 있는 한글폰트를 pdf파일 변환시 지정해 이용함

## 3.1 네이버 나눔글꼴 설치
browseURL("https://hangeul.naver.com/2017/nanum")
# - 해당사이트에서 윈도우용 & 맥용 선택가능

## 3.2 네이버 D2코딩글꼴 설치
browseURL("https://github.com/naver/d2codingfont")
# - 해당사이트에서 <Ver 1.3.2 (2018.06.01 배포)> 링크클릭해 zip파일 다운/압축풀기
# - 해당글꼴들 마우스로 선택후 오른쪽버튼 클릭후 나타나는 팝업메뉴에서 
#   "설치" 메뉴 선택

## 시스템에 설치되어 있는 폰트파일 목록과 설치경로 확인
install.packages("showtext")
library(showtext)
font_files()
font_paths()

## 현재 R에서 사용가능한 폰트패밀리 목록 확인
font_families()
windowsFonts()

##########################################################################################
## R 마크다운 핵심코드요약(CheatSheets)

# 한글버전
browseURL("https://www.rstudio.com/wp-content/uploads/2016/02/rmarkdown-cheatsheet-kr.pdf")

# 영문버전
browseURL("https://www.rstudio.com/wp-content/uploads/2015/02/rmarkdown-cheatsheet.pdf")

# 영문버전2.0
browseURL("https://www.rstudio.com/wp-content/uploads/2016/03/rmarkdown-cheatsheet-2.0.pdf")

# 영문버전2.0 링크
browseURL("https://rmarkdown.rstudio.com/lesson-15.html")

### End of Source ########################################################################

#1,2 - 지도학습 -> 패턴 有, 종속변수 존재 
# 1. 분류예측 - 쿠폰 발행했을때, 소비가 증가할 집단/아닌집단 분류하여 예측
# 2. 수치예측 - 회귀분석, 쿠폰발행할때 쿠폰금액포함 얼마를 결제할지 수치를 예측
#    -> 기존데이터로 고객 특성이 어떨때 얼마 얼마를 구매한 이력이 존재함. 

# 3,4,5 - 자율학습 - 패턴 無
# 3. 연관분석(association analysis) - 장바구니 분석/ 상품추천시 사용 
#     - 교보문고 a책을 구매시 b를 구매함 -> 화면에 다른고객이 구매한 상품 추천
# 4. 군집분석 - mass를 segmentation 한다. one to one/ 
# 5. 축소화 분석(변수) - 신장, 허리둘레 등 같이 묶일수 있음(신체지수로)
# 부가 : AB 테스트 

# 추속화/유형학 분석의 종류 
# 1) 관찰치를 묶어서 데이터를 축소함 - 범주 항목간의 
# -RAW 데이터의 분포/특징을 가장 잘 나타내는 
# - 대표적인 데이터 유형을 찾아내고 
# - 불필요한 잡음(noise-outliar) 없앤다. 


# 연관분석 
# 장바구니분석
# 2)

# 한번에 하나씩 구매하는 고객은 포함 x

## 연관부넉 종류 
# - 일반연관성: 성형수술 봄엔 코, 다 치유후 광대 .. 이런식으로 동시에 팔수 없다. 
# - 순차연관 고객 프로필 분석 시 유사 (협업필터링)



# 3가지 유형의 연관규칙 도출 
#  - 행동가능한 useful, explainable actionable 규칙
#    : 도출된 규칙과 논리근거가 있어 유용성이 높은규칙
#   예) 기저귀&맥주  -> 활용 기저귀를 산사람 중 맥주를 안산사람에게 맥주쿠폰
#                    -> why 기저귀&맥주 - 신혼부부/미국/수요저녁
# 
# - 사소한 규칙: 누구에게나 이미 알려진 규칙 
# 액션을 위한 유용성이 낮은 규칙 
# 예 페이트&붓 , 컴퓨터&프린터
# - 설명/해석 불가능한(Inexplicable)
#   불확실성이 높은 규칙이 있음 
#   예) 기초화장품 & 자동차 와이퍼 -> 이 경우를 각각 경우에 따라 설치해놓고 자료를 수집한다.
# 
# 연관분석 종류
# 일반연관성: 동시에 파매되는 상품조합을 추출 
# 순차연관성: 구매순서나 시간간격을 두고 판매되는 상품 조합 추출 
# 협업필터링: 유사한


# 연관분석
#install.packages("arules")
library(Matrix)
library(arules)

# long format
# single format -> item 1개씩 표현 
# matrix format -> title 상단에 있고 0,1로 구매유무를 행렬로 표현

# 1) 트랜젝션 데이터를 basket 포맷형태로 로딩하는 경우 
raw.bk <- read.transactions("asso_basket.csv",
                            format = "basket", sep=",")

raw.bk

# 2) 트랜젝션 데이타를 single 포맷형태로 로딩 
raw.sg <- read.transactions("asso_single.csv",
                            format = "single", sep=",",
                            cols = c(1,2))
#transactionInfo(raw.sg)
raw.sg

# 3) 일반행렬(매트릭스) 데이터를 single 포맷으로 변경해 로딩
## read_csv 가능 
### 행렬 -> transcation 변환과정
#### 1. data frame 상태로 csv 데이타 roading 
##### data fream -> list 형식 
raw.mat <- read.csv("asso_matrix.csv",
                            header = T, sep=",")
head(raw.mat)

#### 2. matrix 형태로 변환 
raw.mat <- as.matrix(raw.mat)
head(raw.mat)

#### 3. transaction id를 임의로 생성 
rownames(raw.mat) <- paste("tr", 1:NROW(raw.mat), sep = "")
head(raw.mat)

#### 4. transaction으로 변환
raw.mx <- as(raw.mat, "transactions")
raw.mx


## transaction 활용 
raw <- raw.bk
#raw1 <- raw.sg
raw2 <- raw.mx


as(raw, "data.frame")
View(as(raw, "data.frame"))
inspect(raw)
image(raw)

as(raw1, "data.frame")
View(as(raw1, "data.frame"))
inspect(raw1)
image(raw1)

as(raw2, "data.frame")
View(as(raw2, "data.frame"))
inspect(raw2)
image(raw2)

# item 정보 확인 
itemInfo(raw)

# 트랜잭션
## summary generic 함수- 괄호안에 데이타 형식 상관없이 summary 해준다.
## transaction 경우 most frequent items: 기능 추가 
summary(raw)

# element (itemset/transaction) length distribution:
#   sizes
# 1  2  3  4  5  6 
# 29 39 27 25 22  8 
# => 1개만 구매하고 가는 고객이 꽤 있다 
#    -> 근거리 주거 고객, 차를 몰지 않고 걸어서 오는 고객으로 추측 

# 반발항목 발생 빈도//비율
# 탐색적 데이터 분석 기법(EDA : Exploratory Data Analysis) -> GTN(가능한 부분 시각화하여 표현)
# browseURL("https://m.blog.naver.com/PostView.nhn?blogId=whytimes&logNo=220678086657&proxyReferer=https%3A%2F%2Fwww.google.co.kr%2F")

ifa <- itemFrequency(raw, type="absolute")
ifa
ifr <- itemFrequency(raw, type="relative")
ifr
df <- data.frame(Freq = ifa,Prop=round(ifr,2))
df
df[order(df$Freq, decreasing = T),]

# 반발항목 그래프
barplot(sort(ifa, decreasing = T))

itemFrequencyPlot(raw, topN = 5, type="absolute")
itemFrequencyPlot(raw, topN = 5, type="relative")
itemFrequencyPlot(raw, support = 0.1, cex.names = 0.7) ## 0.1 이상인것만 보여줘
itemFrequencyPlot(raw, support = 0.3, cex.names = 0.7) ## 0.3 이상인것만 보여줘


image(raw)
image(raw[1:5])
image(raw[15:28])


## 워드 클라우드 패키지에 아래와 같은 형태를 넣어야 한다. 
# > df[order(df$Freq, decreasing = T),]
# Freq Prop
# food       105 0.70
# kitchen     93 0.62
# homedeco    82 0.55
# children    74 0.49
# leisure     59 0.39
# book        18 0.12
# appliance   15 0.10

####################################
## 워드 클라우드 

## 색상파레트 패키지 준비 
#install.packages("RColorBrewer")
library(RColorBrewer)

display.brewer.all()

col.pal <- brewer.pal(9,"Blues")
col.pal

## 상품 아이템 레이블 확인 
product_name <- itemLabels(raw)
product_name


## 상품아이템별 발생빈도 계산 
product_cnt <- itemFrequency(raw, type="absolute")
product_cnt


#install.packages("wordcloud")
library(wordcloud)

wordcloud(words=product_name,
          freq = product_cnt,
          min.freq = 1,
          max.words = Inf,
          scale = c(4,0.5),
          col = col.pal,
          # random.color = TRUE,
           random.color = FALSE,
          random.order = F,
          rot.per = 0
          )


## 트랜잭션 항목(items)간 교차분석 
raw.ct <- crossTable(raw)
raw.ct
## sum 추가하여 출력
addmargins(raw.ct)
## 서로 교차되는 빈도수가 높은 상품 
#           appliance book children food homedeco kitchen leisure  Sum
# food              9   13       57  105       62      67      44  357
# -> kitchen/homedeco 연관성 비중이 있는 것을 확인할 수있다. 


#install.packages("gplots")
library(gplots)
library(RColorBrewer)

## 빈도수를 hits로 그림으로 표현
heatmap.2(raw.ct, margins = c(5,5))
heatmap(raw.ct, margins = c(10,10))

install.packages("d3heatmap")
library(d3heatmap)

#d3heatmap(raw.ct, scale="column",)

library(arules)

## 연관규칙 추출 ㅣ 기본 파라미터 설정(1)
rules <- apriori(raw, 
                 parameter = list(supp = 0.10, ## support 
                                  conf = 0.10)) ## confidence
## support 를 조정해서 규칙을 자름. 
## 규칙의 가지수는 인력, 비용 등에 의해 좌우된다.

summary(rules)
inspect(rules)
# [1]  {}                                  => {appliance} 0.1000000 0.1000000  1.0000000  15  
# [2]  {}                                  => {book}      0.1200000 0.1200000  1.0000000  18  
# [3]  {}                                  => {leisure}   0.3933333 0.3933333  1.0000000  59  
# [4]  {}                                  => {homedeco}  0.5466667 0.5466667  1.0000000  82  
# [5]  {}                                  => {children}  0.4933333 0.4933333  1.0000000  74  
# [6]  {}                                  => {kitchen}   0.6200000 0.6200000  1.0000000  93  
# [7]  {}                                  => {food}      0.7000000 0.7000000  1.0000000 105  
## appliance 15/150 -> 10프로 
## support 값을 10%로 주었음 

## 8번부터 - 1:1 규칙
# [26] {kitchen}                           => {food}      0.4466667 0.7204301  1.0291859  67  
# [27] {food}                              => {kitchen}   0.4466667 0.6380952  1.0291859  67
## support 값이 높은 규칙 n(x->y)/n
#P(A^B)교집합/n


## confidence는 n(x->y)/n(x) -> 신뢰도를 올릴수잇음
#P(A^B)교집합/P(A)


## lift는 개선도(향성도)로 
#P(A^B)교집합/P(A)*P(B) - A,B 동시 진행할때 같이 발생할 확률


######## 데이터 유형화/축소화 분석(data reduction):
# - raw 데이터의 분포/특징을 가장 잘 나타내는  
# - 대표적인 데이터 유형을 찾아내고 
# - 불필요한 잡음(noise)를 제거해줌 

# 대표적인 데이터 유형에는 관찰치와 변수컬럼을 대상으로 
# 그룹핑/유형화/묶음/축소화/네트워크 등의 유사작업을 수행함

#### 축소화/유형화 분석의 종류
## (1) 관찰치를 묶어서 데이터를 축소함
# - 군집분석(clustering Analysis)
# - 다차원척도분석(Multidimensional Scaling)
# - 연관분석(Association Analysis; Basket Analysis)

## (2) 변수컬럼을 묶어서 데이터를 축소함
# - 주성분(Principal Component Analysis)
# - 요인분석(Factor Analysis)

#######################################################################
#### 연관분석(Association Rule Analysis)
#### 장바구니분석(Market Basket Analysis)

# 특정 이벤트나 사건, 항목이 발생할 때 
# 함께 발생하는 또 다른 이벤트나 사건, 항목을 찾아내는 분석

# 대규모 거래처리(트랜잭션) 관찰치/레코드에서
# 발생빈도가 상대적으로 크며, 상호간에 유사한 
# 이벤트나 사건, 항목 집합/그룹/유형/군집을 찾아줌

# 발견된 연관규칙들을 토대로 상품진열, 
# 패키지 제품/서비스개발, 온·오프 상품추천 등에 사용

## 3가지 유형의 연관규칙 도출
# - 행동가능한(Useful, Explainable, Actionable) 규칙
#   : 도출된 규칙의 논리근거가 있어 유용성이 높은 규칙
#   예: 기저귀&맥주
# - 사소한(Trivial) 규칙: 누구에게나 이미 알려진 규칙으로 
#   액션을 위한 유용성이 낮은 규칙
#   예: 페인트&붓, 컴퓨터&프린터
# - 설명/해석 불가능한(Inexplicable) 규칙: 논리적 근거가 불충분하고 
#   불확실성이 높은 규칙이 있음
#   예: 기초화장품&자동차와이퍼

## 연관분석 종류
# - 일반연관성: 동시에 판매되는 상품조합을 추출
# - 순차연관성: 구매순서나 시간간격을 두고 판매되는 상품조합 추출
# - 협업필터링: 유사한 고객이 구매하는 상품조합을 추출

#######################################################################
#### 연관분석을 위한 raw 데이터 준비

## 연관분석 패키지 설치 및 로딩
# install.packages("arules")
library(arules)

#### 트랜잭션 데이터 로딩

#######################
## (1) 트랜잭션데이터를 basket 포맷형태로 로딩하는 경우
raw.bk <- read.transactions("asso_basket.csv", 
                            format = "basket", sep = ",")
raw.bk

#######################
## (2) 트랜잭션데이터를 single 포맷형태로 로딩하는 경우
raw.sg <- read.transactions("asso_single.csv", 
                            format = "single", sep = ",",
                            cols = c(1, 2))
raw.sg

#######################
## (3) 일반 행렬(매트릭스)데이터를 single 포맷으로 변경해 로딩하는 경우
raw.mat <- read.csv("asso_matrix.csv", 
                    header = T, sep = ",")
head(raw.mat)

raw.mat <- as.matrix(raw.mat) # 행렬형식으로 변환함 
head(raw.mat)

rownames(raw.mat) <- paste("tr", 1:NROW(raw.mat), sep  = "") # 행이름 부여
head(raw.mat)

raw.mx <- as(raw.mat, "transactions") # 트랜잭션 데이터형식으로 변환
raw.mx3

#######################
## 최종 분석용 트랜잭션데이터셋 선택
raw <- raw.bk

###################################################################
## 트랜잭션에 대한 간단 기술통계 확인
raw 

## 트랜잭션 전체내용 조회
as(raw, "data.frame") # 데이터프레임 형식으로 조회
View(as(raw, "data.frame")) # View창을 통해 조회 
inspect(raw)
image(raw)

## 아이템 정보확인
itemInfo(raw) # 트랜잭션에 포함된 상품목록 유형(items)

## 트랜잭션 데이터셋에 대한 세부 기술통계분석
summary(raw) 
# 150 * 7 = 1050개 발생가능 매트릭스 셀에서 
# 150 * 7 * 0.4247619 = 446개 itemMatrix 데이터 존재

## 트랜잭션 데이터셋의 기술통계 분석결과 내부구조 확인
str(raw) # 세부 부가적 정보를 $기호가 아닌 @로 참조가능
raw@data 

#######################
## 빈발항목 발생 빈도/비율
ifa <- itemFrequency(raw, type = "absolute")
ifa
ifr <- itemFrequency(raw, type = "relative")
ifr

df <- data.frame(Freq = ifa, Prop = round(ifr, 2))
df
df[order(df$Freq, decreasing = T), ]           

## 빈발항목 그래프
barplot(sort(ifa, decreasing = T))

itemFrequencyPlot(raw, topN = 5, type = "absolute")
itemFrequencyPlot(raw, topN = 5, type = "relative")
itemFrequencyPlot(raw, support = 0.1, cex.names = 0.7)
itemFrequencyPlot(raw, support = 0.3, cex.names = 0.7)

## 빈발항목 히트맵
image(raw)
image(raw[1:5])
image(raw[15:28])

#######################
### 워드클라우드를 이용한 그래프

## 색상파레트 패키지 준비
# install.packages("RColorBrewer")
library(RColorBrewer)

# RcolorBrewer 패키지에서 보유한 3가지 파레트 그룹 출력
# Sequential: 18종, Qualitative: 8종, Diverging: 9종
display.brewer.all() 


brewer.pal.info # maxcolors, category, colorblind 컬럼 있음
display.brewer.all(type = "seq")
subset(brewer.pal.info, category =  "seq")
display.brewer.all(type = "qual")
subset(brewer.pal.info, category =  "qual")
display.brewer.all(type = "div")
subset(brewer.pal.info, category =  "div")

display.brewer.all(n = 5)
display.brewer.all(n = 5, type = "seq")
display.brewer.all(n = 5, type = "qual")
display.brewer.all(n = 5, type = "div")

col.pal <- brewer.pal(9, "Blues")
col.pal # 색상선택

## 상품아이템 레이블 확인
product_name <- itemLabels(raw)
product_name
## 상품아이템별 발생빈도 계산
product_cnt <- itemFrequency(raw, type = "absolute")
product_cnt 
## 워드클라우드 패키지 준비
# install.packages("wordcloud")
library(wordcloud)
## 워드클라우드 작성
wordcloud(words = product_name, 
          freq = product_cnt, 
          min.freq = 1,
          max.words = Inf,
          scale = c(4, 0.5), 
          col = col.pal,
          random.color = FALSE, 
          random.order = F,
          rot.per = 0)

#######################
## 트랜잭션 항목(items)간 빈발관련성 교차분석
raw.ct <- crossTable(raw)
raw.ct
addmargins(raw.ct)

## 관련 그래프 분석

# install.packages("gplots")
library(gplots)

# install.packages("RColorBrewer")
library(RColorBrewer)

heatmap.2(raw.ct, margins = c(5, 5))
heatmap(raw.ct, margins = c(10, 10))

# install.packages("d3heatmap")
library("d3heatmap")
d3heatmap(raw.ct, scale = "column", colors = "Blues",
          xaxis_font_size = "14px",
          yaxis_font_size = "14px")

###################################################################
#### 연관규칙 분석수행

## 연관규칙 패키지 준비
# install.packages("arules")
library(arules)

###################################################################
## 연관규칙 추출: 기본 파라미터 설정 (1)
rule <- apriori(raw, 
                parameter = list(supp = 0.10, 
                                 conf = 0.10))

summary(rule) # 연관규칙 기초통계량

inspect(rule) # 세부연관규칙 분석결과
# 도출된 82개의 연관규칙을 세부적으로 보여줌
# - lhs는 left-hand side로 조건(X아이템)을, 
#   rhs는 right-hand side로 결과(Y아이템)를 의미함

## 연관규칙 추출을 위한 파라미터
# (1) supp(support로 코딩해도 됨)는 지지도로 
#  - 전체 트랜잭션 중에서 X->Y가 함께 발생한 트랜잭션 비율임
#  - 업무상황에 따라 일정수준 이상의 지지도를 갖는 연관관계를 찾음

# (2) conf(confidence로 코딩해도 됨)는 신뢰도로 
#  - X아이템이 발생한 트랜잭션 중에서 
#    동시에 Y아이템을 포함한 트랜잭션 비율임
#  - 업무상황에 따라 일정수준 이상의 신뢰도를 갖는 연관관계를 찾음

# (3) lift는 개선도(향상도)로  
#  - X아이템이 발생한 트랜잭선 중 Y아이템이 포함된 트랜잭션과 
#    X아이템에 상관없이 Y아이템이 독립적으로 발생하는 트랜잭션간의 비율임
#  - 향상도가 1보다 큰 연관관계를 찾음

## 향상도(lift)에 대한 해석
# (1) lift값 = 1: X와 Y가 독립적관계로 서로 상관없이 발생함
# - 예: 과자와 후추
# (2) lift값 > 1: X와 Y가 양의 상관관계
# - X의 발생이 B의 발생에 긍정적으로 상관관계가 있음, 예: 빵과 버터
# (3) lift값 < 1: X와 Y가 음의 상관관계
# - A의 발생이 B의 발생에 부정적으로 상관관계가 있음, 예: 지사제와 변비약
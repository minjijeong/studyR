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

# 4.1 기초수학 78p
4 * 6 + 5
(4 * 6) + 5
4 * (6 + 5)
2^3 ## 2의 3승

#4.2.1 변수할당
x<- 6 + 6
y <-x * x + 2
x
y


z=32
12->zy

x<-2
x=2

a<- b<- 7
a
b

assign("j",4)


avg_age <- 33.2

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

levels(edulevel2)

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
# 

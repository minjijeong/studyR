###################################
##### init Setting
###################################
getwd()
setwd("C:\\workspaceR")
Sys.setenv(JAVA_HOME="C:\\Program Files\\Java\\jre1.8.0_131")

###################################
##### Summary
###################################

#메모리 관련 명령어
#--메모리의 전체 오브젝트를 출력
ls() 
object()
#--메모리 전체 할당 해제 
rm(list=ls())
#--논리조건의 TRUE인 항목 1개라도 만족하는 것
any(arry0 < arry1)
#--글자수
nchar(q)

levels(edulevel) 
# - 객체에 들어 있는 반복되는 항목조회
# - 일반 문자열 벡터이므로 특별한 레벨이 들어 있지않아서 NULL로 나옴 

str(edulevel)
# - 객체 내부구조를 보면 객체형식이 chr임을 알 수 있음
# chr [1:27] "ms" "dt" "hs" "ms" "ms" "cl" "dt" "hs" "hs" "dt" "dt" "ms" ...

table(edulevel) # 범주형변수 빈도수 계산 
# - 우리가 알고 있는 학력순서로 출력되지 않고 알파벳순서로 출력되어,
#   자연스로운 학력증가/감소에 따른 빈도수 비교가 어려움
# edulevel
# cl dt hs ms 
# 7  5  9  6 
# ----------------------------------------
## 팩터화(범주형데이터화)
## 방향성을 알수없다. order by 처리 안되어 있음.
table(grade, useNA = "ifany")
# NA인 항목 빈도수 카운트 포함
# NA가 존재하지 않을때는 빈도수 출력되지 않음

table(grade, useNA = "always")
# NA인 항목 빈도수 카운트 포함
# NA가 벡터에 존재하지 않더라도 NA 0으로 출력

edulevel2 <- factor(edulevel)
edulevel2
# [1] ms dt hs ms ms cl dt hs hs dt dt ms hs cl ms dt hs ms hs cl cl hs hs cl
# [25] hs cl cl
# Levels: cl dt hs ms
# - 팩터화 이후 레벨표시는 되었지만 여전히 알파벳 순서임
## group by와 동일한 기능 -- 범주형 데이타로 인식


edulevel.f <- factor(edulevel, levels = c("hs", "cl", "ms", "dt")) 
## factor 함수 사용시, level를 인수/인자/파라미터로 지정하여 순서지정
## 명목의 의미로 부여
## level 미지정시, 자동 level 확인하여 level설정
## 명명규칙을 .f로 함으로써 factor형으로 범주데이타 처리한것으로 표기함
edulevel.f
# - 팩터화시 4가지 학력을 우리가 알고있는 학력순으로 배치했음 

#-- 평균값
mean(y)

#-- 중앙값
median(x, na.rm = TRUE)

#-- 분산
var(a, na.rm = TRUE)
#-- 표준편차 
sd(a, na.rm = TRUE)

#-- 해당하는 값의 위치 출력
which(is.na(a))

#-- 올림
round(x, 1) 

#-- 기타 
sum(a, na.rm = TRUE) 
min(a, na.rm = TRUE)
max(a, na.rm = TRUE)

#-- NA 값을 가진 항목 벡터로 생성 
x[is.na(x)]

#--빈도수 전체 SUM 출력
addmargins(table(grade))

#-- 항목의 이름 출력 
labels(grade.max)
names(grade.max)

#-- 벡터 길이 확인 함수 
length(product)

k <- c()
length(k)
is.null(k) ## TRUE

d <- NULL
length(d)
is.null(d) ## TRUE

## 벡터는 NULL을 인자로 가질수 없음. NA로 대체해야함


#-- TABLE 빈도수 퍼센트로 표기 
prop.table(table(grade, useNA = "ifany"))



## 파이프연산자 패키지 설치
install.packages("magrittr")
library(magrittr)

## 파이프 연산 
grade %>% table() %>% addmargins()


#---------------------------------------------------------
# 데이타 유형
#---------------------------------------------------------
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

### nickname 부여 컬럼명
theDF.nick <- data.frame(sports = q, order = x, rank = y)

### 프레임의 사이즈확인 
nrow(theDF.nick)
ncol(theDF.nick)
dim(theDF.nick) ##demesion 구하기 

colnames(theDF.nick)
names(theDF.nick)
#### colnames == name 함수 동일한 기능
names(theDF.nick)[0] <- "activities"## [] index 지정
row.names(theDF.nick)
row.names<-paste("row_id",row.names(theDF.nick))
#### rownames, row.names 동일한 기능 
rownames(theDF.nick) <- row.names


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

names(mtcars) # 변수컬럼 조회
colnames(mtcars) # 변수컬럼 조회
rownames(mtcars) # 행이름 조회
row.names(mtcars) # 행이름 조회







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


##JOIN TABLE
library(dplyr)
inner_join(artists, songs, by = c("first"="First", "last"="Last"))
full_join(artists, songs, by = c("first"="First", "last"="Last"))
left_join(artists, songs, by = c("first"="First", "last"="Last"))
right_join(artists, songs, by = c("first"="First", "last"="Last"))

























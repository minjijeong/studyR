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

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

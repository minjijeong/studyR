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
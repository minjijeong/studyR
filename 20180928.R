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
 install.packages("arules")
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

##########################################################################################
#### 다양한 조건지정을 통한 연관규칙 조회

## 연관규칙 구조조회
str(rule)
rule@quality
quality(rule)

## 연관규칙 세부내용 정렬
# supprt 항목기준 
inspect(sort(rule, by = "support"))

# lift 항목기준
inspect(sort(rule, by = "lift"))

# lift 항목기준 정렬내용 중 상위 10개 연관규칙만 출력
inspect(sort(rule, by = "lift")[1:10])

# 정렬없이 출력된 전체 규칙에서 
# 10번째 규칙에서 20번째까지 순서대로 출력 
inspect(rule[10:20])

# --------------------
## 1:1 연관규칙만 부분추출
rule_1to1 <- rule[c(8:27)]
rule_1to1
summary(rule_1to1)
inspect(rule_1to1)

# 1:1규칙 중 lift 항목기준 내림차순 정렬
inspect(sort(rule_1to1, by = "lift"))

# 1:1규칙 중 lift 항목기준 상위 5대 규칙만 출력
inspect(sort(rule_1to1, by = "lift")[1:5])

# --------------------
## 2:1 연관규칙만 부분추출
rule_2to1 <- rule[c(28:57)]
rule_2to1
summary(rule_2to1)
inspect(rule_2to1)

# 2:1규칙 중 lift 항목기준 내림차순 정렬
inspect(sort(rule_2to1, by = "lift"))

# 2:1규칙 중 lift 항목기준 상위 5대 규칙만 출력
inspect(sort(rule_2to1, by = "lift")[1:5])

#######################
## item, lhs, rhs 항목별 키워드와 조건지정

# 특정조건 키워드 지정조회(in)
# -해당조건 항목 중 하나라도 들어있으면 됨
inspect(subset(rule, items %in% c("leisure")))
inspect(subset(rule, items %in% c("leisure"))[1:10])
inspect(subset(rule, items %in% c("leisure") & lift > 2.0))
inspect(subset(rule, lhs %in% 
                   c("children", "homedeco"))[25:30])
inspect(subset(rule, rhs %in% c("kitchen", "children")))

# 부분일치 키워드 지정조회(partial matching in)
# - 해당 조건 철자가 들어 있으면 됨
inspect(subset(rule, items %pin% c("child"))[30:37])
inspect(subset(rule, lhs %pin% c("kit") & confidence >=  0.8))
inspect(subset(rule, rhs %pin% c("home")))

# 완전일치 키워드 지정조회(all in)
# - 해당조건 항목들이 모두 들어 있어야 함
inspect(subset(rule, lhs %ain% c("kitchen", "homedeco")))
inspect(subset(rule, lhs %ain% c("food", "children", "kitchen")))
inspect(subset(rule, lhs %ain% c("food", "children") & lift >=  2.0))

##########################################################################################
## 연관규칙 추출: 파라미터션 설정/조정 A

rule <- apriori(raw, 
                control = list(verbos = F), 
                parameter = list(support = 0.10, 
                                 confidence = 0.10, 
                                 minlen = 2, 
                                 maxlen = 3, 
                                 smax = 1),
                appearance = list(none = c("food","children")))

# control = list(verbos = F): 복잡한 연관규칙 계산과정 콘솔창 출력안함
# minlen = 최소물품수(lhs+rhs), maxlen = 최대물품수(lhs+rhs)
# smax = 최대지지도
# appearance: 다음 3가지 세부옵션은 각각 필요시 취사선택/결합 가능
# - none: 특정 상품아이템을 제외하고 규칙도출
# - default: 주어진 상품아이템 모두 고려해 규칙도출
# - lhs: A라는 상품아이템을 구매한 경우 
#        함께 어떤 상품을 사는지 알고 싶은 경우
# - rhs: 어떠한 상품을 구매한 경우에 A라는 상품아이템을 
#        함께 구매하는지 알고 싶은 경우 

summary(rule) # 연관규칙 기초통계량
inspect(rule) # 세부연관규칙 분석결과

##########################################################################################
## 연관규칙 추출: 파라미터 설정/조정 B

rule <- apriori(raw, control = list(verbos = F), 
                parameter = list(support = 0.10, confidence = 0.10, 
                                 minlen = 2, maxlen = 3, smax = 1),
                appearance = list(default = "lhs", 
                                  rhs = "leisure"))

# appearance: 다음 3가지 세부옵션은 각각 필요시 취사선택/결합 가능
# - none: 특정 상품아이템을 제외하고 규칙도출
# - default: 주어진 상품아이템 모두 고려해 규칙도출
# - lhs: A라는 상품아이템을 구매한 경우 
#        함께 어떤 상품을 사는지 알고 싶은 경우
# - rhs: 어떠한 상품을 구매한 경우에 A라는 상품아이템을 
#        함께 구매하는지 알고 싶은 경우 

summary(rule) # 연관규칙 기초통계량
inspect(rule) # 세부연관규칙 분석결과

##########################################################################################
## 연관규칙 추출: 옵션 설정/조정 C

rule <- apriori(raw, control = list(verbos = F), 
                parameter = list(support = 0.10, confidence = 0.10, 
                                 minlen = 2, maxlen = 3, smax = 1),
                appearance = list(lhs = "leisure", 
                                  default = "rhs"))

# appearance: 다음 3가지 세부옵션은 각각 필요시 취사선택/결합 가능
# - none: 특정 상품아이템을 제외하고 규칙도출
# - default: 주어진 상품아이템 모두 고려해 규칙도출
# - lhs: A라는 상품아이템을 구매한 경우 
#        함께 어떤 상품을 사는지 알고 싶은 경우
# - rhs: 어떠한 상품을 구매한 경우에 A라는 상품아이템을 
#        함께 구매하는지 알고 싶은 경우 

summary(rule) # 연관규칙 기초통계량
inspect(rule) # 세부연관규칙 분석결과

######## 데이터 축소화 분석(data reduction):
# - raw 데이터의 분포/특징을 가장 잘 나타내는  
# - 대표적인 데이터 유형을 찾아내고 
# - 불필요한 잡음(noise)를 제거해줌 

# 대표적인 데이터 유형에는 관찰치와 변수컬럼을 대상으로 
# 그룹핑/유형화/묶음/축소화 등의 유사작업을 수행함

#### 축소화/유형화 분석의 종류
## (1) 관찰치를 묶어서 데이터를 축소함
# - 군집분석(clustering Analysis)
# - 다차원척도분석(Multidimensional Scaling)
# - 연관분석(Association Analysis; Basket Analysis)

## (2) 변수컬럼을 묶어서 데이터를 축소함
# - 주성분(Principal Componnent Analysis)
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
## 순차연관성 관련 패키지 준비
# install.packages("arules")
 install.packages("arulesSequences")
library(Matrix)
library(arules)
library(arulesSequences)

getwd()

## 관련 raw 데이터셋 로딩
raw <- read_baskets("asso_sequence.csv", 
                    info = c("sequenceID", "eventID", "SIZE"))
# - sequenceID: 온라인 쇼핑몰 운영일자(이벤트가 발생하는 시간적인 순서) 관련 ID개념
# - eventID: 온라인 쇼핑몰 이용고객(이벤트를 발생시킨 주체) 관련 ID개념
# - SIZE: 온라인 쇼핑몰 일자별/이용고객별 구매한 상품아이템 갯수
# - items: 온라인 쇼핑몰 일자별/이용고객별 구매한 상품아이템 세부 목록

###################################################################
## 순차트랜잭션에 대한 간단 기술통계 확인
raw 
#library(Matrix)
## 트랜잭션 전체내용 조회
inspect(raw)
image(raw)
as(raw, "data.frame") # 데이터프레임 형식으로 조회

install.packages("magrittr")
library(magrittr)
as(raw, "data.frame") %>% View # View창을 통해 조회 

## 트랜잭션 내용 조회
itemsetInfo(raw) # 트랜잭션에 포함된 트랜잭션명(trID)
itemInfo(raw) # 트랜잭션에 포함된 상품목록 유형(items)

## 트랜잭션 데이터셋에 대한 세부 기술통계분석
summary(raw) 
# 10 * 8 = 80개 발생가능 매트릭스 셀에서 
# 10 * 8 * 0.3375 = 27개 itemMatrix 데이터 존재

## 트랜잭션 데이터셋의 기술통계 분석결과 내부구조 확인
str(raw) # 세부 부가적 정보를 $기호가 아닌 @로 참조가능
raw@data 

###################################################################
## 빈발항목 발생 빈도
ifa <- itemFrequency(raw, type="absolute")
ifa

sort(ifa, decreasing = TRUE)
sort(ifa, decreasing = TRUE)[1:3]

order(ifa, decreasing = TRUE)
order(-ifa)
ifa[order(ifa, decreasing = TRUE)][1:3]

## 빈발항목 발생 비율
ifr <- itemFrequency(raw, type="relative")
ifr

## 빈발항목 발생 빈도와 비율 결합
df <- data.frame(Freq = ifa, Prop = round(ifr, 2))
df
df[order(df$Freq, decreasing = T), ]           

## 빈발항목 그래프
barplot(sort(ifa, decreasing = T))

itemFrequencyPlot(raw, topN = 5, type = "absolute")
itemFrequencyPlot(raw, topN = 5, type = "relative")
itemFrequencyPlot(raw, support = 0.1, cex.names = 0.7)

image(raw)
image(raw[1:5])
image(raw[5:10])

###################################################################
### 워드클라우드를 이용한 그래프
## 상품아이템 레이블 확인
product_name <- itemLabels(raw)
product_name

## 상품아이템별 발생빈도 계산
product_cnt <- itemFrequency(raw, type="absolute")
product_cnt 

## 색상파레트 패키지 준비
# install.packages("RColorBrewer")
library(RColorBrewer)
display.brewer.all()
col.pal <- brewer.pal(8, "Set2")
col.pal # 색상선택

## 워드클라우드 패키지 준비
# install.packages("wordcloud")
library(wordcloud)

## 워드클라우드 작성
wordcloud(words = product_name, 
          freq = product_cnt, 
          min.freq = 1, 
          scale = c(3, 0.2), 
          col = col.pal, 
          random.order = FALSE)

###################################################################
## 트랜잭션 항목(items)간 빈발관련성 교차분석 aruels::crossTable
crossTable(raw)
crossTable(raw, measure = "lift")
crossTable(raw, measure = "lift", sort = TRUE)
## lift 등 옵션을 통해 교차테이블에서 빈도수로 인해 확인 가능 
## 상관성보다는 연관성이라고 주로 부른다.

## 수치출력결과 자릿수 확인과 조정
options()$digits # 디폴트는 7자리로 설정되어 있음
options(digits = 3)
# - 다시 위쪽의 crossTable 관련구문을 실행해 digits 옵션조정 효과확인
## options() 환경변수 정의를 확인 가능한다. 
## options()$digits 이런방식으로 옵션을 호출하여 설정된 값 확인 
## options(digits = 3) 환경변수를 변경처리 

raw.ct <- crossTable(raw)
raw.ct
addmargins(raw.ct)

## 관련 그래프 분석
 install.packages("gplots")
library(gplots)
 install.packages("RColorBrewer")
library(RColorBrewer)

heatmap.2(raw.ct, margins=c(5, 5))
heatmap(raw.ct, margins=c(10, 10))

 install.packages("d3heatmap")
library("d3heatmap")
d3heatmap(raw.ct, scale = "column", colors = "Blues",
          xaxis_font_size = "14px",
          yaxis_font_size = "14px")

###################################################################
#### 순차연관규칙 분석수행

## 순차연관규칙 추출
# SPADE: Sequential PAttern Discovery using Equivalence classes
rule <- cspade(raw, parameter = list(support = 0.3), 
               control = list(verbose = TRUE))
rule

## 순차연관규칙 기초통계량
summary(rule)  

## 순차연관규칙 데이터프레임 형식으로 조회
as(rule, "data.frame")
View(as(rule, "data.frame"))
inspect(rule)

labels(rule, setSep = "->", seqStart = "", seqEnd = "")
labels(rule, setSep = "->", seqStart = "<", seqEnd = ">")

## 트랜잭션 데이터셋의 기술통계 분석결과 내부구조 확인
str(rule) # 세부 부가적 정보를 $기호가 아닌 @로 참조가능
rule@elements@items@data
## 출력결과/ 희소행렬형태로 출력된다- 연관있다없다를 | 표기

###################################################################
## 순차연관규칙 조건조회

## 순차연관규칙을 데이터프레임으로 전환
rule.df <- as(rule, "data.frame")
rule.df
str(rule.df)

## 각 순차연관규칙의 세부 상품아이템셋 크기(size) 파악
rule.sz <- size(rule)
rule.sz

## 각 순차연관규칙의 세부 상품아이템셋 길이(length) 파악
rule.lg <- size(rule, type = "length")
rule.lg

## 순차연관규칙과 세부 상품아이템셋 크기(size)&길이(length) 정보 결합
rule.out <- cbind(rule.df, rule.sz, rule.lg)
rule.out

## 단순 규칙 제외하고 2개 이상의 순차연관 규칙만 추출
output <- subset(rule.out,  rule.sz >= 2)
output
## 로그인된 회원의 경우 rule 사이즈 2개 이상인경우 
## 고객이 A상품 선택했을때, B,C 순차적으로 연관하여 정보를 출력

## 정렬내용 조회
output[order(output$rule.sz), ]

## item 항목별 키워드와 조건지정
# 특정조건 키워드 지정조회(in)
# -해당조건 항목 중 하나라도 들어있으면 됨
rule.df[rule %in%  c("Fashion"), 1:2]
# - 1:2의 의미는 해당 시퀀스와 지지도가 있는 컬럼위치를 지정함
rule.df[rule %in%  c("Fashion", "Design"), 1:2]

# 부분일치 키워드 지정조회(partial matching in)
# - 해당 조건 철자가 들어 있으면 
rule.df[rule %pin%  c("Fas"), 1:2]
rule.df[rule %pin%  c("Des"), 1:2]

# 완전일치 키워드 지정조회(all in)
# - 해당조건 항목들이 모두 들어 있어야 함
rule.df[rule %ain%  c("Fashion", "Design"), 1:2]
###################################################################
## 순차연관규칙 상세화: 
# - 신뢰도(confidence)와 향상도(lift) 수치출력
# - lhs ==> rhs 표시

rule2 <- ruleInduction(rule, confidence = 0.1)
rule2 

## 상세화 규칙 요약
summary(rule2)

## 상세화 규칙 세부내용파악
inspect(rule2)
inspect(head(rule2, by = "lift"))
labels(rule2, setSep = "->", seqStart = "", seqEnd = "")

## 데이터프레임으로 전환
rule2.df <- as(rule2, "data.frame")
rule2.df
View(rule2.df)

## 향상도 1순위, 신뢰도 2순위로 상세화 규칙 정렬
rule2.df.sorted <- rule2.df[order(-rule2.df$lift, -rule2.df$confidence), ]
rule2.df.sorted
## rule2.df order(1순위, 2순위, ) 순서로 index 정렬
## with/ attach /detech 사용가능

## 정렬내용 조회
print(rule2.df.sorted, row.names=F)

rule2.df[rule2 %in% c("Fashion"), 1:2]
rule2.df[grep("47206",rule2.df$rule),]
rule2.df[rule2.df$lift >= 1.0,]
### End of Source ######################################################

install.packages("arules")
install.packages("arulesSequences")

library(arules)
library(arulesSequences)
## 관련 raw 데이터셋 로딩
raw <- read_baskets("asso_sequence_big.txt", 
                    info = c("sequenceID", "eventID", "SIZE"))

summary(raw)
# inspect(raw)

options()$digits # 디폴트는 7자리로 설정되어 있음
options(digits = 3)

.libPaths()
rule <- cspade(raw, parameter = list(support = 0.3), 
               control = list(verbose = TRUE))
rule


labels(rule, setSep = "->", seqStart = "", seqEnd = "")
labels(rule, setSep = "->", seqStart = "<", seqEnd = ">")

rule2 <- ruleInduction(rule, confidence = 0.1)
rule2 

## 상세화 규칙 요약
summary(rule2)

## 상세화 규칙 세부내용파악
inspect(rule2)
inspect(head(rule2, by = "lift"))
labels(rule2, setSep = "->", seqStart = "", seqEnd = "")

## 데이터프레임으로 전환
rule2.df <- as(rule2, "data.frame")
rule2.df
View(rule2.df)

## 향상도 1순위, 신뢰도 2순위로 상세화 규칙 정렬
rule2.df.sorted <- rule2.df[order(-rule2.df$lift, -rule2.df$confidence), ]
rule2.df.sorted
## rule2.df order(1순위, 2순위, ) 순서로 index 정렬
## with/ attach /detech 사용가능

## 정렬내용 조회
print(rule2.df.sorted, row.names=F)
summary(rule2)
str(rule2)

rule2@elements@items@itemInfo

rule2[]
# error
# rule2.df[rule2 %in% c("78903"), 1:2]
rule2.df[grep("47206",rule2.df$rule),]
rule2.df[rule2.df$lift >= 1.0,]

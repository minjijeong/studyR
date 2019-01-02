## 2018.10.1 

# R base - 메모리에 위치 
# R Recommend - R root 폴더내에 lib/ 패키지 install
# R contributed - install.packages 통해 설치

.libPaths()
# > .libPaths()
# [1] "C:/Users/MJ/Documents/R/win-library/3.1"
# [2] "C:/Program Files/R/R-3.1.3/library"   

## library 경로 세팅
# ,를 이용하여 기존의 경로를 유지하고 해당경로만 추가 해달라는 의미
# .libPaths(c("C:/Users/MJ/Documents/R/win-library/3.1", .libPaths() ))


## 군집분석 
## - 다른분석 전에 특성을 나눌때 사용. 고객을 그룹핑 후 연계분석 등을 할수 있음 
## - 여러개의 관찰치/관측치/사례/케이스/레코드등을 
## - 특성이 유사한 것들끼리 하나의 그룹으로 묶음. 
## - 일종의 데이타 축소화(Reduction)

# 1) 계층적 (= 탐색적 군집분석)
# - 그룹의 개수를 지정하지 않고 알고리즘에게 나눌수 있는만큼 나눠 명령함.


# 2) 분할적 (= 확인적 분석)
# - 미리 개수를 정해서 넣었다 뺏다 확인함

# 이상치에 민감하다거나, 범주형 데이타를 어떻게 다룰지 
# 이런 여러 케이스에 따라 알고리즘이 변경된다. 


# install.packages("flexclust")
library(flexclust)

library(help = flexclust)
# 27종의 생성, 가금류, 육류에 대한 
# 영양소 데이타 셋 
# energy 열량, protein 단백질, fat 지방
# calcium, iron 등의 데이타 포함 

data(package = "flexclust")
data(nutrient, package = "flexclust")

head(nutrient)

str(nutrient)

#install.packages("psych")
library(psych)
headTail(nutrient)

summary(nutrient)
str(nutrient)
## 변수 군집분석할때, 변수의 값(영양소)이 max가 나올수 있고 그에 비해 취약한 그룹이 나올수 있다. 
## 서로 상관관계로 있거나 변수의 변화량을 관촬하여 레코드중 빈도수가 제일 높은것 등 특성에 따라 그룹을 나눌수 있다. 
## 두 레코드 간의 차이를 계산해서 거리를 둔다. 
## 기하학 유클리드 거리 (x1 - y1)^2 +(x2 - y2)^2 -


psych::describe(nutrient)

# 머신러닝 여러개 분석 변수를 넣을 경우, 
# 그대로 넣게 되면  움직이면, 동일한 패턴을 어긋나게 되어 
# 값을 표준하처리한다. 
## 통상적으로 z스코어 처리 -1 ~ 1 사이로 처리
### 0을 중심으로 -1 ~ 1센터링한다. 
### 0 ~ 1 ranging 한다. 

# 출력자리수 설정
options(digit = 3)

# MACKEREL CANNED        155      16   9     157  1.8
# PERCH FRIED            195      16  11      14  1.3
# SALMON CANNED          120      17   5     159  0.7
# 유클리드 거리 개념으로 제곱, 루트 등 수치를 가공한다.
## 변수가 3개이상 투입되기 때문에 개별 관찰치별로 거리가 얼마인지 계산하여 처리 
dist(nutrient) ## dist = distance 
d <- dist(nutrient) 

as.matrix(d)[1:2,1:2]
as.matrix(d)[1:4,1:4]
#                BEEF BRAISED HAMBURGER BEEF ROAST BEEF STEAK
# BEEF BRAISED          0.0      95.6       80.9       35.2
# HAMBURGER            95.6       0.0      176.5      130.9
# BEEF ROAST           80.9     176.5        0.0       45.8
# BEEF STEAK           35.2     130.9       45.8        0.0
## 거리차이로 표현
### 각 변수마다 수치의 단위가 차이가 나므로, 정확한 거리라고 보기 어렵다.

# row name들 소문자로 변경
row.names(nutrient) <- tolower(row.names(nutrient))


# 군집분석 전에 각 변수컬럼의 상대적인 규모/범위를 
nutrient.scaled <- scale(nutrient)
# scale(x, center=TRUE, scale=TRUE)
# center = true -> -1 < x < 1, 하지만 3배정도까지 가능하다 -3 < x < 3
head(nutrient.scaled)
## 거리차이로 표현
### 각 변수마다 centering이 진행되었기때문에 거리차릴 구할수 있다. 
d <- dist(nutrient.scaled)
as.matrix(d)[1:2,1:2]
as.matrix(d)[1:4,1:4]

## 영양성분 - 식자재, 향기 등의 요소를 추가하여 거리를 입체적으로 출력가능

# 알고리즘에게 y/n 어디를 선택해? -> 문류분석
# 알고리즘에게 ? 알아서 옵션을 정해서 분석해줘 -> 군집분석


## 계층형 군집분석
### stats 내장된 library , hclust : hierarchical 계층
## 평균 연결법
fit.average <- stats::hclust(d, method="average")
# fit.average <- stats::hclust(dist(scale(nutrient), method="average")
# Cluster method   : average  
# Distance         : euclidean 유클리드 
# Number of objects: 27 
## 식자재 간의 가격을 분석하여 AI 발생으로 대체 상품 추출
## 가격이 보다 저렴하지만 비슷한 영양소를 보유한 대체 상품 추출하여 비지니스 모델링으로 만들수 잇음 
## hang - 숫자에대한 가지길아 cex - label에 대한 크기 

## plot.new 에러시, plot remove하고 다시 선언 처리 
# plot.new()

## 그룹간의 평균을 군집하여 표현 - 평균 연결기
plot(fit.average, hang = -1 , cex = 0.8,main = "평균연결법을 활용한 계층적 군집분석")
str(fit.average)
fit.average$order

## plot을 통해 윤곽을 확인 
## 누가 몇번째에 속해있는지 알기 위해 fit.average$order 정보를 사용
## order 정보를 원본데이터에 추가해야한다. 



# fitting 방식소개 
fit.average <- stats::hclust(d, method="average")
fit.single <- stats::hclust(d, method="single")
## 멀리잇는 특정 항목들을 개별간의 거리 
fit.complete <- stats::hclust(d, method="complete")
fit.centroid <- stats::hclust(d, method="centroid")
## 그룹의 중앙 값을 찾는 것
fit.ward <- stats::hclust(d, method="ward.D")
## 거리차이를 자기 그룹의 요소를 구하여 합을 구한다.
fit.ward2 <- stats::hclust(d, method="ward.D2")



plot(fit.average, hang = -1 , cex = 0.8,main = "평균연결법을 활용한 계층적 군집분석")
plot(fit.single, hang = -1 , cex = 0.8,main = "최단연결법을 활용한 계층적 군집분석")
plot(fit.complete, hang = -1 , cex = 0.8,main = "최장연결법을 활용한 계층적 군집분석")
plot(fit.centroid, hang = -1 , cex = 0.8,main = "centroid을 활용한 계층적 군집분석")
plot(fit.ward, hang = -1 , cex = 0.8,main = "ward.D을 활용한 계층적 군집분석")
plot(fit.ward2, hang = -1 , cex = 0.8,main = "ward.D2근을 활용한 계층적 군집분석")


## 계층형 군집분석은 데이타의 양상(수치)을 확인하고 
## 주로 군집분석은 그룹개수를 지정하여 추출하여 처리하는 경우가 더 많다. 

## 그룹핑 차이를 확인하여 프로파일링을 하고 이름을 붙여 구별한다. 

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
#### 군집분석(clustering)
## 여러개의 관찰치/관측치/사례/케이스/레코드들을 대상으로
## 특성이 유사한 것끼리 하나의 그룹으로 묶어줌
## 일종의 데이터 축소화(reduction) 분석에 속함

## 크게 2가지 방식의 군집분석 기법이 있음
# (1) 계층적/위계적/응축적(hierarchical)/탐색적(exploratory) 군집분석
# - 데이터변량차이가 가장가까운 2개 관찰리를 하나의 군집으로 응축해 시작해 계속 거리차이가 가까운 군집들과 응축해 나가는 방법
# - 최대한 나눌 수 있을 만큼/ 그룹핑 할 수 있을 만큼 해줌
# 한 번 그룹핑된 관찰치를 다른 그룹에 넣을 수 없음

# - hclust()

# (2) 분할적(partitioning)/확인적(confirmatory) 군집분석
# - 분석가가 원하는 군집의 갯수를 알고리즘에 지정/입력한 다음 해당  그룹핑 작업을 시킴
# - 대상 관찰치들을 어느 분할된 그룹에 입력했다가
# 그 그룹의 변량차이에 어울리면 놓고, 아니면 다른 그룹에 
# 이동해서 다시 그 그룹의 변량계산 함

# - kmeans(), cluster::pam()
# https://rstudio-pubs-static.s3.amazonaws.com/249084_09c0daf4ceb24212a81ceddca97ba1ea.html
#######################################################################
## 기여패키지를 활용한 예제 데이터 준비

# install.packages("flexclust") # 기여패키지 인스톨
library(flexclust) # 기여패키지 로딩

library(help = flexclust) # 패키지 간략 도움말 확인
help(package = flexclust) # 패키지 도움말 파일 확인

data(package = "flexclust") # 패키지내 데이터셋 목록 확인
data(nutrient, package = "flexclust") # 패키지내 특정 데이터셋 한개 로딩
# 특히 여러 기여패키지에 nutrient라는 데이터셋이 존재할 수 있으므로
# 이를 flexclust라는 패키지에서 가져온다는 것을 명시적으로 표시한 것임

#######################################################################
#### nutrient 데이터셋 
# 27종의 생선(fish), 가금류(fowl), 육류(meat)에 대한
# 영양소(nutrient) 데이터셋
# energy(열량), protein(단백질), fat(지방), 
# calcium(칼슘), iron(철분) 등의 데이터 포함

## 데이터셋 간략 스캐닝
head(nutrient)

# install.packages("psych")
library(psych)
headTail(nutrient)

nutrient

## 내부구조 파악
str(nutrient)

## 요약기술통계 확인
summary(nutrient)

## 군집분석용 투입변수에 대한 기술통계분석 
psych::describe(nutrient)

## 5개 영양소 변수컬럼별 박스플롯 그래프
boxplot(nutrient) 
# 데이터 규모/범위/단위가 달라 표준화 작업이 필요해 보임
# 또한 일부 이상치가 존재하지만 실제 관찰치이므로 그대로 사용

#######################################################################
#### 각 관찰치간 거리구하기

## 소수점 출력자리수 설정
options(digits = 3)

## 유클리드 거리(Euclidean distance): 공간에서 두 점 사이 거리계산방법
# 거리값이 작을수록 유사성 큼 = =  비유사성 작음
# 거리값이 클수록 유사성 작음 = =  비유사성 큼

dist(nutrient) # 27종의 관찰치간 거리계산
d <- dist(nutrient)
as.matrix(d)[1:2, 1:2] # 2개 관찰치간 거리계산 값을 조회
as.matrix(d)[1:4, 1:4] # 4개 관찰치간 거리계산 값을 조회

1## 행이름 소문자로(단순변환)
row.names(nutrient) <- tolower(row.names(nutrient))

## 군집분석 전에 각 변수컬럼의 상대적인 규모/범위를 고려해 표준화실시
nutrient.scaled <- scale(nutrient)                                  
head(nutrient.scaled)

## 표준화된 영양소 데이터를 이용해 각 관찰치간 거리계산
d <- dist(nutrient.scaled)
as.matrix(d)[1:2, 1:2] # 2개 관찰치간 거리계산 값을 조회
as.matrix(d)[1:4, 1:4] # 4개 관찰치간 거리계산 값을 조회

#######################################################################
#### 계층적 군집분석 실시

## stats::hclust() 함수이용 -- 내장패키지에 이미 들어 있음 
fit.average <- hclust(d, method = "average")

## 계층적 군집분석 그래프화
plot(fit.average, hang = -1, cex = .8, 
     main = "평균연결법을 활용한 계층적 군집분석")

str(fit.average) # 군집분석 결과 내부구조확인
fit.average$order 
# 덴드로그램(dengrogram; 계통도) 각 요소별 순서확인


#### 계층적 군집분석 방법간 비교
# - 연결방법에 따라 다르게 군집화가 실시되며
#   보다 군집의 유형이 뚜렷한 형태를 찾음

fit.average <- hclust(d, method = "average")
fit.single <- hclust(d, method = "single")
fit.complete <- hclust(d, method = "complete")
fit.centroid <- hclust(d, method = "centroid")
fit.ward.D <- hclust(d, method = "ward.D")
fit.ward.D2 <- hclust(d, method = "ward.D2")

par(mfrow = c(2, 3))

plot(fit.average, hang = -1, cex = .8, 
     main = "평균연결법을 활용한 계층적 군집분석")
plot(fit.single, hang = -1, cex = .8, 
     main = "최단연결법법을 활용한 계층적 군집분석")
plot(fit.complete, hang = -1, cex = .8, 
     main = "최장연결법을 활용한 계층적 군집분석")
plot(fit.ward.D, hang = -1, cex = .8, 
     main = "Centroid방법을 활용한 계층적 군집분석")
plot(fit.ward.D, hang = -1, cex = .8, 
     main = "Ward.D방법을 활용한 계층적 군집분석")
plot(fit.ward.D2, hang = -1, cex = .8, 
     main = "Ward.D2방법을 활용한 계층적 군집분석")

par(mfrow = c(1, 1))

#######################################################################
#### 계층적 군집분석의 적정 군집갯수 선정

# install.packages("NbClust") # 패지키 이용
library(NbClust)
## distant 데이타 외에 centring 된 데이타만 집어 넣으면 됨 
## 2~15개 사이 군집 중 몇개정도로 나누면 될까?에 대해 26개 알고리즘 처리
nc <- NbClust(nutrient.scaled, distance = "euclidean", 
              min.nc = 2, max.nc = 15, method = "average")
nc # 26개 군집갯수 선정기준의 계산결과
par(mfrow = c(1, 1)) # 플로팅창 원래대로 리셋

nc$Best.nc # 26개 기준별 추천 군집정보 
nc$Best.nc[1, ] # 26개 기준별 추천 군집갯수
## table 구조로 빈도계산
table(nc$Best.nc[1,]) # 추천군집갯수별 빈도수 계산

## 추천군집갯수 그래프를 통한 비교
barplot(table(nc$Best.nc[1, ]), 
        xlab = "추천된 군집갯수", ylab = "군집산정 기준 갯수",
        main = "26개 군집갯수 산정기준을 통한 추천군집갯수") 

# 15개로 나누면되는 것을 보면, 
# 데이타의 분포로 인해서 5이상일때 간격이 작아지기 때문에
# 2 또는 3개의 군집으로 나누는 것이 타당하다.


## 프로파일링을 위해 군집갯수를 많이 나누는 것만이 능사가 아니다

## 실루엣 지표를 이용한 군집갯수 적정성 파악
library("cluster")
plot(silhouette(cutree(fit.average, k = 5), dist = d))

#######################################################################
#### 5개 군집이 적정하다고 가정하고 군집별 특성파악

## 5개 군집분할 영역표시
plot(fit.average, hang = -1, cex = .8,  
     main = "평균연결법을 활용한 계층적 군집분석")
## plot 함수를 그린 후 k의 개수 = 군집의 개수 만큼 지정하여 박스로 표기)
rect.hclust(fit.average, k = 5)
# sardines canned, beef heart, clams raw, clams canned는 그룹으로 묶기는 것이 어려워 보인다. 

## 5개로 군집분할
## cutree를 통해 k개수로 커팅하는 함수, labeling 자동으로 처리
clusters <- cutree(fit.average, k = 5)
clusters # 27종의 관찰치별로 어떤 군집에 속하는지 확인
table(clusters) # 5개 군집별로 속해 있는 관찰치 갯수 확인

## 기존 데이터셋에 그룹표시 변수컬럼 추가
### 레코드 개수가 동일하여 data.frame으로 변환가능하다
nutrient2 <- data.frame(nutrient, group = clusters) ##변수명 = clusters
head(nutrient2)

## 군집그룹별 소팅
nutrient2[order(nutrient2$group), ]

#######################################################################
#### 각 군집별 특성파악(프로파일링)
# 프로파일링: 각 군집의 평균적인 특징을 별도로 파악하는 것
# 프로파일링방법: 군집분석에 사용한 변수컬럼들의 평균값을 구해보면 됨
# 프로파일링의 최종적으로 각 군집에 적정한 그룹명칭을 부여해 주면 좋음

## 프로파일링: 표준화된 데이터 활용 
### 그룹별로 sorting되어 표현
aggregate(as.data.frame(nutrient.scaled), ## scaling된 데이타
          by = list(cluster = clusters), median) ## 산술평균


## 프로파일링: 원래 데이터 활용
aggregate(nutrient, by = list(cluster = clusters), median) 

## 그룹명칭 부여
nutrient2$group.f <- factor(nutrient2$group, levels = c(1, 2, 3, 4, 5),
                            labels = c("1: fat-energy",
                                       "2: protein",
                                       "3: iron-protein",
                                       "4: iron-calcium",
                                       "5: calcium-protein"))
tb <- table(nutrient2$group.f)
tb
as.data.frame(tb)

#######################################################################
## 요약집계 그래프
library(lattice)
parallelplot( ~ nutrient2, group = group.f, data = nutrient2, 
              horizontal.axis = FALSE, auto.key = TRUE)


## caret패키지의 시각화 기능이용 그래프 그리기
# install.packages("caret", dependencies = TRUE)
# caret이 추천하는 다양한 패키지를 함께 설치하기 위해서
# dependencies = TRUE 옵션을 사용함
install.packages("caret")
library(caret)

featurePlot(x = nutrient2[ , c(1:5)], y = nutrient2$group.f, 
            plot = "pairs", 
            auto.key = list(columns = 3)) # 상단에 한줄당 범례표시갯수 
## x변수가 증가할때 시각적으로 그룹핑이 잘되었는지 호가인할 수 있다. 


featurePlot(x = nutrient2[ , c(1:5)], y = nutrient2$group.f, 
            plot = "density",
            scales = list(x = list(relation = "free"),
                          y = list(relation = "free")),
            adjust = 1.5,
            pch = "|",
            layout = c(5, 1),
            auto.key = list(columns = 3)) # 상단에 한줄당 범례표시갯수

featurePlot(x = nutrient2[ , c(1:5)], y = nutrient2$group.f, 
            plot = "box",
            scales = list(y = list(relation = "free"),
                          x = list(rot = 90)),
            layout = c(5, 1))

pairs(~ energy + protein + fat + calcium + iron, data = nutrient2, 
      pch = c(1, 2, 3, 4, 5)[nutrient2$group.f], 
      col = c(1, 2, 3, 4, 5)[nutrient2$group.f])

### End of Source #####################################################

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
#### 군집분석(clustering)
## 여러개의 관찰치/관측치/사례/케이스/레코드들을 대상으로
## 특성이 유사한 것끼리 하나의 그룹으로 묶어줌
## 일종의 데이터 축소화(reduction) 분석에 속함

## 크게 2가지 방식의 군집분석 기법이 있음
# (1) 계층적/위계적/응축적(hierarchical)/탐색적(exploratory) 군집분석
# - 데이터변량차이가 가장가까운 2개 관찰리를 하나의 군집으로 응축해 시작해 계속 거리차이가 가까운 군집들과 응축해 나가는 방법
# - 최대한 나눌 수 있을 만큼/ 그룹핑 할 수 있을 만큼 해줌
# 한 번 그룹핑된 관찰치를 다른 그룹에 넣을 수 없음

# - hclust()

# (2) 분할적(partitioning)/확인적(confirmatory) 군집분석
# - 분석가가 군집의 갯수를 알고리즘에 지정/입력한 다음 해당  그룹핑 작업을 시킴
# - 대상 관찰치들을 어느 분할된 그룹에 입력했다가
# 그 그룹의 변량차이에 어울리면 놓고, 아니면 다른 그룹에 
# 이동해서 다시 그 그룹의 변량계산 함

# - kmeans(), cluster::pam()
# - kmeans() : 그룹의 산술평균 - 독립변수 중 범주형 데이타를 사용할 수 없다. 
#             아웃라이어(이상치)에 약하다
#              개체를 제외처리할수 있지만, 데이타량이 줄어들어 신뢰성이 떨어질수 있다. 
# cluster::pam() : medois, 거리평균의 개념이 아니라 임이의 중앙값을 지정하여 사용, 
#                  아웃라이어(이상치)에 약함을 개선한 알고리즘
#                  개체중에 이들의 대표할수 있는 것을 집계방식을 통해 추출하는 것이 아니라 
#                  medois를 선정하고 그와 거리차이를 계산하는 것이다. 
########################################################################
#### 군집분석용 카드사용고객 raw 데이터 준비 ==> 계층적 군집분석으로 실시

# usage(월평균 카드사용횟수, 회)
# amount(1회평균 카드사용금액, 만원)
# period(쇼핑몰 사이트 이용시간, 분)
# variety(상품구매 다양성)

raw <- read.csv("mycard.csv", header=T, sep=",",
                stringsAsFactors = F, # 팩터화 없이 일반적 로딩 
                strip.white = T, # 데이터 요소별 좌우 공백 제거 
                na.strings = "") # 데이터 중 ""표시부분 NA로 인식

#######################################################################
## 데이터셋 간략 스캐닝
head(raw)
tail(raw)

# install.packages("psych")
library(psych)
headTail(raw)
raw

## 내부구조 파악
str(raw)

## 요약기술통계 확인
summary(raw)

## 군집분석용 투입변수에 대한 기술통계분석 
psych::describe(raw)

## 변수컬럼별 박스플롯 그래프
boxplot(raw) 
# 데이터 규모/범위/단위가 달라 표준화 작업이 필요해 보임
# 또한 일부 이상치가 존재하지만 실제 관찰치이므로 그대로 사용

## 박스플롯에서 이상치 확인방법
x <- boxplot(raw$variety)
str(x)
x$out

#######################################################################
#### 각 관찰치간 거리구하기

## 소수점 출력자리수 설정
options(digits=3)

## 유클리드 거리(Euclidean distance): 공간에서 두 점 사이 거리계산방법
# 거리값이 작을수록 유사성 큼 == 비유사성 작음
# 거리값이 클수록 유사성 작음 == 비유사성 큼

dist(raw) # 관찰치간 거리계산
d <- dist(raw)
as.matrix(d)[1:2, 1:2] # 2개 관찰치간 거리계산 값을 조회
as.matrix(d)[1:4, 1:4] # 4개 관찰치간 거리계산 값을 조회

## 군집분석 전에 각 변수컬럼의 상대적인 규모/범위를 고려해 표준화실시
raw.scaled <- scale(raw)                                 
head(raw.scaled)

## 표준화된 데이터를 이용해 각 관찰치간 거리계산
d <- dist(raw.scaled)
as.matrix(d)[1:2, 1:2] # 2개 관찰치간 거리계산 값을 조회
as.matrix(d)[1:4, 1:4] # 4개 관찰치간 거리계산 값을 조회

## 거리간 유사성/비유사성을 시각적으로 파악

# install.packages("factoextra")
library(factoextra)

# 관찰치별 거리간 상관성 파악
res.dist <- get_dist(d, stand = TRUE, method = "pearson")
# 관찰치별 거리간 상관성을 시각적으로 표현
fviz_dist(res.dist, 
          gradient = list(low = "#00AFBB", 
                          mid = "white", 
                          high = "#FC4E07"))

#######################################################################
#### 계층적 군집분석 실시

## stats::hclust() 함수이용 -- 내장패키지에 이미 들어 있음 
fit.average <- hclust(d, method="average")

## 계층적 군집분석 그래프화
plot(fit.average, hang=-1, cex=.8, 
     main="평균연결법을 활용한 계층적 군집분석")

str(fit.average) # 군집분석 결과 내부구조확인
fit.average$order 
# 덴드로그램(dengrogram; 계통도) 각 요소별 순서확인

#######################################################################
#### 계층적 군집분석의 적정 군집갯수 선정

# install.packages("NbClust") # 패지키 이용
library(NbClust)
nc <- NbClust(raw.scaled, distance="euclidean", 
              min.nc=2, max.nc=15, method="average")
nc # 26개 군집갯수 선정기준의 계산결과
par(mfrow=c(1, 1)) # 플로팅창 원래대로 리셋

nc$Best.nc # 26개 기준별 추천 군집정보 
nc$Best.nc[1, ] # 26개 기준별 추천 군집갯수
table(nc$Best.nc[1,]) # 추천군집갯수별 빈도수 계산

## 추천군집갯수 그래프를 통한 비교
barplot(table(nc$Best.nc[1,]), 
        xlab="추천된 군집갯수", ylab="군집산정 기준 갯수",
        main="26개 군집갯수 산정기준을 통한 추천군집갯수") 

#######################################################################
#### 5개 군집이 적정하다고 가정하고 군집별 특성파악

## 5개 군집분할 영역표시
plot(fit.average, hang=-1, cex=.8,  
     main="평균연결법을 활용한 계층적 군집분석")
rect.hclust(fit.average, k=5) # 박스색상 단순히
rect.hclust(fit.average, k=5, border=2:6) # 박스색상 여러개로

# install.packages("factoextra") # 패키지 이용  
library(factoextra)
res <- hcut(raw, k = 5, stand = TRUE)

# 관련 시각화
fviz_dend(res, rect = TRUE, cex = 0.5,
          k_colors = c("#00AFBB","#2E9FDF", "#E7B800", "#FC4E07", "#2F9D27"))


## 관찰치들을 5개로 실제 군집분할 실시
clusters <- cutree(fit.average, k=5)
clusters # 관찰치별로 어떤 군집에 속하는지 확인
table(clusters) # 5개 군집별로 속해 있는 관찰치 갯수 확인

## 기존 데이터셋에 그룹표시 변수컬럼 추가
raw2 <- data.frame(raw, group=clusters)
psych::headTail(raw2)

# 관련 시각화
## 군집분석 관측치 범위를 보면 2개로 나눈다면 1,2번 집단과 3,4,5로 나눌수 있다. 
## 각 케이스별 실험을 통해 정책을 확정할 수 있다. 
fviz_cluster(list(data = raw, cluster = clusters))
y <- fviz_cluster(list(data = raw, cluster = clusters))


str(y)
#######################################################################
#### 각 군집별 특성파악(프로파일링)
# 프로파일링: 각 군집의 평균적인 특징을 별도로 파악하는 것
# 프로파일링방법: 군집분석에 사용한 변수컬럼들의 평균값을 구해보면 됨
# 프로파일링의 최종적으로 각 군집에 적정한 그룹명칭을 부여해 주면 좋음

## 프로파일링: 표준화된 데이터 활용 
aggregate(as.data.frame(raw.scaled), 
          by=list(cluster=clusters), median) 

## 프로파일링: 원래 데이터 활용
aggregate(raw2, by=list(raw2$group), median) 
aggregate(raw, by=list(cluster=clusters), median) 
## usage, amount, period 까지 4번이 상위부분이다. (수가 클수록)
## 4번이 vip 그룹이다. 그다음은 3 -> 5
## 1번 그룹이 variety 다양성이 제일 크다.

## 군집의 수치를 높이기 위해 변수를 추가, 제거를 통해 군집 재작업 
## 다양성 그래프에서, 빨간색은 독자적인 패턴(중첩없이) 별도로 추출가능하다. 머신러닝 관점에서
## 통계학 관점에서는 빨간색을 제외한 나머지는 중첩이 된 데이타들이 교차구매에 대해 의미를 추정할 수 있다. 




## 그룹명칭 부여 
raw2$group.f <- factor(raw2$group, ordered = TRUE,
                       levels = c(4, 3, 5, 1, 2),
                       labels = c("1:Superplus", "2:Prime",
                                  "3:Platinum", "4:Starclass", 
                                  "5:Vclub"))
psych::headTail(raw2)

tb <- table(raw2$group.f)
tb
addmargins(tb)
as.data.frame(addmargins(tb))

tb.pro <- prop.table(tb)
tb.pro
addmargins(tb.pro)
as.data.frame(addmargins(tb.pro))

#######################################################################
## caret패키지의 시각화 기능이용 그래프 그리기
# caret이 추천하는 다양한 패키지를 함께 설치하기 위해서
# dependencies = TRUE 옵션을 사용함

# install.packages("caret", dependencies = TRUE)
library(caret)

featurePlot(x = raw2[ , c(1:4)], y = raw2$group.f, 
            plot = "pairs", 
            auto.key = list(columns = 3)) # 상단에 한줄당 범례표시갯수 

featurePlot(x = raw2[ , c(1:4)], y = raw2$group.f, 
            plot = "density",
            scales = list(x = list(relation="free"),
                          y = list(relation="free")),
            adjust = 1.5,
            pch = "|",
            layout = c(4, 1),
            auto.key = list(columns = 3)) # 상단에 한줄당 범례표시갯수

featurePlot(x = raw2[ , c(1:4)], y = raw2$group.f, 
            plot = "box",
            scales = list(y = list(relation="free"),
                          x = list(rot = 90)),
            layout = c(4, 1))
## 4번5번이 각 변수의퍼포먼스를 보았을때 함께 묶어도 되지 않은가
## 유사한 패턴을 나타내고 있기때문에 4그룹으로 구분할 수 있다.
## 머신러닝은 변수가 많고 적음은 상관없다. 각 경우에 분석 결과를 제공할뿐이다.


# install.packages("ellipse")
library(ellipse)
featurePlot(x = raw2[ , c(1:5)], y = raw2$group.f, 
            plot = "ellipse") 
## 타원 바깥쪽에 존대하는 것은 아웃라이어라고 한다.
## 이러한 데이터를 이유로 명확한 그룹핑이 안되는 경우가 있다. 

pairs(~ usage + amount + variety + period, data=raw2, 
      pch=c(1, 2, 3, 4, 5)[raw2$group.f], 
      col=c(1, 2, 3, 4, 5)[raw2$group.f])

### End of Source #####################################################

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
#### 군집분석(clustering)
## 여러개의 관찰치/관측치/사례/케이스/레코드들을 대상으로
## 특성이 유사한 것끼리 하나의 그룹으로 묶어줌
## 일종의 데이터 축소화(reduction) 분석에 속함

## 크게 2가지 방식의 군집분석 기법이 있음
# (1) 계층적/위계적/응축적(hierarchical)/탐색적(exploratory) 군집분석
# - 알고리즘이 자유롭게 최대한 군집을 나누어 그룹핑 작업을 진행함
# - hclust()

# (2) 분할적(partitioning)/확인적(confirmatory) 군집분석
# - 분석가가 군집의 갯수를 알고리즘에 지정/입력해서 그룹핑 작업을 시킴
# - kmeans(), cluster::pam()

#######################################################################
#### 기여패키지를 활용한 예제 데이터 준비

## rattle 패키지에 있는 wine이라는 오픈 데이터셋 이용
# rattle 패키지는 R을 GUI기반에서 사용할 수 있도록 해줌
# 설치할 때 시간이 오래 걸릴 수 있음

# install.packages("rattle") # 기여패키지 인스톨
# library(rattle) # 기여패키지 로딩

# library(help = rattle) # 패키지 간략 도움말 확인
# help(package = rattle) # 패키지 도움말 파일 확인

# data(package = "rattle") # 패키지내 데이터셋 목록 확인
# data(wine, package = "rattle") # 패키지내 특정 데이터셋 한개 로딩
#rm(list=ls())
#### 그래서 다음과 같이 
# 직접 UC Irvine Machine Learning Repository에서 로딩함

wine.url <- "https://archive.ics.uci.edu/ml/machine-learning-databases/wine/wine.data"

wine <- read.csv(wine.url, header = F, 
                 na.strings = c("", " ", "?"), strip.white = T, 
                 stringsAsFactors = FALSE)
## col.names 옵션 -> c함수에서 아래에 names 항목을 그대로 넣어 데이타 로딩가능

head(wine)
names(wine) <- c("Type", "Alcohol", "Malic", "Ash", 
                 "Alcalinity", "Magnesium", "Phenols",
                 "Flavanoids", "Nonflavanoids", 
                 "Proanthocyanins", "Color", "Hue", 
                 "Dilution", "Proline")

## 군지분석에서는 type이라는 변수가 없는 경우가 많다.
## 반드시 type과 일치할 필요는 없다.

#######################################################################
## wine 데이터셋 간략 스캐닝
# - 178개 이탈리안 와인샘플의 13개 화학성분 측정 데이터셋
# - 전체 14개 변수중 첫번째 변수는 와인품종임

## 데이터셋 간략 스캐닝
head(wine)

# install.packages("psych")
library(psych)
headTail(wine)

## 내부구조 파악
str(wine)

## 요약기술통계 확인
### 결측데이타 없는지 확인 (전처리확인)
### 결측데이터가 존재하여 제거할경우 나머지 해당되는 레코드 전체 제거
### 평균치, 중앙값 등 단순 대체법으로 대체한다.
summary(wine)

## 군집분석용 투입변수에 대한 기술통계분석 
psych::describe(wine)

# 13개 화학성분 변수컬럼별 박스플롯 그래프
boxplot(wine) 
# - 데이터 규모/범위/단위가 달라 표준화 작업이 필요해 보임
# - 또한 일부 이상치가 존재하지만 실제 관찰치이므로 그대로 사용

table(wine$Type) ## type이 어느정도 구분되어 있는지 확인
df <- scale(wine[-1]) ## - 붙여서 1번 항목 제외

## dist는 범주형 데이타를 제외하고 거리평균을 구하지 못하기 때문에 
## 범주형 데이터가 포함되었을 시에는 daisy를 이용하여야 한다.

## 1번 A 1, B 2, C 3이면 거리계산하게됨으로써 A,B,C는 범주데이타 인데 
## 마치 A와C , B와C가 거리가 다르다고 계산될 수 있다. 

# - 첫번째 변수컬럼은 와인품종으로 군집분석에 불필요해서 제외함
# - 또한 13개 화학성분 변수컬럼들의 규모/범위/단위 등이 
#   서로달라서 군집분석시 동등한 영향력이 미칠 수 있도록
#   표준화를 실시함

#######################################################################
## NbClust 패키지를 이용한 잠재적 가능 군집갯수 파악
# install.packages("NbClust")
library(NbClust)

# raw데이터 무작위추출을 재생하기 위한 기본설정 
set.seed(1234) 

# k-평균방식을 적용했을 때의 가능 군집갯수 산정(2-15개)
nc <- NbClust(df, min.nc = 2, max.nc = 15, method = "kmeans")
nc # 26개 군집갯수 선정기준의 계산결과
## 2-3 구간에 변화량이 커져서 급격한 변화를 알수 있다. 그외는 변화량이 크지 않다.
## 3개가 적당하다.
par(mfrow = c(1, 1)) # 플로팅창 원래대로 리셋

nc$Best.nc # 26개 기준별 추천 군집정보 
nc$Best.nc[1, ] # 26개 기준별 추천 군집갯수
table(nc$Best.nc[1, ]) # 추천군집갯수별 빈도수 계산

## 추천군집갯수 그래프로 비교
barplot(table(nc$Best.nc[1, ]), 
        xlab = "추천된 군집갯수", ylab = "군집산정 기준 갯수",
        main = "26개 군집갯수 산정기준을 통한 추천군집갯수")
## 그래프상 3개로 선정한 알고리즘이 제일 많다.
#######################################################################
#### 3개 군집이 적정하다고 가정하고 k-평균 군집실시

## 동일한 무작위 샘플링이 재생되도록 발생시킴
set.seed(278613)

## stats::kmeans() 함수이용 -- 내장패키지에 이미 들어 있음 
fit.km <- kmeans(df, centers = 3, nstart = 25)
## centers : 군집의 갯수를 3개로 설정, 가상의 중심위치를 3개로 지정
## nstart : 각 군집의 초기 샘플갯수를 25개씩 무작위로 선정함
### kmeans의 장점은 centers를 추천개수로 사용할 필요없음. 5개로 먼저 확인도 있음.
fit.km # k-평균군집화 결과확인

str(fit.km) # k-평균군집화 결과 내부구조 확인

library(useful)
plot(fit.km, data = df)
# - kmeans 군집분석 알고리즘에 의한 그래프

plot(fit.km, data = wine, class = "Type")
# - 기존 와인종류별 데이터인 Type컬럼의 분류유형과의 비교그래프

## 군집분석 자체가 분류를 모르고 그룹핑을 위한 분석이므로 
## type 변수와(시중판매되는 구별유형) 다를수 있다. 

# 2개 그래프간 비교
library(gridExtra)
p1 <- plot(fit.km, data = df)
p2 <- plot(fit.km, data = wine, class = "Type")

grid.arrange(p1, p2, ncol = 2)

search()

## 스케이링 하지 않은 원본 데이터로 kmeans군집분석
kmeans(wine, 3) 
# - 스케일링을 실시하지 않은 데이터로 하면
#   자승합 불순도가 80% 이상으로 올라감
# - 전체 데이터가 가지는 변화량/설명량인 자승합(total SS)대비
#   군집간 자승합(between SS)크기는 작을 수록 좋음

#   군집간 자승합이라는 의미는 
#   군집이 클리어하게 구분되지 못하고 같이 겹쳐 있는(between)부분이라고 보면됨

#   따라서 군집이 겹쳐 있는 자승합 량이 많을 수록 
#   전체 데이터 자승합에 비해서 불순도가 올라가는 개념으로 보면 될 것임

#   wine데이터를 scaling하지 않고 하면, 불순도가 80%대로 올라감
#   wine데이터를 scaling하고 그룹핑하면, 48% 정도로 낮아짐

## df <- scale(wine[-1])  => -1 <> 1로 scaling 되면, 해석이 어려워 진다
## 아래 처럼 파생변수로 붙여서 해석한다.
fit.km$size # 3개로 군집화된 그룹의 요소갯수 파악
fit.km$cluster # 각 요소별로 어떤 군집에 속하는지 확인
## hclust -> order 였음


## 기존 와인데이터셋에 그룹표시 변수컬럼 추가
wine2 <- data.frame(wine, group = fit.km$cluster)
head(wine2)


#######################################################################
#### 각 군집별 특성파악(프로파일링)
# 프로파일링: 각 군집의 평균적인 특징을 별도로 파악하는 것
# 프로파일링방법: 군집분석에 사용한 변수컬럼들의 평균값을 구해보면 됨
# 프로파일링의 최종적으로 각 군집에 적정한 그룹명칭을 부여해 주면 좋음

## 프로파일링: 표준화된 데이터 활용 
fit.km$centers

## 프로파일링: 원래데이터 활용 
aggregate(wine[-1], by = list(cluster = fit.km$cluster), mean)
### type을 제외하고 유형(cluster)따라 결과를 확인 

## 그룹명칭 부여
wine2$group.f <- factor(wine2$group, levels = c(1, 2, 3),
                        labels = c("Wine1",
                                   "Wine2",
                                   "Wine3"))

tb <- table(wine2$group.f)
tb
as.data.frame(tb)

#######################################################################
#### 군집분석 결과평가(cluster validation)
ct.km <- table(wine$Type, fit.km$cluster)
ct.km 

ct.km <- table(wine$Type, fit.km$cluster,
               dnn = c("RealType", "KmeansType"))
addmargins(ct.km)

# 원래 와인품종 3종류 대비 
# k-means 군집분석을 통해 그룹핑한 
# 3개 군집과의 일치성 여부를 비교함
# 그런데, 분할표/혼동표(confusion Matrix) 상에 
# 1, 2, 3 번호레이블이 RealType과 KmeansType이 반대방향임
# 그래서 KmeansType의 숫자를 리버스 시켜서 다시 비교함
# 두개 비교
# table(fit.km$cluster)
# table(wine$Type)

fit.km$cluster
rev(fit.km$cluster)
ct.km <- table(wine$Type, rev(fit.km$cluster),
               dnn = c("RealType", "KmeansType"))
addmargins(ct.km)

ct.km2 <- table(wine$Type, fit.km$cluster,
               dnn = c("RealType", "KmeansType"))

sum(diag(ct.km))/sum(ct.km)
# diagonal - 대각선의 숫자 합 (1,1)+(2,2)+(3,3)
# 0.01 %로 낮추면 성공가능

## Rand 조정지수 사용
# install.packages("flexclust")
library(flexclust)
randIndex(ct.km)
# 원본데이터의 유형 대비
# 군집분석 클러스터링 유형 간의 일치성을 0~1사이로 파악함

#######################################################################
## 요약집계와 관련 그래프
library(lattice)
parallelplot( ~ wine2, group = group, data = wine2, 
              horizontal.axis = TRUE, auto.key = TRUE)

## caret패키지의 시각화 기능이용 그래프 그리기
# install.packages("caret", dependencies = TRUE)
# caret이 추천하는 다양한 패키지를 함께 설치하기 위해서
# dependencies = TRUE 옵션을 사용함

library(caret)

featurePlot(x = wine2[ , c(2:13)], y = wine2$group.f, 
            plot = "pairs", 
            auto.key = list(columns = 3)) # 상단에 한줄당 범례표시갯수 

## 왼쪽, 오른쪽 꼬리 분포인지 확인 
## 아래에 깔대분석(상단의 분포를 압축시켜놓은것) 겹쳐있으면
## 두개 분포가 구분이 잘안되서 구별이 어렵다. 
featurePlot(x = wine2[ , c(2:13)], y = wine2$group.f, 
            plot = "density",
            scales = list(x = list(relation = "free"),
                          y = list(relation = "free")),
            adjust = 1.5,
            pch = "|",
            layout = c(5, 3),
            auto.key = list(columns = 3)) # 상단에 한줄당 범례표시갯수

## 박스는 서로 겹치지 않는것이 주요함
featurePlot(x = wine2[ , c(2:13)], y = wine2$group.f, 
            plot = "box",
            scales = list(y = list(relation = "free"),
                          x = list(rot = 90)),
            layout = c(5, 3))
## 1,2번은 유사형태를 가지는 편이다. 
## 하지만, Ash와 같이 세개의 항목이 유사하고 겹쳐있는항목들은 제외하고 처리할수 있다. 

## 불필요한 변수 제거하여 재측정 후 모델 최적화 
### End of Source #####################################################


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
#### 군집분석(clustering)
## 여러개의 관찰치/관측치/사례/케이스/레코드들을 대상으로
## 특성이 유사한 것끼리 하나의 그룹으로 묶어줌
## 일종의 데이터 축소화(reduction) 분석에 속함

## 크게 2가지 방식의 군집분석 기법이 있음
# (1) 계층적/위계적/응축적(hierarchical)/탐색적(exploratory) 군집분석
# - 알고리즘이 자유롭게 최대한 군집을 나누어 그룹핑 작업을 진행함
# - hclust()

# (2) 분할적(partitioning)/확인적(confirmatory) 군집분석
# - 분석가가 군집의 갯수를 알고리즘에 지정/입력해서 그룹핑 작업을 시킴
# - kmeans(), cluster::pam()

#######################################################################
#### 기여패키지를 활용한 예제 데이터 준비

## rattle 패키지에 있는 wine이라는 오픈 데이터셋 이용
# rattle 패키지는 R을 GUI기반에서 사용할 수 있도록 해줌
# 설치할 때 시간이 오래 걸릴 수 있음

# install.packages("rattle") # 기여패키지 인스톨
# library(rattle) # 기여패키지 로딩

# library(help = rattle) # 패키지 간략 도움말 확인
# help(package = rattle) # 패키지 도움말 파일 확인

# data(package = "rattle") # 패키지내 데이터셋 목록 확인
# data(wine, package = "rattle") # 패키지내 특정 데이터셋 한개 로딩

help(wine)

#### 그래서 다음과 같이 
# 직접 UC Irvine Machine Learning Repository에서 로딩함

wine.url <- "https://archive.ics.uci.edu/ml/machine-learning-databases/wine/wine.data"

wine <- read.csv(wine.url, header = F, 
                 na.strings = "?", strip.white = T)

head(wine)
names(wine) <- c("Type", "Alcohol", "Malic", "Ash", 
                 "Alcalinity", "Magnesium", "Phenols",
                 "Flavanoids", "Nonflavanoids", 
                 "Proanthocyanins", "Color", "Hue", 
                 "Dilution", "Proline")

#######################################################################
#### wine 데이터셋 간략 스캐닝
## 178개 이탈리안 와인샘플의 13개 화학성분 측정 데이터셋
## 전체 14개 변수중 첫번째 변수는 와인품종임

## 데이터셋 간략 스캐닝
head(wine)
# install.packages("psych")
library(psych)
headTail(wine)

## 내부구조 파악
str(wine)

## 요약기술통계 확인
summary(wine)

## 군집분석용 투입변수에 대한 기술통계분석 
psych::describe(wine)

# 13개 화학성분 변수컬럼별 박스플롯 그래프
boxplot(wine) 
# 데이터 규모/범위/단위가 달라 표준화 작업이 필요해 보임
# 또한 일부 이상치가 존재하지만 실제 관찰치이므로 그대로 사용

#######################################################################
#### PAM(Partitioning around medoids) k-medoids 방식을 이용한 군집분석
# - 보통의 계층형/분할형 군집분석은 연속형/정량적 데이터를 사용해야함
#   이로인해 이상치에 민감하게 반응하는 결과가 나올 수 있음
# - k-modoids 방법은 연속형/정량적 데이터 이외에 다른 척도 사용가능
# - medoids라고 부르는 임의의 관측치를 무작위로 선정한다음 
#   다른 관측치들과의 거리/비유사성을 계산해 가까운 medoides에 배정함

## 동일한 무작위 샘플링이 재생되도록 발생시킴
set.seed(1234)

## cluster 패키지의 pam() 함수이용
library(cluster) 
# cluster패키지는 recommend 패키지로서
# R콘솔 설치시 기본적으로 같이 설치되는 패키지임
# 그러나 사용하려면 library()를 이용해 메모리로 로딩해야함

## pam() 함수 실행 
fit.pam <- pam(wine[-1], k = 3, stand = TRUE)
# wine 데이터셋에서 첫번째 변수컬럼인 와인유형 제외
# 이전 kmeans분석 초반에 3개 군집이 적정하다는 결과활용
# 변수컬럼들의 규모/범위/단위들이 상이하므로
# 표준화(stand옵션사용) 방식의 데이터 변환을 통해 군집분석실시

fit.pam # k-medoids 군집화 결과확인
# $Medoids 부분을 보면 36, 107, 175가 
# 각 군집을 대표하는 Medoids로 선정됨을 알 수 있음

str(fit.pam) # k-medoids 군집화 결과 내부구조 확인

fit.pam$clustering # 각 요소별로 어떤 군집에 속하는지 확인
fit.pam$medoids
## 기존 와인데이터셋에 그룹표시 변수컬럼 추가
wine3 <- data.frame(wine, group = fit.pam$clustering)
head(wine3)

#######################################################################
#### 각 군집별 특성파악(프로파일링)
# 프로파일링: 각 군집의 평균적인 특징을 별도로 파악하는 것
# 프로파일링방법: 군집분석에 사용한 변수컬럼들의 평균값을 구해보면 됨
# 프로파일링의 최종적으로 각 군집에 적정한 그룹명칭을 부여해 주면 좋음

## 프로파일링: 표준화된 데이터 활용 
fit.pam$medoids

## 프로파일링: 원래데이터 활용 
aggregate(wine[-1], by = list(cluster = fit.pam$clustering), mean)


## 3개로 군집화된 그룹별 그래프 비교
clusplot(fit.pam, main = "Bivariate Cluster Plot")
# k-medoids 군집분석에 사용한 13개 화학성분 변수컬럼을
# 크게 2개의 성분차원으로 만들었을 때 각 관찰치들의
# 상대적인 특성/위치의 비교
## 보라색 선이 길수록 두 그룹간의 움직임이 표현되는 것을 알수 있다. 

## 그룹명칭 부여
wine3$group.f <- factor(wine3$group, levels = c(1, 2, 3),
                        labels = c("Wine1",
                                   "Wine2",
                                   "Wine3"))

tb <- table(wine3$group.f)
tb
as.data.frame(tb)

#######################################################################
#### 군집분석 결과평가(cluster validation)
ct.pam <- table(wine$Type, fit.pam$clustering)
ct.pam
# 원래 와인품종 3종류 대비 
# k-medoids 군집분석을 통해 그룹핑한 
# 3개 군집과의 일치성 여부를 비교함

## Rand 조정지수 사용
# install.packages("flexclust")
library(flexclust)
randIndex(ct.pam)
# 원본데이터의 유형 대비
# 군집분석 클러스터링 유형 간의 일치성을 0~1사이로 파악함

### End of Source #####################################################

# .csv, .txt, .dat range를 설정하여 추출 할 수 있다. 
# 5점척도 1-2-3-4-5 # 번호별로 레이블을 달지만
# 7점척도 1-3-5-7-9-11-13 # 척도의 경우 별도의 레이블 기록 
# 유사점 이질점 - 쌍대비교 e.g. 어떤사람이 중요해 안중요해
# MDS_car.xslx 
# 각 분포에 따라 기성세대의 군집/그룹핑 자동차의 이미지 형태를 알 수 있다. 
# 원점, x, y 기준으로 어떻게 데이타를 분류한 것인지 알아내야함.
# 개체가 같은 거리에 위치한 것을 표현할 수 없다. 


library(readxl)
 mycar <- read_excel("MDS_car.xlsx", sheet="cardata", col_names = TRUE,
                     range = "A14:J22",
                     na = "", trim_ws = TRUE)

car <- mycar[-c(1,2)] # 다차원분석시 필요없음. 1,2번은 제외  
subset(mycar,select = c1:c8)
car

## 결과가 지저분하다고 생각하면 가공처리 
## default 7
options(digits = 3)

## cmdscale 다차원 척도 분석 
## k = 2 - 2차원으로 구별해달라 
## eig : 아이겐 벨류값 

result <- cmdscale(car,
                   eig = TRUE,
                   k=2)

## 부분 추출하여 그림을 그리겠다.
x <- result$points[,1]
y <- result$points[,2]

carnames <- mycar$carname

names(y,result[,1])
sort(y)
as.data.frame(sort(y))

# 2차원으로 그래프 그리기
## limit를 부여함으로써 균형있게 표현
plot(x,y, pch=19,
     xlim = c(-4,4),
     ylim = c(-2,2))

text(x,y, pos=3,
     labels=carnames,
     cex = 0.5, ## 글씨 크기  
     offset = 0.5) ## 점하고 레이블의 간격          
### 0점 기준으로 수직/수평선 표기
abline(h=0, v=0, col = "red")

## 분석된 내용
## 젊은세대의 이미지로 인해 y < 0 : 비선호 y >0 : 선호
## y : 스타일 , 이미지, 가성비 요소 포함
## x : 가격








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
#### 다차원척도법(Multi-dimensional Scaling)
# 개체(객체) 간의 근접성(Proximity)을 시각화하는 통계기법
# 개체들간의 거리계산시에 유클리드 거리행렬을 활용함 
# 군집분석과 같이 개체들을 대상으로 변수들을 측정한 후에 
# 개체들 사이의 유사성/비유사성을 측정
# 측정결과를 2차원/3차원 공간상에 점으로 표현하여 
# 개체들 사이의 집단화를 시각적으로 표현하는 분석방법
# 데이터 속에 잠재해 있는 패턴/구조를 찾아내어 2차/3차원 정도의 기하학으로 표현함
# 데이터축소(data reduction)목적으로 이용가능함
# 다차원척도법을 통해 분석된 유사그룹들을 대상으로 의미를 부여함

## 2가지 방식의 다차원척도법
# (1) 계량적 MDS(metric MDS)
# - 데이터가 등간(간격)척도나 비율척도인 경우 활용
# - stats::cmdscale() 함수이용
# - 각 개체들간의 유클리드 거리행렬을 계산
# - 개체들간의 비유사성을 공간상에 표현함

# (2) 비계량적 MDS(Kruskal's Non-metric Multidimensional Scaling)
# - 데이터가 순서척도인 경우 활용, MASS::isoMDS	함수이용
## 고객등급 구매금액 -> 동등한 등급간격이 아니므로 실제 개체간의 거리와 데이타간의 격차가 
## 다를 수 있으므로 데이타를 정재하여 처리한다. 
# - 개체들간의 실제거리가 아닌 순서개념의 거리가 주어진 경우
# - 순서척도를 거리의 속성처럼 변환해서 분석함
# - 개체들간이 거리가 0인, 즉 동일한 관측치가 존재하는 경우
# - vegan::monoMDS() 기능함수이용

#######################################################################
## 엑셀파일로부터 raw데이터 읽어들이기
# install.packages("readxl")
library(readxl)

mycar <- read_excel("MDS_car.xlsx", 
                    sheet = "cardata", 
                    col_names = TRUE, 
                    range = "A14:J22",
                    na = "", trim_ws = TRUE)
# - 엑셀파일에 sheet가 하나이므로 sheet옵션은 생략가능함
# - (주의) 엑셀파일이 열려있으면, 파일리 lock되어 있어서 오류발생함

## 이미 초기 계산이 완료된 excel 파일

mycar
# 차량 8종에 대해서 2개 차량씩 짝을지여 쌍대비교를 통해
# 유사성에 대해서 7점척도로 10명에게 조사한 데이터임

car <- mycar[-c(1, 2)] # 단순 차량명칭인 불필요한 첫번째 변수컬럼 제외
car
# 데이터값들이 7점척도로 측정되어서 특별한 표준화작업(scale)은 불필요함

#######################################################################
#### 계량적 MDS(metric MDS) 분석실시 

options(digits = 3)
## 2개 차원으로 분석
result <- cmdscale(car, 
                   eig = TRUE, 
                   k = 2)
result

## 2개 차원의 좌표값 별도추출
x <- result$points[, 1]
x
y <- result$points[, 2]
y

range(x); range(y) # x, y 좌표값 범위 확인

## 좌표별 차량레이블 매칭
names(x) <- mycar$carname
x
sort(x)
as.data.frame(sort(x))

names(y) <- mycar$carname
y
sort(y)
as.data.frame(sort(y))

## 2차원으로 그래프 그리기
plot(x, y, pch=19, 
     xlim=c(-4, 4), 
     ylim=c(-2, 2))

## 플로팅된 요소들에 차량이름 레이블 표시
carname <- c("현대:모닝", "현대:그랜저", "쌍용:체어맨", 
             "르노:SM3", "쉐보레:스파크", "현대:에쿠우스", 
             "르노:SM7", "현대:아반떼")

text(x, y, pos=3, 
     labels = mycar$carname, 
     cex = 0.7, 
     offset = 0.5)

## 그래프에 가이드라인 표시
abline(h=0, v=0, col="red")

#######################################################################
#### 계량적 MDS(metric MDS) 분석실시 

## 3개 차원으로 분석
out <- cmdscale(car, eig = TRUE, k = 3)
out

## 3개 차원의 좌표값 별도추출
x <- out$points[, 1]
y <- out$points[, 2]
z <- out$points[, 3]

## x, y, z 좌표값 범위 확인
range(x); range(y); range(z) 

## 좌표별 차량레이블 매칭
names(x) <- mycar$carname
x
sort(x)
as.data.frame(sort(x))

names(y) <- mycar$carname
y
sort(y)
as.data.frame(sort(y))

names(z) <- mycar$carname
z
sort(z)
as.data.frame(sort(z))

#######################################################################
## 3차원으로 그래프 그리기
# install.packages("scatterplot3d") 패키지사용
library(scatterplot3d)

scatterplot3d(x, y, z, pch=19, 
              xlim=c(-4, 4), ylim=c(-2, 2), zlim=c(-2, 2),
              highlight.3d=T, type="h")
## highlight.3d -> 높이 보여줌

## 3차원 그래프 내부정보 확인
sp <- scatterplot3d(x, y, z, pch=19, 
                    xlim=c(-4, 4), ylim=c(-2, 2), zlim=c(-2, 2),
                    highlight.3d=T, type="h")

str(sp) 
# 이중 $xyz.convert가 x, y, z의 3차원 좌표값을
# 2차원 x, y 좌표로 변한 내용을 가지고 있음
# 왜냐하면 scatterplot3d 함수에는 text()가 적용이 안되므로
# 3차원 좌표정보를 2차원으로 만들어 낸것임

sp.coords <- sp$xyz.convert(out$points) # 플로팅된 각 지점별 좌표값 확인 
text(sp.coords$x, sp.coords$y, # 플로팅된 각 점에 레이블 표시
     labels = carname, pos=3, cex=.7, col=rainbow(8))

#######################################################################
## 3차원으로 그래프 그리기2

# install.packages("rgl") # 패키지 확인
library(rgl)

## 차량이름 레이블 간략하게 정리
# H현대, S:쌍용, R:르노삼성, C:쉐보레

carname <- c("H:Mor", "H:Grd", "S:Char", "R:SM3", 
             "C:Spa", "H:Equ", "R:SM7", "H:Avt")
carname 

## 3차원 동적 그래프 구현
plot3d(x, y, z, type="s", col=rainbow(8), size=4)
text3d(x, y, z, text=carname, adj=2, cex=0.7)
texts3d(x, y, z, text=carname, adj=2, cex=0.7)

#######################################################################
#######################################################################
#### 비계량적 MDS(nonmetric MDS)를 이용한 분석

## 계속해서 car 데이터셋을 비계량적 데이터로 가정해서 이용
car
carname <- c("현대:모닝", "현대:그랜저", "쌍용:체어맨", 
             "르노:SM3", "쉐보레:스파크", "현대:에쿠우스", 
             "르노:SM7", "현대:아반떼")

#####################################
## MASS패키지의 isoMDS() 기능함수이용
# 2개 개체간 거리가 0이 포함되어 있지 않다는 것을 전제로함
# 혹시라도 관측치 중에서 완전히 동일한 관측치가 있는 경우에는 
# data.table패키지의 unique()함수를 통해 1개 개체만 데이터셋에 남도록함

# install.packages("MASS")
# install.packages("data.table")
library(MASS)
library(data.table)
my_uq <- unique(car)

rt.iso <- isoMDS(dist(my_uq), k=2) 
rt.iso
# $points 부분이 x, y좌표값
# $stress 부분의 지수수치가 작을수록
# 요소들의 거리간격계산이 양호한 것으로 판단함 

## 2개 차원의 좌표값 별도추출
x <- rt.iso$points[, 1]
y <- rt.iso$points[, 2]

range(x); range(y) # x, y 좌표값 범위 확인

## 좌표별 차량레이블 매칭
names(x) <- carname
x
sort(x)
as.data.frame(sort(x))

names(y) <- carname
y
sort(y)
as.data.frame(sort(y))


## 2차원으로 그래프 그리기
plot(x, y, pch=19, xlim=c(-8, 8), ylim=c(-4, 4))
text(x, y, labels=carname, pos=3, cex=0.7, offset = 0.5)
abline(h=0, v=0, col="red")

#####################################
# vegan패키지의 monoMDS() 기능함수이용
# 2개 개체간 거리가 0인 것에 상관없음 
# 거리차이가 없는 레코드에 이점이 있음

# install.packages("vegan")
library(vegan)
rt.mono <- monoMDS(dist(my_uq), k=2) 
rt.mono

x <- rt.mono$points[, 1]
y <- rt.mono$points[, 2]

range(x); range(y)

# 2차원으로 그래프 그리기
plot(x, y, pch=19, xlim=c(-2, 2), ylim=c(-2, 2))
text(x, y, labels=carname, pos=3, cex=0.7, offset = 0.5)
abline(h=0, v=0, col="red")

#purrr/ map - tapply

#######################################################################
#######################################################################
#### 쌍대비교 데이터셋을 이용해 직접 쌍대비교행렬 자료를 만드는 방법

## 엑셀파일로부터 raw데이터 읽어들이기
# install.packages("readxl")
library(readxl)

raw <- read_excel("MDS_car.xlsx", col_names = TRUE, 
                  range = "A1:AC11", ## row 데이터를 이용함. 계산처리된것 nope!
                  na = "", trim_ws = TRUE)

## 내용조회
raw
raw <- raw[-1] # 첫번째 변수컬럼인 응답자 아이디 제거
raw

## 10명의 쌍대비교 결과 평균값 구하기
avg <- apply(raw, 2, mean) ## 모든 열 세로방향으로 평균구하기
avg
NROW(avg)
## 쌍대비교로 진행된 2개 차량간 쌍대비교 결과에 대한
## 10명의 응답데이터를 평균값으로 구함
## 8개 차량을 2개씩 짝을지어 쌍대비교를 하게 되면
## 총 28개의 질문데이터가 존재하게 됨

## 참고: 조합계산하기
# nCr 개념의 조합계산함수
choose(8, 2) 
# 8개 중에서 2개씩 선정할 때의 경우의 수: 28개

# 8개 차량데이터 중에서 2개씩 쌍대 비교할 경우
combn(carname, 2)

#####################################
### 패키지를 이용한 쌍대비교행렬 구성
# install.packages("metaSEM")
library(metaSEM)

## 쌍대비교 행렬 만들기 - 대칭되어있는 정방행렬 생성 
avg.mx <- vec2symMat(avg, diag = F, byrow = FALSE)
# - diag = FALSE이면 대각에 1이라는 요소를 생성추가하며, 
#   diag = TRUE이면 대각자체를 생성하지 않고, 주어진 avg값만으로 행렬을 구성함
avg.mx

## 대각행렬을 0으로 채움
diag(avg.mx) <- 0

## 최종완성된 쌍대비교행렬자료
avg.mx
# 이행렬을 이용해 다차원척도분석을 진행하면됨

### End of Source #####################################################





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
###### 주성분분석과 요인분석
# - 여러 변수들 간에 존재하는 상관관계, 연관성을 이용해 
# - 소수의 주성분 또는 요인으로 차원(변수의 개수)을 축소하는 분석기법

### ------------------------------------------------------------
### 주성분분석(principal component analysis: PCA)
# - 선형적 결합이 중심

# - 주어진 변수들간의 개념적 상관성 보다는 수치적인 상관성이 있는지,
#   즉 모든 변수들의 공통적인 선형적인 데이터 변화량을 
#   전체적으로 고려하여 뚜렷하게 관찰되는 대표적인 변화량을 
#   주성분(principal component)으로 통합함
# - 보통 2-3개 정도의 성분을 추출하는데, 제1주성분의 변화량(설명령)이 
#   가장 크고/강해서 전체적인 변수들을 대표하는데 있어 
#   상대적인 `요도가 크다고 할 수 있음
# - 도출된 주성분들의 변화량(설명력)을 합쳤을 때
#   85%정도 이상이면 무난하게 주성분이 도출된 것으로 봄
# - 나머지 설명력이 작은 주성분들은 더 이상 추가해도 의미가 없음

### ------------------------------------------------------------
### 요인분석(explotory factor analysis: EFA)
# - 잠재구조 결합이 중심

# - 주어진 모든 변수들 간의 수치적인 상관성인 선형적 결합보다는
#   전체변수들 중에서 개념적/논리적으로 주제가 비슷한 
#   몇 몇 변수들을 잠재적인 요인(factor)으로 통합하여 만듬
# - 도출되는 요인의 갯수는 제한없이 여러개가 도출 될 수 있으며,
#   하나의 요인에 결합되는 변수들의 갯수도 서로 다를 수 있음
# - 각 요인간 상대적인 중요도 차이는 없지만 도출된 요인들의 
#   개별 설명력을 합친 누적설명력의 합이 85% 이상일 때의  
#   요인갯수가 적정한 것으로 판단함

### ------------------------------------------------------------
### 공통점
## 변수 축소 기능(차원의 저주를 해소하는 기법)
# - 전형적인 데이터 축소기법으로 여러 개의 변수데이터를 활용해서 
#   공통적인 새로운 변수들을 만들 수 있음
# - 서로 상관관계가 있는 여러 개의 변수들을 선형결합으로 만들어 
#   대상으로 변수가 가진 자료의 분포내용(변동)을 
#   최대한 보존하는 축소된 개수의 변수로 변환시키는 방법

## 데이터 패턴탐색 용이
# - 여러 개 변수들이 아닌 축소된 몇 개의 주성분/요인을 통해서 
#   주어진 데이터에 대한 이해도가 높아지고 관리용이성도 커짐

## 다른 분석을 위한 사전분석 역할
# - 회귀분석 등에서 독립변수간 다중공선성문제(Multi-collinearity)이 존재할 경우 
#   상관도가 높은 변수들을 하나의 주성분 혹은 요인으로 축소하여 
#   회귀분석모형개발에 활용함
# - 주성분 또는 요인분석을 통해 차원을 축소한 후에 
#   군집분석을 수행하면 군집화 결과, 연산속도가 개선됨
# - 기계에서 나오는 다수의 센서데이터를 주성분분석이나 요인분석을 하여 
#   차원을 축소한 후에 시계열로 분포나 추세의 변화를 분석하면 
#   기계의 고장(fatal failure) 징후를 사전에 파악하는데 활용

### ------------------------------------------------------------
### 차이점

## 축소를 통해 새롭게 생성된 변수의 수
# - (요인분석) 요인의 갯수를 사전에 지정하는 것이 아닌 분석과정에서 결정됨
# - (주성분분석) 보통 4개 이하의 범위에서 성분을 생성함

## 새롭게 생성된 변수이름 명명
# - (요인분석) 분석가가 요인에 묶여진 변수들을 토대로 명명함
# - (주성분분석) 공통분산(주성분)크기순대로 제1주성분, 제2주성분 등으로 표현함

## 새롭게 생성된 변수들 간의 중요도
# - (요인분석) 새롭게 생성된 변수들 간에는 대등한 관계임
#   어떤 요인변수가 더 중요하다고 볼 수 없음
# - (주성분분석) 제1주성분이 분산의 변동량을 가장 많이 가지고 있으므로
#   가장 중요하며, 그 다음으로 제2-제3-제4 주성분임

## 분석방법의 실제 의미
# - (요인분석) 목표변수를 고려하지 않고 주어진 데이터들간의 상관성을 토대로 
#   비슷한 변수들을 묶어서 새로운 잠재변수를 만들어 냄
# - (주성분분석)  목표변수를 고려하여 목표변수를 잘 예측/분류할 수 있는 
#   선형결합으로 이루어진 몇 개의 주성분을 찾아냄

#######################################################################
## 문제시나리오: 온라인 쇼핑몰 쿠폰이벤트 사용자만족도 조사분석
# - 쿠폰을 통한 프로모션 진행후 이용고객들에게 
#   사용자만족도를 조사함
# - 이용자들이 쿠폰프로모션에 대해서 생각하는 
#   다양한 평가기준(관리포인트)를 대표하는 요소는 무엇인지?
# - 이 요소들 중에서 상대적으로 중요한 것은 무엇인가?

## 사용자만족도 조사변수
# - quality: 쿠폰을 통해 판매하는 제품은 품질이 높다. 
# - refund: 쿠폰을 통해 구매한 제품은 쉽게 환불이 가능하다. 	
# - value: 쿠폰을 통해 판매하는 제품은 대체로 값어치가 있다.	
# - simple: 쿠폰을 통해 구매하면 매우 간편하다.	
# - equal: 쿠폰을 통해 구매해 배달되는 제품은 광고제품과 동일하다.	
# - time: 쿠폰을 통해 구매하면 시간을 절약할 수 있다.	
# - lost: 쿠폰을 통해 구매하면 분실염려가 없다.	
# - brand: 쿠폰을 통해 판매하는 제품은 대부분 유명브랜드 제품이다.	
# - delivery: 쿠폰을 통해 구매한 제품은 원하는 장소에 배달된다.	

#######################################################################
### raw데이터 준비

## 온라인 쇼핑몰 쿠폰이벤트 사용자만족도 데이터 로딩
raw <- read.csv("reduction_coupon.csv", header = T, sep = ",",
                stringsAsFactors = F, # 팩터화 없이 일반적 로딩 
                strip.white = T, # 데이터 요소별 좌우 공백 제거 
                na.strings = "") # 데이터 중 ""표시부분 NA로 인식

#######################################################################
## 간단 조회
head(raw)

str(raw)
library(tibble); glimpse(raw)

summary(raw)
library(skimr); skim(raw)

#######################################################################
#### 각 변수간 기본적 관련성 파악
## 공분산 분석(corvariance analysis)
# - 두 변수 간에 상호 관련성을 파악하는 기법
# - 하나의 변수가 양/음으로 변화될 때 다른 변수도 
#   같은 방향으로 변하는지, 다른방향으로 변하는지 경향성을 파악함
# - 그러나 두 변수간의 상호관련성의 크기를 
#   절대적으로 판단할 수 있는 기준은 아님
# - 이를 표준화해서 만든 것이 상관계수임

## 상관관계 분석(correlation analysis)
# - 두 변수 간에 상호 관련성(선형성)을 파악하는 기법
# - 관련성의 크기를 상관계수(correlation coefficient)로 나타냄 
# - 선형성이 있다면 방향성은 정·양(+)인지, 부·음(-)인지,
#   그 관계는 얼마나 큰지를 나타내는 판단기준
# - 상관계수값은 -1 ~ +1 사이로 표준화 되어 있음
#   0: 상관관계가 없음, ±1은 상관관계가 매우 강함
# - 어떤 변수가 원인이고, 결과인지 알 수 없음
# - 두 변수가 등간/비율/양적 척도이면, pearson 상관관계
# - 서열/등간 척도이면, spearman/kendall 서열상관관계

#####
## 축소분석 대상인 여러개 변수들간의 관계를
# - 공분산행렬과 상관계수 행렬중 어떤 것을 사용할 것인가?

# 주성분 분석의 경우 변수들간의 선형결합을 유도할 때 
# - 분산을 이용하기 때문에 공분산 행렬로부터 유도된 주성분은 
#   각 변수들의 측정단위에 영향을 많이 받음 
# - 설문조사처럼 모든 변수들이 같은 수준으로 측정된 데이터는  
#   공분산 행렬을 사용해도 무방함
# - 변수들의 scale이 서로 많이 다른 경우에는 
#   측정단위가 큰 특정 변수의 영향으로 도출된 주성분에
#   오류가 있을 가능성이 크므로 상관계수 행렬을 사용해 추출함

## 공분산 분석(corvariance analysis)
raw.cov <- cov(raw, use = "complete.obs", method = "pearson")
raw.cov # 공분산행렬
round(raw.cov, 3)

cov2cor(raw.cov) # 공분산을 상관계수로 변환해줌

## 상관관계 분석(correlation analysis)
raw.cor <- cor(raw, use = "complete.obs", method = "pearson") 
raw.cor # 상관계수행렬
round(raw.cor, 3)

## install.packages("Hmisc") 패키지 사용
# - 상관계수값과 통계적 유의수준(p-value)를 같이 구해줌
library(Hmisc)

raw.r <- rcorr(as.matrix(raw), type = "pearson")
raw.r  

#######################################################################
#### 변수간 상관관계 그래프
## 어떤 변수들간에 데이터변화량이 상관성이 있는지 윤곽을 보고
## 결합될 수 있는 성분/요인을 미리 파악함

## --------------------------------------------
## 단순 스캐터플롯(산점도 그래프)
plot(raw)

## --------------------------------------------
## PerformanceAnalytics 패키지이용 산점도
## install.packages("PerformanceAnalytics")
library("PerformanceAnalytics")
chart.Correlation(raw, histogram = TRUE)

## --------------------------------------------
## psych 패키지이용 산점도
## install.packages("psych")
library(psych)
pairs.panels(raw)

## --------------------------------------------
## corrplot 패키지 이용 상관성파악
# (상관계수행렬을 직접입력함)
# install.packages("corrplot")
library("corrplot")
cp <- corrplot(raw.cor, type = "upper", order = "hclust", 
               tl.col = "black", tl.srt = 45)
cp
str(cp) # 그래프 세부정보 확인
dimnames(cp)[[1]] # 상관성/연관성이 강한 변수컬럼 목록확인

## --------------------------------------------
## gplots 패키지 이용 상관성파악
# (상관계수행렬을 직접입력함)
# install.packages("gplots")
library(gplots)
# install.packages("RColorBrewer")
library(RColorBrewer)

heatmap(raw.cor, margins = c(10, 10))
hm2 <- heatmap.2(raw.cor, margins = c(5, 5))
hm2

str(hm2) # 그래프 세부정보 확인
dimnames(hm2$carpet) # 상관성/연관성이 강한 변수컬럼 목록확인
dimnames(hm2$carpet)[[1]]

## --------------------------------------------
## d3heatmap 패키지 이용 상관성파악
# (상관계수행렬을 직접입력함)
# install.packages("d3heatmap")
library("d3heatmap")
d3h <- d3heatmap(raw.cor, scale = "column", colors = "Blues",
                 xaxis_font_size = "14px",
                 yaxis_font_size = "14px")

d3h

str(d3h) # 그래프 세부정보 확인
d3h$x$matrix$rows # 상관성/연관성이 강한 변수컬럼 목록확인

## --------------------------------------------
## 성분/요인으로 결합될 가능성이 높은 변수컬럼 기준으로 
## raw데이터의 변수컬럼 순서를 재구성함 

# 원래 변수컬럼 순서확인
head(raw)

# 변수컬럼 순서 변경
raw <- raw[d3h$x$matrix$rows]

# 변경된 변수컬럼 순서확인
head(raw) 

#######################################################################
#### 적정한 주성분 & 요인 갯수 산정

## install.packages("psych") 패키지 활용
library(psych)

## 잠재적 주성분 갯수 산정: fa = "pc" 옵션사용
# - 스크리 플롯에서 1보다 큰 성분을 찾으면 됨
fa.parallel(raw.cov, n.obs = 80, fa = "pc", n.iter = 100,
            show.legend = T, 
            main = "스크리 플롯을 활용한 주성분 갯수산정")

## 잠재적 요인 갯수 산정: fa = "fa" 옵션사용
# - 스크리 플롯에서 0보다 큰 성분을 찾으면 됨
fa.parallel(raw.cov, n.obs = 80, fa = "fa", n.iter = 100,
            show.legend = T, 
            main = "스크리 플롯을 활용한 요인 갯수산정")

## 잠재적 주성분과 요인 갯수 동시 산정: fa = "both" 옵션사용
# - 스크리 플롯에서 1보다 큰 성분이 주성분 갯수임
# - 스크리 플롯에서 0보다 큰 성분이 요인 갯수임
fa.parallel(raw.cov, n.obs = 80, fa = "both", n.iter = 100,
            show.legend = T, 
            main = "스크리 플롯을 활용한 주성분&요인 갯수산정")

#######################################################################
##### 주성분 분석실시

#### (1) install.packages("psych") 패키지 활용 
library(psych)
#### psych::principal() 함수이용 주성분 분석

## --------------------------------------------
## (1.1) 성분추출시 무회전방식
pout.nn <- principal(raw, nfactors = 4, rotate = "none")
# - 주성분 추출시 성분회전 없이 선형성을 중심으로
#   변수들을 결합해 성분을 만들어 냄
pout.nn
##-----------------------------------------------------------------------------
## personal note
##-----------------------------------------------------------------------------
## Principal Components Analysis
## PC ~4로 갈수록 대표성이 산재되어 있어서 성분4를 구성하였다. 
## h2 86%
## 뒤에 com은 복잡도 , 크면 개별 변수가 여러 성분에 걸쳐 있다. 
## 작으면 특정 성분에 집중되어 있다. 
## brand는 PC1에 구성하는데 많이 사용되지만 그외 ~4까지는 많이 안쓰임

##                        PC1  PC2  PC3  PC4
## SS loadings           2.91 1.98 1.59 0.79
## => PC4는 구성내용 자체가 취약하다. 숫자가 작다..
## PC4로 인해 과대추정되거나 과대해석 될 수 있다. 
## Proportion Var        0.32 0.22 0.18 0.09
## => 비율면에서 볼수 있다. PC4는 9%로 밖에 안됨..
## Cumulative Proportion 0.40 0.67 0.89 1.00
## => PC3까지. 임계값 0.85정도면 괜찮음. 일부 정보손실은 감안하고
## 수십개의 변수를 집어넣는 것보다 관리도 편하고
## 독립변수의 상관성으로 인한 문제를 보안할수 있다. 

## 변수는 적은게 비용면에서/ 분석측면에서 좋다.

## 개별 관찰치와 성분별 관련성을 플롯으로 확인
biplot(pout.nn, cex = c(0.7, 0.8))
##-----------------------------------------------------------------------------
## personal note
##-----------------------------------------------------------------------------
## 산점도는 위 아래를 보면된다. 
## PC1 - PC2 => Y축 : PC1, X축 : PC2 
## equal, lost, refund PC2에 많이 적재 
## brand, value, quality, delivery
## delivery -> 상관계수를 구하면 simple,time 쪽에 가는것이 맞지만, 실제는 brand 쪽에 가깝다. 
## time, simple

## PC2 - PC3 => Y축 : PC2, X축 : PC3  
## equal, lost, refund 
## brand, value, quality
## time, simple, delivery


## PC4와 연계된 것들은 변수들의 방향이 중첩되지 않고 방사형이므로 
## 분석 및 연관성을 찾기 어렵다. 



## pout.nn의 세부내용 확인
str(pout.nn) # 내부구조
pout.nn$loadings # 각 변수들과 성분간의 상관성 수치
# - ss loading는 아이겐밸류(eigenvalues; 고유값/고유치)으로 
#   특정성분에 결합된 개별변수들의 데이터변화량인 
#   표준화된 분산수치의 총합임
# - 보통 아이겐밸류값이 1이상이 되어야 특정 성분에 결합된 
#   여러 변수들의 공통적인 데이터변화를 결합하여 
#   하나의 대표변수로서의 분산량을 확보한 것으로 봄
# - 아이겐밸류 값이 1보다 작으면 특정성분에 결합된 
#   각 변수의 공통적 데이터변화량이 많지 않아서 
#   이들을 대표할 수 있는 성분으로서의 가치가 작다는 것임
# - 분석결과 3개 성분이 1.0이상의 분산량을 확보한 것으로 나옴
# - 해당성분이 여러 변수들을 결합해 그들의 데이터 변화량을 
#   어느정도 설명하는지를 proportion var에서 확인
# - cummulative var는 각 성분의 설명분산량을 누적해서 보여주는 개념임
# - Proportion Explanined 주성분 분석에 사용한 
#   9개변수의 설명력을 1.0(100%)으로 보았을 때, 
#   각 주성분이 가진 상대적인 설명력의 크기 비교임
# - Cumulative Proportion은 이를 누적해서 보여주는 것임

pout.nn$weights # 각 변수들의 성분별 점수
# - 개별 변수들이 어떠한 성분에 관련성이 있는지를 나타냄

round(pout.nn$weights, 3)

pout.nn$scores # 각 관찰치들의 성분별 점수
# - 개별 관찰치들이 어떠한 성분에 관련성이 있는지를 나타낸 것으로
#   개별 관찰치들이 원래 가진 여러 개의 변수컬럼들의 내용을 
#   몇몇 주요 성분으로 축소화 한 점수임 
# - 이 점수를 활용해 분류/회귀/군집 분석등에서 활용
# - 결국 9개 변수가 4개변수로 축소화되어 
#   다른 분석에서 쉽게 데이터 입력값으로 사용하게 됨
round(pout.nn$scores, 3)

## 각 관찰치들의 성분점수를 다음과 같이
## raw데이터에 새로운 변수컬럼으로 추가하면 됨
raw2 <- cbind(raw, pout.nn$scores)
##-----------------------------------------------------------------------------
## personal note
##-----------------------------------------------------------------------------
## 성분점수 raw에 붙이는 것은 tibble로도 가능
head(raw2) 
str(raw2)

## --------------------------------------------
## (1.2) 성분추출시 직교회전 방식
pout.vm <- principal(raw, nfactors = 4, rotate = "varimax")
# - 주성분 추출시 성분관 상관성을 무상관으로 만들어주는
#   직교회전 방식으로 설정
pout.vm
##-----------------------------------------------------------------------------
## personal note
##-----------------------------------------------------------------------------
#           RC1   RC2   RC4   RC3   h2   u2 com
# brand     0.91  0.07  0.15  0.09 0.86 0.14 1.1
## => RC1에 집중. 복잡도를 낮추고 각 변수들의 움직임을 가지고 집중도를 구성하였다. 
# value     0.90 -0.02 -0.07  0.21 0.86 0.14 1.1
# quality   0.79  0.09  0.33 -0.27 0.81 0.19 1.6
# simple    0.08  0.14  0.63  0.64 0.83 0.17 2.1
## => 4개성분에 어정쩡하게 걸쳐 있다.가급적 숫자가 큰쪽으로 생각할 수 있다. 
# delivery  0.19 -0.03  0.88  0.20 0.86 0.14 1.2
# time      0.06  0.05  0.17  0.89 0.83 0.17 1.1
# equal     0.16  0.85  0.01  0.08 0.75 0.25 1.1
# lost      0.02  0.80  0.24 -0.12 0.72 0.28 1.2
# refund   -0.07  0.82 -0.18  0.18 0.75 0.25 1.2


## 개별 관찰치와 성분별 관련성을 플롯으로 확인
biplot(pout.vm, cex = c(0.7, 0.8))

## pout.vm의 세부내용 확인
str(pout.vm) # 내부구조
pout.vm$loadings # 각 변수들과 성분간의 상관성 수치
# - 각 변수와 성분간 상관성이 보다 명확하게 보임

pout.vm$weights # 각 변수들의 성분별 점수 

pout.vm$scores # 각 관찰치들의 성분별 점수

## 각 관찰치들의 성분점수를 다음과 같이
## raw데이터에 새로운 변수컬럼으로 추가하면 됨
raw2 <- cbind(raw, pout.vm$scores)
head(raw2) 
str(raw2)

## --------------------------------------------
## (1.3) 성분추출시 사각회전 방식
pout.pm <- principal(raw, nfactors = 4, rotate = "promax")
# 주성분 추출시 성분간 상관성을 어느정도 허용하는
# 사각회전 방식으로 설정
pout.pm 

## 개별 관찰치와 성분별 관련성을 플롯으로 확인
biplot(pout.pm, cex = c(0.7, 0.8))

## pout.vm의 세부내용 확인
str(pout.pm) # 내부구조
pout.pm$loadings # 각 변수들과 성분간의 상관성 수치
# 각 변수와 성분간 상관성이 보다 명확하게 보임

pout.pm$weights # 각 변수들의 성분별 점수 
## => 성분의 가중치 확인
pout.pm$scores # 각 관찰치들의 성분별 점수
## => 80명의 데이타에 대해 9의 변수를 4개의 대표성분으로 만들어서 사용할 수 있다. 

## 각 관찰치들의 성분점수를 다음과 같이
## raw데이터에 새로운 변수컬럼으로 추가하면 됨
raw2 <- cbind(raw, pout.pm$scores)
head(raw2) 
str(raw2)

## --------------------------------------------
## 각 변수와 성분점수와의 상관성 재확인
cor(raw, pout.nn$score)
cor(raw, pout.vm$score)
cor(raw, pout.pm$score)

#######################################################################
#### (2) stats::prcomp() 함수이용 주성분 분석

pc <- prcomp(raw)
pc
# - 도출가능한 9개 성분중 4개 정도의 성분의 값이 1.0이상임

## 고유벡터(eigenvector)의 계수값 확인
## 주성분과 변수간 관련성 파악
print(pc, digits = 2)
# Standard deviations (1, .., p=9):
#   [1] 2.36 1.64 1.40 1.09 0.82 0.77 0.70 0.60 0.52
## => 1.0 초과하는 성분은 4개가 있다. 

## 누적기여율 분석을 통한 성분갯수 결정
summary(pc)

#                          PC1    PC2    PC3     PC4     PC5    PC6     PC7
# Standard deviation     2.3626 1.6371 1.4025 1.09187 0.82163 0.7717 0.70386
# Proportion of Variance 0.4039 0.1939 0.1423 0.08627 0.04885 0.0431 0.03585
# Cumulative Proportion  0.4039 0.5979 0.7402 0.82650 0.87536 0.9184 0.95431
#                          PC8     PC9
# Standard deviation     0.59861 0.52260
# Proportion of Variance 0.02593 0.01976
# Cumulative Proportion  0.98024 1.00000

# PC1 ~ 4까지 Standard deviation이 1.0을 초과한다.


## 스크리 도표를 통한 성분 갯수 결정
plot(pc, type = "l")
abline(h = 1, col = "red")

## 개별 관찰치와 성분별 관련성을 플롯으로 확인
biplot(pc, cex = c(0.7, 0.8))

pc$rotation # 각 변수들의 성분별 점수 
pc$x # 각 관찰치들의 성분별 점수

## 각 관찰치들의 성분점수를 다음과 같이
## raw데이터에 새로운 변수컬럼으로 추가하면 됨
raw2 <- cbind(raw, pc$x[, 1:4])
head(raw2) 
str(raw2)

#######################################################################
#### (3) stats::princomp() 함수이용 주성분 분석

pn <- princomp(raw)
pn$loadings

# - 도출가능한 9개 성분중 4개 정도의 성분의 값이 1.0이상임

## 고유벡터(eigenvector)의 계수값확인
## 주성분과 변수간 관련성 파악
print(pn, digits = 2)

## 누적기여율 분석을 통한 성분갯수 결정
summary(pn)

## 스크리 도표를 통한 성분 갯수 결정
plot(pn, type = "l")
abline(h = 1, col = "red")

## 개별 관찰치와 성분별 관련성을 플롯으로 확인
biplot(pn, cex = c(0.7, 0.8))

pn$loadings # 각 변수들의 성분별 점수 
pn$scores # 각 관찰치들의 성분별 점수

## 각 관찰치들의 성분점수를 다음과 같이
## raw데이터에 새로운 변수컬럼으로 추가하면 됨
raw2 <- cbind(raw, pn$scores[, 1:4])
head(raw2) 
str(raw2)

#######################################################################
## (4) install.packages("FactoMineR") 패키지 활용 
library(FactoMineR)

## FactoMiner::PCA() 함수이용 주성분 분석
out <- PCA(raw, scale.unit = TRUE, ncp = 4, graph = F)
out # PCA() 함수를 통한 주성분분석 세부정보 목록 확인

## 성분분석 내용 요약
summary(out)

## 아이겐밸류값(eigenvalues) 확인
out$eig
# - 특정 성분(component)에 결합된 각 변수들의 표준화한 분산량의 총합
# - 보통 아이켄밸류값이 1이상이 되어야 특정 성분에 결합된 
#   여러 변수들의 공통적인 데이터변화를 결합하여 
#   하나의 대표변수로서의 분산량을 확보한 것으로 봄
# - 1보다 작으면 특정성분에 결합된 각 변수의 공통적 데이터변화량이 
#   많지 않아서 이들을 대표할 수 있는 성분으로서의 가치가 작다는 것임
# - 분석결과 3개 성분이 1.0이상의 분산량을 확보한 것으로 나옴

# - 또한 각 성분의 분산량의 비율을 보면 
#   제1성분 32%, 제2성분 22%, 제3성분 18% 정도인데, 
#   보통 도출된 성분의 합이 85% 이상 되어야 적정 성분갯수로 볼 수 있음
# - 따라서 제4성분의 아이겐밸류값이 0.79, 제5성분이 0.47이지만, 
#   이들 성분까지 합쳐야 누적설명분산이 85%를 넘어서게 되어 
#   9개 변수에 대한 주성분은 5개로 보는 것이 바람직함

## 스크리 그래프를 통한 성분갯수 파악
#- y축의 설명분산 비율이 뚜렷하게 변화되는 갯수를 고려

# 막대그래프 활용
barplot(out$eig[, 2], names.arg = 1:nrow(out$eig), 
        main = "주성분 분산비율",
        xlab = "주성분 갯수",
        ylab = "설명분산 비율",
        col  = "steelblue")
lines(x = 1:nrow(out$eig), out$eig[, 2], 
      type = "b", pch = 19, col = "red")

# install.packages("factoextra") 패키지 활용
library(factoextra)
fviz_screeplot(out, ncp = 9)

## 도출된 성분과 관찰치/변수간 관계 그래프
# 개별 관찰치와 성분 매핑
plot.PCA(out, axes = c(1, 2), choix = c("ind"))
fviz_pca_ind(out)

# 개별 변수들과 성분 매핑
plot.PCA(out, axes = c(1, 2), choix = c("var"))
plot.PCA(out, axes = c(1, 2), choix = c("varcor"))

plot(out, choix = "var")
fviz_pca_var(out)
fviz_pca_var(out, col.var = "steelblue")+
  theme_minimal()

fviz_pca_var(out, col.var = "contrib")
fviz_pca_var(out, col.var = "cos2")
fviz_pca_var(out, col.var = "coord")

fviz_pca_var(out, col.var = "contrib")+
  scale_color_gradient2(low = "white", mid = "blue", 
                        high = "red", midpoint = 55)+theme_bw()

fviz_pca_var(out, alpha.var = "contrib")+
  theme_minimal()

# 개별 변수들의 성분과의 관련성과 점수 
out$var$coord
out$var$cos2
out$var$contrib

# 개별 관찰치들의 성분과의 관련성과 점수
out$ind$coord
out$ind$cos2
out$ind$contrib

### End of Source #####################################################








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
###### 주성분분석과 요인분석
# - 여러 변수들 간에 존재하는 상관관계, 연관성을 이용해 
# - 소수의 주성분 또는 요인으로 차원(변수의 개수)을 축소하는 분석기법

### ------------------------------------------------------------
### 주성분분석(principal component analysis: PCA)
# - 선형적 결합이 중심

# - 주어진 변수들간의 개념적 상관성 보다는 수치적인 상관성이 있는지,
#   즉 모든 변수들의 공통적인 선형적인 데이터 변화량을 
#   전체적으로 고려하여 뚜렷하게 관찰되는 대표적인 변화량을 
#   주성분(principal component)으로 통합함
# - 보통 2-3개 정도의 성분을 추출하는데, 제1주성분의 변화량(설명령)이 
#   가장 크고/강해서 전체적인 변수들을 대표하는데 있어 
#   상대적인 중요도가 크다고 할 수 있음
# - 도출된 주성분들의 변화량(설명력)을 합쳤을 때
#   85%정도 이상이면 무난하게 주성분이 도출된 것으로 봄
# - 나머지 설명력이 작은 주성분들은 더 이상 추가해도 의미가 없음

### ------------------------------------------------------------
### 요인분석(explotory factor analysis: EFA)
# - 잠재구조 결합이 중심

# - 주어진 모든 변수들 간의 수치적인 상관성인 선형적 결합보다는
#   전체변수들 중에서 개념적/논리적으로 주제가 비슷한 
#   몇 몇 변수들을 잠재적인 요인(factor)으로 통합하여 만듬
# - 도출되는 요인의 갯수는 제한없이 여러개가 도출 될 수 있으며,
#   하나의 요인에 결합되는 변수들의 갯수도 서로 다를 수 있음
# - 각 요인간 상대적인 중요도 차이는 없지만 도출된 요인들의 
#   개별 설명력을 합친 누적설명력의 합이 85% 이상일 때의  
#   요인갯수가 적정한 것으로 판단함

### ------------------------------------------------------------
### 공통점
## 변수 축소 기능(차원의 저주를 해소하는 기법)
# - 전형적인 데이터 축소기법으로 여러 개의 변수데이터를 활용해서 
#   공통적인 새로운 변수들을 만들 수 있음
# - 서로 상관관계가 있는 여러 개의 변수들을 선형결합으로 만들어 
#   대상으로 변수가 가진 자료의 분포내용(변동)을 
#   최대한 보존하는 축소된 개수의 변수로 변환시키는 방법

## 데이터 패턴탐색 용이
# - 여러 개 변수들이 아닌 축소된 몇 개의 주성분/요인을 통해서 
#   주어진 데이터에 대한 이해도가 높아지고 관리용이성도 커짐

## 다른 분석을 위한 사전분석 역할
# - 회귀분석 등에서 독립변수간 다중공선성이 존재할 경우 
#   상관도가 높은 변수들을 하나의 주성분 혹은 요인으로 축소하여 
#   회귀분석모형개발에 활용함
# - 주성분 또는 요인분석을 통해 차원을 축소한 후에 
#   군집분석을 수행하면 군집화 결과, 연산속도가 개선됨
# - 기계에서 나오는 다수의 센서데이터를 주성분분석이나 요인분석을 하여 
#   차원을 축소한 후에 시계열로 분포나 추세의 변화를 분석하면 
#   기계의 고장(fatal failure) 징후를 사전에 파악하는데 활용

### ------------------------------------------------------------
### 차이점

## 축소를 통해 새롭게 생성된 변수의 수
# - (요인분석) 요인의 갯수를 사전에 지정하는 것이 아닌 분석과정에서 결정됨
# - (주성분분석) 보통 4개 이하의 범위에서 성분을 생성함

## 새롭게 생성된 변수이름 명명
# - (요인분석) 분석가가 요인에 묶여진 변수들을 토대로 명명함
# - (주성분분석) 공통분산(주성분)크기순대로 제1주성분, 제2주성분 등으로 표현함

## 새롭게 생성된 변수들 간의 중요도
# - (요인분석) 새롭게 생성된 변수들 간에는 대등한 관계임
#   어떤 요인변수가 더 중요하다고 볼 수 없음
# - (주성분분석) 제1주성분이 분산의 변동량을 가장 많이 가지고 있으므로
#   가장 중요하며, 그 다음으로 제2-제3-제4 주성분임

## 분석방법의 실제 의미
# - (요인분석) 목표변수를 고려하지 않고 주어진 데이터들간의 상관성을 토대로 
#   비슷한 변수들을 묶어서 새로운 잠재변수를 만들어 냄
# - (주성분분석)  목표변수를 고려하여 목표변수를 잘 예측/분류할 수 있는 
#   선형결합으로 이루어진 몇 개의 주성분을 찾아냄

#######################################################################
## 문제시나리오: 호텔서비스 사용자만족도 데이터 로딩
# - 호텔서비스 이용고객들에게 사용자만족도를 조사함
# - 이용자들이 호텔서비스 대해서 생각하는 
#   다양한 평가기준(관리포인트)를 대표하는 요소는 무엇인지?
# - 이 요소들 중에서 상대적으로 중요한 것은 무엇인가?

## 사용자만족도 조사변수
# - room: 객실
# - response: 예약대응 -overbooking
# - front: 프론트
# - infra: 시설
# - meal: 식음료
# - service: 서비스

#######################################################################
### raw데이터 준비

## 호텔서비스 사용자만족도 데이터 로딩
raw <- read.csv("reduction_hotel.csv", header = T, sep = ",",
                stringsAsFactors = F, # 팩터화 없이 일반적 로딩 
                strip.white = T, # 데이터 요소별 좌우 공백 제거 
                na.strings = "") # 데이터 중 ""표시부분 NA로 인식

#######################################################################
## 간단 조회
head(raw)
str(raw)
summary(raw)

# 가설을 통해 변수간의 관계를 추정. 
# 또는 논문 혹은 호텔업 관련한 책자 등을 통해 변수대상 추정

#######################################################################
#### 각 변수간 기본적 관련성 파악
## 공분산 분석(corvariance analysis)
# - 두 변수 간에 상호 관련성을 파악하는 기법
# - 하나의 변수가 양/음으로 변화될 때 다른 변수도 
#   같은 방향으로 변하는지, 다른방향으로 변하는지 경향성을 파악함
# - 그러나 두 변수간의 상호관련성의 크기를 
#   절대적으로 판단할 수 있는 기준은 아님
# - 이를 표준화해서 만든 것이 상관계수임

## 상관관계 분석(correlation analysis)
# - 두 변수 간에 상호 관련성(선형성)을 파악하는 기법
# - 관련성의 크기를 상관계수(correlation coefficient)로 나타냄 
# - 선형성이 있다면 방향성은 정·양(+)인지, 부·음(-)인지,
#   그 관계는 얼마나 큰지를 나타내는 판단기준
# - 상관계수값은 -1 ~ +1 사이로 표준화 되어 있음
#   0: 상관관계가 없음, ±1은 상관관계가 매우 강함
# - 어떤 변수가 원인이고, 결과인지 알 수 없음
# - 두 변수가 등간/비율/양적 척도이면, pearson 상관관계
# - 서열/등간 척도이면, spearman/kendall 서열상관관계

#####
## 축소분석 대상인 여러개 변수들간의 관계를
# - 공분산행렬과 상관계수 행렬중 어떤 것을 사용할 것인가?

# 요인분석도 잠재변수 추출시  
# - 공통 분산을 이용하기 때문에 공분산 행렬로부터 유도된 요인은 
#   각 변수들의 측정단위에 영향을 많이 받음 
# - 설문조사처럼 모든 변수들이 같은 수준으로 측정된 데이터는  
#   공분산 행렬을 사용해도 무방함
# - 변수들의 scale이 서로 많이 다른 경우에는 
#   측정단위가 큰 특정 변수의 영향으로 도출된 요인에
#   오류가 있을 가능성이 크므로 상관계수 행렬을 사용해 추출함

## 공분산 분석(corvariance analysis)
raw.cov <- cov(raw, use = "complete.obs", method = "pearson")
raw.cov # 공분산행렬
round(raw.cov, 3)

cov2cor(raw.cov) # 공분산을 상관계수로 변환해줌

## 상관관계 분석(correlation analysis)
raw.cor <- cor(raw, use = "complete.obs", method = "pearson") 
raw.cor # 상관계수행렬
round(raw.cor, 3)

## install.packages("Hmisc") 패키지 사용
# - 상관계수값과 통계적 유의수준(p-value)를 같이 구해줌
library(Hmisc)

raw.r <- rcorr(as.matrix(raw), type = "pearson")
raw.r  

#######################################################################
#### 변수간 상관관계 그래프
## 어떤 변수들간에 데이터변화량이 상관성이 있는지 윤곽을 보고
## 결합될 수 있는 성분/요인을 미리 파악함

## --------------------------------------------
## 단순 스캐터플롯(산점도 그래프)
plot(raw)

## --------------------------------------------
## PerformanceAnalytics 패키지이용 산점도
## install.packages("PerformanceAnalytics")
library("PerformanceAnalytics")
chart.Correlation(raw, histogram = TRUE, pch = 19)

## --------------------------------------------
## psych 패키지이용 산점도
## install.packages("psych")
library(psych)
pairs.panels(raw)

## --------------------------------------------
## corrplot 패키지 이용 상관성파악
# (상관계수행렬을 직접입력함)
# install.packages("corrplot")
library("corrplot")
cp <- corrplot(raw.cor, type = "upper", order = "hclust", 
               tl.col = "black", tl.srt = 45)
cp
str(cp) # 그래프 세부정보 확인
dimnames(cp)[[1]] # 상관성/연관성이 강한 변수컬럼 목록확인

## --------------------------------------------
## gplots 패키지 이용 상관성파악
# (상관계수행렬을 직접입력함)
# install.packages("gplots")
library(gplots)
# install.packages("RColorBrewer")
library(RColorBrewer)

heatmap(raw.cor, margins = c(10, 10))
hm2 <- heatmap.2(raw.cor, margins = c(5, 5))
hm2

str(hm2) # 그래프 세부정보 확인
dimnames(hm2$carpet) # 상관성/연관성이 강한 변수컬럼 목록확인
dimnames(hm2$carpet)[[1]]

## --------------------------------------------
## d3heatmap 패키지 이용 상관성파악
# (상관계수행렬을 직접입력함)
# install.packages("d3heatmap")
library("d3heatmap")
d3h <- d3heatmap(raw.cor, scale = "column", colors = "Blues",
                 xaxis_font_size = "14px",
                 yaxis_font_size = "14px")

d3h

str(d3h) # 그래프 세부정보 확인
d3h$x$matrix$rows # 상관성/연관성이 강한 변수컬럼 목록확인

## --------------------------------------------
## 성분/요인으로 결합될 가능성이 높은 변수컬럼 기준으로 
## raw데이터의 변수컬럼 순서를 재구성함 

# 원래 변수컬럼 순서확인
head(raw)

# 변수컬럼 순서 변경
raw <- raw[d3h$x$matrix$rows]

# 변경된 변수컬럼 순서확인
head(raw) 

#######################################################################
#### 적정한 주성분 & 요인 갯수 산정

## install.packages("psych") 패키지 활용
library(psych)

## 잠재적 주성분 갯수 산정: fa = "pc" 옵션사용
fa.parallel(raw.cov, n.obs = 80, fa = "pc", n.iter = 100,
            show.legend = T, 
            main = "스크리 플롯을 활용한 주성분 갯수산정")

## 잠재적 요인 갯수 산정: fa = "fa" 옵션사용
fa.parallel(raw.cov, n.obs = 80, fa = "fa", n.iter = 100,
            show.legend = T, 
            main = "스크리 플롯을 활용한 요인 갯수산정")

## 잠재적 주성분과 요인 갯수 동시 산정: fa = "both" 옵션사용
fa.parallel(raw.cov, n.obs = 80, fa = "both", n.iter = 100,
            show.legend = T, 
            main = "스크리 플롯을 활용한 주성분&요인 갯수산정")

#######################################################################
#### (1) install.packages("psych") 패키지 활용 
library(psych)
# install.packages("GPArotation") #패키지도 같이 필요함
library(GPArotation) 

#### psych::fa() 함수이용 요인 분석

## --------------------------------------------
## (1.1) 요인추출시 무회전방식 factor analysis
### 요인간의 좌표값을 상관계수 값을 만들때, 데이터의 방향성 유
fa.nn <- fa(raw, nfactors = 2, n.obs = 20, 
            rotate = "none", scores = T, fm = "pa" )
fa.nn

## 요인분석 플로팅
factor.plot(fa.nn, labels = rownames(fa.nn$loadings))
fa.diagram(fa.nn, simple = F)

fa.nn$loadings # 각 변수들과 요인간의 상관성 수치
# - ss loading는 아이겐밸류(eigenvalues; 고유값/고유치)으로 
#   특정 요인에 결합된 개별변수들의 데이터변화량인 
#   표준화된 분산수치의 총합임
# - 보통 아이겐밸류값이 1이상이 되어야 특정 요인에 결합된 
#   여러 변수들의 공통적인 데이터변화를 결합하여 
#   하나의 대표변수로서의 분산량을 확보한 것으로 봄
# - 아이겐밸류 값이 1보다 작으면 특정요인에 결합된 
#   각 변수의 공통적 데이터변화량이 많지 않아서 
#   이들을 대표할 수 있는 요인으로서의 가치가 작다는 것임
# - 분석결과 2개 요인이 1.0이상의 분산량을 확보한 것으로 나옴
# - 해당요인이 여러 변수들을 결합해 그들의 데이터 변화량을 
#   어느정도 설명하는지를 proportion var에서 확인
# - cummulative var는 각 요인의 설명분산량을 누적해서 보여주는 개념임

fa.nn$weights # 각 변수들의 요인별 점수
fa.nn$scores # 각 관찰치들의 요인별 점수
# - 이 점수를 활용해 분류/회귀/군집 분석등에서 활용
# - 결국 6개 변수가 2개변수로 축소화되어 
#   다른 분석에서 쉽게 데이터 입력값으로 사용하게 됨

## 각 관찰치들의 요인점수를 다음과 같이
## raw데이터에 새로운 변수컬럼으로 추가하면 됨
raw2 <- cbind(raw, fa.nn$scores)
head(raw2) 
str(raw2)

## 요인에 결합된 변수들의 주제를 통해 
#  요인명을 새롭게 프로파일링
# plyr 패키지의 rename()를 이용한 변수컬럼 변경
# install.packages("plyr")
library(plyr)

raw2 <- rename(raw2, c(PA1 = "Hard_Qty",
                       PA2 = "Soft_Qty"))
head(raw2) 

## --------------------------------------------
## (1.2) 요인추출시 직교(직각)회전 방식
# - 요인간에 상관관계가 없다는 가정하에 요인분석을 실시 
fa.vm <- fa(raw, nfactors = 2, n.obs = 20, 
            rotate = "varimax", scores = T, fm = "pa" )
fa.vm

## 요인분석 플로팅
### 직교회전을 했기때문에 2부분으로 확실히 나뉜다
factor.plot(fa.vm, labels = rownames(fa.vm$loadings))
fa.diagram(fa.vm, simple = F)

fa.vm$loadings # 각 변수들과 요인간의 상관성 수치
fa.vm$weights # 각 변수들의 요인별 점수
fa.vm$scores # 각 관찰치들의 요인별 점수

## 관찰치별 요인점수 raw데이터에 반영
raw2 <- cbind(raw, fa.vm$scores)
head(raw2) 
str(raw2)

## 요인명 프로파일링
# install.packages("plyr")
library(plyr)

raw2 <- rename(raw2, c(PA1 = "Hard_Qty",
                       PA2 = "Soft_Qty"))
head(raw2) 

## --------------------------------------------
## (1.3) 요인추출시 사각회전 방식
# - 요인간에 상관관계가 있는 경우에 요인분석을 실시 
fa.pm <- fa(raw, nfactors = 2, n.obs = 20, 
            rotate = "promax", scores = T, fm = "pa" )
fa.pm

## 요인분석 플로팅
factor.plot(fa.pm, labels = rownames(fa.pm$loadings))
fa.diagram(fa.pm, simple = F)

fa.pm$loadings # 각 변수들과 요인간의 상관성 수치
fa.pm$weights # 각 변수들의 요인별 점수
fa.pm$scores # 각 관찰치들의 요인별 점수

## 관찰치별 요인점수 raw데이터에 반영
raw2 <- cbind(raw, fa.pm$scores)
head(raw2) 
str(raw2)

## 요인명 프로파일링
# install.packages("plyr")
library(plyr)

raw2 <- rename(raw2, c(PA1 = "Hard_Qty",
                       PA2 = "Soft_Qty"))
head(raw2) 

#######################################################################
#### (2) stats::factanal() 함수이용 요인 분석

## raw 데이터의 상관계수행렬을 이용한 아이겐밸류값(고유값/고유치) 산정
ev <- eigen(raw.cor)
ev
# - 6개의 변수들 중에서 공통적인 데이터변화량을 갖고 있어
#   결합될 수 있는 요인이 2개로 나타남
# - 2개 요인은 결합된 변수들의 데이터변화량을 대표할 수 있는 
#   1.0 이상의 충분한 표준화된 분산량을 가지고 있음
# - 반면에, 요인을 3개 이상으로 추출할 경우에는 
#   결합되는 변수들의 공통적 변화량 보다도 
#   결합변수들의 고유성이 강해 하나의 대표성을 갖는
#   요인이 되지 못하고 있음

## 아이겐밸류값을 이용한 스크리 그래프
plot(ev$values, type = "b")
abline(h = 1, col = "red")

#### factanal() 함수이용 주성분 분석실시
## --------------------------------------------
## (2.1) 요인추출시 무회전 방식
ft.nn <- factanal(raw, 2, rotation = "none", scores = "regression")
print(ft.nn, digits = 3, cutoff = 0.3)

ft.nn$loadings # 각 변수들과 요인간의 상관성 수치
ft.nn$scores # 각 관찰치들의 요인별 점수

## 관찰치별 요인점수 raw데이터에 반영
raw2 <- cbind(raw, ft.nn$scores)
head(raw2) 
str(raw2)

## 요인명 프로파일링
# install.packages("plyr")
library(plyr)

raw2 <- rename(raw2, c(Factor1 = "Hard_Qty",
                       Factor2 = "Soft_Qty"))
head(raw2) 

## --------------------------------------------
## (2.2) 요인추출시 직교회전 방식
ft.vm <- factanal(raw, 2, rotation = "varimax", scores = "regression")
print(ft.vm, digits = 3, cutoff = 0.3)

ft.vm$loadings # 각 변수들과 요인간의 상관성 수치
ft.vm$scores # 각 관찰치들의 요인별 점수

## 관찰치별 요인점수 raw데이터에 반영
raw2 <- cbind(raw, ft.vm$scores)
head(raw2) 
str(raw2)

## 요인명 프로파일링
# install.packages("plyr")
library(plyr)

raw2 <- rename(raw2, c(Factor1 = "Hard_Qty",
                       Factor2 = "Soft_Qty"))
head(raw2) 

## --------------------------------------------
## (2.3) 요인추출시 사각회전 방식
ft.pm <- factanal(raw, 2, rotation = "promax", scores = "regression")
print(ft.pm, digits = 3, cutoff = 0.3)

ft.pm$loadings # 각 변수들과 요인간의 상관성 수치
ft.pm$scores # 각 관찰치들의 요인별 점수

## 관찰치별 요인점수 raw데이터에 반영
raw2 <- cbind(raw, ft.pm$scores)
head(raw2) 
str(raw2)

## 요인명 프로파일링
# install.packages("plyr")
library(plyr)

raw2 <- rename(raw2, c(Factor1 = "Hard_Qty",
                       Factor2 = "Soft_Qty"))
head(raw2) 

### End of Source #####################################################

###################################################################
## 비교차이(A/B테스트)와 예측분석(prediction)

## A/B/n Test
# - 비교대상 액션아이템 중에서 목표로하는 성과를 가져다 주는 것이 
#   어떤 아이템인지를 성과차이를 비교해 선택하는 문제유형 
# - 목표로 하는 성과의 달성 여부를 어떤 기준을 가지고 할 것인가?
# - Y/N(이항형), Norminal(다항형), Ordinal(서열형), Average(평균형)의
#   4가지 기준을 통해 액션아이템의 성과를 비교분석함
# - 이 중에서 Y/N(이분형), Norminal(다항형), Ordinal(서열형) 기준으로
#   아이템의 성과를 비교할 때 비율분석/카이자승 분석이 중심
# - 이 중에서 Average(평균형) 기준으로 아이템의 성과를 비교할 때
#   T검정(t.test), 분산분석(anova)이 중심

## Prediction Test
# - 테스트된 아이템을 가지고 실제로 액션을 취했을 때 
#   아이템의 성과가 어떤조건에 따라 달라지는지를 판단하는 문제유형 
# - 테스트된 아이템을 가지고 실제로 액션을 취했을 때 왜 성과차이가 나는가?
# - Y/N(이분형), Norminal(다항형), Ordinal(서열형), Average(수치형)의
#   4가지 성과를 다르게 발생시키는 조건/요인/속성/변수/기준/피처(feature)와 
# - 이들이 가지는 임계치(성과다 달라지는 경계값)을 도출함
# - 피처 + 임계치  =  규칙

# - 이중에서 Y/N(이분형), Norminal(다항형), Ordinal(서열형) 성과를 
#   발생시키는 규칙을 찾는 문제를 분류예측(classification)이라고 함
# - 그리고 Average(평균형) 성과를 발생시키는 규칙을 찾는 문제를
#   회귀예측(regression)이라고 함

##################################################################################
##  분류분석(classification)
#  - 사전에 정해진 유형으로 고객을 구분하는 규칙을 도출함
#  - 사전에 정해진 유형 중에서 목표로 하는 고객유형도 있으며,
#    그렇지 않은 고객유형도 있음
#  - 이들을 구별할 수 있는 기준/규칙/피처(feature)/속성/변수, 
#    즉 속성변수와 그 임계치를 알아 낼 수 있다면, 
#    목표고객을 대상으로 마이크로 타겟팅이 가능해짐

## 회귀분석(regression)
#  - 사전에 고객의 반응들을 수치/양적 데이터로 측정하고
#    이 수치를 대표하는 평균값을 만들어 내는 
#    기준/규칙/피처(feature)/속성/변수를 도출함
#  - 즉, 속성변수와 그 임계치를 알아 낼 수 있다면,
#    특정한 평균값을 충족하는 목표고객을 대상으로 마이크로 타겟팅이 가능해짐
####################################################################
## A/B테스트와 회귀분석을 통한 동일한 문제에 대한 차별적 접근

# A/B 테스트를 통해 선정한 아이템을 가지고 
# 고객 100명에게 액션을 취했을 때 반응이 평균 5만원 정도로 나왔다. 
# 이 성과를 6만원으로 높일 수 있는 방법은?

# (1) <A/B테스트 방식> 또다른 대안 C, D 등를 만들어 
# A/B 테스트를 진행해 목표로하는 성과평균값이 나오는 아이템을 선정함

# (2) <회귀분석 방식> 기존의 반응금액 데이터를 이용해 
#     반응금액을 결정하는 규칙(피처+임계치)를 찾아낸 다음
#     이 규칙을 통해 6만원 이상의 반응을 보일만한
#     고객한테만 액션을 취하면 됨

####################################################################
## 비즈니스 시나리오
# - 카드사 이용고객 중 쿠폰이벤트를 진행했을 때 다양한 반응금액이 나옴
# - 이용고객들의 어떤 특성들이 작용해 반응금액을 만들어 낼까? 
# - 반응 금액을 결정하는 조건/요인/속성/변수/기준/피처(feature)와 
#   이들이 가지는 임계치와 상대적인 중요도는?

## 분석 모델링 및 조작적 정의
# avrprice(1회평균 카드사용금액) --> 수치데이터(만원)
# period(1회평균 온라인쇼핑몰 접속시간) --> 수치데이터(시간)
# variety(상품구매다양성) --> 수치데이터(부문)
# job(직업유형) --> 범주형데이터(1:student, 2:officeworker: 3:housewife)
# age(연령) --> 수치데이터(세)
# total(이벤트 반응금액) --> 수치데이터(만원) 

###################################################################
## raw 데이터 준비
raw <- read.csv("myregression.csv", header = T, sep = ",",
                stringsAsFactors  =  F, # 팩터화 없이 일반적 로딩 
                strip.white  =  T, # 데이터 요소별 좌우 공백 제거 
                na.strings  =  "") # 데이터 중 ""표시부분 NA로 인식

## --------------------------------------------
## 데이터 정보조회
head(raw) 
str(raw) 
summary(raw)

## 전체변수 산점도
plot(raw)

## PerformanceAnalytics 패키지이용 산점도
# install.packages("PerformanceAnalytics")
library("PerformanceAnalytics")
chart.Correlation(raw, histogram = TRUE, pch = 19)

## --------------------------------------------
## 범주형변수의 팩터변수화
raw$job <- factor(raw$job, levels = c(1, 2, 3),
                  labels = c("student", "officeworker", "housewife"))
str(raw)

#################################################################
#### 다중회귀분석 실시

## 다중회귀모델 설정
fit <- lm(total ~ avrprice + period + variety + job + age, data  =  raw)
fit <- lm(total ~ ., data  =  raw) # formula 축약버전

## 회귀분석결과확인
fit # 기본분석결과
summary(fit) # 상세분석결과

## --------------------------------------------
## 회귀예측모델 변수선택방법
fit.fw <- step(fit, direction  =  "forward") #전진선택방법
summary(fit.fw)

fit.bw <- step(fit, direction  =  "backward") # 후진제거방법
summary(fit.bw)

fit.bt <- step(fit, direction  =  "both") # 단계적 방법 
summary(fit.bt)

## --------------------------------------------
## 변수컬럼마다의 회귀계수 신뢰구간
confint(fit)
signif(confint(fit), 1)
signif(confint(fit), 2)
signif(confint(fit), 3)

#################################################################
## 새로운 데이터를 이용한 수치예측: 1개 데이터 예측
new1 <- data.frame(avrprice  =  3.2, 
                   period  =  0.7, 
                   variety  =  2.8,
                   job  =  1,
                   age  =  35)
new1

new1$job <- factor(new1$job, levels = c(1, 2, 3),
                   labels  =  c("student", "officeworker", "housewife"))
str(new1)

## --------------------------------------------
predict(fit, new1, interval  =  "none")
predict(fit, new1, interval  =  "confidence")
predict(fit, new1, interval  =  "prediction")

#################################################################
# 새로운 데이터셋을 이용한 수치예측: 복수 데이터 예츠
new2 <- data.frame(avrprice = c(3.5, 4.5, 5.5), 
                   period = c(0.2, 0.4, 0.6), 
                   variety = c(2.0, 2.5, 3.5),
                   job = c(2, 1, 3),
                   age = c(28, 52, 45))
new2

new2$job <- factor(new2$job, levels = c(1, 2, 3),
                   labels = c("student", "officeworker", "housewife"))
str(new2)

## --------------------------------------------
predict(fit, new2, interval = "none")
predict(fit, new2, interval = "confidence")
predict(fit, new2, interval = "prediction")

## --------------------------------------------
# 예측결과 결합하기 
pred <- predict(fit, new2, interval = "prediction")
pred

output <-cbind(new2, pred)
output

str(output)

## --------------------------------------------
# 예측값 내림차순 정렬
output[order(output$fit, decreasing  =  T), ]

# 예측값 6만원 이상만 필터링
output[order(output$fit, decreasing  =  T) 
       & output$fit >=  6.0, ]

######################################################################
# 회귀모델의 진단
# - 회귀모델이 가져야할 통계적 가정 충족정도 확인

## 기본 용어 이해
# (1) 오차(error)
# - 전체 데이터를 활용한 예측모델에서 추정된 값과 실제값의 차이

# (2) 잔차(residual)
# - 표본 데이터를 활용한 예측모델에서 추정된 값과 실제값의 차이

# (3) 편차(deviation)
# - 관측치가 평균으로부터 떨어져 있는 정도

# -----------------------------------------------------------
## 회귀분석 모델진단 그래프: 멀티캔버스
par(mfrow = c(2, 3))

plot(fit, which = c(1:6))

par(mfrow = c(1, 1))

# -----------------------------------------------------------
## 회귀분석 모델진단 그래프: 개별 출력

## (1) 선형성(Linearity) 가정: 독립변수와 종속변수간 선형관계인지 파악
# - 투입/예측/설명/독립변수와 산출/결과/반응/종속변수 관계가 
#   선형적인지 확인
# - 개별 투입변수가 종속변수와 상관성이 있는지 
#   상관관계 그래프(scatter matrix plot)를 그려서
#   상관계수 정도와 선형적 직선의 모양/방향 확인

plot(fit, which = 1) 
# - 독립변수들과 종속변수 간에 선형관계가 있다면 
#   예측치(Fitted values)와 잔차(Residuals)  
#   특별한 관련성이 보이지 않아야 함
# - 현재 그림에서는 빨간색 선이 가로직선을 하고 있어서 
#   예측치들이 잔차들과 특별한 경향성(관련성)이 없으므로
#   선형성을 만족한다고 볼 수 있음
# - 만일, 빨간색 선이 가로직선이 아닌 일종의 곡선모양이라면 
#   회귀모델에 다항식을 포함시켜서 개선함
# - 일부 무작위 잡음(random noise)에 해당하는 관측치는 제거를 고려함
# - 잔차들의 평균0, 분산 일정하므로 선형성 만족함

## / 선을 기준으로 분포 최소자승기법. 선과 요소들의 거리(잔차)

crPlots(fit)

## 독립변수와 종속변수간 선형관계가 아닌경우
# 다항회귀(Polynominal)
# - 독립변수가 다항식으로 구성되는 회귀모델로 변경
# - 독립변수에 지수승을 붙여서 여러 개의 변수로 만들의 회귀모델을 구성하는 기법

# 일반화가법모형(GAM)
# - 독립변수를 그대로 이용하는 것이 아니라 다른함수의 선형결합으로 표현
# - 다양한 함수를 사용하면서 다양한 관계를 표시할 수 있으므로 
#   일반화(generalized)라는 이름이 붙음 

# -----------------------------------------------------------
## (2) 독립성(Independence) 가정: 오차항에 시계열적 특성이 있는지 파악
# - 투입/예측/독립 변수들간에 아무런 관련성이 없어야 함
# - 무작위 샘플링을 통해서 데이터가 시간적/공간적/조건적
#   상황에 영향을 받지 않고 수집되어야 함
library(car)
durbinWatsonTest(fit)
# - 0 ~ 4 값 중에 2에 가까울 수록 데이터간 자동상관(Autocorrelation)
#   가능성이 적은 것으로 판단
# - 0이나 4라는 수치가 나올 수록 데이터간 상관성이 있다고 판단

## 오차항에 자기상관성이 있는 경우
# 자기회귀(Autoregressive Model)
# - 보통의 시계열 데이터와 같이 순서가 있는 데이터인 경우 
#   주기성이나 계절성 같이 일정한 패턴을 가지는 자기상관성이 발생함

# - 시간에 따라 평균이 변하는 경우: 
#   ARMA(Auto Regressive Moving Average) Model

# - 시간에 따라 분산이 달라지는 경우: 
#   ARCH(Auto Regressive Conditionally Heteroscedastic) Model
# -----------------------------------------------------------
## (3) 정규성(Normality) 가정: 오차항의 확률분포가 정규분포인지 파악  
# - 산출/결과/반응/종속변수의 분포가 정규분포인지 확인

plot(fit, which = 2) 
# - 종속변수가 정규분포라면 잔차도 회귀선 주위에서 
#   평균 0을 중심으로 정규분포이어야 함
# - Q-Q플롯에서 그래프의 점들이 45도 직선위에 있으므로 
#   정규성 가정을 만족한다고  할 수 있음
# - 일부 무작위 잡음(random noise)에 해당하는 관측치는
#   제거를 고려함

## 종속변수가 정규분포가 아닐경우 오차항의 확률분포도 정규분포가 아닌 경우
# 일반화선형모형(Generalized Linear Model)
# - 종속변수가 0 또는 1인경우: 로지스틱회귀(Logistic regression)
# - 종속변수가 순위, 선호도 같이 서열인경우: 서열회귀(Ordinal regression)
# - 종속변수가 개수(count)를 나타내는 경우: 포아송회귀(Poisson regression)
# - 종속변수가 사망시간이나 중도절단(censoring) 데이터인 경우: 
#   생존회귀(Survival regression)
# -----------------------------------------------------------
## (4) 등분산성(Equality of Variance/ Homoscedasticity)
# - 잔차의 분산이 평균 0 주위에 일정한 패턴없이 분포하는지 확인

plot(fit, which = 3) 
# - 잔차들이 일정한 패턴 없이 무작위 대역(random band) 형태로 
#   나타나야 함 
# - 잔차들이 확장, 축소, 곡선형으로 일정 패턴을 보인다면
#   등분산에 부합하지 않은 것임
# - 표준화 잔차와 예측치 사이에 분산이 일정해야 함

ncvTest(fit) # 등분산 검정
spreadLevelPlot(fit) # 잔차진단

## 등분산성에 위배되었을 때
# - log 변환, 가중최소제곱법 적용

# -----------------------------------------------------------
## 영향관측치와 이상치 파악: 데이터에 아웃라이어 존재유무 파악
#  - 해당 관찰치에 대한 제거후 다시 회귀모델 설정
plot(fit, which = 4) 
# 어떤 관찰치가 영향관측치(influential observation)인지 파악

plot(fit, which = 5) 
# 설명변수의 이상치 파악

plot(fit, which = 6) 
# 영향관측치와 이상치 파악 

car::outlierTest(fit) # 이상치 파악
car::influencePlot(fit) # 영향치 파악

library(car)
qqPlot(fit)

## 데이터에 아웃라이어가 있는 경우
# 로버스트회귀(Robust regression)
# - 잔차의 제곱을 이용하는 최소제곱법 대신에 
#   절대값의 합이 최소가 되도록 계수룰 추정하는 방식

# 분위값회귀(Quantile regression)
# - 평균이 아닌 특정 분위값을 추정해서 그 위치에 있는
#   종속변수값을 사용해 아웃라이어의 영향을 해소

# -----------------------------------------------------------
## 다중공선성(Multi-collinearity) 가정: 독립변수간 다중공선성 존재유무 파악
# install.packages(car)
library(car)
vif(fit)
vif(fit) > 10

# - 분산팽창지수 vif(Variance Inflation Factor) 값이 10 이상이면
#   독립변수들간 강한 상관관계가 존재해 종속변수의 수치예측에
#   영향을 미침

## 다중공선성이 있는 경우
# - 고전적인 선형회귀모델을 회귀계수 추정을 위해 잔차의 제곱합을 계산하는
#   일종의 비용함수를 만들어서 비용함수가 최소가 되는 회귀계수를 추정하게 됨
# - 다중공선성이 있는 독립변수들이 투입된 상태의 비용함수에서는
#   회귀계수의 영향력이 과다추정될 수 있음
# - 고전적인 선형회귀모델의 회귀계수 추정시 사용하는
#   잔차의 제곱의 합을 계산하는 비용함수에 페널티(regularization) 함수라는 
#   추가적인 수식을 붙여 회귀계수값들의 과다추정을 막고, 오버피팅도 방지함
# - 이 기존의 잔차제곱합을 계산하는 비용함수에 페널티를 어떻게 줄 것인지에 따라
#   여러 회귀분석으로 나누어짐
# - 데이터의 개수에 비해 독립변수의 개수가 많을 때도 이런방식을 사용할 수 있음

## 페널티(regularization) 함수 추가방식
# 릿지회귀(Ridge regression)
# - 잔차의 제곱합을 계산하는 방식 --> 회귀계수의 제곱합을 계산하는 방식 추가

# 라쏘회귀(Lasso regression)
# - 잔차의 제곱합을 계산하는 방식 --> 회귀계수의 절대값을을 계산하는 방식 추가
# - 영향력이 적은 변수의 회귀계수값을 0으로 만들어 주는 변수선택효과도 있음

# 엘라스틱넷회귀(Elastic net regression)
# - 릿지회귀와 라쏘회귀를 결합한 방식

## 데이터 축소(Data reduction) 방식
# PCR(Principal Component Regression)
# - 독립변수들의 주성분을 추출/이용해 회귀모델을 만듬
# - 주성분들이 서로 직교하므로 다중공선성 발생하지 않음
# - 상위 몇 개 주성분만 이용할 경우 라쏘처럼 일종의 regualization 효과를
#   발생시켜 모델이 오버피팅 현상도 완화됨
# - 그러나 모델 해석은 어려울 수 있음

# PLS(Partial Least Square) regression
# - PCR과 비교했을 때 변수변환 방식에서 차이가 남
# - PCR: 독립변수의 분산을 최대로 하는 축을 찾아 
#        데이터를 전사(projection)하는 방식으로 독립변수만 변형함
# - PLS: 종속변수와 독립변수의 관계를 가장 잘 설명해주는 축을 찾아 
#        전사하는 방식으로 종속변수와 독립변수 모두를 변형함

# -----------------------------------------------------------
# install.packages("gvlma")
library(gvlma)
gvmodel <- gvlma(fit)
summary(gvmodel)
# - Global Stat & Link Function: linearity 가정의 충족여부 판단기준 
# - Skewness & Kurtosis: normality 가정의 충족여부 판단기준 
# - Heteroscedasticity: constant variance 가정의 충족여부 판단기준 

### End of Source ###############################################
















#### 회귀예측

# caret 패키지: classification and regression training
# - 복잡한 회귀& 분류문제 해결을 위한 
#   모형훈련(training)과 조절(tuning) 과정을 간소화하는 패키지

## Max Kuhn's github.io sites: caret패키지에 대한 소개사이트 
browseURL("https://topepo.github.io/caret/")

# caret::train() 함수와 교차검증(Cross Validation) 이용
# method = "" 옵션을 다양한 머신러닝 알고리즘을 선택적으로 적용가능


# - svmRadial: 서포트벡터머신(support vector machine)
# - knn: 최근접이웃(k-nearst neighbors)
# - lm: 선형모형(linear model)

# (1) 배깅 알고리즘
# - bagEarthGCV: 배깅(Bagged MARS using gCV Pruning)
# - rf: 랜덤포레스트(random forest)

# (2) 정규화 알고리즘
# - bridge: L2 Rgularization(Bayesian Ridge Regression)
# - glmnet: L2 Rgularization(Ridge Regression)
# - lasso: L1 Rgularization(The lasso)
# - blassoAveraged: 베이지안 능형회기(Model Averaged)
# - enet: Elasticnet
# - kernelpls: Partial Least Squares

# -(3) 부스팅 알고리즘
# - gbm: 부스팅 나무(boosted trees)
# - xgbDART: 경사하강부스팅(eXtreme Gradient Boosting)
# - BstLm: 부스팅(Boosted Linear Model)

# -(4) 신경망 알고리즘
# - brnn: 베이지안신경망(Bayesian Regularized Neural Networks)


## 관련 패키지 일괄설치&로딩용 사용자정의 함수설정
mypak <- function (pkg) {
  new.pkg <- pkg[!(pkg %in% installed.packages()[, "Package"])]
  if (length(new.pkg)) install.packages(new.pkg, dependencies  =  TRUE)
  sapply(pkg, require, character.only  =  TRUE) 
}
# - 각 패키지 로딩결과도 콘솔창에 TRUE/FALSE로 나옴

## mypak 사용자정의함수 사용
packages <- c("caret", "skimr", "RANN", "randomForest", "C50", 
              "fastAdaboost", "gbm", "xgboost","tidyverse", 
              "caretEnsemble", "earth", "dplyr", "magrittr", 
              "e1071", "prodlim", "RRF", "brnn", "bst", 
              "monomvn", "glmnet", "elasticnet", "pls")

mypak(packages)

# ------------------------------------------------------------------------
### 문제시나리오: 지역과 주택 특성 데이터를 활용한 주택가격 산정규칙 도출
# (기본 의문사항)
# - 왜 주택가격에 차이가 나는 것일까?
# - 주택가격이 차이가 나도록 하는 특성요인은 무엇인가?

# (활용방안)
# - 구매예정 주택이 적정한 가격인지를 가격규칙을 통해 적정성 판단 
# - 개발예정 지역의 신설 주택단지에 대한 적정가격을 미리 산정해 마케팅에 활용
# - 주택가격을 높이기 위해 상대적으로 중요한 특성요인에 자원을 집중함

### raw 데이터 준비
# 투입변수: 1~13, 결과변수: 14

# 1. crime: 범죄발생률 (numeric)
# 2. zn: 주거지 중 2500ft2 이상크기의 대형주택 비율 (numeric)
# 3. indus: 소매상 이외의 상업지구 면적비율 (numeric)
# 4. chas: 찰스강과 인접한지역 1, 아닌경우 0 (qualitative) 
# 5. nox: 산화질소 오염도 (numeric)
# 6. rm: 주거지당 평균 방 개수 (numeric)
# 7. age: 자가 주거지중 1940년 이전 주택의 비율 (numeric)
# 8. dis: 보스턴의 5대 고용중심으로부터 가중평균 거리 (numeric)
# 9. rad: 도시순환 고속도로 접근용이 지수 (numeric)
# 10. tax: 만달러당 주택 재산세율 (numeric)
# 11. ptratio: 학생-선생 비율 (numeric)
# 12. black: 흑인 인구 비율이 0.63과 다른 정도의 제곱 (numeric)
# 13. lstat: 저소득 주민 비율 (numeric)
# 14. medv: 자가 주거지 주택가격 (numeric)

raw <- read.csv("HousingData.csv", header=T, sep=",",
                stringsAsFactors = F, # 팩터화 없이 일반적 로딩 
                strip.white = T, # 데이터 요소별 좌우 공백 제거 
                na.strings = c("", "NA", "?")) # 결측치 인식

## raw 데이터 기본사항 조회
head(raw)
str(raw)
summary(raw)
library(skimr); skim(raw)

#######################################################################
## 데이터셋 유형별 정제작업

## raw 데이터 변수컬럼조회
names(raw); NROW(names(raw))

## 종속변수 지정
var_dep <- c("medv")
var_dep

## 독립변수 중 범주형 데이터 지정
var_ctg <- c("chas")
var_ctg; NROW(var_ctg)

## 독립변수 중 연속형 변수컬럼 지정
var_num <- setdiff(names(raw), c(var_dep, var_ctg))
var_num; NROW(var_num)
# - 데이터셋에서 종속변수와 독립변수 중 범주형 데이터를 제외

# -----------------------------------------------------------
## 독립변수 중 범주형 변수컬럼을 일괄팩터화하는 사용자 정의함수 
to_factors <- function(df, cv) {
  for (i in cv){
    df[[i]] <- as.factor(df[[i]])
  }
  return(df)
}

## 독립변수 중 연속형 변수컬럼을 일괄 스케일링하는 사용자 정의함수 
scale.features <- function(df, nv) {
  for (i in nv){
    df[i] <- as.vector(scale(df[i], center = F, scale = T))
  }
  return(df)
}

# -----------------------------
## 독립변수 중 범주형 변수컬럼 일괄팩터화 작업진행
raw <- to_factors(df = raw, cv = var_ctg)
str(raw)

## 독립변수 중 연속형 변수컬럼 일괄스케일링 작업진행
raw <- scale.features(raw, var_num)
str(raw)

#######################################################################
## 범주형 데이터 가변수화

## 반응(종속) 변수 별도 저장
raw.y <- raw$medv
# - 가변수생성 알고리즘 적용시 제외되는 종속변수를 나중에 
#   재결합해주기 위해서 별도로 준비함

## 가변수생성 알고리즘 원핫인코딩(One-Hot Encoding)모델에 전체데이터 피팅
dummies_model <- dummyVars(medv ~ ., data = raw)
dummies_model

## 가변수화 실시 
raw_mat <- predict(dummies_model, newdata = raw)

# ------------------------------
head(raw_mat)
# - 헤더 조회시 반응(종속)변수가 보이지 않음

str(raw_mat) 
# - 반응(종속) 변수가 더미변수화 과정에서 제외되었으므로  
#   현재 훈련데이터셋에는 예측(독립)변수들로만 구성된 행렬객체임

raw <- data.frame(raw_mat, medv = raw.y)
str(raw)
# - 행렬객체를 데이터프레임형식으로 재변환
# - 가변수화 과정에서 제외되었던 반응(종속)변수 재결합

#######################################################################
#### 데이터 분할실시 
# install.packages("dplyr")
library(dplyr)

## 샘플링 난수번호 설정
set.seed(2000)

## 전체 데이터 중 60%를 학습(training) 데이터로 추출
df_train <- sample_frac(raw, size=0.60)
raw_rest <- dplyr::setdiff(raw, df_train, by = "medv")

## 나머지 40% 데이터 중 절반(50%)를 검증(validation) 데이터로 추출
df_valid <- sample_frac(raw_rest, size=0.50)

## 마지막에 남은 20%를 검증(validation) 데이터로 추출
df_test <-  dplyr::setdiff(raw_rest, df_valid, by = "medv")

## 분할된 3개 데이터셋 크기 비교
NROW(df_train); NROW(df_valid); NROW(df_test)

#######################################################################
## 학습데이터 기본사항 조회
head(df_train)

str(df_train)
glimpse(df_train)

summary(df_train)
skim(df_train)

# -----------------------------------------------------------
## 시각화를 통한 변수간 관련성 파악
# - 독립변수와 종속변수간 상관성
# - 독립변수간 상관성

## 산점도 그래프 
plot(df_train)

## install.packages("car") 활용 산점도
library(car)
scatterplotMatrix(df_train)

## install.packages("psych") 활용 산점도
library(psych)
pairs.panels(df_train, method = "pearson", hist.col = "#00AFBB",
             density = TRUE, ellipses = TRUE)

#######################################################################
##### caret 패키지와 교차검증(Cross Validation)을 이용한 수치예측
##### regression model with caret::train()
#######################################################################

#### 회귀예측
# caret::train() 함수와 교차검증(Cross Validation) 이용
# method = "" 옵션을 다양한 머신러닝 알고리즘을 선택적으로 적용가능

# - svmRadial: 서포트벡터머신(support vector machine)
# - gbm: 부스팅 나무(boosted trees)
# - xgbDART: 경사하강부스팅(eXtreme Gradient Boosting)
# - knn: 최근접이웃(k-nearst neighbors)
# - rf: 랜덤포레스트(random forest)
# - lm: 선형모형(linear model)
# - brnn: 베이지안신경망(Bayesian Regularized Neural Networks)
# - BstLm: 부스팅(Boosted Linear Model)
# - bagEarthGCV: 배깅(Bagged MARS using gCV Pruning)
# - bridge: L2 Rgularization(Bayesian Ridge Regression)
# - glmnet: L2 Rgularization(Ridge Regression)
# - lasso: L1 Rgularization(The lasso)
# - blassoAveraged: 베이지안 능형회기(Model Averaged)
# - enet: Elasticnet
# - kernelpls: Partial Least Squares

#######################################################################
## training 모델설정

mymethod <- "kernelpls"
# - caret::train() 함수의 method = 옵션에 설정될 머신러닝 알고리즘
#######################################################################

## (1) 교차검증(cross validation): 미설정(none) 모델 
cr_none_fit <- 
  train(medv ~ ., data = df_train, method = mymethod, 
        trControl = trainControl(method = "none"))

## method=none 설정모델 내용확인
cr_none_fit
varImp(cr_none_fit, scale = F)
plot(varImp(cr_none_fit, scale = F))
summary(cr_none_fit)

# -----------------------------------------------------------
## (2) 교차검증(cross validation): 부스팅(boot) 모델 
cr_boot_fit <- 
  train(medv ~ ., data = df_train, method = mymethod, 
        trControl = trainControl(method = "boot")) 

## cv=none 설정모델 내용확인
cr_boot_fit
varImp(cr_boot_fit, scale = F)
plot(varImp(cr_boot_fit, scale = F))
summary(cr_boot_fit)

# -----------------------------------------------------------
## (3) 교차검증(cross validation): cv=10 설정모델 
cr_cv10_fit <- 
  train(medv ~ ., data = df_train, method = mymethod, 
        trControl = trainControl(method = "cv", 
                                 number = 10))

## cv=10 설정모델 내용확인
cr_cv10_fit
varImp(cr_cv10_fit, scale = F)
plot(varImp(cr_cv10_fit, scale = F))
summary(cr_cv10_fit)

# -----------------------------------------------------------
## (4) 반복 교차검증(repeated cross validation): 
#  - repeated=2, cv=10 설정모델 
cr_r2cv10_fit <- 
  train(medv ~ ., data = df_train, method = mymethod, 
        trControl = trainControl(method = "repeatedcv", 
                                 repeats = 2,
                                 number = 10))

## repeated=2, cv=10 설정모델 내용확인
cr_r2cv10_fit
varImp(cr_r2cv10_fit, scale = F)
plot(varImp(cr_r2cv10_fit, scale = F))
summary(cr_r2cv10_fit)

# -----------------------------------------------------------
## (5) 한개 데이터 테스트 교차검증(Leave one out cross validation): 
#  - LOOCV 설정모델; 잭나이프(jackknife)기법 
cr_loocv_fit <- 
  train(medv ~ ., data = df_train, method = mymethod, 
        trControl = trainControl(method = "LOOCV"))

## LOOCV 설정모델 내용확인
cr_loocv_fit
varImp(cr_loocv_fit, scale = F)
plot(varImp(cr_loocv_fit, scale = F))
summary(cr_loocv_fit)

#######################################################################
## 60% 학습데이터(df_train)로 학습한 다양한 회귀모델을 
## 검증데이터(df_valid)에 적용해 수치예측 실시
#  - caret::tarin()함수 - none, boot, cv10, r2cv10, LOOCV 모델 5종

## (0) 검증데이터에 있는 실제 주택가격 수치값
df_valid$medv

## (1) caret 교차검증 미설정(none) 모델활용 검증데이터 수치예측
cr_none_pred_valid <- predict(cr_none_fit, newdata = df_valid)
cr_none_pred_valid

## (2) caret 부스팅(boot) 모델활용 검증데이터 수치예측
cr_boot_pred_valid <- predict(cr_boot_fit, newdata = df_valid)
cr_boot_pred_valid

## (3) caret 교차검증(cv=10) 모델활용 검증데이터 수치예측
cr_cv10_pred_valid <- predict(cr_cv10_fit, newdata = df_valid)
cr_cv10_pred_valid

## (4) caret 반복교차검증(repeated=2, cv=10) 모델활용 검증데이터 수치예측
cr_r2cv10_pred_valid <- predict(cr_r2cv10_fit, newdata = df_valid)
cr_r2cv10_pred_valid

## (5) caret 교차검증(LOOCV) 모델활용 검증데이터 수치예측
cr_loocv_pred_valid <- predict(cr_loocv_fit, newdata = df_valid)
cr_loocv_pred_valid

#######################################################################
## 회귀모델간 수치예측 성능평가
# 다양한 회귀모델에서 도출한 주택가격 예상수치와 
# 검증데이터(df_valid)에 있는 주택가격 실제수치와 
# 오차정도를 계산해서 비교함
# - 오차값이 작을 수록 수치예측력이 우수한 회귀모델임

## (1) caret::defaultSummary() 함수이용 성능평가
cr_none_perf_valid <- 
  defaultSummary(data.frame(obs = df_valid$medv, 
                            pred = cr_none_pred_valid))
cr_boot_perf_valid <- 
  defaultSummary(data.frame(obs = df_valid$medv, 
                            pred = cr_boot_pred_valid))
cr_cv10_perf_valid <- 
  defaultSummary(data.frame(obs = df_valid$medv, 
                            pred = cr_cv10_pred_valid))
cr_r2cv10_perf_valid <- 
  defaultSummary(data.frame(obs = df_valid$medv, 
                            pred = cr_r2cv10_pred_valid))
cr_loocv_perf_valid <- 
  defaultSummary(data.frame(obs = df_valid$medv, 
                            pred = cr_loocv_pred_valid))

## 5개 모델간 성능비교 
rbind(cr_none_perf_valid, 
      cr_boot_perf_valid, 
      cr_cv10_perf_valid,
      cr_r2cv10_perf_valid,
      cr_loocv_perf_valid)

# Rsquared(설명력): 가장 높은 설명력을 가진 모델은?
# RMSE(평균제곱근오차): 가장 작은 오차를 가진 모델은?
# MAE(평균절대오차): 가장 작은 오차를 가진 모델은?

#######################################################################
## train() 함수에 method = "svmRadial"로 설정한 경우 검증결과 저장
final_svmRadial <- as.data.frame(rbind(cr_none_perf_valid, 
                                       cr_boot_perf_valid, 
                                       cr_cv10_perf_valid,
                                       cr_r2cv10_perf_valid,
                                       cr_loocv_perf_valid))

## train() 함수에 method = "gbm"로 설정한 경우 검증결과 저장
final_gbm <- as.data.frame(rbind(cr_none_perf_valid, 
                                 cr_boot_perf_valid, 
                                 cr_cv10_perf_valid,
                                 cr_r2cv10_perf_valid,
                                 cr_loocv_perf_valid))

## train() 함수에 method = "xgbDART"로 설정한 경우 검증결과 저장
final_xgbDART <- as.data.frame(rbind(cr_none_perf_valid, 
                                     cr_boot_perf_valid, 
                                     cr_cv10_perf_valid,
                                     cr_r2cv10_perf_valid,
                                     cr_loocv_perf_valid))

## train() 함수에 method = "knn"로 설정한 경우 검증결과 저장
final_knn <- as.data.frame(rbind(cr_none_perf_valid, 
                                 cr_boot_perf_valid, 
                                 cr_cv10_perf_valid,
                                 cr_r2cv10_perf_valid,
                                 cr_loocv_perf_valid))

## train() 함수에 method = "rf"로 설정한 경우 검증결과 저장
final_rf <- as.data.frame(rbind(cr_none_perf_valid, 
                                cr_boot_perf_valid, 
                                cr_cv10_perf_valid,
                                cr_r2cv10_perf_valid,
                                cr_loocv_perf_valid))

## train() 함수에 method = "brnn"로 설정한 경우 검증결과 저장
final_brnn <- as.data.frame(rbind(cr_none_perf_valid, 
                                  cr_boot_perf_valid, 
                                  cr_cv10_perf_valid,
                                  cr_r2cv10_perf_valid,
                                  cr_loocv_perf_valid))

## train() 함수에 method = "BstLm"로 설정한 경우 검증결과 저장
final_BstLm <- as.data.frame(rbind(cr_none_perf_valid, 
                                   cr_boot_perf_valid, 
                                   cr_cv10_perf_valid,
                                   cr_r2cv10_perf_valid,
                                   cr_loocv_perf_valid))

## train() 함수에 method = "bagEarthGCV"로 설정한 경우 검증결과 저장
final_bagEarthGCV <- as.data.frame(rbind(cr_none_perf_valid, 
                                         cr_boot_perf_valid, 
                                         cr_cv10_perf_valid,
                                         cr_r2cv10_perf_valid,
                                         cr_loocv_perf_valid))

## train() 함수에 method = "bridge"로 설정한 경우 검증결과 저장
final_bridge <- as.data.frame(rbind(cr_none_perf_valid, 
                                    cr_boot_perf_valid, 
                                    cr_cv10_perf_valid,
                                    cr_r2cv10_perf_valid,
                                    cr_loocv_perf_valid))

## train() 함수에 method = "glmnet"로 설정한 경우 검증결과 저장
final_glmnet <- as.data.frame(rbind(cr_none_perf_valid, 
                                    cr_boot_perf_valid, 
                                    cr_cv10_perf_valid,
                                    cr_r2cv10_perf_valid,
                                    cr_loocv_perf_valid))

## train() 함수에 method = "lasso"로 설정한 경우 검증결과 저장
final_lasso <- as.data.frame(rbind(cr_none_perf_valid, 
                                   cr_boot_perf_valid, 
                                   cr_cv10_perf_valid,
                                   cr_r2cv10_perf_valid,
                                   cr_loocv_perf_valid))

## train() 함수에 method = "blassoAveraged"로 설정한 경우 검증결과 저장
final_blassoAveraged <- as.data.frame(rbind(cr_none_perf_valid, 
                                            cr_boot_perf_valid, 
                                            cr_cv10_perf_valid,
                                            cr_r2cv10_perf_valid,
                                            cr_loocv_perf_valid))

## train() 함수에 method = "enet"로 설정한 경우 검증결과 저장
final_enet <- as.data.frame(rbind(cr_none_perf_valid, 
                                  cr_boot_perf_valid, 
                                  cr_cv10_perf_valid,
                                  cr_r2cv10_perf_valid,
                                  cr_loocv_perf_valid))

## train() 함수에 method = "kernelpls"로 설정한 경우 검증결과 저장
final_kernelpls <- as.data.frame(rbind(cr_none_perf_valid, 
                                       cr_boot_perf_valid,
                                       cr_cv10_perf_valid,
                                       cr_r2cv10_perf_valid,
                                       cr_loocv_perf_valid))

final_svmRadial
final_gbm
final_xgbDART
final_knn
final_rf
final_brnn
final_BstLm
final_bagEarthGCV
final_bridge
final_glmnet
final_lasso
final_blassoAveraged
final_enet
final_kernelpls

#######################################################################
## 선택된 최종모형과 테스트셋 오차계산

## 테스트 데이터에 있는 실제 주택가격 수치값
df_test$medv

## 선택된 회귀모델을 활용한 테스트 데이터 수치예측
pred_test <- predict(cr_cv10_fit, newdata = df_test)
pred_test

## 선택된 회귀모델의 테스트 결과성능 평가
defaultSummary(data.frame(obs = df_test$medv, 
                          pred = pred_test))

### End of Source #####################################################


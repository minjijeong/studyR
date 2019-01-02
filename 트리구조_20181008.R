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


raw$response <- factor(raw$response, 
                       levels=c(2, 1, 0), 
                       labels=c("high", "low", "nr")) 

## 사전 분류규칙 존재가능성 탐색
boxplot(wine[2:7], 
        main="와인 변수간 데이터분포 비교")

# 투입변수간 관련성 분석
pairs(~ Alcohol + Malic + Ash + Alcalinity + Magnesium + Phenols + Flavanoids, data=wine, 
      pch=c(1, 2, 3, 4, 5)[wine$Type], 
      col=c(1, 2, 3, 4, 5)[wine$Type])

# install.packages("caret")
library(caret)

# install.packages("ellipse")
library(ellipse) 
# 보통 패키지 설


## 분류규칙에 가장 영향을 많이 미치는 변수는 무엇인지를 탐색분석
# install.packages("FSelector")
library(FSelector)

chi.squared(Type ~ Alcohol + Malic + Ash + Alcalinity + Magnesium + Phenols + Flavanoids, data=wine)
chi.squared(Type ~ ., data = wine) # formula 축약버전

x <- chi.squared(Type ~ Alcohol + Malic + Ash + Alcalinity + Magnesium + Phenols + Flavanoids, data=wine)
cutoff.k(x, 1)
cutoff.k(x, 2)
cutoff.k(x, 3)
cutoff.k(x, 4)



#### 분류분석용 데이터 추출

## 랜덤넘버 생성
set.seed(1234)

## 학습(트레이닝-30%) & 검증(테스트-70%) 데이터 추출
index <- sample(1:NROW(wine), nrow(wine)*0.7, replace=F)
index

## 학습 & 검증 데이터 정보조회
trainD <- wine[index, ]
testD <- wine[-index, ]

head(trainD)
head(testD)
nrow(trainD); nrow(testD)

## 훈련데이터 상의 실제고객의 반응(분류)패턴 분포확인
addmargins(table(trainD$Type))

## 검증데이터 상의 실제고객의 반응(분류)패턴 분포확인
addmargins(table(testD$Type))




###################################################################
#### party패키지 ctree() 함수를 이용한 분류분석 실시
###################################################################

## 분류분석 패키지 설치 및 로딩
# install.packages("party")
library(party)

## 분류분석 모델 관계식 정의
f <- Type ~ .

## 학습데이터를 이용한 분류규칙 생성
fit.ct <- ctree(f, data = trainD)
# - 또는 fit.ct <- ctree(response ~. , data = trainD)로 코딩해도 
fit.ct

## 분류규칙 그래프 그리기
plot(fit.ct)
plot(fit.ct, type="simple")
# 개별변수가 왼쪽 값일때 순도/불순도를 구하는 알고리즘 포함
# 어느 한쪽 값일때, label 벨류가 1.0에 얼마나 가까이 가는지 

## --------------------------------------------
## 분류규칙을 이용한 학습(train)데이터 분류분석
train.out <- predict(fit.ct)
train.out # 학습데이터 개별 관찰치를 분류규칙을 통해 분류해 봄

## 학습데이터 response 패턴과 분류규칙 분류패턴간 교차분석
train.result <- table(train.out, trainD$Type,
                      dnn=c("TrainRule", "TrainActual"))
train.result

## 훈련데이터 상의 실제고객의 반응(분류)패턴 분포확인
addmargins(table(trainD$response))

addmargins(train.result) 
# 원래 학습(tainD)데이터 존재하는 실제 response 패턴과
# 학습데이터에서 도출한 분류규칙을 이용해 학습데이터를 분류해보고 
# 이들간의 교차분석을 통해 분류규칙의 적용가능성을 파악

## 학습(train)데이터 분류결과 정확성(Accuracy) 평가
sum(train.result) 
diag(train.result) 
sum(diag(train.result))/sum(train.result) 

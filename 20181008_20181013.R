##  선형 모형 
# - 독립변수를 더하여 y 값 예측
# - 개별변수가 어떻게 움직일때 어떻게 결과가 나올지, 방향성 포함 등 여러요소로 인해
#   잔차라던가 이런것을 더하는것도 가능하여 오류가 얼마인지 등을 알수있다.
# - 최고의 모델 
# - y가 연속변수 일때는 선형으로 가능 

## 비선형 모형 
# - y가 범주 데이터 일때 사용가능

###################################################################
## CRT(Classification & Regression Test) vs. ABT(A & B Items difference TEst)

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

## CRT(Prediction Test)
# - 테스트된 아이템을 가지고 실제로 액션을 취했을 때 
#   아이템의 성과가 어떤조건에 따라 달라지는지를 판단하는 문제유형 
# - 테스트된 아이템을 가지고 실제로 액션을 취했을 때 왜 성과차이가 나는가?
# - Y/N(이분형), Norminal(다항형), Ordinal(서열형), Average(수치형)의
#   4가지 성과를 다르게 발생시키는 조건/요인/속성/변수/기준/피처(feature)와 
# - 이들이 가지는 임계치(성과다 달라지는 경계값)을 도출함
# - 피처 + 임계치 = 규칙

# - 이중에서 Y/N(이분형), Norminal(다항형), Ordinal(서열형) 성과를 
#   발생시키는 규칙을 찾는 문제를 분류예측(classification)이라고 함
# - 그리고 Average(평균형) 성과를 발생시키는 규칙을 찾는 문제를
#   회귀예측(regression)이라고 함

##################################################################################
## 분류분석(classification)
#  - 사전에 정해진 유형으로 고객을 구분하는 규칙을 도출함
#  - 사전에 정해진 유형 중에서 목표로 하는 고객유형도 있으며,
#    그렇지 않은 고객유형도 있음
#  - 이들을 구별할 수 있는 기준/규칙/피처(feature)/속성/변수, 
#    즉 속성변수와 그 임계치를 알아 낼 수 있다면, 
#    목표고객을 대상으로 마이크로 타겟팅이 가능해짐

#  - (cf) 군집분석은 사전에 정해진 유형없이 고객을 그룹핑하는데
#    관련될 것으로 판단되는 속성변수들을 군집분석 알고리즘에 투입해
#    이들 변수의 변화량 특성을 고려해 군집을 나누는 것임
#    ==> 비지도학습, 자율학습: Unsupervised Learning(투입/독립변수만 있음)
#    ==> 패턴, 구조 발견(pattern discovery, feature extraction )
#    ==> 기존의 유형화에 속한 연관(association)분석, 
#        주성분(principal component)/요인(factor)분석 등도 비지도학습에 속함

#  - 반면에 분류분석에서는 비즈니스 측면에서 중요한 고객의 유형이
#    사전에 정해져 있어야 하며, 고객 속성변수의 변화에 따라 고객 유형별
#    분류데이터가 미리 준비되어 있어야 함
#    ==> 지도학습: Supervised Learing(투입/독립변수와 결과/종속변수 변화파악)
#    ==> 예측분석(prediction)

#  - (cf) 강화학습(Reinforcement Learning)은 분석가가 모델링을 통해 
#    선정된 변수들만을 투입해 규칙/피처(feature)를 찾는 것이 아니라 
#    알고리즘이 탐색을 통해서 피처를 선정 찾아내 투입/반복하면서, 점점더 강한 예측력을 가진 
#    알고리즘으로 업그레이드됨

####################################################################
## A/B테스트와 분류분석을 통한 동일한 문제에 대한 차별적 접근

# A/B 테스트를 통해 선정한 아이템을 가지고 
# 고객 100명에게 액션을 취했을 때 반응이 10명정도 나왔다. 
# 이 성과를 20%로 높일 수 있는 방법은?

# (1) <A/B테스트 방식> 또다른 대안 C, D 등를 만들어 
# A/B 테스트를 진행해 목표로하는 20% 성과가 나오는 아이템을 선정함

# (2) <분류분석 방식> 액션대상인 고객 중에서 반응을 보일 것으로 예상되는 
# 50명한테만 액션을 취해서 10명 정도의 반응을 이끌어 내면 20%가 달성됨

####################################################################
## 비즈니스 시나리오
# - 카드사 이용고객 중 쿠폰이벤트를 진행했을 때 반응을 보이는 고객과
#   그렇지 않은 고객으로 나뉘고 있음
# - 어떤 특성을 가진 고객이 쿠폰이벤트에 반응을 보이는지?
# - 어떤 특성을 가진 고객이 쿠폰이벤트에 반응을 보이지 않는지?
# - 반응 유무를 결정하는 조건/요인/속성/변수/기준/피처(feature)와 
#   이들이 가지는 임계치와 상대적인 중요도는?

## 분석 모델링 및 조작적 정의
# usage(월평균 카드사용횟수) --> 수치데이터(횟수)
# amount(1회평균 카드사용금액) --> 수치데이터(만원)
# period(1회평균 온라인쇼핑몰 접속시간) --> 수치데이터(분)
# variety(상품구매다양성) --> 수치데이터(부문)
# response(쿠폰반응유형) --> 0:nr(반응안함, no-response)
#                        --> 1:low(단순/저가구매)
#                        --> 2:high(복합/고가구매)

###################################################################
## raw 데이터 준비

raw <- read.csv("myclass.csv", header=T, sep=",",
                stringsAsFactors = F, # 팩터화 없이 일반적 로딩 
                strip.white = T, # 데이터 요소별 좌우 공백 제거 
                na.strings = "") # 데이터 중 ""표시부분 NA로 인식

###################################################################
## 데이터 정보조회
head(raw) 

## 간단조회
str(raw) 
summary(raw)

## 기존 쿠폰반응 데이터인 response변수를 요인변수로 만들고, 
## 별도 레이블 반영

raw$response <- factor(raw$response, 
                       levels=c(2, 1, 0), 
                       labels=c("high", "low", "nr")) 

#######################################################################
## 사전 분류규칙 존재가능성 탐색
boxplot(raw[1:4], 
        main="고객구매이력 변수간 데이터분포 비교")

# 2개 변수간 관련성 분석
plot(raw$amount, raw$usage, 
     pch=as.numeric(raw$response), col=as.numeric(raw$response))
# plot에서는 150명 관찰치별로 일일히 플로팅캐릭터와 색상을 지정해주어야 함
# 그래서 as.numeric으로 150개 관찰치 별로 수치화를 한 것임
legend("topleft", legend=levels(raw$response), 
       pch=unique(raw$response), col=unique(raw$response))
# 레전드에서는 150개가 아니라 이들을 대표하는 3개 클래스에 대한
# 데이터만 있으면 되므로 unique()로 값을 구한 것임

# 투입변수간 관련성 분석
pairs(~ usage + amount + variety + period, data=raw, 
      pch=c(1, 2, 3, 4, 5)[raw$response], 
      col=c(1, 2, 3, 4, 5)[raw$response])

## -----------------------------
## caret패키지의 featurePlot() 기능이용
# install.packages("caret")
library(caret)

# install.packages("ellipse")
library(ellipse) 
# 보통 패키지 설치시 종속된 패키지가 같이 설치되는데,
# caret의 경우 이 패키지가 없어서 작동에 에러가 나는 경우가 있음
# 그래서 caret 설치/로딩시 ellipse나 e1071과 같은 패키지도
# 같이 설치/로등하는 것이 필요함
# ellipse: caret의 featurePlot()에서 plot = "ellipse"에 필요한 패키지
# e1071: caret의 train()에서 피처 선택할 때 필요한 패키지

featurePlot(x = raw[ , c(1:4)], y = raw$response, 
            plot = "pairs", 
            auto.key = list(columns = 3)) # 상단범례표시 

featurePlot(x = raw[ , c(1:4)], y = raw$response, 
            plot = "density",
            scales = list(x = list(relation="free"),
                          y = list(relation="free")),
            adjust = 1.5,
            pch = "|",
            layout = c(4, 1),
            auto.key = list(columns = 3)) # 상단범례표시

featurePlot(x = raw[ , c(1:4)], y = raw$response, 
            plot = "box",
            scales = list(y = list(relation="free"),
                          x = list(rot = 90)),
            layout = c(4, 1))

featurePlot(x = raw[ , c(1:4)], y = raw$response, 
            plot = "ellipse",
            auto.key = list(columns = 3)) # 상단범례표시

# 아래 패키지를 사용하면 플로팅되는 점들의 투명도가 변경됨
 install.packages("AppliedPredictiveModeling")
library(AppliedPredictiveModeling)
transparentTheme(trans = .4)
# - 바로 위 featurePlot()들을 다시실행

## -----------------------------
## car 패키지의 scatterplotMatrix() 기능 이용
# install.packages("car")
library(car)

# 분류모델에 사용한 4개 투입변수와 1개 결과변수간 산점도 그림
scatterplotMatrix(raw)

# 결과변수인 response변수에 따른 4개변수에 대한 변화 비교 그래프
scatterplotMatrix(~ usage + amount + period + variety | response, data=raw)

# 두개 변수간 관계 중심데이터 표시, 타원을 벗어나는게 이상치로 보면됨
scatterplotMatrix(~ usage + amount + period + variety | response, data=raw,
                  ellipse=TRUE)

# 원래 추세선이 response와 상관없이 전체적으로 보여주었으나
# 이 옵션을 통해 직업유형별 별도 추세선을 보여 줌
scatterplotMatrix(~ usage + amount + period + variety | response, data=raw,
                  by.group=TRUE)

# 4개 변수의 분포모양(+)이 왜도가 오른쪽 꼬리분포임
# 그래서 이를 정규분포형태로 변환해서 노이즈를 제거해 산점도를 그림
scatterplotMatrix(~ usage + amount + period + variety | response, data=raw,
                  transform=TRUE)

###################################################################
## 분류규칙에 가장 영향을 많이 미치는 변수는 무엇인지를 탐색분석
# install.packages("FSelector")
library(FSelector)

chi.squared(response ~ usage + amount + period + variety, data=raw)
chi.squared(response ~ ., data = raw) # formula 축약버전

x <- chi.squared(response ~ usage + amount + period + variety, data=raw)
cutoff.k(x, 1)
cutoff.k(x, 2)
cutoff.k(x, 3)
cutoff.k(x, 4)

###################################################################
#### 분류분석용 데이터 추출

## 랜덤넘버 생성
set.seed(1234)

## 학습(트레이닝-30%) & 검증(테스트-70%) 데이터 추출
index <- sample(1:NROW(raw), nrow(raw)*0.7, replace=F)
index

## 학습 & 검증 데이터 정보조회
trainD <- raw[index, ]
testD <- raw[-index, ]

head(trainD)
head(testD)
nrow(trainD); nrow(testD)

## 훈련데이터 상의 실제고객의 반응(분류)패턴 분포확인
addmargins(table(trainD$response))

## 검증데이터 상의 실제고객의 반응(분류)패턴 분포확인
addmargins(table(testD$response))


###################################################################
#### party패키지 ctree() 함수를 이용한 분류분석 실시
###################################################################

## 분류분석 패키지 설치 및 로딩
# install.packages("party")
library(party)

## 분류분석 모델 관계식 정의
f <- response ~ usage + amount + period + variety

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
train.result <- table(train.out, trainD$response,
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

###################################################################
## 검증(test)데이터에 대한 분류분석
test.out <- predict(fit.ct, newdata=testD)
test.out # 학습데이터 개별 관찰치를 분류규칙을 통해 분류해봄

## 검증데이터 response 패턴과 분류규칙 분류패턴간 교차분석
test.result <- table(test.out, testD$response,
                     dnn=c("TestPredicted", "TestActual"))
test.result

## 검증데이터 상의 실제고객의 반응(분류)패턴 분포확인
addmargins(table(testD$response))

addmargins(test.result)
# 원래 검증(testD)데이터 존재하는 실제 response 패턴과
# 학습데이터에서 도출한 분류규칙을 이용해 검증데이터를 분류해보고 
# 이들간의 교차분석을 통해 분류규칙에 대한 재검증(크로스체크)을 실시함

## 검증(test)데이터 분류결과 정확성(Accuracy) 평가
sum(test.result) 
diag(test.result) 
sum(diag(test.result))/sum(test.result) 

###################################################################
# 학습(tain)데이터와 검증(test)데이터 정확성 비교
x <- sum(diag(train.result))/sum(train.result) 
y <- sum(diag(test.result))/sum(test.result) 

compare <- c(x, y, y - x)
names(compare) <- c("trainAccuracy", "testAccuracy", "AccuracyGap")

compare
round(compare*100, 2)

## 혼동표 그리기 
library(caret)
#install.packages('e1071', dependencies=TRUE)
confusionMatrix(test.result)

###################################################################
## 도출된 규칙을 활용한 고객추출
rawA <- subset(raw, amount > 1.9 & period > 1.7)
rawA

rawB <- subset(raw, amount > 1.9 & period <= 1.7)
rawB

rawC <- subset(raw, amount <= 1.9)
rawC

library(psych)
psych::describe(rawA)
psych::describe(rawB)
psych::describe(rawC)

###################################################################
#### tree패키지 tree() 함수를 이용한 분류분석 실시
###################################################################

## 분류분석 패키지 설치 및 로딩
# install.packages("tree")
library(tree)

## 분류분석 모델 관계식 정의
fit.tr <- tree(response ~. , data=trainD)
plot(fit.tr)
text(fit.tr)

fit.tr.cv <- cv.tree(fit.tr, FUN=prune.misclass )
plot(fit.tr.cv)

fit.tr.pr <- prune.misclass(fit.tr, best = 4)  
plot(fit.tr.pr)
text(fit.tr.pr, pretty=0)

## --------------------------------------------
## 분류규칙을 이용한 학습(train)데이터 분류분석
train.out <- predict(fit.tr.pr, data=trainD, type='class')
train.out # 학습데이터 개별 관찰치를 분류규칙을 통해 분류해 봄

## 학습데이터 response 패턴과 분류규칙 분류패턴간 교차분석
train.result <- table(train.out, trainD$response,
                      dnn=c("TrainRule", "TrainActual"))
train.result

## 훈련데이터 상의 실제고객의 반응(분류)패턴 분포확인


addmargins(train.result) 
# 원래 학습(tainD)데이터 존재하는 실제 response 패턴과
# 학습데이터에서 도출한 분류규칙을 이용해 학습데이터를 분류해보고 
# 이들간의 교차분석을 통해 분류규칙의 적용가능성을 파악

## 학습(train)데이터 분류결과 정확성(Accuracy) 평가
sum(train.result) 
diag(train.result) 
sum(diag(train.result))/sum(train.result) 

## --------------------------------------------
## 검증(test)데이터에 대한 분류분석
test.out <- predict(fit.tr.pr, newdata=testD, type='class')
test.out # 학습데이터 개별 관찰치를 분류규칙을 통해 분류해봄

## 검증데이터 response 패턴과 분류규칙 분류패턴간 교차분석
test.result <- table(test.out, testD$response,
                     dnn=c("TestPredicted", "TestActual"))
test.result

## 검증데이터 상의 실제고객의 반응(분류)패턴 분포확인
addmargins(table(testD$response))

addmargins(test.result)
# 원래 검증(testD)데이터 존재하는 실제 response 패턴과
# 학습데이터에서 도출한 분류규칙을 이용해 검증데이터를 분류해보고 
# 이들간의 교차분석을 통해 분류규칙에 대한 재검증(크로스체크)을 실시함

## 검증(test)데이터 분류결과 정확성(Accuracy) 평가
sum(test.result) 
diag(test.result) 
sum(diag(test.result))/sum(test.result) 

## --------------------------------------------
# 학습(tain)데이터와 검증(test)데이터 정확성 비교
x <- sum(diag(train.result))/sum(train.result) 
y <- sum(diag(test.result))/sum(test.result) 

compare <- c(x, y, y - x)
names(compare) <- c("trainAccuracy", "testAccuracy", "AccuracyGap")

compare
round(compare*100, 2)

## --------------------------------------------
## 혼동표 그리기 
library(caret)
confusionMatrix(test.result)


###################################################################
#### rpart패키지 rpart() 함수를 이용한 분류분석 실시
###################################################################

## 분류분석 패키지 설치 및 로딩
# install.packages("rpart")
library(rpart)

## 분류분석 모델 관계식 정의
fit.rp <- rpart(response ~. , data=trainD)
plot(fit.rp)
text(fit.rp)

## --------------------------------------------
#### 의사결정나무의 가지치기(prunning) 가능성 분석
## 분류결과의 복잡성파라미터(cp: complexity parameter)를 테이블로 확인
printcp(fit.rp)
# - 훈련데이터를 이용해 다양한 나무모양으로 분류한 다음 
#   그 분류적정성(오류정도)을 분석한 결과임
# - cp: 복잡성파라미터 값이 클수록 오분류가 많다는 의미임
# - nsplit: n분기를 가지는 나무모형을 의미함
# - rel error: n분기를 가지는 나무모형의 오류율(r: relative)
# - xerror: 10겹 교차검증(10-fold Cross Validation) 실시 오류율(x: cross)
# - xstd: 교차검증 오류의 표준오차

## 분류결과의 복잡성파라미터(cp: complexity parameter)를 그래프로 확인
plotcp(fit.rp)

## xerror가 가장 낮은 split 개수를 선택
fit.rp.pruned <- prune(fit.rp, 
                       cp= fit.rp$cptable[which.min(fit.rp$cptable[,"xerror"]),"CP"])
## cp - 복잡성지수 테이블, 그림에 있는것처럼 가지치기한다

## 가지치기 이후의 정제된 의사결정나무 
plot(fit.rp.pruned)
text(fit.rp.pruned)

## --------------------------------------------
## 분류규칙을 이용한 학습(train)데이터 분류분석
train.out <- predict(fit.rp.pruned, data=trainD, type='class')
train.out # 학습데이터 개별 관찰치를 분류규칙을 통해 분류해 봄

## 학습데이터 response 패턴과 분류규칙 분류패턴간 교차분석
train.result <- table(train.out, trainD$response,
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

## --------------------------------------------
## 검증(test)데이터에 대한 분류분석
test.out <- predict(fit.rp.pruned, newdata=testD, type='class')
test.out # 학습데이터 개별 관찰치를 분류규칙을 통해 분류해봄

## 검증데이터 response 패턴과 분류규칙 분류패턴간 교차분석
test.result <- table(test.out, testD$response,
                     dnn=c("TestPredicted", "TestActual"))
test.result

## 검증데이터 상의 실제고객의 반응(분류)패턴 분포확인
addmargins(table(testD$response))

addmargins(test.result)
# 원래 검증(testD)데이터 존재하는 실제 response 패턴과
# 학습데이터에서 도출한 분류규칙을 이용해 검증데이터를 분류해보고 
# 이들간의 교차분석을 통해 분류규칙에 대한 재검증(크로스체크)을 실시함

## 검증(test)데이터 분류결과 정확성(Accuracy) 평가
sum(test.result) 
diag(test.result) 
sum(diag(test.result))/sum(test.result) 

## --------------------------------------------
# 학습(tain)데이터와 검증(test)데이터 정확성 비교
x <- sum(diag(train.result))/sum(train.result) 
y <- sum(diag(test.result))/sum(test.result) 

compare <- c(x, y, y - x)
names(compare) <- c("trainAccuracy", "testAccuracy", "AccuracyGap")

compare
round(compare*100, 2)
# trainAccuracy  testAccuracy   AccuracyGap 
# 84.76         88.89          4.13 
## --------------------------------------------
## 혼동표 그리기 
library(caret)
confusionMatrix(test.result)
confusionMatrix(test.result, mode = "sens_spec")
confusionMatrix(test.result, mode = "prec_recall")
confusionMatrix(test.result, mode = "everything")

### End of Source #####################################################

#### 회귀예측 모델링 ##################################################
# stats::lm() 함수 이용 ## 수학 - 기울기
#######################################################################

### 문제시나리오: 지역과 주택 특성 데이터를 활용한 주택가격 산정규칙 도출
# (기본 의문사항)
# - 왜 주택가격에 차이가 나는 것일까?
# - 주택가격이 차이가 나도록 하는 특성요인은 무엇인가?

# (활용방안)
# - 구매예정 주택이 적정한 가격인지를 가격규칙을 통해 적정성 판단 
# - 개발예정 지역의 신설 주택단지에 대한 적정가격을 미리 산정해 마케팅에 활용
# - 주택가격을 높이기 위해 상대적으로 중요한 특성요인에 자원을 집중함

# -----------------------------------------------------------
### raw 데이터 준비
# - 투입변수: 1~13, 결과변수: 14
# - 범주형변수: 4(chas)
## -> LM 데이터를 연속형으로 오인할 수 있다. 
# - 연속형변수: 4(chas) 이외의 나머지 모든 투입변수


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
## 도시가 활성화(급여, 인구유입) -> 주택가격 상승, 기울기 등을 파악할 수 있다. 

raw <- read.csv("HousingData.csv", header=T, sep=",",
                stringsAsFactors = F, # 팩터화 없이 일반적 로딩 
                strip.white = T, # 데이터 요소별 좌우 공백 제거 
                na.strings = c("", "NA", "?")) # 결측치 인식

# plot(raw$medv)
# hist(raw$medv)
# shapiro.test(raw$medv)

# -----------------------------------------------------------
## raw 데이터 기본사항 조회
head(raw)
str(raw)
summary(raw)

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
## setdiff -> 차집합
## glims, str을 통해 데이터 구조를 확인
var_num <- setdiff(names(raw), c(var_dep, var_ctg))
var_num; NROW(var_num)
# - 데이터셋에서 종속변수와 독립변수 중 범주형 데이터를 제외



## 예측 분석
# 1. 수치예측
# 1.1. R^2 , AIC 
# 2. 분류예측
# 2.1 가로, 세로 방향 위치에 따라 성능매져 방법이 있다. 
# -----------------------------------------------------------
## 독립변수 중 범주형 변수컬럼을 일괄팩터화하는 사용자 정의함수 
to_factors <- function(df, cv) {
  for (i in cv){
    df[[i]] <- as.factor(df[[i]])
    }
  return(df)
}
## 벡터형 데이터를 매트릭스 형태로 형변환

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
#### 데이터 분할실시 (1) base::sample() 함수 이용 

## 샘플링 난수번호 설정
set.seed(2000)

## 전체 데이터를 60%, 20%, 20% 비율로 분할할 인덱스 추출
idx <- sample(x = 1:3, 
              size = NROW(raw), 
              replace = TRUE, 
              prob = c(0.6, 0.2, 0.2))
#  - 60%: 학습(training) 데이터
#  - 20%: 검증(validation) 데이터
#  - 20%: 테스트(test) 데이터

idx # 3가지 그룹으로 추출된 인덱스 번호
table(idx) # 추출된 3가지 인덱스그룹 갯수 확인

## 3가지 그룹별 인덱스를 활용한 데이터분할 실시
df_train <- raw[idx == 1, ] # 학습(training) 데이터 추출
df_valid <- raw[idx == 2, ] # 검증(validation) 데이터 추출
df_test <- raw[idx == 3, ] # 테스트(test) 데이터 추출

## 분할된 데이터셋 크기 비교
NROW(df_train); NROW(df_valid); NROW(df_test)

# -----------------------------------------------------------
#### 데이터 분할실시 (2) caret::createDataPartition() 함수 이용 
# install.packages("caret", dependencies = c("Depends", "Suggests"))
library(caret)

## 샘플링 난수번호 설정
set.seed(2000)

## sample 데이터는 인덱스를 강제 생성.
## createDataPartition는 row의 medv의 분포내용을 보고 60%를 추출한다. 
## range, 평균값등의 분포또한 고려되는 면에서 sample과 차이가 있다. 
## 분류 데이터의 경우에도 분할할때 신경써서 분류해준다. 
## 전체 데이터 중 60%를 학습(training) 데이터로 인덱스 추출 
idx_train <- createDataPartition(raw$medv, p = 0.60, list = FALSE)

## 나머지 중 50%(전체에서 20%)를 검증(validation) 데이터로 인덱스 추출
idx_valid <- createDataPartition(raw$medv[-idx_train], p = 0.50, list = FALSE)

## 3가지 그룹별 인덱스를 활용해 3개로 데이터 분할 실시
df_train <- raw[idx_train, ] # 학습(training) 데이터 
df_valid <- raw[-idx_train, ][idx_valid, ] # 검증(validation) 데이터 => 배열을 AND 조건으로 묶음
df_test <- raw[-idx_train, ][-idx_valid, ] # 테스트(test) 데이터

## 분할된 3개 데이터셋 크기 비교
NROW(df_train); NROW(df_valid); NROW(df_test)

# -----------------------------------------------------------
#### 데이터 분할실시 (3) dplyr::sample_frac() 함수 이용

## 샘플링 난수번호 설정
set.seed(2000)

# install.packages("dplyr")
library(dplyr)

df_train <- sample_frac(raw, size=0.60)
## createDataPartition - index 출력/ sample_frac - 컨텐츠 자체 출력
raw_rest <- dplyr::setdiff(raw, df_train, by = "medv")

df_valid <- sample_frac(raw_rest, size=0.50)
df_test <-  dplyr::setdiff(raw_rest, df_valid, by = "medv")

## 분할된 3개 데이터셋 크기 비교
NROW(df_train); NROW(df_valid); NROW(df_test)



#######################################################################
## 학습데이터 기본사항 조회
head(df_train)
str(df_train)
summary(df_train)

# -----------------------------------------------------------
## 변수간 상호관련성 분석

## 기본 산점도 그래프 
plot(df_train)

## install.packages("car") 활용 산점도
library(car)
scatterplotMatrix(df_train)

## install.packages("psych") 활용 산점도
library(psych)
pairs.panels(df_train, method = "pearson", hist.col = "#00AFBB",
             density = TRUE, ellipses = TRUE)

## PerformanceAnalytics 패키지이용 산점도
# install.packages("PerformanceAnalytics")
library(PerformanceAnalytics)
chart.Correlation(df_train, histogram=TRUE, pch=19)

#######################################################################
##### 선형 회귀모델을 이용한 수치예측
##### linear regression model with stats::lm()
#######################################################################

### 기본 선형회귀 모델설정
lm_fit <- lm(medv ~ ., data = df_train)
# - 60%의 학습데이터를 활용한 
#   주택가격 수치예측을 위한 규칙을 도출함

## 회귀계수 확인: 각 계수별 크기, 방향성 확인
lm_fit
length(coef(lm_fit)) 
# - 기본 회귀모델의 투입변수 갯수 확인

## 회귀계수와 로짓분석 모델의 통계적 유의성 확인
summary(lm_fit) 
# - 어떠한 투입변수가 주택가격 예측을 위한 
#   설명력 크기, 방향성, 통계적 유의성을 가지는 피처가 되는지 확인
# - 전체회귀모형의 설명력 크기 및 통계적 유의성 확인

## 회귀분석에 사용한 투입변수 중요도 계산
library(caret)
varImp(lm_fit)

### lm함수로 인해 나온 수치를 해석하여 분석 varImp
vi <- varImp(lm_fit)
vi <- data.frame(var = rownames(vi), imp = vi$Overall)
vi

## 서울대를 몇명을 보내는지, 학원이 몇개인지 등 변수를 추가하면 
## Rsqure라던가 성능의 값이 변한다. 
## 있는 변수 중 2개를 선택하여 상호호환을 이용하여 주택가격에 민감한 패턴을 찾을 수 있다. 

ggplot(vi, aes(x = imp, y = reorder(var, imp))) +
  geom_point(color = "red")

#######################################################################
### 2차상호작용 선형회귀모델 도출(linear regression model) 
#######################################################################
## ^2로하면 상호작용효과로 처리
lm_d2_fit <- lm(medv ~ .^2, data = df_train)
# - 기본 선형회귀 모델에 투입한 독립변수들의 
#   상호작용까지를 고려한 모델로 예측력을 높일 수 있음
# - 60%의 학습데이터를 활용해 
#   주택가격 수치예측을 위한 규칙을 도출함

## 회귀계수 확인: 각 계수별 크기, 방향성 확인
lm_d2_fit

length(coef(lm_d2_fit)) 
# [1] 92 독립변수 모델이 92까지 확장됨
# - 2차상호작용 모델의 투입변수 갯수 확인

## 회귀계수와 로짓분석 모델의 통계적 유의성 확인
summary(lm_d2_fit) 
# - 어떠한 투입변수가 주택가격 예측을 위한 
#   설명력 크기, 방향성, 통계적 유의성을 가지는 피처가 되는지 확인
# - 전체회귀모형의 설명력 크기 및 통계적 유의성 확인
# crime:chas1     42.78428    9.53423   4.487 1.18e-05 ***

## 회귀분석에 사용한 투입변수 중요도 계산
library(caret)
varImp(lm_d2_fit)

vi <- varImp(lm_d2_fit)
vi <- data.frame(var = rownames(vi), imp = vi$Overall)
vi
ggplot(vi, aes(x = imp, y = reorder(var, imp))) +
  geom_point(color = "red")
## crime:chas1 3.14976980 유력하다
#######################################################################
## 회귀모델에 활용가능한 변수를 단계별로 자동선택

## (독립변수 투입범위설정)
# upper = ~ .^2
# - 기본 회귀모델 투입변수들과 2차상호작용 변수까지 있는 모델(최대2개까지)
# lower = ~ 1
# - 기본 회귀모델에서 투입변수가 없는 상수항만 있는 모델

## 단계별 투입을 통해 넣다 뺏다 하면, 
## 
# -----------------------------------------------------------
## (방법1) stats::step() 함수이용
lm_step_fit <- step(lm_fit, 
                    scope = list(upper = ~ .^2, lower = ~ 1))
# trace = 0 옵션사용하면 출력과정 안나옴

## (방법2) MASS::stepAIC() 함수이용
# install.packages("MASS")
library(MASS)
lm_step_fit <- stepAIC(lm_fit,
                       scope = list(upper = ~ .^2, lower = ~ 1))
# trace = 0 옵션사용하면 출력과정 안나옴

# -----------------------------------------------------------
lm_step_fit 
# - 단계별 투입을 통해 도출한 최적화 모형과 회귀 계수 확인

anova(lm_step_fit)
# - 단계별 투입을 통해 도출한 최적화 모형의 
#   투입변수별 회귀계수 크기, 방향, 통계적 유의성 확인

summary(lm_step_fit)
# - 단계별 투입을 통해 도출한 최적화 모형의 
#   투입변수별 회귀계수 크기, 방향, 통계적 유의성 확인
#   그리고, 최적화모형의 설명력크기와 통계적 유의성 확인

length(coef(lm_step_fit))
# - 최적화 모형에 선정된 회귀계수 갯수확인

## 최적화 모형에 사용한 투입변수 중요도 계산
library(caret)
varImp(lm_step_fit)

vi <- varImp(lm_step_fit)
vi <- data.frame(var = rownames(vi), imp = vi$Overall)
vi
ggplot(vi, aes(x = imp, y = reorder(var, imp))) +
  geom_point(color = "red")

#######################################################################
## 훈련데이터로 학습한 모델간 평가
## 선형/ 예측력의 무의미한 값을 제거한 모델
AIC(lm_fit);AIC(lm_d2_fit);AIC(lm_step_fit);
BIC(lm_fit);BIC(lm_d2_fit);BIC(lm_step_fit);

summary(lm_fit)$adj.r.squared
summary(lm_d2_fit)$adj.r.squared
summary(lm_step_fit)$adj.r.squared


#######################################################################
## 60% 학습데이터(df_train)로 학습한 다양한 회귀모델을 
## 검증데이터(df_valid)에 적용해 수치예측 실시

# ------------------------------
## (0) 검증데이터에 있는 실제 주택가격 수치값
df_valid$medv

## (1) 기본 회귀모델을 활용한 검증데이터 수치예측
lm_pred_valid <- predict(lm_fit, newdata = df_valid)
lm_pred_valid

## (2) 2차상호작용 회귀모델을 활용한 검증데이터 수치예측
lm_d2_pred_valid <- predict(lm_d2_fit, newdata = df_valid)
lm_d2_pred_valid

## (3) 단계별 변수선택 회귀모델을 활용한 검증데이터 수치예측
lm_step_pred_valid <- predict(lm_step_fit, newdata = df_valid)
lm_step_pred_valid

#######################################################################
## 검증데이터 대상 회귀모델간 수치예측 성능평가
# - 다양한 회귀모델에서 도출한 주택가격 예상수치와 
#   검증데이터(df_valid)에 있는 주택가격 실제수치와 
#   오차정도를 계산해서 비교함
# - 오차값이 작을 수록 수치예측력이 우수한 회귀모델임

## (1) caret::defaultSummary() 함수이용 성능평가
# 기본 회귀모델
lm_perf_valid <- 
  defaultSummary(data.frame(obs = df_valid$medv,
                            pred = lm_pred_valid))
# 2차상호작용 모델
lm_d2_perf_valid <- 
  defaultSummary(data.frame(obs = df_valid$medv, 
                            pred = lm_d2_pred_valid))
# 단계별 변수선택 모델
lm_step_perf_valid <- 
  defaultSummary(data.frame(obs = df_valid$medv, 
                            pred = lm_step_pred_valid))

## 3개 모델간 성능비교 
out_valid <- rbind(lm_perf_valid, lm_d2_perf_valid, lm_step_perf_valid)
out_valid 
# - Rsquared(설명력): lm_step_fit 모델이 가장 큼
## => 절대값을 줌
# - RMSE(평균제곱근오차): lm_step_fit 모델이 가장 작음
## 차이나는 부분을 더하고 루트를 씌어서 비교 
## 실제 validation 모형안에 들어 있던 각각의 모델을 봤을때 위에서부터 $4.2 가격이 난다.
# - MAE(평균절대오차): lm_step_fit 모델이 가장 작음
# ==> 종합적으로 lm_step_fit 모델을 선택함
## lm_step_perf_valid가 제일 좋게 나옴
## RMSE 는 작을수록 Rsquared, MAE는 작을수록 좋다

# -----------------------------------------------------------
## (2) Metrics::rmse(), Metrics::mae() 함수이용 성능평가
 install.packages("Metrics")
library(Metrics)

# RMSE(Root mean squared error): 평균제곱근오차 비교
rmse(df_valid$medv, lm_pred_valid) # 기본 회귀모델
rmse(df_valid$medv, lm_d2_pred_valid) # 2차상호작용 모델 
rmse(df_valid$medv, lm_step_pred_valid) # 단계별 변수선택 모델

# MAE(Mean Absolute Error): 평균절대오차 비교
mae(df_valid$medv, lm_pred_valid) # 기본 회귀모델
mae(df_valid$medv, lm_d2_pred_valid) # 2차상호작용 모델 
mae(df_valid$medv, lm_step_pred_valid) # 단계별 변수선택 모델

#######################################################################
## 테스트셋을 대상으로 최종적으로 모델간 성능평가

# ------------------------------
## (1) 기본 회귀모델을 활용한 검증데이터 수치예측
lm_pred_test <- predict(lm_fit, newdata = df_test)
lm_pred_test

## (2) 2차상호작용 회귀모델을 활용한 검증데이터 수치예측
lm_d2_pred_test <- predict(lm_d2_fit, newdata = df_test)
lm_d2_pred_test

## (3) 단계별 변수선택 회귀모델을 활용한 검증데이터 수치예측
lm_step_pred_test <- predict(lm_step_fit, newdata = df_test)
lm_step_pred_test

#######################################################################
## 테스트셋을 대상으로 예측모델간 오류와 설명력 비교 

## (1) caret::defaultSummary() 함수이용 성능평가
# 기본 회귀모델
lm_perf_test <- 
  defaultSummary(data.frame(obs = df_test$medv,
                            pred = lm_pred_test))
# 2차상호작용 모델
lm_d2_perf_test <- 
  defaultSummary(data.frame(obs = df_test$medv, 
                            pred = lm_d2_pred_test))
# 단계별 변수선택 모델
lm_step_perf_test <- 
  defaultSummary(data.frame(obs = df_test$medv, 
                            pred = lm_step_pred_test))

## 3개 모델간 성능비교 
out_test <- rbind(lm_perf_test, lm_d2_perf_test, lm_step_perf_test)
out_test
# - Rsquared(설명력): lm_step_fit 모델이 가장 큼
# - RMSE(평균제곱근오차): lm_step_fit 모델이 가장 작음
# - MAE(평균절대오차): lm_step_fit 모델이 가장 작음
# ==> 종합적으로 lm_step_fit 모델을 선택함

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
par(mfrow=c(2, 3))

plot(lm_step_fit, which=c(1:6))

par(mfrow=c(1, 1))

# -----------------------------------------------------------
## 회귀분석 모델진단 그래프: 개별 출력

## (1) 선형성(Linearity) 가정: 독립변수와 종속변수간 선형관계인지 파악
# - 투입/예측/설명/독립변수와 산출/결과/반응/종속변수 관계가 
#   선형적인지 확인
# - 개별 투입변수가 종속변수와 상관성이 있는지 
#   상관관계 그래프(scatter matrix plot)를 그려서
#   상관계수 정도와 선형적 직선의 모양/방향 확인

plot(lm_step_fit, which = 1) 
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

crPlots(lm_step_fit)

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
# - 반응(종속) 변수내의 데이터들이 서로(자기끼리) 아무런 관련성이 없어야 함
# - 무작위 샘플링을 통해서 데이터가 시간적/공간적/조건적
#   상황에 영향을 받지 않고 수집되어야 함

durbinWatsonTest(lm_step_fit)
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

plot(lm_step_fit, which = 2) 
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

plot(lm_step_fit, which = 3) 
# - 잔차들이 일정한 패턴 없이 무작위 대역(random band) 형태로 
#   나타나야 함 
# - 잔차들이 확장, 축소, 곡선형으로 일정 패턴을 보인다면
#   등분산에 부합하지 않은 것임
# - 표준화 잔차와 예측치 사이에 분산이 일정해야 함

ncvTest(lm_step_fit) # 등분산 검정
spreadLevelPlot(lm_step_fit) # 잔차진단

## 등분산성에 위배되었을 때
# - log 변환, 가중최소제곱법 적용

# -----------------------------------------------------------
## 영향관측치와 이상치 파악: 데이터에 아웃라이어 존재유무 파악
#  - 해당 관찰치에 대한 제거후 다시 회귀모델 설정
plot(lm_step_fit, which = 4) 
# 어떤 관찰치가 영향관측치(influential observation)인지 파악

plot(lm_step_fit, which = 5) 
# 설명변수의 이상치 파악

plot(lm_step_fit, which = 6) 
# 영향관측치와 이상치 파악 

car::outlierTest(lm_step_fit) # 이상치 파악
car::influencePlot(lm_step_fit) # 영향치 파악

library(car)
qqPlot(lm_step_fit)

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
vif(lm_step_fit)
vif(lm_step_fit) > 10

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
# - 잔차의 제곱합을 계산하는 방식에 --> 회귀계수의 제곱합을 계산하는 방식 추가

# 라쏘회귀(Lasso regression)
# - 잔차의 제곱합을 계산하는 방식에 --> 회귀계수의 절대값을 계산하는 방식 추가
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
gvmodel <- gvlma(lm_step_fit)
summary(gvmodel)
# - Global Stat & Link Function: linearity 가정의 충족여부 판단기준 
# - Skewness & Kurtosis: normality 가정의 충족여부 판단기준 
# - Heteroscedasticity: constant variance 가정의 충족여부 판단기준  

### End of Source #####################################################

##########################################################################################
## 변수컬럼에 정규성이 부족할 때 변환하는 방법
##########################################################################################

## 예제 데이터셋 로딩
library(MASS)
data(mammals)
help(mammals)

# --------------------
## 데이터셋명 간단변환
mm <- mammals

## 데이터셋 간단조회
mm
head(mm)

str(mm)
library(tibble); glimpse(mm)

## 데이터셋 기술통계
summary(mm)
library(psych); psych::describe(mm)
library(skimr); skim(mm)

##########################################################################################
## 개별변수 탐색

# ----------------------------------------
## body 변수컬럼
mm$body

plot(mm$body)
boxplot(mm$body)

summary(mm$body)
psych::describe(mm$body)
shapiro.test(mm$body)
# - shapiro.test 결과 정규분포가 아닌 것으로 파악됨

# - (참고) 가설검정
# - 귀무가설: A = B (비교대상 A와 B가 서로 같다 / 효과차이가 없다)
# - 대립가설: A ≠ B (비교대상 A와 B가 서로 다르다 / 효과차이가 있다)
# 
# - 보통의 가설검정은 귀무가설이 맞다는 전체하에 검정하며, 
#   귀무가설이 맞으면, 귀무가설을 기각시키지 못하고, 대립가설을 채택하지 못함
# - 반대로 귀무가설이 맞지 않으면 이를 기각하고, 대응되는 대립가설을 채택하게 됨

# - 일반적인 가설검정 판단기준 허용한계치인 유의수준(α) = 0.05에 비해 
#   데이터셋을 분석한 유의확률(p-value)이 2.2e-16로 나와 
#   데이터분석 결과의 오류가능성이 훨씬 더 작은 상태임
# - 즉, <body분포 = 정규분포>라는 귀무가설을 기각하고, 
#   <body.tf분포 ≠ 정규분포>라는 대립가설을 채택해도 좋다는 의미임
# - 결론적으로, body 변수컬럼의 데이터분포는 정규분포라고 볼 수 없음

# --------------------
qqnorm(mm$body); qqline(mm$body)

hist(mm$body, freq = FALSE, nclass = 20, main = "62 mammals")
lines(density(mm$body), col = "red")

# install.packages ("rcompanion")
library (rcompanion)
plotNormalHistogram(mm$body)

library(ggplot2)
ggplot(mm, aes(x = body)) + geom_histogram(bins = 20)
ggplot(mm, aes(x = body)) + geom_density(fill = "red", alpha = 0.2)

ggplot(mm, aes(x = body)) + 
  geom_histogram(aes(y = ..density..), 
                 bin = 2, colour = "black", fill = "white") +
  geom_density(alpha = .2, fill = "#FF6666")

# - 오른쪽 꼬리분포

# ----------------------------------------
## brain 변수컬럼
mm$brain

plot(mm$brain)
boxplot(mm$brain)

summary(mm$brain)
psych::describe(mm$brain)
shapiro.test(mm$brain)

# --------------------
qqnorm(mm$brain); qqline(mm$brain)

hist(mm$brain, freq = FALSE, nclass = 20, main = "62 mammals")
lines(density(mm$brain), col="red")

# install.packages ("rcompanion")
library (rcompanion)
plotNormalHistogram(mm$brain)

library(ggplot2)
ggplot(mm, aes(x = brain)) + geom_histogram(bins = 20)
ggplot(mm, aes(x = brain)) + geom_density(fill = "red", alpha = 0.2)

ggplot(mm, aes(x = brain)) + 
  geom_histogram(aes(y = ..density..), 
                 bin = 2, colour="black", fill = "white") +
  geom_density(alpha = .2, fill = "#FF6666")

# - 오른쪽 꼬리분포

##########################################################################################
## 2개변수간 관계탐색

plot(body ~ brain, data = mm)
abline(lm(body ~ brain, data = mm), col = "red", lwd = 2, lty = 1)
lines(lowess(mm$body ~ mm$brain), col = "blue", lwd = 2, lty = 2)

# --------------------
ggplot(mm, aes(x = brain, y = body)) + 
  geom_point() +
  geom_smooth(span = 0.1)

ggplot(mm, aes(x = brain, y = body)) + 
  geom_point() +
  geom_smooth(spam = 0.2)

ggplot(mm, aes(x = brain, y = body)) + 
  geom_point() +
  geom_smooth(span = 0.5)

ggplot(mm, aes(x = brain, y = body)) + 
  geom_point() +
  geom_smooth(span = 1)

# - 2개 변수간 관계가 변동성이 큼

##########################################################################################
## 데이터 변환(Data Transform)을 통한 정규분포로 만들기 위한 방법

## 박스콕스(Box-Cox) 파워변환(거듭제곱/승수(Power))변환방식이용 
# - 원본 데이터 변수 x이든 y이든 치우침이나 이상치가 존재하는 경우 
#   이를 변환해 정규분포로 만들어 변수간의 관계를 명확하게 찾을 수 있는 가능성을 높이는 기법임
# - 수학적으로 x^λ로 교체하는 방식을 사용하며, 
#   여기서 람다(lamda)값, 승수를 얼마로 할지를 결정하는 것임

## car::powerTransform() 함수를 이용해 가장 가능성 있는 변환승수 람다값을 얻어냄
# install.packages("car")
library(car)

# (1) 추정된 승수(Est Power)값을 활용해 
#     원본 데이터 x를 x^(추정된 승수값) 방식으로 변환함

# (2) 또는 추정된 승수(Est Power)가 어떠한 람다값에 가까운지를 판단해서 
#     다음처럼 변환방식을 결정함 
# - 람다값 -2.0 --> 변환방식: 1 / x^2 거듭제곱 역수변환
# - 람다값 -1.0 --> 변환방식: 1 / x 역수변환
# - 람다값 -0.5 --> 변환방식: 1 / sqrt(x) 제곱근 역수변환 
# - 람다값  0.0 --> 변환방식: log(x) 로그변환 
# - 람다값  0.5 --> 변환방식: sqrt(x) 제곱근변환
# - 람다값  1.0 --> 변환방식: 불필요
# - 람다값  2.0 --> 변환방식: x^2 거듭제곱변환 

# (3) 일반적인 데이터분포 변환방법
# - 우측 심한 꼬리분포 --> 1 / x 역수변환
# - 우측 중간 꼬리분포 --> log(x) 로그변환
# - 우측 일반 꼬리분포 --> sqrt(x) 제곱근변환, x^(1/3) 세제곱근변환
# - 좌측 일반 꼬리분포 --> x^2 제곱변환
# - 좌측 중간 꼬리분포 --> x^3 세제곱변환
# - 좌측 심한 꼬리분포 --> e^x 지수변환

## rcompanion::transformTukey() 함수를 이용하면
#  변환승수 람다값과 Shapiro.test결과, 
#  그리고 원본 데이터 x에 변환승수 람다값을 적용해 변환한 결과데이터를 확인할 수 있음 

# ----------------------------------------
## body 변수컬럼 데이터변환

## 변환승수 람다값 결정

# (1) car::powerTransform() 함수이용
powerTransform(mm$body) %>% summary
# - 추정된 승수(Est Power)값이 -0.0196이므로 
#   람다값 0.0에 근사하는 것으로 간주할수 있어
#   log(x) 변환방식을 사용하면 될 것으로 판단됨

# - 람다 테스트 결과에서도 
#   lambda = (0) 일때 p-value = 0.59702이므로 <람다값 = 0>으로 볼 수 있음 
# - lambda = (1) 일때 p-value < 2.22e-16이므로 <람다값 = 1>이라고 보기 어려움

# - 또는 추정된 승수(Est Power)를 그대로 활용해서 x^(-0.0196)방식으로 변환해도 됨

# --------------------
## body변수 변환
mm$body.tf <-log(mm$body)
mm$body.tf <-mm$body^(-0.0196)

mm$body.tf

plot(mm$body.tf)
boxplot(mm$body.tf)

summary(mm$body.tf)
psych::describe(mm$body.tf)
shapiro.test(mm$body.tf)
# - shapiro.test 결과 정규분포인 것으로 파악됨

# - (참고) 가설검정
# - 귀무가설: A = B (비교대상 A와 B가 서로 같다 / 효과차이가 없다)
# - 대립가설: A ≠ B (비교대상 A와 B가 서로 다르다 / 효과차이가 있다)
# 
# - 보통의 가설검정은 귀무가설이 맞다는 전체하에 검정하며, 
#   귀무가설이 맞으면, 귀무가설을 기각시키지 못하고, 대립가설을 채택하지 못함
# - 반대로 귀무가설이 맞지 않으면 이를 기각하고, 대응되는 대립가설을 채택하게 됨

# - 일반적인 가설검정 판단기준 허용한계치인 유의수준(α) = 0.05에 비해 
#   데이터셋을 분석한 유의확률(p-value)이 0.727로 나와 
#   데이터분석 결과의 오류가능성이 훨씬 더 큰 상태임
# - 즉, <body.tf분포 = 정규분포>라는 귀무가설을 기각하고, 
#   <body.tf분포 ≠ 정규분포>라는 대립가설을 채택하면 오류가능성이 크다는 의미임
# - 결론적으로, body.tf 변수컬럼의 데이터분포는 정규분포라고 볼 수 있음

# --------------------
qqnorm(mm$body.tf); qqline(mm$body.tf)

hist(mm$body.tf, freq = FALSE, nclass = 20, main = "62 mammals")
lines(density(mm$body.tf), col="red")

# install.packages ("rcompanion")
library (rcompanion)
plotNormalHistogram(mm$body.tf)

library(ggplot2)
ggplot(mm, aes(x = body.tf)) + geom_histogram(bins = 20)
ggplot(mm, aes(x = body.tf)) + geom_density(fill = "red", alpha = 0.2)

ggplot(mm, aes(x = body.tf)) + 
  geom_histogram(aes(y = ..density..), 
                 bin = 2, colour="black", fill = "white") +
  geom_density(alpha = .2, fill = "#FF6666")

# - 오른쪽 꼬리분포가 정규분포로 변환됨

# (2) rcompanion::transformTukey() 함수이용
transformTukey(mm$body)

# - 변환승수 lamda = -0.025가 나왔으며, 
#   이를 적용해 변환한 결과데이터에 대한 shapiro.test에서는 p.value=0.8032로
#   정규분포 특성을 가진 것으로 검증됨

# ----------------------------------------
## brain 변수컬럼 데이터변환

## 변환승수 람다값 결정

# (1) car::powerTransform() 함수이용
powerTransform(mm$brain) %>% summary
# - 추정된 승수(Est Power)값이 -0.0078이므로 
#   람다값 0.0에 근사하는 것으로 간주할수 있어
#   log(x) 변환방식을 사용하면 될 것으로 판단됨

# - 람다 테스트 결과에서도 
#   lambda = (0) 일때 p-value = 0.87201이므로 <람다값 = 0>으로 볼 수 있음 
# - lambda = (1) 일때 p-value < 2.22e-16이므로 <람다값 = 1>이라고 보기 어려움

# - 또는 추정된 승수(Est Power)를 그대로 활용해서 x^(-0.0078)방식으로 변환해도 됨

# --------------------
## brain변수 변환
mm$brain.tf <-log(mm$brain)
mm$brain.tf <-mm$body^(-0.0078)

mm$brain.tf

plot(mm$brain.tf)
boxplot(mm$brain.tf)

summary(mm$brain.tf)
psych::describe(mm$brain.tf)
shapiro.test(mm$brain.tf)
# - shapiro.test 결과 
#   유의수준(α) = 0.05에 비해 데이터셋을 분석한 유의확률(p-value)이 0.727로 나와 
#   데이터분석 결과의 오류가능성이 훨씬 더 큰 상태임
# - 즉, <brain.tf분포 = 정규분포>라는 귀무가설을 기각하고, 
#   <brain.tf분포 ≠ 정규분포>라는 대립가설을 채택하면 오류가능성이 크다는 의미임
# - 결론적으로, brain.tf 변수컬럼의 데이터분포는 정규분포라고 볼 수 있음

# --------------------
qqnorm(mm$brain.tf); qqline(mm$brain.tf)

hist(mm$brain.tf, freq = FALSE, nclass = 20, main = "62 mammals")
lines(density(mm$brain.tf), col = "red")

# install.packages ("rcompanion")
library (rcompanion)
plotNormalHistogram(mm$brain.tf)

library(ggplot2)
ggplot(mm, aes(x = brain.tf)) + geom_histogram(bins = 20)
ggplot(mm, aes(x = brain.tf)) + geom_density(fill = "red", alpha = 0.2)

ggplot(mm, aes(x = brain.tf)) + 
  geom_histogram(aes(y = ..density..), 
                 bin = 2, colour="black", fill = "white") +
  geom_density(alpha = .2, fill = "#FF6666")

# - 오른쪽 꼬리분포가 정규분포로 변환됨

# (2) rcompanion::transformTukey() 함수이용
transformTukey(mm$brain)

# - 변환승수 lamda = 0이 나왔으며, 
#   이를 적용해 변환한 결과데이터에 대한 shapiro.test에서는 p.value=0.697로
#   정규분포 특성을 가진 것으로 검증됨


##########################################################################################
## 로그변환된 2개변수간 관계탐색

plot(body.tf ~ brain.tf, data = mm)
abline(lm(body.tf ~ brain.tf, data = mm), col = "red", lwd = 2, lty = 1)
lines(lowess(mm$body.tf ~ mm$brain.tf), col = "blue", lwd = 2, lty = 2)

# --------------------
ggplot(mm, aes(x = brain.tf, y = body.tf)) + 
  geom_point() +
  geom_smooth(span = 0.1)

ggplot(mm, aes(x = brain.tf, y = body.tf)) + 
  geom_point() +
  geom_smooth(spam = 0.2)

ggplot(mm, aes(x = brain.tf, y = body.tf)) + 
  geom_point() +
  geom_smooth(span = 0.5)

ggplot(mm, aes(x = brain.tf, y = body.tf)) + 
  geom_point() +
  geom_smooth(span = 1)

# - 2개 변수간 관계가 안정적으로 관찰됨

##########################################################################################
## Quiz

## UsingR::cfb 데이터셋 중에서
# - 소득(INCOME) 대비 저축(SAVING) 변수간 관계를 탐색하시오.
# - 단, 2개 변수컬럼에서 0 관찰치는 제외하는 것으로 함

### End of Source ########################################################################

######################################################################
## 수치예측(회귀분석) 중 정규화(regualization)와 축소(Shrinkage) 회귀모델
######################################################################

## 일반회귀분석의 가정조건: 다중공선성(Multicollinearity) 문제

## 다중공선성이 있는 경우 --> 예측변수가 늘어날 수록 variance가 커지는 문제발생
# - 고전적인 선형회귀모델에서는 회귀계수 추정을 위해 잔차의 제곱합을 계산하는 
#   일종의 비용함수를 만들어서 비용함수가 최소가 되는 회귀계수를 추정하게 됨
# - 하지만 다중공선성이 있는 독립변수들이 투입된 상태의 비용함수에서는
#   회귀계수의 영향력이 과다추정될 수 있음
# - 분산팽창지수 vif(Variance Inflation Factor) 값이 10 이상이면
#   독립변수들간 강한 상관관계가 존재해 종속변수의 수치예측에 영향을 미침
# - 다중 공선성은 모형의 일부 예측 변수가 다른 예측 변수와 상관되어 있을 때 
#   발생하는 조건으로 회귀계수의 분산을 증가시켜 과다추정 계수를 만듬
# - 예측변수와 반응변수 간에 유의한 관계가 있음에도 없는 것처럼 보이게 함
# - 높은 상관 관계가 있는 예측변수의 계수 부호가 반대방향으로 나타나게 함

# ----------------------------------------
## [A] 정규화(regularization)와 축소(Shrinkage) 회귀모델
# - 일반적 선형회귀계수에 대한 제약조건/벌점/페널티을 추가함으로써 
#   과최적화를 막는 방법으로 Regularized Method, Penalized Method, 
#   Contrained Least Squares라고도 함
# - 고전적인 선형회귀모델의 회귀계수 추정시 사용하는
#   잔차의 제곱의 합을 계산하는 비용함수에 페널티(regularization) 함수라는 
#   추가적인 수식을 붙여 회귀계수값들의 과다추정을 막고, 오버피팅도 방지함
# - 기존의 잔차제곱합을 계산하는 비용함수에 페널티를 어떻게 줄 것인지에 따라
#   여러 개의 세부적인 회귀분석으로 나누어짐
# - 데이터의 갯수에 비해 독립변수의 개수가 많을 때도 이런방식을 사용할 수 있음

# (1) 릿지;능형(Ridge) 회귀모델
# - 회귀계수 추정에 따른 잔차의 제곱합을 최소화하는 계산방식에다가  
#   --> 회귀계수의 제곱합(squared sum of weights)을 최소화하는 제약조건 추가
# - Ridge 모형은 예측변수들의 회귀계수를 한꺼번에 축소시키면서
#   가중치가 클 수록 큰 페널티를 부과해 오버피팅을 억제하는 효과가 있는데,
#   이를 L2 regularization(벌점;페널티) 특성을 가짐
# - 능형회귀는 변수가 많아 높은 분산을 가지는 상황에서 
#   계수의 크기가 거의 동일한 크기일 때 성능이 좋음

# (2) 라쏘(LASSO) 회귀모델(Least Absolute Shrinkage and Selection Operator) 
# - 회귀계수 추정에 따른 잔차의 제곱합을 최소화하는 계산방식에다가  
#   --> 회귀계수의 절대값의 합을 최소화하는 제약조건 추가
# - Lasso 모형은 일부 예측변수의 회귀계수가 먼저 0으로 수렴하는 특성을 가짐
# - 작은 가중치(회귀계수)들은 거의 0으로 수렴하게 되며, 몇 개의 중요한 
#   가중치만 남게되므로 피처선택(feature selection) 효과가 있는데, 
#   이를 L1 regularization(벌점;페널티)이라고 함
# - 적은 수의 설명변수가 상당히 큰 계수를 가질때 잘 작동함

# (3) 엘라스틱넷(Elastic Net) 회귀모델
# - Lasso와 Ridge의 제약조건을 결합한 모형으로 
#   가중치의 절대값의 합과 제곱합을 동시에 최소화하는 제약조건을 가짐

# ----------------------------------------
## [B] 데이터 축소(Data reduction) 방식
# 
# (1) PCR(Principal Component Regression)
# - 독립변수들의 주성분을 추출/이용해 회귀모델을 만듬
# - 주성분들이 서로 직교하므로 다중공선성 발생하지 않음
# - 상위 몇 개 주성분만 이용할 경우 라쏘처럼 일종의 regualization 효과를
#   발생시켜 모델이 오버피팅 현상도 완화됨
# - 그러나 모델 해석은 어려울 수 있음

# (2) PLS(Partial Least Square) regression
# - PCR과 비교했을 때 변수변환 방식에서 차이가 남
# - PCR: 독립변수의 분산을 최대로 하는 축을 찾아 
#        데이터를 전사(projection)하는 방식으로 독립변수만 변형함
# - PLS: 종속변수와 독립변수의 관계를 가장 잘 설명해주는 축을 찾아 
#        전사하는 방식으로 종속변수와 독립변수 모두를 변형함

######################################################################

## 패키지 일괄설치&로딩용 사용자정의 함수설정
mypak <- function (pkg) {
  new.pkg <- pkg[!(pkg %in% installed.packages()[, "Package"])]
  if (length(new.pkg)) install.packages(new.pkg, dependencies  =  TRUE)
  sapply(pkg, require, character.only  =  TRUE) 
}
# - 각 패키지 로딩결과도 콘솔창에 TRUE/FALSE로 나옴

## mypak 사용자정의함수 사용
packages <- c("rsample", "glmnet", "dplyr", "ggplot2", 
              "skimr", "AmesHousing", "tibble")
mypak(packages)


## 예제 데이터셋 로딩
library(AmesHousing)
data(package = "AmesHousing")
help(package = "AmesHousing")

## 데이터셋 분할
set.seed(123)
ames_split <- initial_split(AmesHousing::make_ames(), 
                            prop = 0.7, strata = "Sale_Price")
ames_split

ames_train <- training(ames_split)
ames_train
str(ames_train)
skim(ames_train)

ames_test <- testing(ames_split)
ames_test
str(ames_test)
skim(ames_test)

######################################################################
## 다중공선성 여부 확인

# 2개 예측변수를 사용한 다중회귀분석
lm(Sale_Price ~ Gr_Liv_Area + TotRms_AbvGrd, data = ames_train)
# - 예측변수: Gr_Liv_Area(지상생활면적) + TotRms_AbvGrd(총방수)
# - 반응변수: Sale_Price(판매가격)
# - Gr_Liv_Area의 회귀계수값은 플러스(+) 방향이라 판매가격을 높이는 것으로,
#   TotRms_AbvGrd의 회귀계수값은 마이너스(-) 방향이라 판매가격을 낮추는 것으로
#   해석할 수 있음
# - 그러나 통상적으로 TotRms_AbvGrd(총방수)가 늘어나면 주택의 판매가격도
#   늘어나는 것이 상식인데, 지금의 다중회귀모형은 반대 회귀계수로 나타남
# - 회귀계수의 방향성에 문제점이 있으므로 다중공선성 의심을 가질 수 있음

## 1개 예측변수를 사용한 단순회귀분석

lm(Sale_Price ~ Gr_Liv_Area, data = ames_train)
# - Gr_Liv_Area(지상생활면적)의 회귀계수값이 플러스(+) 방향이라
#   주택가격을 높이는 요소로 판단됨

lm(Sale_Price ~ TotRms_AbvGrd, data = ames_train)
# - TotRms_AbvGrd(총방수)의 회귀계수값이 플러스(+) 방향이라
#   주택가격을 높이는 요소로 판단됨

# -> 2개의 예측변수를 개별적으로 투입하는 단순회귀분석에서 
#     각각 회귀계수가 유의미한 방향과 크기로 관찰이 되었음
# -> 2개 예측변수를 동시에 투입한 다중회귀분석에서는 
#    개별 변수별 예측력과 방향성에 차이를 보이고 있음

## 2개 예측변수간 상관성파악
cor(ames_train$Gr_Liv_Area, ames_train$TotRms_AbvGrd)
# - r = +0.801로서 2개 예측변수간 상관성이 매우 큼
# - 이런 상태에서 다중회귀분석에 같이 투입되면
#   2개 변수간 다중공선성이 발생해 각 변수들의 회귀계수가 팽창되어 
#   과다추정되거나 방향성이 달라질 수 있으므로
#   결국 종속변수의 예측에 오류가 커짐

######################################################################
## 정규화(regularization) 회귀분석 이용

# - 정규화 된 회귀는 계수의 크기에 대한 제약을 가하고 
#   점차적으로 0으로 축소하는 방식사용
# - 제약 조건은 계수의 크기와 변동을 줄이는 데 도움이되며 
#   모델의 분산을 줄여 예측력의 일관성을 유지해 줌

## 정규화 회귀모델의 조율파라미터(tuning parameter): lambdas(람다)
# - 회귀모델의 각 피처별 회귀계수의 과다추정을 막기위해서
#   수축패널티를 0에서 무한까지 조절하면 
#   예측모델의 편향과 분산값 사이의 절충(trade-off)이 발생함 
# - 이 둘의 합인 검정MSE가 최소인 지점을 찾게 되고 
#   이 때의 계수 추정치를 구해 줌

## 정규화 회귀모델 분석을 위한 glmnet::glmnet() 함수사용
# - glmnet()에는 관계식(formula) 방식인 ( y ~ x)를 사용하지 않음
# - model.matrix()를 사용해 알고리즘에 피팅하기전에 
#   특성 및 대상 집합을 만들어 줌
# - 이 함수에서는 기본적으로 예측 변수를 표준화(스케일링) 
#   (standardize = FALSE 일 경우에는 비표준화)해주며,
#   질적 변수는 자동으로 더미 인코딩해줌 
# - 반응 변수는 필요시 데이터변환(예: log적용)을 통해 
#   데이터의 분포모양을 안정화시킴

## glmnet()함수의 alpha 파라미터
# - alpha 파라미터의 값에 따라 페널티를 부여하는 정도를 다르게 설정함
# - alpha = 0 --> ridge regression model
# - alpha = 1 --> lasso regression model
# - alpha = 0 ~ 1 --> elastic net model

######################################################################
## 릿지회귀(ridge regression)

## 데이터 모델링
# - 훈련데이터셋과 테스트데이터셋의 예측변수들을 행렬데이터로 생성함
# - 반응변수는 왜도가 심해 log변환을 통해 벡터데이터로 생성함
# - 투입되는 피처와 반응변수간 순수한 관계를 보기위해 
#   상수항(intercept)은 제외시킴

# 훈련데이터셋 모델링
ames_train_x <- model.matrix(Sale_Price ~ ., ames_train)[, -1]
ames_train_y <- log(ames_train$Sale_Price)

str(ames_train_x)
str(ames_train_y)

# 테스트데이터셋 모델링
ames_test_x <- model.matrix(Sale_Price ~ ., ames_test)[, -1]
ames_test_y <- log(ames_test$Sale_Price)

str(ames_test_x)
str(ames_test_y)

# ----------------------------------------
## 릿지모델에 훈련데이터 피팅
ames_ridge <- glmnet(x = ames_train_x, 
                     y = ames_train_y,
                     alpha = 0)
# - alpha = 0이므로 정규화회귀모델 중 릿지모델 파라미터 설정임
# - 또한 lambdas(람다)라는 벌점 파라미터는 
#   디폴트로 lambda = 100으로 설정된 상태임 
# - 릿지못델에 훈련데이터가 피팅될 때마다 자동생성된 100개 람다값이 투입되므로
#   예측모델도 100개 정도가 만들어 지게 됨

plot(ames_ridge, xvar = "lambda")
# - 람다값이 커질수록 각 예측모델별 피처들의 
#   회귀계수 추정치가 거의 0으로 수렴함
# - 플롯상단의 숫자 299는 100개 예측모델을 구성하고 있는 피처갯수인데,
#   릿지모델은 중요도가 낮은 피처들의 회귀계수 추정치를 0에 가깝게 만들지만
#   예측모델에서 제외하지는 않는다는 것을 알 수 있음

# ----------------------------------------
## 릿지모델 피팅결과 확인

## lambdas(람다) 페널티 파라미터 조회
ames_ridge$lambda
range(ames_ridge$lambda); NROW(ames_ridge$lambda)
# - 릿지모델에 훈련데이터 피팅시 적용된 lambdas(람다) 페널티 파라미터들로
#   디폴트로 100개 정도의 값이 자동설정되었음을 알 수 있음

## 피처별 회귀계수 추정지 변화확인
coef(ames_ridge) 
# - glmnet() 함수에서는 lambdas(람다) 파라미터값을 
#   가장 큰 λ(람다)값부터 가장 작은 값 순서로 나열하고
#   각 예측모델을 구성하는 피처들의 회귀계수 추정치도 같은 순서대로 보유함

options(scipen = 999)
coef(ames_ridge)[c("Gr_Liv_Area", "TotRms_AbvGrd"), 100]
coef(ames_ridge)[c("Gr_Liv_Area", "TotRms_AbvGrd"), 1] 
# - 2개 예측변수에 대한 회귀계수 추정치 변화
# - 람다값이 커질수록 예측변수의 회귀계수 추정치가 거의 0으로 수렴함

options(scipen = 0)
coef(ames_ridge)[c("Gr_Liv_Area", "TotRms_AbvGrd"), 100]
coef(ames_ridge)[c("Gr_Liv_Area", "TotRms_AbvGrd"), 1] 

# ----------------------------------------
## lambdas(람다) 페널티 파라미터 튜닝

# - lambdas(람다) 파라미터는 릿지모델에 훈련데이터 피팅시
#   오버피팅을 방지하기 위한 일종의 튜닝 매개 변수의 역할을 가짐
# - 최적의 lambdas(람다) 파라미터 설정상태를 식별하기 위해 
#   교차검증(CV)을 수행함

## 릿지모델에 훈련데이터 피팅시 교차검정 적용
ames_ridge <- cv.glmnet(x = ames_train_x,
                        y = ames_train_y,
                        alpha = 0)
# - cv.glmnet의 k-폴드 CV 기본옵션설정 값은 nfolds = 10임

plot(ames_ridge)
# - 플롯상단의 숫자 299는 예측모형에 투입된 변수숫자임
# - 이를 통해서 릿지모델 회귀분석에서는 투입된 피처들의 회귀계수 추정치를
#   0으로 설정하지 않으므로 모든 피처가 모형에 남아 있음을 알 수 있음
# - 첫 번째 수직점선은 100개 예측모델 중 최소 MSE(평균제곱오차)를 기록한 모델의
#   lambdas(람다)값 상태임
# - 두 번째 수직점선은 최소 MSE(평균제곱오차) 모델에 최소표준오차 내에서 
#   가장 큰 λ 값을 가진 위치를 나타냄

## 최소 MSE(평균제곱오차)를 기록한 모델
min(ames_ridge$cvm)
ames_ridge$lambda.min
# - 최소 표준오차(MSE)를 기록할 때의 lambdas(람다)값

## 최소 MSE모델의 표준오차내 모델
ames_ridge$cvm[ames_ridge$lambda == ames_ridge$lambda.1se]
ames_ridge$lambda.1se
# - 최소 MSE모델의 표준오차 범위내에 있는 모델 중 
#   가장 큰 람다값을 가진 모델의 lambdas(람다)값

# ----------------------------------------
## 최소 표준오차(MSE)를 모델 확인
ames_ridge_min <- glmnet(x = ames_train_x, 
                         y = ames_train_y,
                         alpha = 0)

plot(ames_ridge_min, xvar = "lambda")
abline(v = log(ames_ridge$lambda.1se), col = "red", lty = "dashed")

## 변수 중요도 파악
coef(ames_ridge, s = "lambda.1se") %>%
  tidy() %>%
  filter(row != "(Intercept)") %>%
  top_n(25, wt = abs(value)) %>%
  ggplot(aes(value, reorder(row, value))) +
  geom_point() +
  ggtitle("Top 25 influential variables") +
  xlab("Coefficient") +
  ylab(NULL)
# - 예측모델을 구성하는 피처를 모두 유지해야 하는 경우에는 릿지회귀모델을 사용
# - 회귀계수 추정치가 0에 수렴하는 중요도가 적은 가중치를 가지는 피처를 
#   제거해야할 필요가 있을 때에는 라소회귀모델을 적용하면 됨

######################################################################
## 라소회귀(lasso regression)

# - 릿지회귀모델은 벌점을 부과해 중요도가 낮은 피처의 회귀계수를 
#   거의 0에 가까운 수치로 만들어 줌 
# - 라소회귀모델은 벌점을 부과해 중요도가 낮은 피처의 회귀계수를 
#   0으로 만들어 줌으로써 자동화된 피처선택을 수행하고 예측력을 높여줌

## 데이터 모델링
# - 데이터분할은 앞서 릿지모델에서 분할된 훈련&테스트 셋을 그대로 사용함

# ----------------------------------------
## 라소모델에 훈련데이터 피팅
ames_lasso <- glmnet(x = ames_train_x, 
                     y = ames_train_y,
                     alpha = 1)
# - alpha = 1이므로 정규화회귀모델 중 라소모델 파라미터 설정임
# - 마찬가지로 lambdas(람다)라는 벌점 파라미터가 
#   디폴트로 lambda = 100으로 설정된 상태임 
# - 라소못델에 훈련데이터가 피팅될 때마다 자동생성된 100개 람다값이 투입되므로
#   예측모델도 100개 정도가 만들어 지게 됨

plot(ames_lasso, xvar = "lambda")
# - 람다값이 커질수록 각 예측모델별 피처들의 
#   회귀계수 추정치가 거의 0으로 수렴함
# - 플롯상단에 줄어들고 있는 숫자들은 100개 예측모델을 구성하고 있는 피처갯수인데,
#   람다값이 커지면서 예측모델을 구성하는 피처들중에서 중요도가 낮은 피처들은
#   회귀계수 추정치가 0에 수렴하면서 아예 예측모델에서 제외됨을 알 수 있음

# ----------------------------------------
## 라소모델 피팅결과 확인

## 라소모델에 훈련데이터 피팅시 교차검정 적용
ames_lasso <- cv.glmnet(x = ames_train_x,
                        y = ames_train_y,
                        alpha = 1)
# - cv.glmnet의 k-폴드 CV 기본옵션설정 값은 nfolds = 10임

plot(ames_lasso)
# - 플롯상단에 줄어들고 있는 숫자는 각 예측모델별로 선택된 피처갯수임
# - 이를 통해서 라소모델에서는 투입된 피처들의 중요도에 따라 회귀계수 추정치를 
#   0으로 만들 때도 있으므로 피처선택/제거도 같이 진행됨을 알 수 있음

# - 첫 번째 수직점선은 100개 예측모델 중 최소 MSE(평균제곱오차)를 기록한 모델의
#   lambdas(람다)값 상태임
# - 두 번째 수직점선은 최소 MSE(평균제곱오차) 모델에 최소표준오차 내에서 
#   가장 큰 λ 값을 가진 위치를 나타냄

## 최소 MSE(평균제곱오차)를 기록한 모델
min(ames_lasso$cvm) 
ames_lasso$lambda.min  
# - 최소 표준오차(MSE)를 기록할 때의 lambdas(람다)값

## 최소 MSE모델의 표준오차내 모델
ames_lasso$cvm[ames_lasso$lambda == ames_lasso$lambda.1se]
ames_lasso$lambda.1se 
# - 최소 MSE모델의 표준오차 범위내에 있는 모델 중 
#   가장 큰 람다값을 가진 모델의 lambdas(람다)값

# ----------------------------------------
## 최소 표준오차(MSE) 모델 확인
ames_lasso_min <- glmnet(x = ames_train_x, 
                         y = ames_train_y,
                         alpha = 1)

plot(ames_lasso_min, xvar = "lambda")
abline(v = log(ames_lasso$lambda.min), col = "red", lty = "dashed")
abline(v = log(ames_lasso$lambda.1se), col = "red", lty = "dashed")

## 변수 중요도 파악
coef(ames_lasso, s = "lambda.1se") %>%
  tidy() %>%
  filter(row != "(Intercept)") %>%
  ggplot(aes(value, reorder(row, value), color = value > 0)) +
  geom_point(show.legend = FALSE) +
  ggtitle("Influential variables") +
  xlab("Coefficient") +
  ylab(NULL)

######################################################################
## 릿지모델과 라소모델간 성능비교

# 릿지모델 최소 MSE
min(ames_ridge$cvm)

# 라소모델 최소 MSE확인
min(ames_lasso$cvm)

# --> 모델의 오류를 고려한 정확성 측면의 성능은 미세하게 릿지모델이 우수함
# --> 그러나 이정도의 오류차이가 큰 문제가 되지 않을 경우
#     예측모델의 간명성/단순성 측면에서는 라소모델의 사용성이 더 우수함

#####################################################################
## 엘라스틱넷(elastic net regression)

# - 릿지모델의 페널티와 라소모델의 패털티를 결합해서 부과하는 모델임

## 데이터 모델링
# - 데이터분할은 앞서 릿지모델에서 분할된 훈련&테스트 셋을 그대로 사용함


# ----------------------------------------
## glm() 함수를 이용한 정규화&축소회귀
# - alpha라는 파라미터에 따라 사용할 모델이 결정됨
# - alphs = 0: 릿지회귀
# - alphs = 1: 라소회귀
# - alphs = 0 ~ 1: 엘라스틱넷

## alpha 파라미터에 따른 정규화&축소 모델선택
ridge    <- glmnet(ames_train_x, ames_train_y, alpha = 0.0)
elastic1 <- glmnet(ames_train_x, ames_train_y, alpha = 0.25) 
elastic2 <- glmnet(ames_train_x, ames_train_y, alpha = 0.75) 
lasso    <- glmnet(ames_train_x, ames_train_y, alpha = 1.0) 

## 모델간 비교
par(mfrow = c(2, 2), mar = c(6, 4, 6, 2) + 0.1)
# - 플롯창 여백크기 변경

plot(ridge, xvar = "lambda", main = "Ridge (Alpha = 0)\n\n\n")
plot(elastic1, xvar = "lambda", main = "Elastic Net (Alpha = .25)\n\n\n")
plot(elastic2, xvar = "lambda", main = "Elastic Net (Alpha = .75)\n\n\n")
plot(lasso, xvar = "lambda", main = "Lasso (Alpha = 1)\n\n\n")

par(mfrow = c(1, 1))

# ----------------------------------------
## 교차검정 모델준비

## 설정모델별로 같은 교차검정이 될 수 있도록 cv fold id번호 생성
fold_id <- sample(1:10, size = length(ames_train_y), replace = TRUE)
fold_id

## alpha 파라미터별 모델성능 튜닝그리드 생성
tuning_grid <- tibble(
  alpha      = seq(0, 1, by = .1),
  mse_min    = NA,
  mse_1se    = NA,
  lambda_min = NA,
  lambda_1se = NA)

tuning_grid
# - glm()함수의 alpha파라미터의 값을 0 ~ 1사이로 0.1 간격으로 설정해
#   alpha = 0의 릿지모델부터, 0 ~ 1 사이의 엘라스틱넷 모델,
#   alpha = 1의 라소모델까지 교차검정 실시하기 위함
# - alpha 파라미터값별 튜닝모델의 학습결과를 받아서 저장하기 위한 
#   그리드 구조의 비어 있는 데이터셋을 준비함

# ----------------------------------------
## 교차검정 모델별 피팅
# - 각 alpha 파라미터 값별로 예측모델을 설정하고, CV만큼 교차검정을 실시
# - 각 모델별 최소 및 하나의 표준 오차범위내의 MSE 값, 각 람다값을 추출함

for(i in seq_along(tuning_grid$alpha)) {
  fit <- cv.glmnet(ames_train_x, ames_train_y, 
                   alpha = tuning_grid$alpha[i], 
                   foldid = fold_id)
  
  tuning_grid$mse_min[i]    <- fit$cvm[fit$lambda == fit$lambda.min]
  tuning_grid$mse_1se[i]    <- fit$cvm[fit$lambda == fit$lambda.1se]
  tuning_grid$lambda_min[i] <- fit$lambda.min
  tuning_grid$lambda_1se[i] <- fit$lambda.1se
}

## 튜닝그리드 설정값을 통한 모델별 성능비교
tuning_grid

# ----------------------------------------
## 모델별 성능비교 플롯팅
tuning_grid %>%
  mutate(se = mse_1se - mse_min) %>%
  ggplot(aes(alpha, mse_min)) +
  geom_line(size = 2) +
  geom_ribbon(aes(ymax = mse_min + se, ymin = mse_min - se), alpha = .25) +
  ggtitle("MSE ± one standard error")

# - 각 alpha파라미터 설정에 따른 성능평가 결과 플롯팅 결과
#   최적의 λ에 대해 MSE ± 표준 오차를 고려한 값을 비교해 보면 
#   모두 동일한 수준의 정확도 내에 있음을 알 수 있음 

# - 결과적으로 λ = 0.02062776 인 전체 올가미 모델을 선택할 수

## 베스트모델 선정
cv_lasso   <- cv.glmnet(ames_train_x, ames_train_y, alpha = 1.0)
min(cv_lasso$cvm)

# ----------------------------------------
## 테스트데이터를 이용한 예측모델 성능평가
pred <- predict(cv_lasso, s = cv_lasso$lambda.min, ames_test_x)
mean((ames_test_y - pred)^2)

### End of Source ####################################################

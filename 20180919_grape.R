
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




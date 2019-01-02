## 스칼라 데이타
a <- 2

## 벡터 데이타
h <- c(1:72)

## 행렬 데이타 
mat <- matrix(h, nrow = 6)
length(h)
mat_8rows <- matrix(h, nrow = 8)
mat_8cols <- matrix(h, ncol = 8)

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
names(theDF) <- c("sweet","salty","creazy")

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


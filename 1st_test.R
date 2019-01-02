1. R이 부상하는 이유
R은 무료이고, 오픈소스이며 강력한 분석기능 및 뛰어난 확장성을 가지고 있음
-오픈소스기반 무료 소프트웨어
-포괄적인 통계 플랫폼
-멀티OS 지원
-시각화 기능
-작업의 재현성
-전세계적 커뮤니티 생태계

2. 메모리 불러오는 기능함수
data()

3. 작업경로 확인 및 설정하는 기능함수
#현재 작업 경로 확인
getwd()
#현재 작업경로에 있는 파일 목록 확인
dir()
list.files()
#현재 작업경로에 있는 폴더 확인
list.dirs()
#새로운 작업경로 생성
dir.create("C:/Rtest")
#작업경로를 다른 곳으로 변경
setwd("C:/Rtest")
#변경한 작업경로 확인
getwd()

4. 파일 로딩할 때 몇가지 방법
-CSV 파일 읽기
-엑셀 데이터
-데이터베이스에서 데이터 읽기
-웹 사이트에서 데이터 추출하기
-R에 포함돼 있는 데이터
-JSON 데이터 읽기

5. 3V
물리적 특성
Volume - 폭발적 데이터볼륨 증대로 저장/처리 인프라 도입
Variety - 내/외부, 정형/비정형 데이터 수집채널 구축
Velocity - 신속한/복잡한 분석을 위해 고차원 알고리즘 구현

비즈니스적 특성
Volume - 공급자의 제품/서비스 및 사용자의 이용확대
Variety - 다양한 연관/파생 비즈니스 탄생 및 동일모델 타업종 적용
Velocity - 적시적인 타이밍과 트렌드세터의 타임투마켓



6. 여덟가지 객체 나열, 어떤 객체를 지칭하는지, 사람 내외부 고객, 제품서비스, 온오프라인, 시설 장비., 객체마다 고유한 특성이 있으니까 기억하기
1 사람/내외부 고객
    ex) 인구통계학적 프로필, 라이프스타일, 구매이력 등

2 제품/서비스
    ex) 제품명, 가격, 무게, 색상, 기능, 디자인, 내구성

3 온/오프채널
    ex) 이용단계, 이동경로, 이용빈도, 구매율, 편의성, 결재수단, 정보구조 등

4 시설/장비
    ex) 온도, 작동시간, 압력, 기름양, 색상, 습기, 회전수, 에러율, 소음, 진동, 전력사용량, 동작횟수, 사용연한 등

5 시간/요일/기간/트렌드
    ex)고객이 제품서비스를 언제, 어느 기간동안, 어느 추세로 이용하는지 등

6 지역/장소/공간/위치
    ex) 지역, 장소, 공간, 위치 등

7 날씨/기상/자연
    ex)기온, 습도, 풍향, 풍속, 강수량, 강수확률, 재난, 이상기후, 이동경로, 발생위치 등이 분석대상임

8 정책/법률/규제/제도
    ex) 공정거래, 건강, 안전, 환경 및 보안 준수 등

7--척도 종류 물어보는 것
범주형,질적 :이항형, 다항형, 서열형,
연속형, 양적 : 중간형, 중요판단형, 비율형

8--모델링이란
데이터분석 모델링은 8가지 분석대상 객체, 3가지 문제유형, 5가지 분석기준을 연결/종합해 주는 작업
문제 해결에 관련된 변수를 선별하여 변수간 관계를 구조화된 그림 모형 모델로 형상화(모델링

9 보기항목을 뒤섞어 놓고 성격이 다른 변수 고르기
성과/반응/결과/종속변수
영향/투입예측/설명/독립변수
조절/상황/교란/혼동변수
매개변수
파생변수
요약변수
대리변수

10
주어진 데이터로만 불가능할 때
변수 변환작업을 통해서 만들어내는변수
요약변수, 파생변수, 대리변수



1-- R이 부상하는 이유 - 패키지 등 무료로 다운받는 것 오픈소스

2--메모리 불러오는 기능함수

3--작업경로 확인 및 설정하는 기능함수

4--파일 로딩할 때 몇가지 방법

5--3V

6--여덟가지 객체 나열, 어떤 객체를 지칭하는지, 사람 내외부 고객, 제품서비스, 온오프라인, 시설 장비., 객체마다 고유한 특성이 있으니까 기억하기



7--척도 종류 물어보는 것
범주형,질적 :이항영, 다항형, 서열형, 
연속형, 양적 : 중간형, 중요판단형, 비율형

8--모델링이란  45p
문제 해결에 관련된 변수를 선별하여 변수간 관계를 구조화된 그림 모형 모델로 형상화(모델링

9  45p
예측설명독립변수/ 행
성과반응결과종속변수/ 컬럼
조절상황교란혼동변수
보기항목을 뒤섞어 놓고 성격이 다른 변수 고르기

10
주어진 데이터로만 불가능할 때
변수 변환작업을 통해서 만들어내는변수
요약변수, 파생변수, 대리변수

11 탐색적 데이터분석(기술통계분석)의 개념중 3가지 포인트
https://statkclee.github.io/ml/ml-eda.html

12 R에서 쓰는 객체유형
스칼라, 벡터, 리스트, 데이터 프레임, 기타포맷
기타포맷중에서 NA가 의미하는게 뭐냐 이런것들
## 1. 연속형 변수의 결측치(NA) 처리
## raw데이터 준비

x <- c(6.5, 4.9, NA, 4.2, 7.3, NA , 11.7, 6.9, 5.2)
##---연습문제응용하기  x<-freq 이렇게만 입력하면됨---##
x


mean(x) # NA로 인해서 평균도 NA로 출력
mean(x, na.rm = TRUE) # NA를 제외하고 연산결과 출력
#결측치를 제외하고 정상적으로 입력되어있는 데이터만 보겠다는 뜻



which(is.na(x))
#which함수는 어느 자리에 TRUE가 있는지 위치를 알려줌
#괄호 안 조건에 맞는 것이 어디에 있나
#- 어떤 요소위치(자리)에 NA가 있는지 확인 3, 6 (3번째, 6번째)
#어디에 결측데이터가 있는지 알아야 하기에 위치를 확인함
#결측데이터를 대체할 자료를 넣을 수 있기 때문

?which
is.na(x)
is.na(x)
#1] FALSE FALSE  TRUE FALSE FALSE  TRUE FALSE FALSE FALSE
#FALSE: 결측치가 아니다.
#TRUE:결측치이다.
# - 데이터가 아직 넘어오지 않았다면 NA라고 써야함
# - NA는 자리도 차지하고 있음

NULL의 의미
###NULL이 들어 있을 때
z<- c(1, NULL, 3)
str(z)
length(z)
# - NULL은 값(데이터)도 없고, 자리도 차지하지 않는다
# - 요소값은 물론 요소자리(위치)도 아예 없는 공집합 개념

# - 데이터가 아직 넘어오지 않았다면 NA라고 써야함
# - NA는 자리도 차지하고 있음

13 빅데이터가 유행하게 된 계기

14 계정계 OLTP
     정보계 OLAP   Data ware house, Data mart
OLTP: Transaction Processing : 처리, 데이터 수시로 갱신, ex)주문입력시스템(포스), 재고관리시스템 등
OLAP: Analytical Processing: 분석 처리, 다차원적 데이터 접근 의사 결정에 활용, 데이터 조회 위주 ex)제품의 판매 추이, 구매성향 파악, 재무 회계 분석


15 데이터를 다룰 때 컬럼을 부르는 것,행을 부르는 것
변수 컬럼을 부르는 명칭들이 다양하고
레코드를 부르는 명칭들이 다양함. 이것들이 섞여있는 문제가 있음
#열, 컬럼, 변수, 속성, attribute, feature. 
#행, 로우, 관찰치, 레코드, 케이스, 사례, 한 사람 한사람의 프로필 정보, 

16 subset을 만드는 R코드 몇가지
어떤 패키지에 어떤 함수가 가능한지
## 데이터셋에 있는 특정 변수컬럼을 인덱싱/셀렉션(indexding/selection)하기

# - (필요한 변수 뽑아서 subset 만들기)
#   (불필요한 것 제거하고 쓰겠다)

# - 열(column), 변수(variable), 컬럼, 속성, 애트리뷰트(attribute),
#   필드(field), 피처(feature)를 대상으로
#   조건을 지정해 특정 변수컬럼을 부분추출함

# - 방법1: base패키지에 속한 달러$연산자를 이용하는 방법
#          --> 1개 변수컬럼 지정인덱싱만 가능함
# - 방법2: base패키지에 속한 대괄호[]연산자를 이용하는 방법
# - 방법3: base::subset() 함수를 이용하는 방법
# - 방법4: dplyr::select() 함수를 이용하는 방법
#   --> select()라는 이름을 가진 함수는 다양한 패키지에서 사용하는 기능함수명이므로
#       이상하게 작동할시에는 단순 select()함수가 아닌 dplyr::select()로 코딩필요


17
샘플링 역할하는 함수 base::sample()
무작위 추출하기 때문에 그때그때 달라지기 떄문에
seed number 하고 무작위 추출할때 썼던 함수명

## 기본 base::sample() 함수이용: 비복원추출

set.seed(1)#번호 마음대로 해도 됨 (이름표를 붙인다고 생각)
# 샘플링 재현성을 위한 초기난수값 설정
# nrow = number of row = length = 행갯수
# 변수명 < - sample(추출할 대상의 범위:nrow(데이터셋), size = 100(무작위로 100개),
# ,replace = TRUE/FALSE(주어진 범위보다 적게 샘플링할때)


index <- sample(1:nrow(diamonds),
                size = 100,
                replace = FALSE)
index
# - 실제 diamonds셋의 내용이 아닌 추출대상 레코드번호(인덱스번호)가 무작위추출됨
# 결과는 레코드 번호임
# 실제 diamonds 셋의 내용이 아닌 추출대상 레코드번호
# 매번 결과가 다름
# 변수가 많으면 정확도가 높아짐

sub.dd <- diamonds[index, ]
sub.dd
# - 무작위 비복원추출된 레코드번호를 이용해 실제 내용을 추출함
# 샘플링된 100개의 subset을 만듦

# --------------------
## 기본 base::sample() 함수이용: 복원추출

set.seed(200)
# - 샘플링 재현성을 위한 초기난수값 설정

index2 <- sample(1:100, size = 1000, replace = TRUE)
index2
#실제 diamonds셋의 내용이 아닌 추출대상 레코드번호
#추출대상은 1:100 즉 100개인데, 추출사이즈갯수는 1000개
#주어진 데이터 100개를 1000개로 키워서 해봄
#그런데 키워서 했을 때 정확도가 높은지 아닌지는 확인해봐야함

table(index2)
# 무작위 추출된 인덱스번호들이 중복추출 되었음을 빈도수
#1번이라는 항목이 몇번, 2번이는 항목이 몇번 등 빈도수를 나타냄

sub.dd2 <- diamonds[index2, ]
sub.dd2
skim(sub.dd2)
# - 무작위 복원추출된 레코드번호를 이용해 실제 내용을 추출함

# --------------------
## dplyr::sample_n() 함수이용: 비복원추출
##        sample_frac() : 비율을 나타냄


set.seed(1234)
# - 샘플링 재현성을 위한 초기난수값 설정
#1:1000 이 아니라 데이터셋 diamonds를 통째로 넣어봄
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
# TRUE라고 해야 복원추출할 수 있음
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
# dplyr::setdiff() 차집합



sample(letters[1:5], 10, replace = TRUE) # 무작위 소문자 복원 추출
sample(LETTERS[1:20], 10, replace = FALSE) # 무작위 대문자 비복원 추출

########################################################################
## 알파벳 상수를 이용한 무작위 ID만들기
sample(letters, 10, replace = TRUE) # 무작위 10개 소문자 복원 추출
sample(100:999, 10) # 무작위 100~999 중 10개 숫자 비복원 추출

id1 <- sample(letters, 10, replace = TRUE) # 무작위 10개 소문자 복원 추출
id2 <- sample(100:999, 10) # 무작위 100~999 중 10개 숫자 비복원 추출

paste(id1, id2, sep = "") # 영문명과 숫자를 결합한 무작위 10개 ID생성




18
연속형 데이터는 어떠어떠한거 체크하고
범주형 데이터는 어떠어떠한거 체크하는지 잘 보세요


19 기능함수 중에서 빈도수 구하는 함수

table(grade)

# - 범주변수의 범주항목별 빈도수와 NA항목의 빈도수 확인
table(grade, useNA = "ifany")
#useNA = "ifany"의 의미
#grade변수 안에 만약에 하나라도 NA가 들어 있다면 NA의 빈도도 작성
#NA가 들어있지 않다면 NA 갯수는 출력되지 않음

#useNA="always"라고 한다면 결측데이터가 있던지 없던지간에
#NA결측치를 출력함
table(grade, useNA = "always")
x <- diamonds[diamonds$cut == "Ideal" & diamonds$clarity == "VS2", ]  
table(x$cut, dnn = "커팅품질 항목별 빈도수")
table(x$clarity, dnn = "투명도 항목별 빈도수")
# - 필터링 결과확인

table(index2)
# 무작위 추출된 인덱스번호들이 중복추출 되었음을 빈도수
#1번이라는 항목이 몇번, 2번이는 항목이 몇번 등 빈도수를 나타냄

prettyR::describe(diamonds) # 범주형과 연속형을 구분함numeric, factor
                            # 빈도수와 비율을 백분위로 나타내주고 있음

ggplot(mpg, aes(manufacturer)) +
  geom_bar(stat = "count")
# - stat = "count": 빈도수 카운팅을 통해 막대그래프를 그린다는 것을 명시적으로 코딩    


20
셀렉션이나 필터링하는 문제 주어지고 
문법적으로 틀린 것(대괄호나 $ 표시 해서 인덱싱하는 기법)

################################################################################
## 데이터셋관리(DML: Data Manipulation Language)
# - 변수컬럼명 & 인덱스번호(위치)를 이용한 인덱싱(Indexing)/셀렉션(Selection)
################################################################################

# - (필요한 변수 뽑아서 subset 만들기)
#   (불필요한 것 제거하고 쓰겠다)

# - 열(column), 변수(variable), 컬럼, 속성, 애트리뷰트(attribute),
#   필드(field), 피처(feature)를 대상으로
#   조건을 지정해 특정 변수컬럼을 부분추출함

# - 방법1: base패키지에 속한 달러$연산자를 이용하는 방법
#          --> 1개 변수컬럼 지정인덱싱만 가능함
# - 방법2: base패키지에 속한 대괄호[]연산자를 이용하는 방법
# - 방법3: base::subset() 함수를 이용하는 방법
# - 방법4: dplyr::select() 함수를 이용하는 방법
#   --> select()라는 이름을 가진 함수는 다양한 패키지에서 사용하는 기능함수명이므로
#       이상하게 작동할시에는 단순 select()함수가 아닌 dplyr::select()로 코딩필요

################################################################################
## 1. 특정 변수컬럼 1개 "지정" 인덱싱/셀렉션

    ## 1.1 기본 달러$연산자 이용방식
    # 데이터셋변수명$컬럼명
    # - 변수컬럼명으로 인덱싱 --> 벡터형 인덱싱
    
    diamonds$carat
    diamonds$[1]
    # - 달러$연산자에서는 대괄호[]방식의 인덱스번호 사용은 에러발생!
    # 달러$ 연산자 다음에 [] 대괄호 쓰면 안됩니다.
    # []대괄호 쓰려면 데이터셋변수명[컬럼명or컬럼위치]

# ----------------------------------------
    ## 1.2 기본 대괄호[]연산자 이용방식
    # - 대괄호[]연산자에서는 변수컬럼명이나 인덱스번호(위치)로 인덱싱
    #   --> 티블(데프)형 인덱싱
    
    diamonds["carat"]
    diamonds[ , "carat"]
    diamonds[1]
    diamonds[ , 1]
    # 콤마(,)를 써도 되고 안써도 된다. (열 기준)

# ----------------------------------------
    ## 1.3 base::subset() 기능함수 이용방식
    # - subset()함수에서는 변수컬럼명이나 인덱스번호(위치)로 인덱싱
        #   --> 티블(데프)형 인덱싱
        
        subset(diamonds, select = "carat")
        subset(diamonds, select = 1)
        
        ## 파이프 %>% 연산자 이용
        install.packages("magrittr")
        library(magrittr)
        diamonds %>% subset(select = "carat")
        diamonds %>% subset(select = 1)
        # 파이프로 태워서 그 다음 함수에 넣는다.

# ----------------------------------------
    ## 1.4 dplyr::select() 기능함수 이용방식
    # tibble구조일 때 속도가 빠르다.
    # select는 다른 패키지에도 포함되어 있다. 오류 뜰 때는 dplyr::select()
        # - dplyr::select()함수에서는 변수컬럼명이나 인덱스번호(위치)로 셀렉션
        #   --> 티블(데프)형 인덱싱
        library(dplyr)
        select(diamonds, carat)
        select(diamonds, 1)
        
        ## 파이프 %>% 연산자 이용
        diamonds %>% select(carat)
        diamonds %>% select(1)

################################################################################
## 2. 특정 변수컬럼 1개 "제외" 인덱싱/셀렉션

    ## 2.1 기본 달러$연산자 이용방식
    ## 걔만 빼고 데이터셋 만들기 "제외" 차집합의 개념
    # - 달러$연산자에서는 제외 인덱싱은 불가능함
    
    diamonds$-carat # 에러발생!
    diamonds$-[1]  # 에러발생!
    #달러 연산자는 한개를 인용할 때 쓰는 것

# ----------------------------------------
    ## 2.2 기본 대괄호[]연산자 이용방식
    # - 특정 변수컬럼을 제외(except)하는 인덱싱/셀렉션에서  
    #   대괄호[]연산자를 사용할 경우 변수컬럼명으로는 안되며,
    #   숫자로 된 인덱스번호(위치)만 가능함
    
    diamonds[-"carat"]    # 에러발생!
    diamonds[ , -"carat"] # 에러발생!
    diamonds[-1]          #가능, 첫번째 컬럼 제외하고 데이터셋 만듬 = [2:11]
    diamonds[ , -1]       #가능

# ----------------------------------------
    ## 2.3 base::subset() 기능함수 이용방식
    # - 특정 변수컬럼을 제외(except)하는 인덱싱/셀렉션에서
    #   base::subset() 함수를 사용할 경우 변수컬럼명으로는 안되며,
    #   숫자로 된 인덱스번호(위치)만 가능함
    
    subset(diamonds, select = -"carat") # 에러발생!
    subset(diamonds, select = -1)       #가능   =[2:11]
    
    ## 파이프 %>% 연산자 이용
    diamonds %>% subset(select = -"carat") # 에러발생!
    diamonds %>% subset(select = -1)       #가능

# ----------------------------------------
    ## 2.4 dplyr::select() 기능함수 이용방식
    # - 특정 변수컬럼을 제외(except)하는 인덱싱/셀렉션에서
    # - dplyr::select() 함수를 사용할 경우
    #   변수컬럼명, 숫자로 된 인덱스번호(위치) 모두 가능함
    
    select(diamonds, -carat)   #가능, 컬럼명으로도 됨
    select(diamonds, -1)       #가능
    
    ## 파이프 %>% 연산자 이용
    diamonds %>% select(-carat)
    diamonds %>% select(-1)

################################################################################
## 3. 특정 변수컬럼 2개이상 "지정" 인덱싱/셀렉션

    ## 3.1 기본 달러$연산자 이용방식
    # - 달러$연산자로는 2개 이상 동시 "지정" 변수컬럼 인덱싱은 불가능함
    
    diamonds$c("carat", "price")   #!에러발생
    diamonds$c(1, 7)               #!에러발생
    # - 모두 에러발생!

# ----------------------------------------
    ## 3.2 기본 대괄호[] 연산자 이용방식
    # - 2개이상의 변수컬럼 동시 "지정" 인덱싱/셀력션에서 대괄호[]연산자를 사용할 경우
    #   변수컬럼명과 인덱스번호(위치), 임의의 변수컬럼지정 벡터방식 모두 가능함
    
    diamonds[c("carat", "price")]
    diamonds[ , c("carat", "price")]
    
    diamonds[c(1, 7)]
    diamonds[ , c(1, 7)]
    #나중에 행까지 호출하고 싶을 때 [, ]
    
    #임시변수에 저장
    target <- c("carat", "price")
    diamonds[target]
    diamonds[ , target]
    
    target2 <- c(1, 7)
    diamonds[target2]
    diamonds[ , target2]

# ----------------------------------------
    ## 3.3 base::subset() 기능함수 이용방식
    # - 2개이상의 변수컬럼 동시 "지정" 인덱싱/셀력션에서 base::subset()함수를 사용할 경우
    #   변수컬럼명과 인덱스번호(위치), 임의의 변수컬럼지정 벡터방식 모두 가능함
    
    subset(diamonds, select = c("carat", "price"))
    subset(diamonds, select = c(1, 7))
    
    target <- c("carat", "price")
    subset(diamonds, select = target)
    
    target2 <- c(1, 7)
    subset(diamonds, select = target2)
    
    ## 파이프 %>% 연산자 이용
    diamonds %>% subset(select = c("carat", "price"))
    diamonds %>% subset(select = c(1, 7))
    diamonds %>% subset(select = target)
    diamonds %>% subset(select = target2)

# ----------------------------------------
## 3.4 dplyr::select() 기능함수 이용방식
    # - 2개이상의 변수컬럼 동시 "지정" 인덱싱/셀력션에서 base::subset()함수를 사용할 경우
    #   변수컬럼명과 인덱스번호(위치), 임의의 변수컬럼지정 벡터방식 모두 가능함
    
    select(diamonds, carat, price)
    select(diamonds, 1, 7)
    
    target <- c("carat", "price")
    select(diamonds, target)
    
    target2 <- c(1, 7)
    select(diamonds, target2)
    
    ## 파이프 %>% 연산자 이용
    diamonds %>% select(carat, price)
    diamonds %>% select(1, 7)
    diamonds %>% select(target)
    diamonds %>% select(target2)

################################################################################
## 4. 특정 변수컬럼 2개이상 "제외" 인덱싱/셀렉션

    ## 4.1 기본 달러$연산자 이용방식
    # - 달러$연산자로는 2개 이상 변수컬럼 "제외" 인덱싱은 불가능함
    
    diamonds$c(-"carat", -"price")   #!에러발생
    diamonds$-c("carat", "price")    #!에러발생
    diamonds$c(-1, -7)               #!에러발생
    diamonds$-c(1, 7)                #!에러발생
    # - 모두 에러발생!

# ----------------------------------------
    ## 4.2 기본 대괄호[] 연산자 이용방식
    # - 2개이상의 변수컬럼 동시 "제외" 인덱싱/셀력션에서 대괄호[]연산자를 사용할 경우
    #   변수컬럼명을 사용하면 에러가 발생하며, 인덱스번호(위치)를 사용하는 경우에만 가능함
    
    diamonds[-target]  #!에러발생
    #이름으로 했을 때는 에러 발생!
        
    diamonds[c(-"carat", -"price")]
    diamonds[-c("carat", "price")]
    # - 모두 에러발생!
    
    diamonds[c(-1, -7)]
    diamonds[ , c(-1, -7)]
    diamonds[-c(1, 7)]
    diamonds[ , -c(1, 7)] #마이너스(-)를 c앞에 코딩함
    
    target <- c("carat", "price")
    diamonds[-target]
    # - 에러발생!
    
    target2 <- c(1, 7)
    diamonds[-target2]

# ----------------------------------------
    ## 4.3 base::subset() 기능함수 이용방식
    # - 2개이상의 변수컬럼 동시 "제외" 인덱싱/셀력션에서 base::subset()함수를 사용할 경우
    #   변수컬럼명을 사용하면 에러가 발생하며, 인덱스번호(위치)를 사용하는 경우에만 가능함
    
    subset(diamonds, select = c(-"carat", -"price")) #!에러발생
    subset(diamonds, select = -c("carat", "price"))  #!에러발생
    # - 모두 에러발생!
    
    subset(diamonds, select = c(-1, -7))  #가능
    subset(diamonds, select = -c(1, 7))   #괄호 안에 지정시 오류 발생
    
    target <- c("carat", "price")       #!에러발생
    subset(diamonds, select = -target)  #!에러발생
    # - 에러발생!
    
    target2 <- c(1, 7)
    subset(diamonds, select = -target2)
    
    ## 파이프 %>% 연산자 이용
    diamonds %>% subset(select = c(-"carat", -"price"))  #!에러발생
    diamonds %>% subset(select = -c("carat", "price"))  #!에러발생
    # - 모두 에러발생!
    
    diamonds %>% subset(select = c(-1, -7))
    diamonds %>% subset(select = -c(1, 7))
    
    target <- c("carat", "price")          #!에러발생
    diamonds %>% subset(select = -target)  #!에러발생
    # - 에러발생!
    
    target2 <- c(1, 7)
    diamonds %>% subset(select = -target2)

# ----------------------------------------
    ## 4.4 dplyr::select() 기능함수 이용방식
    # - 2개이상의 변수컬럼 동시 "제외" 인덱싱/셀력션에서 dplyr::select()함수를 사용할 경우
    #   변수컬럼명과 인덱스번호(위치), 임의의 변수컬럼지정 벡터방식 모두 가능함
    # - 단, dplyr::select()함수에서 제외되는 변수컬럼 지정시
    #   -(변수1, 변수2)와 같은 방식으로는 작동을 하지 않고 에러가 발생함
    
    select(diamonds, -carat, -price)
    select(diamonds, -(carat, price)) # 괄호()안에 지정시 에러발생!
    select(diamonds, -1, -7)
    select(diamonds, -(1, 7)) # 괄호()안에 지정시 에러발생!
    
    target <- c("carat", "price")
    select(diamonds, -target)
    
    target2 <- c(1, 7)
    select(diamonds, -target2)
    
    ## 파이프 %>% 연산자 이용
    diamonds %>% select(-carat, -price)
    diamonds %>% select(-(carat, price)) # 괄호()안에 지정시 에러발생!
    diamonds %>% select(-1, -7)
    diamonds %>% select(-(1, 7)) # 괄호()안에 지정시 에러발생!
    diamonds %>% select(-target)
    diamonds %>% select(-target2)

################################################################################
    ## 5. 연속위치 변수컬럼 인덱싱
    head(diamonds)
    
    # - 콜론(:) 기호를 이용해 변수컬럼명이나 인텍스번호(위치)를 [시작:끝]으로 지정해
    #   연속적으로 붙어 있는 변수컬럼을 동시에 인덱싱/셀렉션 할 수 있음
    
    ## 연속위치 변수컬럼 "지정" 인덱싱/셀렉션
    
    ## 5.1 기본 달러$연산자 이용방식
    # - 달러$연산자로는 연속적으로 붙어 있는 변수컬럼을
    #   동시에 "지정"하는 인덱싱은 불가능함
    
    diamonds[c("carat":"clarity") ]# 이 코드자체가 에러발생!
    diamonds$c(1:7)
    # - 모두 에러발생!

# ----------------------------------------
    ## 5.2 기본 대괄호[] 연산자 이용방식
    # - 연속적으로 붙어 있는 변수컬럼을 동시에 "지정" 인덱싱 하기 위해서  
    #   대괄호[]연산자를 사용할 경우 변수컬럼명을 사용하면 에러가 발생하며,
    #   인덱스번호(위치)를 사용해서 [시작:끝]으로 설정해야 함
    
    diamonds[c("carat":"clarity")]
    diamonds[ , c("carat":"clarity")]
    # - c("carat":"clarity") 코드자체가 에러발생!
    
    diamonds[c(1:4)]
    diamonds[ , c(1:4)]
    diamonds[1:4]
    diamonds[ , 1:4]
    
    target <- c("carat":"clarity") # 이 코드자체가 에러발생!
    diamonds[target]
    diamonds[ , target]
    # - 에러발생!
    
    target2 <- c(1:4)
    diamonds[target2]
    diamonds[ , target2]

# ----------------------------------------
    ## 5.3 base::subset() 기능함수 이용방식
    # - 연속적으로 붙어 있는 변수컬럼을 동시에 "지정" 인덱싱 하기 위해서  
    #   base::subset()함수를 사용할 경우 변수컬럼명을 사용하면 에러가 발생하며,
    #   인덱스번호(위치)를 사용해서 [시작:끝]으로 설정해야 함
    
    subset(diamonds, select = c("carat":"clarity")) # 이 코드자체가 에러발생!
    subset(diamonds, select = c(1:4))
    subset(diamonds, select = 1:4)
    
    target <- c("carat":"clarity") # 이 코드자체가 에러발생!
    subset(diamonds, select = target)
    
    target2 <- c(1:4)
    subset(diamonds, select = target2)
    
    ## 파이프 %>% 연산자 이용
    diamonds %>% subset(select = c("carat":"clarity")) # 이 코드자체가 에러발생!!
    diamonds %>% subset(select = c(1:4))
    diamonds %>% subset(select = 1:4)
    
    diamonds %>% target <- c("carat":"clarity") # 이 코드자체가 에러발생!
    diamonds %>% subset(select = target)
    
    diamonds %>% target2 <- c(1:4)
    diamonds %>% subset(select = target2)

# ----------------------------------------
    ## 5.4 dplyr::select() 기능함수 이용방식
    # - 연속적으로 붙어 있는 변수컬럼을 동시에 "지정" 인덱싱 하기 위해서  
    #   dplyr::select()함수를 사용할 경우
    #   변수컬럼명과 인덱스번호(위치), 임의의 변수컬럼지정 벡터방식 모두 가능함
    
    select(diamonds, carat:clarity)
    select(diamonds, c(1:4))
    select(diamonds, 1:4)
    
    target <- c("carat":"clarity") # 이 코드자체가 에러발생!
    select(diamonds, target)
    
    target2 <- c(1:4)
    select(diamonds, target2)
    
    ## 파이프 %>% 연산자 이용
    diamonds %>% select(carat:clarity)
    diamonds %>% select(c(1:4))
    diamonds %>% select(1:4)
    
    target <- c("carat":"clarity") # 이 코드자체가 에러발생!
    diamonds %>% select(target)
    
    target2 <- c(1:4)
    diamonds %>% select(target2)

################################################################################
    ## 5.5 연속위치 변수컬럼 "제외" 인덱싱/셀렉션
    
    ## 5.1 기본 달러$연산자 이용방식
    # - 달러$연산자로는 연속적으로 붙어 있는 변수컬럼을
    #   동시에 "제외"하는 인덱싱은 불가능함
    
    diamonds$c("-carat":"-clarity")
    diamonds$-c("carat", "clarity")
    diamonds$c(-1, -4)
    diamonds$-c(1, 4)
    # - 모두 에러발생!

# ----------------------------------------
    ## 5.2 기본 대괄호[] 연산자 이용방식
    # - 연속적으로 붙어 있는 변수컬럼을 동시에 "제외" 인덱싱 하기 위해서  
    #   대괄호[]연산자를 사용할 경우 변수컬럼명을 사용하면 에러가 발생하며,
    #   마이너스 기호와 인덱스번호(위치)를 사용해서 [시작:끝]으로 설정해야 함
    
    diamonds[c(-"carat":-"clarity")]
    diamonds[-c("carat":"clarity")]
    # - 모두 에러발생!
    
    diamonds[-c(1:4)]
    diamonds[ , -c(1:4)]
    diamonds[c(-1:-4)]
    diamonds[ , c(-1:-4)]
    diamonds[-1:-4]
    diamonds[ , -1:-4]
    diamonds[-(1:4)]
    diamonds[ , -(1:4)]
    
    target <- c("carat":"clarity") # 이 코드자체가 에러발생!
    diamonds[-target]
    diamonds[ , -target]
    # - 에러발생!
    
    target2 <- c(1:4)
    diamonds[-target2]
    diamonds[ , -target2]

# ----------------------------------------
    ## 5.3 base::subset() 기능함수 이용방식
    # - 연속적으로 붙어 있는 변수컬럼을 동시에 "지정" 인덱싱 하기 위해서  
    #   base::subset()함수를 사용할 경우 변수컬럼명을 사용하면 에러가 발생하며,
    #   마이너스 기호와 인덱스번호(위치)를 사용해서 [시작:끝]으로 설정해야 함
    
    subset(diamonds, select = c(-"carat":-"clarity"))
    subset(diamonds, select = -c("carat":"clarity"))
    # - 모두 에러발생!
    
    subset(diamonds, select = c(-1:-4))
    subset(diamonds, select = -c(1:4))
    subset(diamonds, select = -1:-4)
    subset(diamonds, select = -(1:4))
    
    target <- c("carat":"clarity")# 이 코드자체가 에러발생!
    subset(diamonds, select = -target)
    # - 에러발생!
    
    target2 <- c(1:4)
    subset(diamonds, select = -target2)
    
    ## 파이프 %>% 연산자 이용
    diamonds %>% subset(diamonds, select = c(-"carat":-"clarity"))
    diamonds %>% subset(diamonds, select = -c("carat":"clarity"))
    # - 모두 에러발생!
    
    diamonds %>% subset(select = c(-1:-4))
    diamonds %>% subset(select = -c(1:4))
    diamonds %>% subset(select = -1:-4)
    diamonds %>% subset(select = -(1:4))
    
    target <- c("carat":"clarity") # 이 코드자체가 에러발생!
    diamonds %>% subset(select = -target)
    
    target2 <- c(1:4)
    diamonds %>% subset(select = -target2)

# ----------------------------------------
    ## 5.4 dplyr::select() 기능함수 이용방식
    # - 연속적으로 붙어 있는 변수컬럼을 동시에 "제외" 인덱싱 하기 위해서  
    #   dplyr::select()함수를 사용할 경우
    #   변수컬럼명과 인덱스번호(위치), 임의의 변수컬럼지정 벡터방식 모두 가능함
    
    select(diamonds, -carat:-clarity)
    select(diamonds, -(carat:clarity))
    
    select(diamonds, -1:-4)
    select(diamonds, -(1:4))
    
    target <- c("carat":"clarity") # 이 코드자체가 에러발생!
    select(diamonds, -target)
    
    target2 <- c(1:4)
    select(diamonds, -target2)
    
    ## 파이프 %>% 연산자이용
    diamonds %>% select(-carat:-clarity)
    diamonds %>% select(-(carat:clarity))
    diamonds %>% select(-1:-4)
    diamonds %>% select(-(1:4))
    
    target <- c("carat":"clarity") # 이 코드자체가 에러발생!
    diamonds %>% select(diamonds, -target)
    
    target2 <- c(1:4)
    diamonds %>% select(diamonds, -target2)

### End of Source ##############################################################




################################################################################
## 데이터셋관리(DML: Data Manipulation Language)
# - 정규식(Regular Expression)을 이용한
#   변수컬럼 인덱싱(Indexing)/셀렉션(Selection)
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
# install.packages("AmesHousing") # 주택관련 데이터셋 패키지

library(ggplot2)
library(dplyr)
library(tibble)
library(magrittr)
library(Hmisc)
library(prettyR)
library(psych)
library(skimr)
library(tidyselect)
library(AmesHousing)

# ----------------------------------------
## AmesHousing 패키지에 내장된 ames_raw 데이터셋 활용

## AmesHousing 패키지 도움말
library(help = AmesHousing)     # 간단 도움말 뷰어 오픈
help(package = AmesHousing)     # 알파벳순서 도움말 탭 오픈
data(package = "AmesHousing")   # 해당 패키지에 들어 있는 예제데이터셋 목록조회

#함수 검색 help("함수명")
#패키지 검색 help(package = "패키지명")

## AmesHousing::ames_raw 데이터셋 로딩 & 코딩북 확인
data(ames_raw, package = "AmesHousing")
#data(data set 이름, package = "패키지명")
#예제 데이터가 다른 패키지와 충돌할까봐 패키지이름까지 지정해줌

help(ames_raw)

## ames_raw 코딩북

################################################################################
## 데이터셋 조회
ames_raw
(ames_raw)
print(ames_raw)
View(ames_raw)

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
## 데이터셋 기술통계 (중심성, 변동성, 정규성)
Hmisc::describe(ames_raw)
prettyR::describe(ames_raw)
psych::describe(ames_raw)
skim(ames_raw)

################################################################################
## 정규표현식(Regular Expression)을 이용해
#  데이터셋에 있는 특정 변수컬럼 인덱싱/셀렉션(indexing/selection)하기

# - 정규표현식(Regular Expression):
#   --> 특정한 패턴을 갖는 문자열을 표시/검색/조회 하기 위한 표준화된 표기법

# - 사용예:
#    - 1. 특정문자로 시작하는/종료하는 변수컬럼 찾기
#    - 2. 숫자가 들어 있는 변수컬럼 찾기
#    - 3. 특정문자와 숫자가 들어 있는 변수컬럼 찾기
#    - 4. 다양한 문자조합과 자리수가 있는 변수컬럼 찾기

################################################################################
## 1. 변수컬럼명 "시작부분" 일치여부 이용 인덱싱/셀렉션

## 1.1 base::grep() & tidyselect::starts_with() 함수이용 패턴찾기
colnames(ames_raw)

grep(pattern = "^Exter", x = colnames(ames_raw), ignore.case = TRUE)
#콜롬 위치만 알려줌
# "^Exter" = Exter로 시작하는 변수명을 찾겠다. (검색어)
# x = 함수(데이터셋), 어디서 검색할 것인지를 보여줌
# ignore.case = TRUE, 대소문자 구별을 할지 말지
# 반드시 대소문자 일치해야 한다면 FALSE,
# 대문자든 소문자든 상관없이 찾아달라 TRUE.

grep(pattern = "^Exter", x = colnames(ames_raw), ignore.case = TRUE, value = T)
# value = T, 위치 말고 그 값(조건이 일치하는 것)을 좀 알려줄래? (콜롬명까지 알려줌)

grep(pattern= "^Exter",
     x = colnames(ames_raw),
     ignore.case=TRUE,
     value = T)

grep("^Exter", colnames(ames_raw), TRUE, T)
#옵션을 일일히 쓰기 귀찮아 생략하고 싶으면 옵션의 순서를 외우고 있어야 한다.

starts_with(match = "Exter", vars = colnames(ames_raw), ignore.case = TRUE)
#꺽쇠기호(^)가 없음
#grep보다 속도감이 있는 함수

colnames(ames_raw)[grep("^Exter", colnames(ames_raw))]
colnames(ames_raw)[starts_with("Exter", vars = colnames(ames_raw))]
# - "Exter"라는 문자로 시작하는 모든 변수컬럼 조회
# - colnames(ames_raw) 대신 names(ames_raw) 사용가능
# - ignore.case = TRUE는 디폴트값으로 생략이 가능하며,
#   ignore.case = FALSE로 설정하면 대소문자를 구별해서 조회함
# - grep()에서 value = TRUE로 설정하면, 해당 인덱스번호 대신에
#   해당되는 요소값을 리턴해 주는데, value = FASLE가 디폴트값임

str(ames_raw)
colnames(ames_raw)

# ----------------------------------------
## 1.2 티블(데프)에서 변수컬럼 인덱싱

## 대괄호[] 연산자 사용 인덱싱/셀렉션 방식
ames_raw[grep("^Exter", colnames(ames_raw))]
ames_raw[starts_with("Exter", vars = colnames(ames_raw))]

## 대괄호[행, 열] 연산자 사용 인덱싱/셀렉션 방식
ames_raw[ , grep("^Exter", colnames(ames_raw))]
ames_raw[ , starts_with("Exter", vars = colnames(ames_raw))]

# -----------------------------------------
## 1.3 base::subset() 사용 인덱싱/셀렉션 방식
subset(ames_raw, select = grep("^Exter", colnames(ames_raw)))
subset(ames_raw, select = starts_with("Exter", vars = colnames(ames_raw)))

## 파이프 %>% 연산자 이용
ames_raw %>% subset(select = grep("^Exter", colnames(ames_raw)))
ames_raw %>% subset(select = starts_with("Exter", vars = colnames(ames_raw)))

# ----------------------------------------
## 1.4 dplyr::select() 기능함수 이용방식
select(ames_raw, grep("^Exter", colnames(ames_raw)))
select(ames_raw, starts_with("Exter"))

## 파이프 %>% 연산자 이용
ames_raw %>% select(grep("^Exter", colnames(ames_raw)))
ames_raw %>% select(starts_with("Exter"))


##실습
#starts_with
ames_raw[ , grep("^B", colnames(ames_raw))]
ames_raw[ , starts_with("B", vars = colnames(ames_raw))]
ames_raw %>% subset(select = grep("^B", colnames(ames_raw)))
ames_raw %>% subset(select = starts_with("B", vars=colnames(ames_raw)))
select(ames_raw, grep("^B",colnames(ames_raw)))
select(ames_raw, starts_with("B"))

#ends_with
ames_raw[ ,grep("1$",colnames(ames_raw))]
ames_raw[ ,ends_with("1", vars=colnames(ames_raw))]
ames_raw %>% subset(select = grep("1$", colnames(ames_raw)))
ames_raw %>% subset(select = ends_with("1", vars=colnames(ames_raw)))
select(ames_raw, grep("1$", colnames(ames_raw)))
select(ames_raw, ends_with("1"))

################################################################################
## 2. 변수컬럼명 "끝부분" 일치여부 이용 인덱싱/셀렉션

## 2.1 base::grep() & tidyselect::ends_with() 함수이용 패턴찾기
#끝나는 단어 알고 싶으면 "~~$" 달러 표시를 합니다.

colnames(ames_raw)

grep(pattern = "Area$", x = colnames(ames_raw), ignore.case = TRUE)
grep(pattern = "Area$", x = colnames(ames_raw), ignore.case = TRUE, value = T)
ends_with(match = "Area", vars = colnames(ames_raw), ignore.case = TRUE)

colnames(ames_raw)[grep("Area$", colnames(ames_raw))]
colnames(ames_raw)[ends_with("Area", vars = colnames(ames_raw))]
# - "Area"라는 문자로 끝나는 모든 변수컬럼 조회
# - colnames(ames_raw) 대신 names(ames_raw) 사용가능
# - ignore.case = TRUE는 디폴트값으로 생략이 가능하며,
#   ignore.case = FALSE로 설정하면 대소문자를 구별해서 조회함
# - grep()에서 value = TRUE로 설정하면, 해당 인덱스번호 대신에
#   해당되는 요소값을 리턴해 주는데, value = FASLE가 디폴트값임

# ----------------------------------------
## 2.2 대괄호[] 연산자 사용 인덱싱/셀렉션 방식
ames_raw[grep("Area$", colnames(ames_raw))]
ames_raw[ends_with("Area", vars = colnames(ames_raw))]

## 대괄호[행, 열] 연산자 사용 인덱싱/셀렉션 방식
ames_raw[ , grep("Area$", colnames(ames_raw))]
ames_raw[ , ends_with("Area", vars = colnames(ames_raw))]

# ----------------------------------------
## 2.3 base::subset() 사용 인덱싱/셀렉션 방식
subset(ames_raw, select = grep("Area$", colnames(ames_raw)))
subset(ames_raw, select = ends_with("Area", vars = colnames(ames_raw)))

## 파이프 %>% 연산자 이용
ames_raw %>% subset(select = grep("Area$", colnames(ames_raw)))
ames_raw %>% subset(select = ends_with("Area", vars = colnames(ames_raw)))

# ----------------------------------------
## 2.4 dplyr::select() 기능함수 이용방식
select(ames_raw, grep("Area$", colnames(ames_raw)))
select(ames_raw, ends_with("Area"))

## 파이프 %>% 연산자 이용
ames_raw %>% select(grep("Area$", colnames(ames_raw)))
ames_raw %>% select(ends_with("Area"))


################################################################################
## 3. 변수컬럼명 "특정문자" 포함여부 이용 인덱싱/셀렉션

## 3.1 base::grep() &
#      tidyselect::contains(), tidyselect::matches() 함수이용 패턴찾기
colnames(ames_raw)

grep(pattern = "Fin", x = colnames(ames_raw), ignore.case = TRUE)
grep(pattern = "Fin", x = colnames(ames_raw), ignore.case = TRUE, value = T)
contains(match = "Fin", vars = colnames(ames_raw), ignore.case = TRUE)
matches(match = "Fin", vars = colnames(ames_raw), ignore.case = TRUE)

colnames(ames_raw)[grep("Fin", colnames(ames_raw))]
colnames(ames_raw)[contains("Fin", vars = colnames(ames_raw))]
colnames(ames_raw)[matches("Fin", vars = colnames(ames_raw))]

# ----------------------------------------
## 3.2 대괄호[] 연산자 사용 인덱싱/셀렉션 방식
ames_raw[grep("Fin", colnames(ames_raw))]
ames_raw[contains("Fin", vars = colnames(ames_raw))]
ames_raw[matches("Fin", vars = colnames(ames_raw))]

## 대괄호[행, 열] 연산자 사용 인덱싱/셀렉션 방식
ames_raw[ , grep("Fin", colnames(ames_raw))]
ames_raw[ , contains("Fin", vars = colnames(ames_raw))]
ames_raw[ , matches("Fin", vars = colnames(ames_raw))]

# ----------------------------------------
## 3.3 base::subset() 사용 인덱싱/셀렉션 방식
subset(ames_raw, select = grep("Fin", colnames(ames_raw)))
subset(ames_raw, select = contains("Fin", vars = colnames(ames_raw)))
subset(ames_raw, select = matches("Fin", vars = colnames(ames_raw)))

## 파이프 %>% 연산자 이용
ames_raw %>% subset(select = grep("Fin", colnames(ames_raw)))
ames_raw %>% subset(select = contains("Fin", vars = colnames(ames_raw)))
ames_raw %>% subset(select = matches("Fin", vars = colnames(ames_raw)))

# ----------------------------------------
## 3.4 dplyr::select() 기능함수 이용방식
select(ames_raw, grep("Fin", colnames(ames_raw)))
select(ames_raw, contains("Fin"))
select(ames_raw, matches("Fin"))

## 파이프 %>% 연산자 이용
ames_raw %>% select(grep("Fin", colnames(ames_raw)))
ames_raw %>% select(contains("Fin"))
ames_raw %>% select(matches("Fin"))

################################################################################
## 4. "복합 정규표현식" 포함여부 이용 인덱싱/셀렉션
################################################################################
## - base::grep() & tidyselect::matches() 함수이용 패턴찾기

# ----------------------------------------
## 4.1 "sa로 시작 + 아무문자 + e로 끝남"으로 구성된 변수컬럼명 조회
colnames(ames_raw)

grep(pattern = "^sa.+e$", x = colnames(ames_raw), ignore.case = TRUE)
grep(pattern = "^sa.+e$", x = colnames(ames_raw), ignore.case = TRUE, value = T)
matches(match = "^sa.+e$", vars = colnames(ames_raw), ignore.case = TRUE)

colnames(ames_raw)[grep("^sa.+e$", colnames(ames_raw), ignore.case = TRUE)]
colnames(ames_raw)[matches("^sa.+e$", vars = colnames(ames_raw))]

# ----------------------------------------
## 4.2 대괄호[] 연산자 사용 인덱싱/셀렉션 방식
ames_raw[grep("^sa.+e$", colnames(ames_raw), ignore.case = TRUE)]
ames_raw[matches("^sa.+e$", vars = colnames(ames_raw))]

## 대괄호[행, 열] 연산자 사용 인덱싱/셀렉션 방식
ames_raw[ , grep("^sa.+e$", colnames(ames_raw), ignore.case = TRUE)]
ames_raw[ , matches("^sa.+e$", vars = colnames(ames_raw))]

# ----------------------------------------
## 4.3 base::subset() 사용 인덱싱/셀렉션 방식
subset(ames_raw, select = grep("^sa.+e$", colnames(ames_raw), ignore.case = TRUE))
subset(ames_raw, select = matches("^sa.+e$", vars = colnames(ames_raw)))

## 파이프 %>% 연산자 이용
ames_raw %>% subset(select = grep("^sa.+e$", colnames(ames_raw), ignore.case = TRUE))
ames_raw %>% subset(select = matches("^sa.+e$", vars = colnames(ames_raw)))

# ----------------------------------------
## 4.4 dplyr::select() 기능함수 이용방식
select(ames_raw, grep("^sa.+e$", colnames(ames_raw), ignore.case = TRUE))
select(ames_raw, matches("^sa.+e$"))

## 파이프 %>% 연산자 이용
ames_raw %>% select(grep("^sa.+e$", colnames(ames_raw), ignore.case = TRUE))
ames_raw %>% select(matches("^sa.+e$"))

################################################################################
## 5.1 "숫자(\\d)"가 들어간 변수컬럼명 조회
# - "\\d" 표현식 대신에 "[0-9]"로 해도 됨
colnames(ames_raw)

grep(pattern = "\\d", x = colnames(ames_raw), ignore.case = TRUE)
grep(pattern = "\\d", x = colnames(ames_raw), ignore.case = TRUE, value = T)
matches(match = "\\d", vars = colnames(ames_raw), ignore.case = TRUE)

colnames(ames_raw)[grep("\\d", colnames(ames_raw))]
colnames(ames_raw)[matches("\\d", vars = colnames(ames_raw))]

# ----------------------------------------
## 5.2 대괄호[] 연산자 사용 인덱싱/셀렉션 방식
ames_raw[grep("\\d", colnames(ames_raw), ignore.case = TRUE)]
ames_raw[matches("\\d", vars = colnames(ames_raw))]

## 대괄호[행, 열] 연산자 사용 인덱싱/셀렉션 방식
ames_raw[ , grep("\\d", colnames(ames_raw), ignore.case = TRUE)]
ames_raw[ , matches("\\d", vars = colnames(ames_raw))]

# ----------------------------------------
## 5.3 base::subset() 사용 인덱싱/셀렉션 방식
subset(ames_raw, select = grep("\\d", colnames(ames_raw), ignore.case = TRUE))
subset(ames_raw, select = matches("\\d", vars = colnames(ames_raw)))

## 파이프 %>% 연산자 이용
ames_raw %>% subset(select = grep("\\d", colnames(ames_raw), ignore.case = TRUE))
ames_raw %>% subset(select = matches("\\d", vars = colnames(ames_raw)))

# ----------------------------------------
## 5.4 dplyr::select() 기능함수 이용방식
select(ames_raw, grep("\\d", colnames(ames_raw), ignore.case = TRUE))
select(ames_raw, matches("\\d"))

## 파이프 %>% 연산자 이용
ames_raw %>% select(grep("\\d", colnames(ames_raw), ignore.case = TRUE))
ames_raw %>% select(matches("\\d"))

################################################################################
## 6.1 "Fin + 아무문자 + 숫자"로 구성된 변수컬럼명 조회
# - "Fin.+\\d" 표현식 대신에 ""Fin.+[0-9]"로 해도 됨
colnames(ames_raw)

grep(pattern = "Fin.+\\d", x = colnames(ames_raw), ignore.case = TRUE)
grep(pattern = "Fin.+\\d", x = colnames(ames_raw), ignore.case = TRUE, value = T)
matches(match = "Fin.+\\d", vars = colnames(ames_raw), ignore.case = TRUE)

colnames(ames_raw)[grep("Fin.+\\d", colnames(ames_raw))]
colnames(ames_raw)[matches("Fin.+\\d", vars = colnames(ames_raw))]

# ----------------------------------------
## 6.2 대괄호[] 연산자 사용 인덱싱/셀렉션 방식
ames_raw[grep("Fin.+\\d", colnames(ames_raw), ignore.case = TRUE)]
ames_raw[matches("Fin.+\\d", vars = colnames(ames_raw))]

## 대괄호[행, 열] 연산자 사용 인덱싱/셀렉션 방식
ames_raw[ , grep("Fin.+\\d", colnames(ames_raw), ignore.case = TRUE)]
ames_raw[ , matches("Fin.+\\d", vars = colnames(ames_raw))]

# ----------------------------------------
## 6.3 base::subset() 사용 인덱싱/셀렉션 방식
subset(ames_raw, select = grep("Fin.+\\d", colnames(ames_raw), ignore.case = TRUE))
subset(ames_raw, select = matches("Fin.+\\d", vars = colnames(ames_raw)))

## 파이프 %>% 연산자 이용
ames_raw %>% subset(select = grep("Fin.+\\d", colnames(ames_raw), ignore.case = TRUE))
ames_raw %>% subset(select = matches("Fin.+\\d", vars = colnames(ames_raw)))

# ----------------------------------------
## 6.4 dplyr::select() 기능함수 이용방식
select(ames_raw, grep("Fin.+\\d", colnames(ames_raw), ignore.case = TRUE))
select(ames_raw, matches("Fin.+\\d"))

## 파이프 %>% 연산자 이용
ames_raw %>% select(grep("Fin.+\\d", colnames(ames_raw), ignore.case = TRUE))
ames_raw %>% select(matches("Fin.+\\d"))

################################################################################
## 7.1 "t + 아무2자리글자 + n + 아무문자 + 숫자"로 구성된 변수컬럼명 조회
# - "t..n.+\\d" 표현식 대신에 ""t..n.+[0-9]"로 해도 됨
colnames(ames_raw)

grep(pattern = "t..n.+\\d", x = colnames(ames_raw), ignore.case = TRUE)
grep(pattern = "t..n.+\\d", x = colnames(ames_raw), ignore.case = TRUE, value = T)
matches(match = "t..n.+\\d", vars = colnames(ames_raw), ignore.case = TRUE)

colnames(ames_raw)[grep("t..n.+\\d", colnames(ames_raw))]
colnames(ames_raw)[matches("t..n.+\\d", vars = colnames(ames_raw))]

# ----------------------------------------
## 7.2 대괄호[] 연산자 사용 인덱싱/셀렉션 방식
ames_raw[grep("t..n.+\\d", colnames(ames_raw), ignore.case = TRUE)]
ames_raw[matches("t..n.+\\d", vars = colnames(ames_raw))]

## 대괄호[행, 열] 연산자 사용 인덱싱/셀렉션 방식
ames_raw[ , grep("t..n.+\\d", colnames(ames_raw), ignore.case = TRUE)]
ames_raw[ , matches("t..n.+\\d", vars = colnames(ames_raw))]

# ----------------------------------------
## 7.3 base::subset() 사용 인덱싱/셀렉션 방식
subset(ames_raw, select = grep("t..n.+\\d", colnames(ames_raw), ignore.case = TRUE))
subset(ames_raw, select = matches("t..n.+\\d", vars = colnames(ames_raw)))

## 파이프 %>% 연산자 이용
ames_raw %>% subset(select = grep("t..n.+\\d", colnames(ames_raw), ignore.case = TRUE))
ames_raw %>% subset(select = matches("t..n.+\\d", vars = colnames(ames_raw)))

# ----------------------------------------
## 7.4 dplyr::select() 기능함수 이용방식
select(ames_raw, grep("t..n.+\\d", colnames(ames_raw), ignore.case = TRUE))
select(ames_raw, matches("t..n.+\\d"))

## 파이프 %>% 연산자 이용
ames_raw %>% select(grep("t..n.+\\d", colnames(ames_raw), ignore.case = TRUE))
ames_raw %>% select(matches("t..n.+\\d"))

### End of Source ##############################################################








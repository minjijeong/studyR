#############################################################################
### 일반 Plain Text 파일 로딩 
#############################################################################

## 로딩용 데이터셋 폴더위치(경로)와 파일명 확인

getwd()
# - 현재 작업경로(working director) 확인

list.dirs()
# - 현재 작업경로내 폴더명 조회

list.files()
# - 현재 작업경로내 파일명 조회

list.files("./Chapter6",pattern = "adult")
# - adult라는 단어가 들어 있는 파일명 조회

adultFileUrl <- "./Chapter6/adult.csv"

#############################################################################
## (1) 기본 패키지 활용 로딩방식
#   search()로 아래 패키지 존재유무 확인
# - base패키지 중의 하나인 utils패키지에 속한 
#   read.csv()나 read.table() 함수를 이용해 (기능동일)
#   .csv, .txt 파일을 data.frame 형식으로 로딩함 
## 간단 로딩
adult.df <- read.csv(file = adultFileUrl, header = TRUE, sep = ",")
View(adult.df)

str(adult.df)
class(adult.df); mode(adult.df)
# - 내부구조 조회결과 불필요한 1) 팩터형변수로 인식된 변수컬럼,
#   문자데이터 좌우로 붙어 있는 2) 화이트스페이스 존재,
#   군데군데 보이는 3) 결측치 문자가 제대로 인식이 안된 채로 로딩됨

# ------------------------------------
## 몇가지 옵션사용 로딩
adult.df <- read.csv(file = adultFileUrl, header = TRUE, sep = ",",
                     stringsAsFactors = FALSE, 
                     strip.white = TRUE,
                     na.strings = c("", "?"))
# stringsAsFactors : 문자열 펙터로 자동인식 방지
# strip.white = TRUE : 공백(white space) 제어(공백제거)
# na.strings = c("", "?") : ?,""을 NA로 변경

str(adult.df)
class(adult.df); mode(adult.df)
# 다양한 데이타 형태가 존재하는 경우 MODE = LIST로 명시
# - 3가지 옵션/인수/인자 설정을 통해서 데이터로딩시 발생가능한 문제해결

#############################################################################
## (2) 최신 readr 패키지 활용 로딩방식
# - read_csv(), read_delim() 함수를 이용해 
#   .csv, .txt 파일을 tibble(tble_df, tbl) 형식과 data.frame 형식으로 로딩함

## 필요 패키지 설치
# install.packages("readr")
library(readr)

# ------------------------------------
## readr::read_delim() 함수 이용
## 명시적으로 패키지명::함수명 형식으로 사용한다.
adult.tb <- read_delim(file = adultFileUrl, 
                       col_names = TRUE, ## header가 존재하는 유무 
                       delim = ",", ## 구분
                       trim_ws = TRUE, ## 공백(white space) 제거
                       na = c(""," ", "?"))  ## NA로 대체 

View(adult.tb)
str(adult.tb)
class(adult.tb); mode(adult.tb)
## class 정보에서 tbl 정보가 추가됨. 자료구조 tibble로 선언됨. 
## tibble은 자료구조 처리속도의 한계로 인해 생성된 신규 객체유형
## tibble은 data.frame의 기능 및 구조를 포함하고 있다. 
# - read_delim() 함수는 delim 옵션을 통해서 요소값을 구별하는 구분기호가
#   콤마(,), 세미콜론(;), 탭(/t) 등인 경우에 로딩이 가능함
# - stringsAsFactors = FALSE 옵션은 아예 별도 옵션설정 없이 기본으로 작동함

# ------------------------------------
## readr::read_csv() 함수 이용
adult.tb <- read_csv(file = adultFileUrl, col_names = TRUE,
                     trim_ws = TRUE,
                     na = c("", "?"))

str(adult.tb)
class(adult.tb); mode(adult.tb)

v <- paste("aaaaa"+"\t"+"bbbbb",v)

# - read_csv() 함수는 데이터요소값들을 구별하는 구분기호가 
#   콤마(,)로 되어 있는 파일에 특화된 로딩함수임
#   (그래서 별도의 delim = ","라는 구분이 없음)
# - 구분기호가 세미콜론(;)이나 탭(/t)로 되어 있는 파일로딩시 오류가 발생함

#############################################################################
## (3) 최신 data.table 패키지 활용 로딩방식
# - fread() 함수를 이용해 
#   .csv, .txt 파일을 data.table 형식과 data.frame 형식으로 로딩함

## 필요 패키지 설치
# install.packages("data.table")
library(data.table)

# ------------------------------------
# data.tabble::fread() 함수 이용
adult.dt <- fread(input = adultFileUrl, header = TRUE, sep = ",", 
                  stringsAsFactors = FALSE, 
                  strip.white = TRUE, 
                  na.strings = c("", "?"))

str(adult.dt)
class(adult.dt); mode(adult.dt)

#############################################################################
## 데이터셋 로딩시 3가지 방법간 성능비교

## (1) system.time {base} 함수이용
system.time(adult.df <- read.csv(file = adultFileUrl, header = TRUE, sep = ",",
                                 stringsAsFactors = FALSE, 
                                 strip.white = TRUE,
                                 na.strings = c("", "?")))

system.time(adult.tb <- read_delim(file = adultFileUrl, col_names = T, delim = ",",
                                   trim_ws = TRUE,
                                   na = c("", "?")))

system.time(adult.dt <- fread(input = adultFileUrl, header = TRUE, sep = ",",
                              stringsAsFactors = FALSE, 
                              strip.white = TRUE, 
                              na.strings = c("", "?")))

## (2) microbenchmark {microbenchmark} 함수이용
# install.packages("microbenchmark")
library(microbenchmark)
microbenchmark(adult.df = read.csv(file = adultFileUrl, header = TRUE, sep = ",",
                                   stringsAsFactors = FALSE, 
                                   strip.white = TRUE,
                                   na.strings = c("", "?")),
               adult.tb = read_delim(file = adultFileUrl, col_names = T, delim = ",",
                                     trim_ws = TRUE,
                                     na = c("", "?")),
               
               adult.dt = fread(input = adultFileUrl, header = TRUE, sep = ",",
                                stringsAsFactors = FALSE, 
                                strip.white = TRUE, 
                                na.strings = c("", "?")),
               times = 10, unit = "s")
# - 각각 단위작업을 = 기호를 이용해서 구별하였음

#############################################################################
## 로딩된 데이터셋의 내부구조와 요약정보(기술통계) 조회하는 방법

## (1) 내부구조 조회

## base패키지 중의 하나인 utils::str() 함수를 이용해 객체의 내부구조를 조회함

str(adult.df)
str(adult.tb)
str(adult.dt)

## dplyr::glimpse()함수를 이용해 객체의 내부구조를 조회함
# install.packages("dplyr")
library(dplyr)

glimpse(adult.df)
glimpse(adult.tb)
glimpse(adult.dt)
## 지저분한 내부구조 간편하게 나옴
## (2) 요약정보 조회

## base::summary() 함수를 이용해 객체의 간단 기술통계 확인
summary(adult.df)
summary(adult.tb)
summary(adult.dt)

# MIN : 25%
# MEDIAN :50%
# 3RD QU. : 75%
# MAX:100%

## skimr::skim()함수를 이용해 객체의 내부구조 조회함
 install.packages("skimr")
library(skimr)

skim(adult.df)
skim(adult.tb)
skim(adult.dt)

#############################################################################
## 로딩된 데이터셋의 기본내용 조회하는 방법

## (1) 해당 객체이름을 통한 내용조회

adult.df
# - data.frame 객체형식인데, 전체변수컬럼과 실데이터가 출력되다가
#   max.print 옵션설정에 도달하면 더이상 출력이 안됨 
# - options()$max.print로 설정값 확인가능(기본값은 1000임) 
# - options(max.print = 2000)과 같은 방식으로 변경가능 => 설정된 2000개 이상은 안보여줌.

options(max.print = 1000)
## option 설정된 값 출력
options()$max.print

# $digits
# [1] 7
# $max.print ## cell 출력개수 제한
# [1] 1000

adult.tb
# - tibble 객체형식인데, 현재 콘솔창의 크기를 고려해 
#   read_cvs tibble 구조로 저장할 수 있다.
#   적정한 변수컬럼과 레코드 10개를 출력해줌
# - 콘솔화면 하단에 출력하지 못한 레코드갯수와 변수컬럼이  
#   어떤것이 있는지 안내해줌 
# - 데이타 특성에 따라, 보기좋게 표기하고 있음. 너무 긴것은 ~ 생략 숫자는 마이너스인경우 다른색으로 표기
## 컬럼명 작성시 명칭에 특수기호를 포함하게되면 '' 묶어주어야 한다. 


adult.dt
# - data.table 객체 형식인데, 전체변수컬럼이 출력되며,
#   실데이터는 앞쪽에서 4개, 뒤쪽에서 4개 레코드를 보여줌
# fread로 제일 빠르게 읽을 수 있다. tibble 구조보다 더 빠르게 자료처리된다. 
# 데이타 처리의 사용법이 불편해서 데이타 로딩만 진행하여 속도를 빠른것이 필요할때만 사용한다.
# 분석시에는 tibble구조로 변경하여 사용한다.  
adult.trns.tb <- as_tibble(adult.dt)

## (2) utils::View()를 활용한 내용조회
View(adult.df)
View(adult.tb)
View(adult.dt)

## (3) head & tail을 활용한 부분조회
head(adult.df)
head(adult.tb)
head(adult.dt)

tail(adult.df)
tail(adult.tb)
tail(adult.dt)

## (4) psych::headTail()을 활용한 부분조회
# install.packages("psych")
library(psych)
headTail(adult.df)
headTail(adult.tb)
headTail(adult.dt)

#############################################################################
## 로딩된 데이터셋의 객체유형(class) 변경방법
# - tibble이나 data.table 형식으로 만들면 데이터셋 로딩이나 저장, 
#   조회, 서브셋, 가공, 시각화 등에서 속도나 간편코딩 이점을 누릴 수 있음
# - 이런 효과를 누리기 위해서 전통적인 data.frame형식을 다루는 함수를 
#   사용하면 안되며, tibble 형식의 경우 dplyr이라는 패키지의 기능함수를 
#   사용하면 해당 효과를 누릴 수 있음
# - 그래서 data.frame이나 data.table로 로딩한 데이터객체를
#   as_tibble() 함수를 이용해 tibble 구조로 변경할 수 있음

## 각 객체별 유형확인
class(adult.df)
class(adult.tb)
class(adult.dt)

## data.frame객체를 tibble객체로 변환
adult.df_to_tibble <- as_tibble(adult.df)
class(adult.df_to_tibble)

## data.table객체를 tibble객체로 변환
adult.dt_to_tibble <- as_tibble(adult.dt)
class(adult.dt_to_tibble)

### End of Source ###########################################################


---
title: "R 용어정리"
author: "정민지"
date: "2018-10-01"
output: 
  html_document:
    toc: true
    toc_depth: 3
    number_sections: true
    code_folding: hide
    toc_float:
      collapsed: false
  pdf_document:
    latex_engine: xelatex
    toc: true
    toc_depth: 3
    number_section: true
mainfont: D2Coding
---
# R 패키지
## Factor
- GROUP BY 와 동일한 기능 
```{r}
edulevel <- c("ms", "dt", "hs", "ms", "ms", "cl", 
              "dt", "hs", "hs", "dt", "dt", "ms", 
              "hs", "cl", "ms", "dt", "hs", "ms", 
              "hs", "cl", "cl", "hs", "hs", "cl", 
              "hs", "cl", "cl")
edulevel2 <- factor(edulevel)
levels(edulevel2) 
## Factor w/ 4 levels "cl","dt","hs",..: 4 2 3 4 4 1 2 3 3 2 ...
```

# 확률관련 단어 정리




##정규분포 
- https://brunch.co.kr/@rapaellee/4

### 표준화(Standardization)
x - 평균 / 표준편차
평균을 기준으로 얼마나 떨어져 있는지를 나타내는 값. 서로 다른 단위의 대상 데이터를 같은 기준으로 볼수 있도록 변환 

### 정규화(Normalization)
x - 최소값/ 최대값-최소값
구간 0 ~ 100 으로 설정하여 관찰 

##이항분포

##포아송분포 



#정규분포에 준하는 난수 생성 함수 
rnorm








# 데이터 정규화(Feature Scaling)
https://thebook.io/006723/ch09/02/01/

데이터 정규화는 변숫값의 분포를 표준화하는 것을 의미한다. 표준화는 변수에서 데이터의 평균을 빼거나 변수를 전체 데이터의 표준 편차로 나누는 작업을 포함한다. 이렇게 하면 변숫값의 평균이 0 이 되고 값의 퍼짐 정도(분포) 또한 일정해진다.
데이터 정규화는 k 최근 이웃 분류 알고리즘kNN, k-Nearest Neighbor, 서포트 벡터 머신SVM, Support Vector Machine, 신경망Neural Network 등 많은 분류 알고리즘에서 유용하게 사용된다.[4] R에서 데이터를 정규화하는 함수는 scale( )이다.
```{r}
scale(
  x,            # 숫자 벡터 유형의 객체
  center=TRUE,  # TRUE면 모든 데이터에서 전체 데이터의 평균을 뺀다.
  # scale이 TRUE일 때 center도 TRUE면 모든 데이터를 전체 데이터의 표준 편차로 나눈다.
  # scale이 TRUE지만 center는 FALSE면 모든 데이터를 전체 데이터의 제곱 평균 제곱근으로 나눈다.
  # scale이 FALSE면 데이터를 어떤 값으로도 나누지 않는다.
  scale=TRUE
)
```
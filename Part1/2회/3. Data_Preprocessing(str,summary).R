#### 데이터 파악하기, 구조, 요약통계량 확인 ####
# https://mrchypark.github.io/dabrp_classnote3/class2#11 +a

mpg <- read.csv('./data/mpg1.csv')#,row.names = 'X')
# mpg <- mpg[,-1]
head(mpg)

# head(): 최초 6행의 데이터를 보여줌(행갯수 조절 가능)
# tail(): 마지막 6행의 데이터를 보여줌(행갯수 조절 가능)
# length(): 열 갯수 출력, 데이터의 길이 출력(vector)
# nrow(): 행 갯수 출력(data.frame)
# ncol(): 열 갯수 출력
# dim(): (행,열) 데이터 차원 출력

# View(): gui환경에서 데이터 확인
# Addins::editData : gui 환경에서 데이터 확인, 수

# str(): 각 컬럼의 자료형과 초기 값을 보여줌
# dplyr::glimpse()  : str()와 비슷 각 컬럼의 자료형, 차원을 알려준다.

# summary(): 각 컬럼의 자료형과 숫자라면 대표값을 함께 보여줌
# psych::describe() : summary() 와 비슷 하지만 더 많은 요약 통계량을 준다.
# psych::describeBy(mpg[c('cty','hwy')], mpg$drv) # 그룹별(factor) 요약통계량

# is.na(): NA 인지 확인
# complete.cases(): 값이 모두 있는지 행단위로 검사

# tibble(): 최근 기법으로 재구성한 tidyverse 패키지 군에서 사용하는 data.frame의 일종
# as.data.table(): DB에서 사용하는 기법 등과 메모리 효율성을 극대화한 data.frame의 일종
# http://using.tistory.com/81 # data.table 

#### 변수명 변경 ####
library(dplyr)
# dplyr::rename()

df_midterm <- data.frame(english = c(90, 80, 60, 70),
                         math = c(50, 60, 100, 20),
                         class = c(1, 1, 2, 2))
df_midterm2 <- df_midterm # 데이터프레임 복
df_midterm2 <- rename(df_midterm2, ENGLISH = english)
df_midterm2

#### QUIZ) mpg 데이터프레임을 복사하고, 변수명 3개를 변경해보시오 ####

#### 파생변수 만들기 ####
# 파생변수(Derived Variable) : 기존의 변수를 변형해 만든 변수
df_midterm$sum <- df_midterm$english + df_midterm$math
df_midterm

df_midterm$mean <- df_midterm$sum / 2
df_midterm

#### 조건문 ####
ifelse('조건문','조건문 TRUE일 때 실행', '조건문 FALSE일 때 실행')

ifelse(10>1, '참입니다.', '거짓입니다.')
ifelse(10<1, '참입니다.', '거짓입니다.')

mpg$total <- (mpg$cty + mpg$hwy) / 2
summary(mpg$total)
hist(mpg$total)
boxplot(mpg$total)

mpg$test <- ifelse(mpg$total >= 20, 'pass', 'fail')
mpg$test

library(ggplot2)
table(mpg$test) 
qplot(mpg$test)

# total을 기준으로 A, B, C 등급 부여
mpg$grade <- ifelse(mpg$total >= 30, "A",
                    ifelse(mpg$total >= 20, "B", "C"))

head(mpg, 20)     # 데이터 확인

table(mpg$grade)  # 등급 빈도표 생성
qplot(mpg$grade)  # 등급 빈도 막대 그래프 생성

# A, B, C, D 등급 부여
mpg$grade2 <- ifelse(mpg$total >= 30, "A",
                     ifelse(mpg$total >= 25, "B",
                            ifelse(mpg$total >= 20, "C", "D")))

#### QUIZ) midwest 데이터 분석 ####
midwest <- ggplot2::midwest
midwest

# 1. poptotal백(전체인구) 변수를 total로, popasian(아시아 인구) 변수를 asian으로 수정하시오

# 2. total, asian 변수를 이용해 '전체 인구 대비 아시아 인구 백분율' 파생변수를 만들고, 히스토그램을 그리시오

# 3. 아시아 인구 백분율 전체 평균을 구하고, 평균을 초과하면 'large', 그 외에는 'small'을 부여하는 파생변수를 만들어 보세요.
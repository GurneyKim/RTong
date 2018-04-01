#### 변수 ####
# a라는 변수명에 숫자 1을 메모리에(RAM) 할당했다. / 아래의 Environment에 a가 생성됨
a <- 1
# a 출력
a

# aa라는 변수명에 실수 3.141592 를 메모리에(RAM) 할당했다.
aa <- 3.141592

# name 라는 변수에 '홍길동' 문자를 메모리에(RAM) 할당했다.
name <- '홍길동' # 문자 할당은 "문자" or '문자'로 할당한다.

#### 메모리에 할당된 변수 확인, 삭제 ####
rm(a) # 메모리에 할당된 변수 a 삭제 / rm = remove

ls() # 메모리에 할당된 모든 변수 조회

rm(list=ls()) # 메모리에 할당된 모든 변수 삭제

#### 변수명 규칙 ####
# 반드시 문자로 시작
1a <- 10 # unexpected 오류 발생

# 대소문자 구분
score <- 10
SCORE <- 11
Score <- 12  # 모두 다른 변수이다.

# (_) 사용 가능, 특수문자 사용 금지
total_score <- 479
total_score! <- 11

#### Quiz 변수를 만들어 보세요 ####


#### 질문 ! 한 변수에 여러명의 점수를 넣을 수 있지 않을까? ####
math_score <- c(70,80,60,88) # c() Combine(합치다)의 의미
math_score # math_score라는 변수에 70,80,60,88 숫자를 동시에 할당함
math_score[1] # math_score의 첫 번째 값 추출
math_score[2] # math_score의 두 번째 값 추출
math_score[3] # math_score의 세 번째 값 추출
math_score[4] # math_score의 네 번째 값 추출

math_score + 10 # math_score 변수에 있는 모든 숫자에 + 10
math_score # 기존값이 변하지 않는다. 변하고 싶다면
math_score <- math_score +10 # 재할당해주어야 한다.

math_score*1.5  # math_score 변수에 있는 모든 숫자에 곱하기 1.5

#### Quiz! math_score의 평균을 구하시오, 단 함수 사용 금지 ####


#### 문자 데이터 ####
name1 <- 'kim'
name2 <- c('k','i','m')

name1
name2

name1 + 2 # 문자열은 연산할 수 없다.


#### 함수 ####
# 함수란 특정한 기능을 가지고 있는 상자라고 생각하자.

# 평균을 구한다면?
x <- c(1,2,3)
(x[1] + x[2] + x[3]) / 3

mean(x)
max(x)
min(x)
mean('ㅇ')
x_maen <- mean(x)
x_maen
#### Quiz! english_score 변수에 10명의 점수를 임의로 할당하여 평균 mean(), 최대값 max(), 최소값 min(), 중앙값 median(), 표준편차 sd()를 구하시오 ####
 

#### (심화) mean 함수가 어떻게 만들어져 있나? ####
# help(mean)
# methods(mean)
getAnywhere(mean.default())
# 사용자 정의 함수를 만들 수 있다.
stat_function <- function(x)
{
  x_mean = mean(x)
  x_sd = sd(x)
  x_min = min(x)
  x_max = max(x)
  x_summary = list(평균=x_mean, 표준편차=x_sd, 최소값= x_min, 최대값= x_max)
  return(x_summary)
}
stat_function()

#### 패키지(packages) ####
# 패키지란 특정 기능들이 모인 함수들의 꾸러미라고 생각하자.
# https://cran.r-project.org/
install.packages('ggplot2') # 을 실행하면 위의 공식 홈페이지에 들어가 'ggplot2' 패키지를 확인하여 나의 로컬(컴퓨터)에 다운로드 한다.


# 주제에 맞는 다양한 패키지 https://cran.r-project.org/web/views/

# 패키지 사용방법
# 1. 설치 / 2. 사용마다 library('패키지명') 불러오기
install.packages('ggplot2')
library(ggplot2)
qplot(x)
#ggplot2::qplot(x) # 다양한 패키지를 로드하다보면 함수명이 겹칠 때가 있다. 그때는 앞에 패키지명::함수명 을 사용한다.

# 패키지 기능을 모르겠다면?  공식 문서를 살펴보자!, 구글에 검색하자
?qplot
help(qplot)
# https://goo.gl/FxybXX

#### Quiz! "dplyr" 패키지를 설치하시오 ####


#### (심화) R의 자료형(data type) ####
# https://goo.gl/yAHrqw 
sessionInfo()

# NULL: 데이터가 없는 경우
# Logical: 불리언, 참 또는 거짓
# Int: 정수
# Double: 부동소수점 실수
# Complex: 복소수
# Character: 문자열
# List: 리스트
# Closure: 함수 등 등 
typeof(NULL)
typeof(3.14)

# 자료형과 클래스의 차이점
# R 에서 클래스는 변수가 가지는 속성의 하나이다. 따라서 자료형과 클래스는 같은 값을 가지지 않을 수도 있다.
# 특히 다음과 같은 점에 주의한다.
# 부동소수점 실수의 자료형은 double 이지만 클래스는 numeric 이다.
# 함수의 자료형은 closure 이지만 클래스는 function 이다.
# matrix, data.frame 등의 클래스 객체나 사용자 정의 클래스의 자료형은 list 이다.


x <- TRUE            ; cat(class(x), typeof(x), "\n")
x <- 1L              ; cat(class(x), typeof(x), "\n")
x <- 3.14            ; cat(class(x), typeof(x), "\n")
x <- "abc"           ; cat(class(x), typeof(x), "\n")
x <- ls              ; cat(class(x), typeof(x), "\n")
x <- matrix(cars)    ; cat(class(x), typeof(x), "\n")
x <- cars            ; cat(class(x), typeof(x), "\n")

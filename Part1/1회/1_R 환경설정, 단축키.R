#### R 설치 ####
# https://cran.r-project.org/bin/windows/base/
  
  
#### R packges 설치 ####

# 패키지 종류
# https://cran.r-project.org/web/views/
  
# 패키지 하나만 설치할 때 
install.packages('패키지명')

# 의존 패키지, 권장 패키지 함께 설치할 때(의존패키지 - Depends  / 권장 패키지 - Suggests)
install.packages('caret', dependencies = c("Depends", "Suggests"))

# 패키지 업데이트
update.packages('패키지명')


#### R studio 설치 ####
# https://www.rstudio.com/products/rstudio/download/
  
#### R studio 환경설정, 단축키 ####

# 현재 개발환경 확인
sessionInfo()

# 작업 디렉토리
getwd()
setwd('변경할 위치') #작업 디렉토리 변경

# 한번에 패키지 업데이트
#Tools -> check for package update (패키지 한번에 업데이트)

# R data 저장여부
# Tools - Global Option - General - save work space .Rdada (항상 저장되는 Rdata X)

#  encoding 조절
# File - Reopen with encoding 

# 폰트, Theme 변경
# Tools - global Options - Appearance

# 단축키 help-keyboard
# * 화살표 <-  : alt + ' -'
# * 여러개 스크립트창 있을 때 옮기는 단축키 :ctrl + tab / ctrl + tab + shift
# * 콘솔창 지우기 : ctrl +' l'
# *  스크립트, 콘솔창 왔다갔다 : ctrl + 1, ctrl + 2
# *  주석처리 : ctrl+ shift + 'c'
# *  들여쓰기 : ctrl +[ , ]
# *  하이퍼링크,책갈피 기능 : ctrl + shift + 'o'  / ---- , ====, #### 으로 열고 닫고
# * 자동 띄어쓰기(reformat code) : ctrl +shift + a


#### R Studio Script file, Project 관리 ####
# Script file 관리
# 캡슐화(객체 지향 프로그래밍)/ 사용자정의함수 사용
# source() 로 스크립트 불러와서 사용 

# Project 관리
# 용도에 따른 구분 - 데이터 입출력, 전처리 등
# 성질에 따른 구분 - 패키지 로딩, 환경설정, 데이터 병합 등
# 요구사항에 따른 구분 - 특정 업무 처리
# 
# 0_할일 / 등등
# 1_env  / 패키지 로딩, 옵션 설정, DB연결
# 2_EDA / 이상치/결측치 처리, 데이터 분호 확인, 상관계수 행렬 등
# 3_model / Feature Engineering, 모델 성능 비교
# 
# ex)
# 00_할일.r / 01_env.r / 02_eda.r / 03_model.r
# 파일로 관리
# 만약 02_eda.r 에서 01_env.r 스크립트 전체를 사용하려면
# source(01_env.r) 로 사용한다.




#### 자주쓰는 packages ####

# dplyr : 데이터 전처리
install.packages('dplyr')
install.packages("tidyr")

# ggplot2 : 데이터 시각화
install.packages(ggplot2)

# caret : Classification and Regression Training(분류, 회귀)
install.packages('caret', dependencies = c("Depends", "Suggests"))

#### 유용한 Addins / devtools ####
# devtools 설치(devtools를 설치해야 플러그인 할 수 있다.)
install.packages('devtools')

# editData (gui 환경 데이터 편집)
install.packages("editData")
devtools::install_github("cardiomoon/editData")

# ggplotAssist(ggplot2를 좀 더 쉽게)
install.packages('stringi')
devtools :: install_github ("cardiomoon/ggplotAssist") #SHA에러시 : force=TRUE 인자 추가

#### DBI(DataBase Interface, DB 연결)  ####
if (!require(devtools)) install.packages("devtools") 
if (!require(DBI)) devtools::install_github("rstats-db/DBI")
if (!require(RSQLite)) devtools::install_github("rstats-db/RSQLite")

install.packages("dbplyr") # DB 연결 후 dplyr 패키지 사용
install.packages("dtplyr") # DB 연결 후 data.table 패키지 사용

#### 성능 비교 ####
install.packages("microbenchmark")

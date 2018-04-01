#### 데이터 읽기, 쓰기(Data Read, Write) ####
데이터 분석을 하려면 외부 데이터를 가져와야 한다.
xlsx, txt, csv, rda, sas, sav, pdf. . . . . . .??? OMG!!!!!

매우 어렵게 느껴지지만 느낌!만(작동방식) 알면 어렵지? 않다.
1. 데이터가 어떻게 저장, 압축되어 있는가? (인코딩은? 구분자는? 헤더는? 쓰레기들은? na 값은? 등 등)
2. 어떻게 빨리 읽고 쓸까? (성능을 생각해야 한다.!)

https://cran.r-project.org/doc/manuals/r-release/R-data.pdf  R-import export 공식문서

#### 1. 작동방식, 데이터가 어떻게 저장, 압축되어 있는가? ####

#### 1.1 파일위치 ####
- 상대경로 : 현재 getwd() 위치에서의 파일 경로
windows 기준 cmd(명령 프롬포트를 열어 연습해보자)
. : 현재위치
.. : 이전폴더
/ : root 폴더
dir : 현재 위치의 파일 목록 확인
cd 경로  : change directory(디렉토리 이동)
mkdir 폴더명 : make directory(폴더명으로 폴더 생성)

- 절대경로 : 전체 파일 경로
window에서는 경로를 \ 백슬래쉬로 표현 vs R 에서는 / 슬래쉬로 표현 (헷갈림)

#### Quiz) cmd(명령프롬포트 연습)#### 
# 1. 나의계정-downloads 폴더에 절대경로 방식으로 ex_cmd1 폴더(디렉토리)를 만드시오.
# 2. 나의계정-downloads 폴더에 상대경로 방식으로 ex_cmd2 폴더(디렉토리)를 만드시오.

#### 1.2 separator (구분자) ####
2차원 데이터가(데이터프레임) 형식으로 있을 때
보통 엔터키로 행을 나누고, 구분자(separator)로 열을 나눈다.
내가 읽을 파일이 어떤 구분자(separator)로 열을 나누었는가?  확인

#### 1.3 Encoding (인코딩) ####
내가 읽을 파일의 인코딩은 무엇인가?

#### 1.4 지저분한 데이터 프레임 형식 ####
앞 뒤 양 옆의 쓰레기 줄이 있는가? 어떻게 처리 할 것인가?

#### csv(comma-separated values) 파일 ####
# https://goo.gl/XsJvvT 
?read.csv
# file : 읽을 파일 경로
# header : 첫 줄 변수명으로 읽을 것인가? default = T
# sep : 구분자, read.csv의 default는 ',' read.table의 default는 ''
# skip : 건너뛸 줄 수
# fileEncoding : ex) "UTF-8"
# stringAsFactors : 문자열 자료 factor로 변환, default = T

# read
df_csv_exam <- read.csv("./data/csv_exam.csv")
df_csv_exam


# write
df_midterm <- data.frame(english = c(90, 80, 60, 70),
                         math = c(50, 60, 100, 20),
                         class = c(1, 1, 2, 2))
df_midterm

write.csv(df_midterm, file = "df_midterm.csv")
write.table(df_midterm, file = 'df_midterm.txt') # sep 구분자 차이

# summary_df <- summary(df_midterm) # 요약통계량 저장
# write.csv(summary_df,'./summary_df.csv')

#### Quiz) 다양한 mpg 파일을 읽어보시오 ####
# mpg1.csv
# mpg2.csv
# mpg3.csv
# mpg4.txt 
# mpg5.csv
# mpg6.txt

#### 다양한 파일 포맷 ####
# https://goo.gl/FhXYkD # csv, excel, sas, spss 파일 불러오기 / Case by Case!
#### xlsx file ####
install.packages("readxl")
library(readxl)
getwd()
exam <- read_excel("./data/excel_exam.xlsx") 
# exam <- read_excel(file.choose()) # file.choose() 좀 쓸만합니다.
str(exam)
# 출력
mean(exam$english)
mean(exam$science)


df_exam_novar <- read_excel("./data/excel_exam_novar.xlsx")
df_exam_novar

df_exam_novar <- read_excel("./data/excel_exam_novar.xlsx", col_names = F)
df_exam_novar

# 엑셀 파일의 세 번째 시트에 있는 데이터 불러오기
df_exam_sheet <- read_excel("./data/excel_exam_sheet.xlsx", sheet = 3)
df_exam_sheet
일

#### rda ####
# rda file save
save(df_midterm, file = "df_midterm.rda") #saveRDS()
# rda load
load("df_midterm.rda") #readRDS()
# Tools - GlobalOption 자동 저장 선택 

#### 2. 어떻게 빨리 읽고 쓸까? (성능을 생각해야 한다.!) ####
# https://goo.gl/cc6vgP  # read,write,압축 비교

- write.csv(), read.csv() : 기본 함수. 권장하지 않음
- fwrite(), fread() : 데이터 압축 없음, 문자 데이터 읽고 쓰기가 빠름, 텍스트 에디터 등으로 바로 열람 가능 ('data.table' 패키지)
- write_csv() read_csv() : 데이터 압축 없음, 무난한 읽기 및 쓰기 속도, 텍스트 에디터 등으로 바로 열람 가능 ('readr' 패키지)

- saveRDS(), readRDS() : 높은 데이터 압축률, 빠른 읽기 속도, 느린 쓰기 속도(R 내장함수)
- write_feather() read_feather() : 낮은 데이터 압축률, 매우 빠른 읽기 및 쓰기 속도 ('feather' 패키지)

#### 2.1 성능비교 ####
big_df <- data.frame(v1 = rnorm(n = 1000000, mean = 0, sd = 1),
                     v2 = rnorm(n = 1000000, mean = 2, sd = 3))

system.time(write.table(big_df, './data/big_df.txt', sep = ',', row.names = F))
system.time(fwrite(big_df, './data/big_df.txt', sep = ',', row.names = F))

system.time(df <- read.csv('./data/big_df.txt')) 
library(readr)
system.time(df <- read_csv('./data/big_df.txt'))
library(data.table)
system.time(df <- fread('./data/big_df.txt')) # read.csv 안녕 널 보내줄게

# 숫자가 많을 땐 read_csv()
# 문자가 많을 땐 fread()

# Q) R은 RAM(메모리) 작업공간에 실행된다.
# RAM이 무한하면 좋겠지만, 거의 불가능하다. 데이터를 자르거나 병렬처리하여 분석해야 함

#### Quiz) 행 = 5천만개, 열 =3 개인 데이터 프레임을 만들고 다양한 방법으로 읽어보시오
# 튕길 수 있으니 저장하고 실행
big_df2 <- data.frame(rnrom1 = rnorm(n = 50000000, mean = 0, sd = 1),
                     rnorm2 = rnorm(n = 50000000, mean = 2, sd = 3),
                     rnorm3 = rnorm(n = 50000000, mean = 10, sd = 5))

fwrite(big_df2, './data/big_df2.csv', sep = ',') # 2.4GB 생성..
big_df22 <- fread('./data/big_df2.csv')

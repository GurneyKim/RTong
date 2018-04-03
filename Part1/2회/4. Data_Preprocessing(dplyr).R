#### Reference ####
# https://goo.gl/ea2iNm - 쉽게 배우는 R 데이터 분석 ch6(김영우)
# https://mrchypark.github.io/dabrp_classnote3/class3 - 데이터 분석의 기본이 되는 데이터 전처리 (박찬엽)
# https://github.com/hellogurney/ipds-kr/tree/master/ch03-data-processing - 따라하며 배우는 데이터 과학(권재명)

기본 베이스 함수들도 데이터 가공에 강력한 기능을 제공 하지만
dplyr은 아름답다.

1. 코드 읽기가 쉽다(파이프 연산자)
2. 코드 쓰기가 쉽다
3. 자동완성 기능
4. 데이터 프레임만 처리
5. 문법이 sql과 비슷하다.

유용한 도구
1) tbl_df 함수/클래스
2) glimpse 함수
3) 파이프 연산자 %>%

#### dplyr (데이터를 다루는 7가지 방법)####
library(dplyr)
1. filter() : 행 추출
2. select() : 열(변수) 추출
3. arrange() : 정렬
4. mutate() : 변수 추가
5. summarise() : 통계치 산출 / group_by() : 집단별로 나누기 : 그룹 계산
6.left_join() : 데이터 합치기(열)
7.. bind_rows() : 데이터 합치기(열)

exam <- read.csv("Data/csv_exam.csv")
exam
str(exam)

#### dplyr::glimpse, tbl_df ####
glimpse(exam) # dplyr::glimpse(exam)
exam <- tbl_df(exam)
head(exam)
class(exam)  

#### %>% 파이프라인 ####
head(exam,10)
exam %>% head() # 파이프연산자 %>%

#### dplyr::filter(), 조건에 맞는 행 추출 ####
# exam에서 class가 1인 경우만 추출하여 출력
subset(exam, exam$class==1) # r 기초 문법
exam %>% filter(class == 1) # dplyr 문법 # filter(exam, class==1)

# 2반인 경우만 추출
exam %>% filter(class == 2)  

# 1반이 아닌 경우
exam %>% filter(class != 1)

# 3반이 아닌 경우
exam %>% filter(class != 3)

# 수학 점수가 50점을 초과한 경우
exam %>% filter(math > 50)

# 수학 점수가 50점 미만인 경우
exam %>% filter(math < 50)

# 영어 점수가 80점 이상인 경우
exam %>% filter(english >= 80)

# 영어 점수가 80점 이하인 경우
exam %>% filter(english <= 80)

#### & (and) 연산자 ####
# 1반이면서 수학 점수가 50점 이상인 경우
exam %>% filter(class == 1 & math >= 50)

# 2반이면서 영어 점수가 80점 이상인 경우
exam %>% filter(class == 2 & english >= 80)

#### | (or) 연산자 ####
# 수학 점수가 90점 이상이거나 영어 점수가 90점 이상인 경우
exam %>% filter(math >= 90 | english >= 90)

# 영어 점수가 90점 미만이거나 과학점수가 50점 미만인 경우
exam %>% filter(english < 90 | science < 50)


#### Quiz) 1, 3, 5 반에 해당되면 추출 ####


class1 <- exam %>% filter(class == 1)  # class가 1인 행 추출, class1에 할당
class2 <- exam %>% filter(class == 2)  # class가 2인 행 추출, class2에 할당
clas1
mean(class1$math)                      # 1반 수학 점수 평균 구하기
mean(class2$math)                      # 2반 수학 점수 평균 구하기


#### Quiz) Gapmider 데이터 ####
library(gapminder)
gapminder
str(gapminder)
# 1. 한국 을 뽑으시오 (country=='Korea, Rep.')
# 2. 2007년도 데이터를 뽑으시오

#### dplyr::select() ,열 추출 ####
# filter() vs select()
# filter()는 조건에 맞는 행 추출
# select()는 열 추출 
exam %>% select(math)                  # math 추출
exam %>% select(english)               # english 추출
exam %>% select(class, math, english)  # class, math, english 변수 추출
exam %>% select(-math)                 # math 제외
exam %>% select(-math, -english)       # math, english 제외

#### filter() %>% select() , 조건으로 행 데이터를 뽑고 필요한 열 추출####
# class가 1인 행만 추출한 다음 english 추출
exam %>% filter(class == 1) %>% select(english)

# 가독성을 높이자.
exam %>%
  filter(class == 1) %>%  # class가 1인 행 추출
  select(english)         # english 추출

exam %>% 
  select(id, math) %>%    # id, math 추출
  head                    # 앞부분 6행까지 추출

exam %>% 
  select(id, math) %>%  # id, math 추출
  head(10)              # 앞부분 10행까지 추출


#### Quiz) Gapminder ####
str(gapminder)
# 1. 한국의  lifeExp(기대수명)을 뽑으시오(country=='Korea, Rep.')
ㅇㅇ
#### dplyr::arrange(), 정렬 ####
## -------------------------------------------------------------------- ##
exam %>% arrange(math)         # math 오름차순 정렬
exam %>% arrange(desc(math))   # math 내림차순 정렬
#exam %>% arrange(-math)
exam %>% arrange(class, math)  # class 및 math 오름차순 정렬


#### dplyr::mutate, 파생변수 생성 ####
exam %>%
  mutate(total = math + english + science) %>%  # 총합 변수 추가
  head                                          # 일부 추출

exam %>%
  mutate(total = math + english + science,         # 총합 변수 추가
         mean = (math + english + science)/3) %>%  # 총평균 변수 추가
  head                                             # 일부 추출

head(exam$test <- ifelse(science >= 60, 'pass','fail'))

exam %>%
  mutate(test = ifelse(science >= 60, "pass", "fail")) %>%
  head

exam %>%
  mutate(total = math + english + science) %>%  # 총합 변수 추가
  arrange(total) %>%                            # 총합 변수 기준 정렬
  head                                          # 일부 추출


#### deplyr::summarise(), 통계치 산출####
exam %>% summarise(mean_math = mean(math))  # math 평균 산출

#### dplyr::group_by(), 그룹별, 통계치 산출 ####
exam %>% 
  group_by(class) %>%                   # class별로 분리
  summarise(mean_math = mean(math))     # math 평균 산출


exam %>% 
  group_by(class) %>%                   # class별로 분리
  summarise(mean_math = mean(math),     # math 평균
            sum_math = sum(math),       # math 합계
            median_math = median(math), # math 중앙값
            n = n())                    # 학생 수

mpg %>%
  group_by(manufacturer, drv) %>%       # 회사별, 구동방식별 분리
  summarise(mean_cty = mean(cty)) %>%   # cty 평균 산출
  head(10)                              # 일부 출력

#### Quiz) Gapminder####
# 1. 2007년도 나라별 일인당 국민소득
# 2. 2007년도 대륙별 일인당 평균수명의 평균과 중앙값

#### Quiz) mpg ####
# 1. 각 회사별 suv의 통합 연비 평균을 내림차순으로 상위 5위까지 출력하시오
# 통합 연비(total_y)  = (cty+hwy)/2 
mpg <- ggplot2::mpg

#### dplyr::left_join(), 열 결합 ####
# 중간고사 데이터 생성
test1 <- data.frame(id = c(1, 2, 3, 4, 5),           
                    midterm = c(60, 80, 70, 90, 85))

# 기말고사 데이터 생성
test2 <- data.frame(id = c(1, 2, 3, 4, 5),           
                    final = c(70, 83, 65, 95, 80))

test3 <- data.frame(nid = c(1, 2, 3, 4, 5),           
                    final = c(70, 83, 65, 95, 80))

test1  # test1 출력
test2  # test2 출력

total <- left_join(test1, test2, by = "id")  # id 기준으로 합쳐서 total에 할당
total                                        # total 출력

total <- left_join(test1, rename(test3, id=nid), by = 'id') # rename 활용
total
name <- data.frame(class = c(1, 2, 3, 4, 5),
                   teacher = c("kim", "lee", "park", "choi", "jung"))
name

exam_new <- left_join(exam, name, by = "class")
exam_new


#### dplyr::bind_rows(), 행 결합 ####
# 학생 1~5번 시험 데이터 생성
group_a <- data.frame(id = c(1, 2, 3, 4, 5),
                      test = c(60, 80, 70, 90, 85))

# 학생 6~10번 시험 데이터 생성
group_b <- data.frame(id = c(6, 7, 8, 9, 10),
                      test = c(70, 83, 65, 95, 80))

group_a  # group_a 출력
group_b  # group_b 출력

group_all <- bind_rows(group_a, group_b)  # 데이터 합쳐서 group_all에 할당
group_all                                 # group_all 출력


#### 정리 ####
# 1.조건에 맞는 데이터만 추출하기
exam %>% filter(english >= 80)

# 여러 조건 동시 충족
exam %>% filter(class == 1 & math >= 50)

# 여러 조건 중 하나 이상 충족
exam %>% filter(math >= 90 | english >= 90)
exam %>% filter(class %in% c(1,3,5))


# 2.필요한 변수만 추출하기
exam %>% select(math)
exam %>% select(class, math, english)
exam %>% filter(class==3) %>% select(math)
exam %>%
  filter(class==3) %>%
  select(math)  

# 3.함수 조합하기, 일부만 출력하기
exam %>%
  select(id, math) %>%
  head(10)

# 4.순서대로 정렬하기
exam %>% arrange(math)         # 오름차순 정렬
exam %>% arrange(desc(math))   # 내림차순 정렬
exam %>% arrange(class, math)  # 여러 변수 기준 오름차순 정렬

# 5.파생변수 추가하기
exam %>% mutate(total = math + english + science)

# 여러 파생변수 한 번에 추가하기
exam %>%
  mutate(total = math + english + science,
         mean = (math + english + science)/3)

# mutate()에 ifelse() 적용하기
exam %>% mutate(test = ifelse(science >= 60, "pass", "fail"))

# 추가한 변수를 dplyr 코드에 바로 활용하기
exam %>%
  mutate(total = math + english + science) %>%
  arrange(total)


# 6.집단별로 요약하기
exam %>%
  group_by(class) %>%
  summarise(mean_math = mean(math))

# 각 집단별로 다시 집단 나누기
mpg %>%
  group_by(manufacturer, drv) %>%
  summarise(mean_cty = mean(cty))


# 7.데이터 합치기
# 열 결합
total <- left_join(test1, test2, by = "id")

# 행 결합
group_all <- bind_rows(group_a, group_b)

# %>% 파이프 연산자의 장점
arrange(
  summarize(
    group_by(
      filter(gapminder, year==2007), continent
    ), lifeExp=median(lifeExp)
  ), -lifeExp
)


gapminder %>%
  filter(year == 2007) %>%
  group_by(continent) %>%
  summarize(lifeExp = median(lifeExp)) %>%
  arrange(-lifeExp)

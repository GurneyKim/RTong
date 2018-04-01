출처 : https://mrchypark.github.io/dabrp_classnote3/class3#52

install.packages('tdiyverse')
library(tidyverse)
# tidyverse 패키지
- tidy data 사상 + 파이프 연산자

What is tidy data
1.1 Each variable forms a column.
1.2 각 변수는 개별의 열(column)으로 존재한다.
1.3 각 열에는 개별 속성이 들어간다.

2.1 Each observation forms a row.
2.2 각 관측치는 행(row)를 구성한다.
2.3 각 행에는 개별 관찰 항목이 들어간다.

3.1 Each type of observational unit forms a table.
3.2 각 테이블은 단 하나의 관측기준에 의해서 조직된 데이터를 저장한다.
3.3 각 테이블에는 단일 유형의 데이터가 들어간다

# tidy 패키지
1. gather() : wide form 데이터를 long form 으로 변환
2. spread() : long form 데이터를 wide form 으로 변환
3. separate() : 하나의 컬럼을 두 개로 나눔
4. unite() : 두 개의 컬럼을 하나로 합침

library(tidyr)
table1 
table2 # long form
table3 # 하나의 열에 2개의 데이터
table4a # wide form
table4b # wide form

# 1. gather() : wide form 데이터를 long form 으로 변환
table4b
table4b %>%
  gather('1999', '2000',
         key='year',
         value = 'cases')

table4a
table4a %>%
  gather('1999','2000',
         key = 'year',
         value = 'cases')
# 2. spread() : long form 데이터를 wide form 으로 변환
table2
table2 %>%
  spread(key = type, value=count)

# 3. separate() : 하나의 컬럼을 두 개로 나눔
table3
table3 %>%
  separate(rate,
           into = c('cases', 'population')) #sep='' 조정가능, 기본 데이터 타입chr

table3 %>%
  separate(rate,
           into = c('cases', 'population'),
           convert = TRUE) # int

# 4. unite() : 두 개의 컬럼을 하나로 합침
table5 
table5 %>%
  unite(new, century, year) # new 변수명에 century + year 합침

table5 %>%
  unite(new, century, year, sep = ' ')

# 참고
# https://github.com/youngwoos/Doit_R/blob/master/Script/Script_Part08.r
# http://freesearch.pe.kr/archives/3134 - 전희원님 ggplot2

#### ggplot2 ####
# Top 50 ggplot2 Visualizations - The Master List (With Full R Code)
# http://r-statistics.co/Top50-Ggplot2-Visualizations-MasterList-R-Code.html
# https://www.rstudio.com/wp-content/uploads/2015/03/ggplot2-cheatsheet.pdf

#### ggplot()  + geom_ () ####
library(ggplot2)
library(dplyr)
head(mpg)
glimpse(mpg)
summary(mpg)

# x축 displ, y축 hwy로 지정해 배경 생성 
ggplot(data = mpg, aes(x = displ, y = hwy))

# 배경에 산점도 추가
ggplot(data = mpg, aes(x = displ, y = hwy)) + geom_point()

# x축 범위 3~6으로 지정
ggplot(data = mpg, aes(x = displ, y = hwy)) + geom_point() + xlim(3, 6)

# x축 범위 3~6, y축 범위 10~30으로 지정
ggplot(data = mpg, aes(x = displ, y = hwy)) + 
  geom_point() + 
  xlim(3, 6) + 
  ylim(10, 30)

# dplyr + ggplot2 - 자동완성 기능
mpg %>% ggplot(aes(x = displ, y =hwy, col = manufacturer)) +
  geom_point()


# 요약통계량 시각화
library(dplyr)

df_mpg <- mpg %>% 
  group_by(drv) %>%
  summarise(mean_hwy = mean(hwy))

df_mpg

ggplot(data = df_mpg, aes(x = drv, y = mean_hwy)) + geom_col()

# 위와 동일한 코드
mpg %>% 
  group_by(drv) %>%
  summarise(mean_hwy = mean(hwy)) %>%
  ggplot(aes(x=drv, y = mean_hwy)) + geom_col()

ggplot(data = df_mpg, aes(x = reorder(drv, -mean_hwy), y = mean_hwy)) + geom_col()

ggplot(data = mpg, aes(x = drv)) + geom_bar()

ggplot(data = mpg, aes(x = hwy)) + geom_bar()


# geom_line() : 시계열
ggplot(data = economics, aes(x = date, y = unemploy)) + geom_line()

# geom_boxplot() : 상자그림
ggplot(data = mpg, aes(x = drv, y = hwy)) + geom_boxplot()

# geom_point() : 산점도
ggplot(data = mpg, aes(x = displ, y = hwy)) + geom_point()

mpg %>%
  ggplot(aes(x=displ, y=hwy, col = manufacturer)) +
  geom_point()

#### Quiz diamonds 데이터를 시각화 해보세요.####
diamonds


#### ggplot2 Assist! ####
# https://github.com/cardiomoon/ggplotAssist 
install.packages("devtools")
devtools::install_github("cardiomoon/ggplotAssist")
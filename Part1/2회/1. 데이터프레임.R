#### Data Frame ####
# 데이터 프레임 만들기

english <- c(90, 80, 60, 70)  # 영어 점수 변수 생성
english

math <- c(50, 60, 100, 20)    # 수학 점수 변수 생성
math

# english, math로 데이터 프레임 생성해서 df_midterm에 할당
df_midterm <- data.frame(english, math)
df_midterm

class <- c(1, 1, 2, 2)
class

df_midterm <- data.frame(english, math, class)
df_midterm
# class(df_midterm)

# df_midterm <- data.frame(english = c(90, 80, 60, 70),
#                          math = c(50, 60, 100, 20),
#                          class = c(1, 1, 2, 2))
# df_midterm


#### Quiz 데이터 프래임 3개 이상 만들어 보세요. ####

#### 데이터프레임 index ####
df_midterm[,1]
df_midterm$english
df_midterm[1:2,]

df_midterm[2,1]
df_midterm$english[2]

mean(df_midterm$english)  # df_midterm의 english로 평균 산출
mean(df_midterm$math)     # df_midterm의 math로 평균 산술


matrix1 <- matrix(c(1:100),10,10)
matrix1
# data.frame 변환
df <- as.data.frame(matrix1)
matrix2 <- as.matrix(df)
matrix2

#### Quiz 위에서 만든 데이터 프레임에 인덱싱 해보시오 ####

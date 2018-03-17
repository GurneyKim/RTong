# 출처 : http://www.postechx.kr/ko/school/posco/courseware/38059 lec2_1.r 파일 입니다.
# 

# Vector, matrix, array (벡터, 행렬, 배열)

#### vector(벡터) ####
x<-c(1,3,5,7,9)
x[3] # r index는 1부터 시작

# Index
# subset of vector : delete the first element (첫번째 속성 삭제)
x[-1] # python과 달리 맨 마지막index가 아니라 첫번째 element 제거 r에서 -는 subset


# subset of vector : delete the first two element
x1 <- x[-c(1,2)]
x1
# subset of vector : delete the 1st to the 3rd element
x2<-x[-c(1:3)]
x2


# create vector using 'seq'
# sequence of 20 values 
y1<-seq(0,10, length=20) #0부터 10까지 20개
y1
# sequence of (1 to 10) by 0.5 # 0부터 10까지 0.5 단위로 생성  
y2<-seq(0,10, by=0.5)
y2
# using rep
z1<-rep(1:4, 2) # 1:4 2번 반복
z1

z2<-rep(1:2,5) # 1:2 5번 반복
z2


# combine vectors in a row or column

c1<-c(2,4,6,8,10)
x
c2<-cbind(x, c1) # 열기준(column) bind

c3<-rbind(x,c1) # 행 기준(row) bind
c3

#### matrix(행렬) ####
# two row matrix with 1 to 10
m1<-matrix(1:10, nrow=2)
m1
# three columns matrix with 1:6 
m2<-matrix(1:6, ncol=3)
m2
# matrix filled by rows, defalut: filled by cloumns
m3<-matrix(1:6, nrow=2, byrow=T) # 행으로 생성 byrow=T / default는 1열부터 채움
m3
# help (matrix)

#### higher order of array ####
a1<-array(c(1:18), dim=c(3,3,2))
a1
a1[, ,1]
a1[, ,2]

#### 정리 ####
# vector 
# seq(1,10,by/length), rep(1:3,2)
# cbind, rbind
# matrix(1:10,nrow,ncol,byrow=)
# array(c(),dim=c())


#### 문제 ####
# 1. seq, rep를 사용하여 벡터 10개를 만들어 보시오
# 2. 각 만든 백터를 cbind, rbind 해보시오
# 3. matrix 10개 만들어 보시오
# 4. array 를 만들어 보고 인덱싱 해보시오.


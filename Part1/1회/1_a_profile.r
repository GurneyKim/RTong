#### profile 사용 ####
http://freesearch.pe.kr/archives/4446

https://lovetoken.github.io/r/2016/12/20/RStartup_Option.html

#### 시각화 한글 오류 해결 ####
# 폰트설치
https://blog.jongbin.com/2016/12/ggplot2-korean-font/

install.packages('extrafont')
library(extrafont)

# 폰트 로드 (c:/windows/fonts의 폰트를 R폴더의 fonts에 옮김)
font_import()
# 특정 폰트 로드
font_import(pattern = 'HUJingod')

fonttable()

# family = '폰트' 지정
par(family='Unbatang')

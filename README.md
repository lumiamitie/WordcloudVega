# WordcloudVega

R 패키지를 작성하는 과정에서 `htmlwidgets`를 통해 JS 라이브러리를 사용하기 위해 만들어본 예제이다.
[Vega](https://vega.github.io/vega/) 에서 제공하는 transformation 기능을 이용하여 워드클라우드를 그려본다.


# 패키지 작성 과정 정리

1. 새로운 패키지 프로젝트 생성
    - RStudio > New Project > New Directory > R package
    - DESCRIPTION 설정
        - `devtools::use_package('htmlwidgets')`
2. vega 다운로드
    - `npm install vega`, `npm install vega-embed`
    - 사용할 파일은 다음과 같다
        - `node_modules/vega/build/vega.js`
        - `node_modules/vega-embed/build/vega-embed.js`
    - R 프로젝트 폴더로 옮겨놓는다
        - `WordcloudVega/inst/htmlwidgets/lib/vega.js`
        - `WordcloudVega/inst/htmlwidgets/lib/vega-embed.js`
3. `vega.R` 파일 생성
    - `WordcloudVega/R/vega.R` 위치에 파일 생성
4. R 함수 생성
    - `simple_wordcloud` 라는 이름으로 함수를 생성한다
    - 위젯을 생성한다 (위젯 이름은 보통 함수 이름과 동일하게 설정)
        - `createWidget('widgetName', data, package = 'packageName')`
    - 만든 함수를 꼭 export 시키자 (`@export`)
5. JS 디펜던시 설정
    - `widgetName.yaml` 파일을 생성한다
        - `WordcloudVega/inst/htmlwidgets/simple_wordcloud.yaml`
    - 위젯에서 사용할 js 라이브러리에 대한 정보를 입력한다
    - <http://www.htmlwidgets.org/develop_intro.html>
6. JS 바인딩 생성
    - `widgetName.js` 파일을 생성한다
        - `WordcloudVega/inst/htmlwidgets/simple_wordcloud.js`
    - 워드클라우드를 생성하는 js 코드를 넣는다
7. 빌드
    - roxygenize (`devtools::document()` or `roxygen2::roxygenize()`)
    - Build > Install and Restart (Cmd + Shift + B)

# 예제

```r
library('WordcloudVega')
simple_wordcloud(lorem_ipsum())
```

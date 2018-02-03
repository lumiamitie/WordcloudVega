#' Simple Wordcloud
#'
#' Wordcloud with no parameters
#'
#' @param text A vector of words
#'
#' @examples
#' simple_wordcloud(lorem_ipsum())
#'
#' @import htmlwidgets
#' @export
simple_wordcloud <- function(text) {
  d = list(data = data.frame(keyword = text))
  createWidget('simple_wordcloud', d, package = 'WordcloudVega')
}

#' Simple Lorem Ipsum Words for Korean
#'
#' Sample Words
#'
#' @export
lorem_ipsum = function() {
  text = "대한민국의 주권은 국민에게 있고, 모든 권력은 국민으로부터 나온다.
법원은 최고법원인 대법원과 각급법원으로 조직된다. 국회는 의장 1인과 부의장 2인을 선출한다.
전직대통령의 신분과 예우에 관하여는 법률로 정한다. 이 헌법은 1988년 2월 25일부터 시행한다.
다만, 이 헌법을 시행하기 위하여 필요한 법률의 제정·개정과 이 헌법에 의한 대통령 및 국회의원의
선거 기타 이 헌법시행에 관한 준비는 이 헌법시행 전에 할 수 있다.
모든 국민은 법률이 정하는 바에 의하여 선거권을 가진다.
대한민국은 통일을 지향하며, 자유민주적 기본질서에 입각한 평화적 통일 정책을 수립하고 이를 추진한다.
비상계엄하의 군사재판은 군인·군무원의 범죄나 군사에 관한 간첩죄의 경우와
초병·초소·유독음식물공급·포로에 관한 죄중 법률이 정한 경우에 한하여 단심으로 할 수 있다.
다만, 사형을 선고한 경우에는 그러하지 아니하다."

  rm_stopwords = gsub('[\\.·,\n]', ' ', text)
  Filter(function(x) x != '', strsplit(rm_stopwords, ' ')[[1]])
}

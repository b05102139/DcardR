#' @title DCard General Board Info
#' @description Returns general info regarding each board.
#' @importFrom jsonlite fromJSON
#' @return
#' @export
#'
#' @examples
dcardForumInfo <- function(){
  jsonlite::fromJSON("https://www.dcard.tw/_api/forums")
}

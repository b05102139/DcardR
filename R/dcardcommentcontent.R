#' @title DCard Comment Content
#' @description Returns general comment info and content in a specific board, where the number of posts and whether or not to sort by popular can be specified. The rate limit can also be altered, at the risk of being blocked by the API.
#' @param board
#' @param posts
#' @param by_popular
#' @param rate_limit
#'
#' @importFrom magrittr %>%
#' @importFrom tictoc tic toc
#' @importFrom vctrs vec_rbind
#' @return
#' @export
#'
#' @examples
dcardCommentContent <- function(board, posts, by_popular = F, rate_limit = 1){
  id <- dcardBoardContent(board, posts, by_popular, rate_limit) %>% `$`(id)
  comment_list <- list()
  message(paste("Total posts:", posts))
  for(i in 1:length(id)){
    tictoc::tic(paste("Post", i, "complete"))
    url <- paste0("https://www.dcard.tw/_api/posts/", id[i], "/comments")
    comments <- jsonlite::fromJSON(url)
    comment_list[[i]] <- comments
    Sys.sleep(rate_limit)
    tictoc::toc()
  }
  message("Finished crawling posts.")
  together_list <- do.call(eval(parse(text="vctrs::vec_rbind")), comment_list)
  together_list$meta <- NA
  together_list
}

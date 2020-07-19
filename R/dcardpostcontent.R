#' @title DCard Post Content
  #' @description Returns post-specific content in a board. This differs from the dcardBoardContent function, as that function only returns an excerpt of the posts, as opposed to the whole content of the post.
#' @param board
#' @param posts
#' @param by_popular
#' @param rate_limit
#'
#' @return
#' @export
#'
#' @examples
dcardPostContent <- function(board, posts, by_popular = F, rate_limit = 1){
  id <- dcardBoardContent(board, posts, by_popular, rate_limit) %>% `$`(id)
  post_list <- list()
  message(paste("Total posts:", posts))
  for(i in 1:length(id)){
    tictoc::tic(paste("Post", i, "complete"))
    url <- paste0("https://www.dcard.tw/_api/posts/", id[i])
    posts <- jsonlite::fromJSON(url)
    post_list[[i]] <- posts
    Sys.sleep(rate_limit)
    tictoc::toc()
  }
  message("Finished crawling posts.")
  together_list <- do.call(eval(parse(text="vctrs::vec_rbind")), post_list)
  together_list$meta <- NA
  together_list
}

#' @title DCard Board Content
#' @description Returns general post info in a specific board, where the post number and whether or not to sort by popular can be specified. The rate limit can also be altered, at the risk of being blocked by the API.
#' @param board
#' @param posts
#' @param by_popular
#' @param rate_limit
#'
#' @importFrom magrittr %>%
#' @return
#' @export
#'
#' @examples
dcardBoardContent <- function(board, posts, by_popular = F, rate_limit = 1){
  if(!(posts %% 1 == 0) | `>=`(0, posts)){
    stop("Posts must be a positive integer.")
  }
  pages <- ceiling(posts / 30)
  if(by_popular == F){
    base_url <- paste0('https://www.dcard.tw/_api/forums/',
                       board,
                       '/posts?popular=false')
  }
  if(by_popular == T){
    base_url <- paste0('https://www.dcard.tw/_api/forums/',
                       board,
                       '/posts?popular=true')
  }
  message(paste("Total pages:", pages))
  tictoc::tic("Page 1 complete")
  main_df <- jsonlite::fromJSON(base_url)
  last_art <- main_df$id[length(main_df$id)]
  pages <- (pages - 1)

  if(pages >= 1){
    Sys.sleep(rate_limit)
    tictoc::toc()
    for(i in 1:pages){
      tictoc::tic(paste("Page", (i + 1), "complete"))
      url <- paste0(base_url,"&before=", last_art)
      new_page <- jsonlite::fromJSON(url)
      last_art <- new_page$id[length(new_page$id)]
      main_df <- vctrs::vec_rbind(main_df, new_page)
      Sys.sleep(1)
      tictoc::toc()
    }
  }
  if(pages == 0){
    tictoc::toc()
  }
  message("Finished crawling pages.")
  main_df[1:posts,]
}

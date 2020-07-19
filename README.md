
<!-- README.md is generated from README.Rmd. Please edit that file -->

# DcardR

`DcardR` 的主要功能在於使大量爬取 Dcard 內容的過程簡化，並以四個 function 為主要內容：

1)  `dcardPostContent()`方便用以爬取文章內容本身，  
2)  `dcardCommentContent()`用以爬取留言內容，  
3)  `dcardBoardContent()`爬取一個板的相關內容，  
4)  `dcardForumInfo()`則提供 Dcard 各個板的綜觀內容。

下方附有各個 function 的使用範例與介紹。

## Installation

要下載 `DcardR`，請在 console 輸入以下指令：

``` r
library(devtools)
install_github("b05102139/DcardR")
```

## Example

以下範例介紹如何爬取10篇感情板中的文章。`dcardPostContent()`允許輸入想要爬取的板名，想要爬取的數量，是否使用熱門排名（否則使用發表時間作為爬名），以及爬完每篇文章後的休眠時間（以1秒為基礎設定，要加快或變慢的話也可以輸入比1更小或更大的數字，但要小心爬得比1快有可能爬幾下就被API擋住）。爬取過程會顯示於
console，幫助確認進度：

``` r
library(DcardR)

relationship_10 <- dcardPostContent(board = "relationship",
                                    posts = 10,
                                    by_popular = F,
                                    rate_limit = 1)
#> Total pages: 1
#> Page 1 complete: 0.367 sec elapsed
#> Finished crawling pages.
#> Total posts: 10
#> Post 1 complete: 1.432 sec elapsed
#> Post 2 complete: 1.23 sec elapsed
#> Post 3 complete: 1.355 sec elapsed
#> Post 4 complete: 1.236 sec elapsed
#> Post 5 complete: 1.397 sec elapsed
#> Post 6 complete: 1.306 sec elapsed
#> Post 7 complete: 1.213 sec elapsed
#> Post 8 complete: 1.197 sec elapsed
#> Post 9 complete: 1.227 sec elapsed
#> Post 10 complete: 1.181 sec elapsed
#> Finished crawling posts.
```

爬取內容大約如下：

``` r
library(magrittr) # pipe function
library(knitr) # to help display the dataframe as a table

head(relationship_10, 1) %>%
  knitr::kable(format = "html")
```

<table>

<thead>

<tr>

<th style="text-align:left;">

id

</th>

<th style="text-align:left;">

title

</th>

<th style="text-align:left;">

content

</th>

<th style="text-align:left;">

excerpt

</th>

<th style="text-align:left;">

anonymousSchool

</th>

<th style="text-align:left;">

anonymousDepartment

</th>

<th style="text-align:left;">

pinned

</th>

<th style="text-align:left;">

forumId

</th>

<th style="text-align:left;">

replyId

</th>

<th style="text-align:left;">

createdAt

</th>

<th style="text-align:left;">

updatedAt

</th>

<th style="text-align:left;">

commentCount

</th>

<th style="text-align:left;">

likeCount

</th>

<th style="text-align:left;">

tags

</th>

<th style="text-align:left;">

topics

</th>

<th style="text-align:left;">

supportedReactions

</th>

<th style="text-align:left;">

withNickname

</th>

<th style="text-align:left;">

reportReason

</th>

<th style="text-align:left;">

hiddenByAuthor

</th>

<th style="text-align:left;">

meta

</th>

<th style="text-align:left;">

forumName

</th>

<th style="text-align:left;">

forumAlias

</th>

<th style="text-align:left;">

nsfw

</th>

<th style="text-align:left;">

replyTitle

</th>

<th style="text-align:left;">

gender

</th>

<th style="text-align:left;">

personaSubscriptable

</th>

<th style="text-align:left;">

reactions

</th>

<th style="text-align:left;">

hidden

</th>

<th style="text-align:left;">

customStyle

</th>

<th style="text-align:left;">

isSuspiciousAccount

</th>

<th style="text-align:left;">

layout

</th>

<th style="text-align:left;">

withImages

</th>

<th style="text-align:left;">

withVideos

</th>

<th style="text-align:left;">

media

</th>

<th style="text-align:left;">

reportReasonText

</th>

<th style="text-align:left;">

mediaMeta

</th>

<th style="text-align:left;">

postAvatar

</th>

<th style="text-align:left;">

school

</th>

<th style="text-align:left;">

department

</th>

<th style="text-align:left;">

categories

</th>

</tr>

</thead>

<tbody>

<tr>

<td style="text-align:left;">

234078846

</td>

<td style="text-align:left;">

承諾給不給

</td>

<td style="text-align:left;">

如果另一半問自己以後會不會跟他/她結婚 但是自己根本沒想過這個問題 還是會一起討論未來嗎？

</td>

<td style="text-align:left;">

如果另一半問自己以後會不會跟他/她結婚，但是自己根本沒想過這個問題，還是會一起討論未來嗎？

</td>

<td style="text-align:left;">

TRUE

</td>

<td style="text-align:left;">

TRUE

</td>

<td style="text-align:left;">

FALSE

</td>

<td style="text-align:left;">

42851318-b9e2-4a75-8a05-9fe180becefe

</td>

<td style="text-align:left;">

NULL

</td>

<td style="text-align:left;">

2020-07-19T11:26:43.605Z

</td>

<td style="text-align:left;">

2020-07-19T11:26:43.605Z

</td>

<td style="text-align:left;">

0

</td>

<td style="text-align:left;">

0

</td>

<td style="text-align:left;">

HIDE\_THUMBNAIL

</td>

<td style="text-align:left;">

c(“愛情”,
“感情”)

</td>

<td style="text-align:left;">

NULL

</td>

<td style="text-align:left;">

FALSE

</td>

<td style="text-align:left;">

</td>

<td style="text-align:left;">

FALSE

</td>

<td style="text-align:left;">

NA

</td>

<td style="text-align:left;">

感情

</td>

<td style="text-align:left;">

relationship

</td>

<td style="text-align:left;">

FALSE

</td>

<td style="text-align:left;">

NULL

</td>

<td style="text-align:left;">

F

</td>

<td style="text-align:left;">

TRUE

</td>

<td style="text-align:left;">

list()

</td>

<td style="text-align:left;">

FALSE

</td>

<td style="text-align:left;">

NULL

</td>

<td style="text-align:left;">

FALSE

</td>

<td style="text-align:left;">

classic

</td>

<td style="text-align:left;">

FALSE

</td>

<td style="text-align:left;">

FALSE

</td>

<td style="text-align:left;">

list()

</td>

<td style="text-align:left;">

</td>

<td style="text-align:left;">

list()

</td>

<td style="text-align:left;">

</td>

<td style="text-align:left;">

NULL

</td>

<td style="text-align:left;">

NULL

</td>

<td style="text-align:left;">

NULL

</td>

</tr>

</tbody>

</table>

`dcardPostContent()`跟直接用`dcardBoardContent()`爬取的差異在於，前者會回報全文，後者則只有文章截選內容，並不完整。若希望文章內容完整者請使用此
function。

留言 (`dcardCommentContent()`) 與各個板 (`dcardBoardContent()`)
的爬取也類似以上過程，可以直接參考。唯`dcardForumInfo()`直接使用即可，不需輸入額外資訊，若想知道各個板大致的狀況或者板名（因為上面幾個
function 需要輸入英文板名），可以打開來參考：

``` r
dcardForumInfo()
```

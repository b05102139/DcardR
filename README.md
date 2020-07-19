
<!-- README.md is generated from README.Rmd. Please edit that file -->

# DcardR

DcardR 的主要功能在於使大量爬取 Dcard 內容的過程簡化，並以四個 function 為主要內容：

1)  dcardPostContent() 方便用以爬取文章內容本身，
2)  dcardCommentContent() 用以爬取留言內容，
3)  dcardBoardContent() 爬取一個板的相關內容，
4)  dcardForumInfo() 則提供 Dcard 各個板的綜觀內容。

下方附有各個 function 的使用範例與介紹。

## Installation

要下載 DcardR，請在 console 輸入以下指令：

``` r
library(devtools)
install_github("b05102139/DcardR")
```

## Example

以下範例介紹如何爬取10篇感情板中的文章。dcardPostContent()
允許輸入想要爬取的板名，想要爬取的數量，是否使用熱門排名（否則使用發表時間作為爬名），以及爬完每篇文章後的休眠時間（以1秒為基礎設定，但要加快或變慢的話也可以輸入比1更小或更大的數字，但要小心爬得比1快有可能爬幾下就被API擋住）。爬取過程會顯示於
console，幫助確認進度：

``` r
library(DcardR)

relationship_100 <- dcardPostContent("relationship", 10, by_popular = F, rate_limit = 1)
#> Total pages: 1
#> Page 1 complete: 0.766 sec elapsed
#> Finished crawling pages.
#> Total posts: 10
#> Post 1 complete: 1.181 sec elapsed
#> Post 2 complete: 1.412 sec elapsed
#> Post 3 complete: 1.177 sec elapsed
#> Post 4 complete: 1.063 sec elapsed
#> Post 5 complete: 1.197 sec elapsed
#> Post 6 complete: 1.104 sec elapsed
#> Post 7 complete: 1.181 sec elapsed
#> Post 8 complete: 1.173 sec elapsed
#> Post 9 complete: 1.172 sec elapsed
#> Post 10 complete: 1.133 sec elapsed
#> Finished crawling posts.
```

爬取內容大約如下：

``` r
library(magrittr) # pipe function
library(knitr) # to help display the dataframe as a table

head(relationship_100, 1) %>%
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

</tr>

</thead>

<tbody>

<tr>

<td style="text-align:left;">

234077801

</td>

<td style="text-align:left;">

瘋狂夢到無緣男朋友

</td>

<td style="text-align:left;">

前陣子在交友軟體認識一個男生，聊天也都不錯他也會跟我講電話什麼的，他算是半個球員吧，所以有找我去看過他的球賽，也喜歡唱歌有找我以前錄過cover，相處都還不錯，見面那天還滿心動
有次講電話他說起他之前的每一段感情，就說到他的前任女友，然後說雙方都有想複合，但他覺得慢慢來，結果有天套話過程他就說啊對了我們復合了，雖然滿頭問號，但也不想造成他們困擾我就沒再回他訊息了
可是重點是那之後到現在一個多禮拜，每天都夢到他，昨天甚至夢到他跟我說我們再來錄歌啊！那我們明天見～前天則是他問我為什麼不回他訊息了我還跟他說怕被你女友誤會⋯⋯==
這有代表什麼意思嗎？我真的不想再夢到⋯畢竟他也不會是我的啊

</td>

<td style="text-align:left;">

前陣子在交友軟體認識一個男生，聊天也都不錯他也會跟我講電話什麼的，他算是半個球員吧，所以有找我去看過他的球賽，也喜歡唱歌有找我以前錄過cover，相處都還不錯，見面那天還滿心動，有次講電話他說起他之前

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

2020-07-19T07:53:19.379Z

</td>

<td style="text-align:left;">

2020-07-19T07:53:19.379Z

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

c(“愛情”, “失戀”, “夢境”)

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

</tr>

</tbody>

</table>

dcardPostContent() 跟直接用 dcardBoardContent()
爬取的差異在於，前者會回報全文，後者則只有文章截選內容，並不完整。若希望文章內容完整者請使用此
function。

留言 (dcardCommentContent()) 與各個板 (dcardBoardContent())
的爬取也類似以上過程，可以直接參考。唯
dcardForumInfo() 直接使用即可，不需輸入額外資訊，若想知道各個板大致的狀況或者板名（因為上面幾個 function
需要輸入英文板名），可以打開來參考：

``` r
dcardForumInfo()
```

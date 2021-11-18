install.packages('rvest')
install.packages('dplyr')

library(rvest)
library(dplyr)

url <- 'https://www.imdb.com/search/title/?groups=top_250&sort=user_rating'
webpage <- read_html(url)

title = webpage %>% html_nodes('.lister-item-header a') %>% html_text()
head(title)
year = webpage %>% html_nodes('.text-muted.unbold') %>% html_text()
rating = webpage %>% html_nodes('.ratings-imdb-rating strong') %>% html_text()
synopsis = webpage %>% html_nodes('.ratings-bar+ .text-muted') %>% html_text()

movies = data.frame(title, year, rating, synopsis, stringsAsFactors = FALSE)
write.csv(movies, 'movies.csv')

#old skool approach
library(wordcloud)
library(tm)
library(stringi)
library(stringr)

#read messy data
report <- readRDS("data/report.rds")

#create a corpus for tm
corpus <- Corpus(VectorSource(report))

#clean a wee bit
corpus <- tm_map(corpus, tolower)
corpus <- tm_map(corpus, removePunctuation)
corpus <- tm_map(corpus, removeNumbers)
#corpus <- tm_map(corpus, removeWords, stopwords("english"))
corpus <- tm_map(corpus, removeWords, c("the", "that", "and"))


#word cloud
wordcloud(corpus, max.words = 100, random.order = FALSE, scale = c(3, .7))
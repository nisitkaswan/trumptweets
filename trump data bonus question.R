library(jsonlite) 
data = fromJSON(txt= "C:/Users/Nisit Kaswan/Downloads/2017-11-01.json")
data2 = fromJSON(txt= "C:/Users/Nisit Kaswan/Downloads/2017-11-02.json")
data3 = fromJSON(txt= "C:/Users/Nisit Kaswan/Downloads/2017-11-03.json")
all = rbind(data,data2)
all = rbind(all,data3) 

#removing emojis
all$text <- iconv(all$text, 'UTF-8', 'ASCII') 
tweet_text <- all$text
library(syuzhet)
tweenrc_data <- get_nrc_sentiment(tweet_text)  

#plotting percentage of negative and positive tweets
barplot(
  sort(colSums(prop.table(tweenrc_data[, 9:10]))), 
  horiz = TRUE, 
  cex.names = 0.7, 
  las = 1, 
  col=heat.colors(10), 
  main = "Emotions in  tweets", xlab="Percentage"
) 



# Read Me

This is a simple R Shiny App that takes a **.txt** file in **UTF-8 encoding**, tokenizes all words, removes common stop words, calculates term frequency, and plots the result as a word cloud.


Users can:
- upload a .txt file to convert into a word cloud
- choose the maximum number of words to display in the cloud
- download the generated word cloud


This simple app was inspired by [similar applications like this one](https://shiny.rstudio.com/gallery/word-cloud.html), but intended to allow a user to upload their own documents.

Text cleaning in this app was accomplished with the [tidytext package](https://www.tidytextmining.com/), by Julia Silge and David Robinson.

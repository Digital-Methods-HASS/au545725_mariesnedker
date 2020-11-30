library(tidyverse)
library(rvest)
library(janitor)
library(stringr)
library(lubridate)
library(ggplot2)
library(ggridges)

url <- "https://en.wikipedia.org/wiki/List_of_U.S._states_by_homicide_rate"

#Scrape the website using the command read_html
url_html <- read_html(url)

#I extract the html table through the tag using the command html_nodes and html_table. 
web_table <- url_html %>% 
  html_nodes("table") %>% #Finds the first "table" 
  html_table #Parse the html table found from html_node into a dataframe

#print table
web_table

#takes the downloaded html table, unlists it and and then combine the individual elements as columns.
new_table <- do.call(cbind,unlist(web_table, recursive = FALSE))
head(new_table) #print the first 6 lines. 

#converts table into data frame 
new_data_frame <- as.data.frame.matrix(new_table)

#select column
select(new_data_frame,"2017")

#plots number of homicides as a function of state for the year 2018
plot(new_data_frame[,"2017"], main="Homicides year 2017", 
     xlab = "State no.", 
     ylab = "Homicides")

write_excel_csv2(new_data_frame, "excel_homicide.csv")
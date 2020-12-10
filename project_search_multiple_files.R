library(pdftools)
library(tidyverse)
library(pdfsearch)

Words_vector <- c("abort","kirke","","","") # saves search words in vector. If not all elements are needed input "". The program is not case sensitive

pdf_files <- list.files(pattern="pdf$") #finds all pdf documents in working directory

files_string <- lapply(pdf_files,pdf_text) #converts all text on a page to a large string for all pdf documents
# you can also use the command pdf_data, that returns a data frame. 

lapply(files_string,length) #prints number of pages in each document. 

word_1 <- grep(Words_vector[1],files_string,ignore.case = TRUE) #searches files_string for the first word in words_vector. Not case sensitive
word_2 <- grep(Words_vector[2],files_string,ignore.case = TRUE) #searches files_string for the second word in words_vector. Not case sensitive
word_3 <- grep(Words_vector[3],files_string,ignore.case = TRUE) #searches files_string for the third word in words_vector. Not case sensitive
word_4 <- grep(Words_vector[4],files_string,ignore.case = TRUE) #searches files_string for the fourth word in words_vector. Not case sensitive
word_5 <- grep(Words_vector[5],files_string,ignore.case = TRUE) #searches files_string for the fifth word in words_vector. Not case sensitive

compare_1 <- intersect(word_1,word_2) #Finds documents where both word 1 and 2 are present
compare_2 <- intersect(word_3,word_4) #Finds documents where both word 3 and 4 are present
compare_3 <- intersect(compare_1,compare_2) #Finds documents where word 1, 2, 3 and 4 are present
compare_4 <- intersect(compare_3,word_5) # Finds documents where all 5 search words are present
compare_4 #Prints number indicading which documents contain all given search criteria 

#abort_search_doc1 <- str_locate_all(files_string[1],"abort") #prints position of all occurrences of "abort" in all documents. 
# returns position
# search context 
# assign to a variable. how? what parameters can it hide? 
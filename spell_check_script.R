library(tidyverse)
library(hunspell)

# example words
words <- c('Sunday', 'walking', 'compleetly', 'happy', 'diferent', 'soape',
           'equal', 'absolootely')

# Check for correct spelling

spell_check <- hunspell_check(words)
spell_check


# Suggest replacement words

hunspell_suggest(words[!spell_check])


# example medical words
medical_words <- c('AIDS', 'Olanzapine', 'COPD', 'myocardial', 'histology', 'hepatoblastoma',
                   'cytotoxic', 'nephrectomy', 'parathyroid', 'submucosa', "Olazapine", "Olanzapinee")

df <- data.frame(words = medical_words, spell_check = hunspell_check(medical_words))

# check spelling of incorrect medication 
hunspell_suggest('Olanzapinee')


# set DICPATH for hunspell medical dictionary 
Sys.setenv(DICPATH = paste0(getwd(),"/hunspell_en_med_glut_workaround_master/"))


# check that the path has been added
hunspell:::dicpath()

# load the dictionary
dictionary("en_US")

# check spellings again
df <- data.frame(words = medical_words, spell_check = hunspell_check(medical_words))

# recheck incorrect spelling of medication

hunspell_suggest('Olanzapinee')





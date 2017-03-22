library(dplyr)
library(tidyr)
library(readr)
library(readxl)
library(stringr)

# read in data

# Lev-Ari sentences and conversations
fowler_items <-
  read_csv('fowler-items.csv') %>%
  gather(phoneme, word, p:k) %>%
  mutate(item = str_c(item, phoneme))

lev_ari_sentences <-
  read_excel('VOT sentnece results.xlsx') %>%
  left_join(fowler_items, by = c('item', 'phoneme')) %>%
  transmute(source = 'levari-sent',
            subject = str_c('la_', subject),
            phoneme = phoneme,
            vot = vot,
            prevoiced = NA,
            word = word,
            sex = sex,
            age = age,
            age_group = ifelse(age < 40, 'y', 'o'),
            bilingual = TRUE)

lev_ari_convo <- read_excel('VOT conversation results.xlsx') %>%
  transmute(source = 'levari-convo',
            subject = str_c('la_', subject),
            phoneme = phoneme,
            vot = vot,
            prevoiced = NA,
            word = word,
            sex = sex,
            age_group = ifelse(age < 40, 'y', 'o'),
            age = age,
            bilingual = TRUE)

# Goldrick et al. (2013) and Baese-Berk & Goldrick (2009)
goldrick2013_sex <- read_tsv('voiced-initial-gender.tsv') %>%
  mutate(Subject = as.numeric(Subject),
         Sex = tolower(Sex))

goldrick2013 <- read_tsv('Goldrick2013_voicedInitial.txt') %>%
  left_join(goldrick2013_sex, by='Subject') %>%
  transmute(source = 'gva13',
            subject = str_c('gva13_', Subject),
            phoneme = Consonant,
            vot = VOT * 1000,
            prevoiced = Prevoiced %>% round() %>% as.logical(),
            word = Word,
            sex = Sex,
            age = NA,
            bilingual = FALSE)

bbg <- read_csv('BBG-Trimmed.csv')

baeseberk_goldrick2009 <- read_csv('BBG-Trimmed.csv') %>%
  mutate(study = ifelse(consonant == 'p', 'a', 'b')) %>%
  transmute(source = 'bbg09',
            subject = str_c('bbg09', study, Subject, sep='_'),
            phoneme = consonant,
            vot = VOT * 1000,
            prevoiced = NA,
            word = Word,
            sex = NA,
            age = NA,
            bilingual = FALSE)

# Wedel/Buckeye

buckeye_speakers <- read_csv('buckeye-speakers.csv') %>%
  mutate(speaker = tolower(speaker))

buckeye <- bind_rows(read_csv('Wedel_VoicelessStopDataFromBuckeye.csv'),
                     read_csv('Wedel_VoicedStopDataFromBuckeye.csv')) %>%
  left_join(buckeye_speakers, by=c(Speaker='speaker')) %>%
  transmute(source = 'buckeye',
            subject = str_c('buckeye_', Speaker),
            phoneme = Phoneme,
            vot = VOT * 1000,
            prevoiced = NA,
            word = Ortho,
            sex = speaker_gender,
            age_group = speaker_age,
            bilingual = FALSE,
            speech_rate = SpeechRate,
            stop_length = StopLength * 1000)


# Put it all together

stops <- data_frame(phoneme = c('b', 'd', 'g', 'p', 't', 'k'),
                    voicing = rep(factor(c('voiced', 'voiceless')), each=3),
                    place = rep(factor(c('lab', 'cor', 'dor'),
                                       levels = c('lab', 'cor', 'dor')),
                                times=2))

vot <- bind_rows(lev_ari_sentences,
                 lev_ari_convo,
                 goldrick2013,
                 baeseberk_goldrick2009,
                 buckeye) %>%
  mutate(phoneme = tolower(phoneme)) %>%
  left_join(stops) %>%
  mutate(phoneme = factor(phoneme, levels = c('b', 'd', 'g', 'p', 't', 'k')))

devtools::use_data(vot, overwrite=TRUE)


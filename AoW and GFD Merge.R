library(tidyverse)
library(dplyr)
library(data.table)

#First, import datasets (already cleaned to have matching country values)
  #name them AOW_mod and GWF_mod, respectively (should be done automatically)

#when imported, GWF_mod 'country' var reads as 'country...1'
  #can correct by renaming, done below
GWF_mod$country <- GWF_mod$country...1

#Next, create data object named 'tab'
  #binds AOW and GWF datasets
tab <- left_join(AOW_mod %>% group_by(year) %>% mutate(id = row_number()),
          GWF_mod %>% group_by(year) %>% mutate(id = row_number()), 
          by = c("year", "country"))

#check for rows/country-year values shared across both datasets
newtab1 <- tab[ which(tab$country == tab$country...1), 
                ]
#check for any rows in tab that are faulty (country not equal to country...1)
newtab2 <- tab[ which(tab$country != tab$country...1), 
                ]

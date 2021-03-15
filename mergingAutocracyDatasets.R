library(plotly)
library(dplyr)

df <- read.csv('/Users/skylar/Desktop/GwF_AoW_Data.csv'
)

#graph with slider that compares lindex to duration nr
p <- ggplot(df, aes(duration_nr, lindex, color = un_continent)) +
  geom_point(aes(size = gwf_fail, frame = year, ids = country)) +
  scale_x_log10()

fig <- ggplotly(p)

fig <- fig %>%
  animation_slider(
    currentvalue = list(prefix = "year: ", font = list(color="grey"))
  )

fig

#creating subsetted dataframe with only un_continent, year, lindex
myvars <- c("un_continent", "year", "lindex")
df1 <- df[myvars]


#finding the mean of lindex according to year and continent
#name this df2
df2 <- df1 %>% group_by(year, un_continent) %>% summarise(mean_lindex = mean(lindex))





# No legend, since the information is redundant
p <- ggplot(data=df2, aes(x=un_continent, y=mean_lindex, fill=mean_lindex)) +
  geom_bar(aes(frame = year, ids = un_continent)) +
  scale_x_log10()

fig <- ggplotly(p)

fig <- fig %>%
  animation_slider(
    currentvalue = list(prefix = "year: ", font = list(color="grey"))
  )

fig


# R project

# install.packages("tidyverse")
library(tidyverse)


# importing data
data <- read.delim("data/ebd_IN-KL_202304_202304_relApr-2023.txt", 
                   sep = "\t", header = T, quote = "",
                   stringsAsFactors = F, na.strings = c(""," ",NA))


# calculating number of species reported per district
tot_specs <- data %>% 
  filter(!is.na(COUNTY)) %>% 
  group_by(COUNTY) %>%
  summarise(NO.SP = n_distinct(COMMON.NAME))


# creating graph
fig1 <- ggplot(data = tot_specs) +
  geom_col(mapping = aes(x = COUNTY, y = NO.SP),
           fill = "navyblue") +
  # geom_col(mapping = aes(x = fct_reorder(COUNTY, NO.SP, .desc = TRUE), y = NO.SP),
  #          fill = "navyblue") +
  labs(x = "District", y = "Number of species") +
  theme_classic()


# saving graph as image
ggsave(plot = fig1, filename = "outputs/fig1.png",
       width = 12, height = 8, units = "in", dpi = 300)


# clean R workspace (environment) completely
rm(list = ls())

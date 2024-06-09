library(tidyverse)
library(lubridate)

load("data/data.RData")


# Adding useful columns --------------------------------------------------------------

data_ebd <- data_ebd %>% 
  # MUTATE
  # group ID (IMPORTANT!!)
  mutate(GROUP.ID = ifelse(is.na(GROUP.IDENTIFIER), 
                           SAMPLING.EVENT.IDENTIFIER, 
                           GROUP.IDENTIFIER)) %>% # like formulas in Excel
  # working with dates, LUBRIDATE
  mutate(OBSERVATION.DATE = as_date(OBSERVATION.DATE), 
         YEAR = year(OBSERVATION.DATE), 
         MONTH = month(OBSERVATION.DATE),
         DAY.M = day(OBSERVATION.DATE))

# PIPING is very useful! Will see example later.


# Basic summaries ------------------------------------------------------------------

tot_bdr <- n_distinct(data_ebd$OBSERVER.ID)
tot_lists <- n_distinct(data_ebd$SAMPLING.EVENT.IDENTIFIER)

# unique lists
tot_ulists <- n_distinct(data_ebd$GROUP.ID)

# we can also simply create a new column with the summary

# complete lists
tot_clists <- data_ebd %>% 
  filter(ALL.SPECIES.REPORTED == 1) %>% 
  summarise(C.LISTS = n_distinct(SAMPLING.EVENT.IDENTIFIER))

# summarise() aggregates data into single row; collapses data per group
tot_clists_dist <- data_ebd %>%
  filter(ALL.SPECIES.REPORTED == 1) %>%
  group_by(COUNTY) %>%
  summarise(C.LISTS.DIST = n_distinct(SAMPLING.EVENT.IDENTIFIER))


data_ebd %>% distinct(CATEGORY)

tot_specs <- data_ebd %>% 
  filter(CATEGORY %in% c("species", "issf") &
           !is.na(COUNTY)) %>% 
  group_by(COUNTY) %>%
  summarise(NO.SP = n_distinct(COMMON.NAME))


# Exercise ------------------------------------------------------------------------

# 1. How to calculate total number of locations?

tot_loc


# NB: Pipelines and tidy workflow! ------------------------------------------------------

# 1. Intermediate objects

temp1 <- filter(data_ebd, ALL.SPECIES.REPORTED == 1)

temp2 <- group_by(temp1, COUNTY)

temp3 <- summarise(temp2, C.LISTS = n_distinct(SAMPLING.EVENT.IDENTIFIER))


# 2. Nested functions

temp4 <- summarise(group_by(filter(data_ebd, 
                                   ALL.SPECIES.REPORTED == 1), 
                            COUNTY), 
                   C.LISTS = n_distinct(SAMPLING.EVENT.IDENTIFIER))


# 3. Pipes!

temp5 <- data_ebd %>% 
  filter(ALL.SPECIES.REPORTED == 1) %>% 
  group_by(COUNTY) %>%
  summarise(C.LISTS = n_distinct(SAMPLING.EVENT.IDENTIFIER))


# Same result but much more clean, efficient, readable
temp3 == temp4 
temp4 == temp5


# Reporting frequency! --------------------------------------------------------------

# Most important metric for most analyses of eBird data

# Can we compare 5 most common species in KAU, Thrissur and Kerala?


# STEP 1: Filtering for data

data_KAU <- data_ebd %>% 
  # https://ebird.org/hotspot/L3086715
  filter(LOCALITY == "Kerala Agricultural University--General Area")

data_TS <- data_ebd %>% 
  filter(COUNTY == "Thrissur")

data_KL <- data_ebd


# STEP 2: Calculate reporting frequency (functionise)

calc_repfreq <- function(data) {
  
  data0 <- data %>%
    # we need to consider ONLY complete checklists---WHY?
    filter(ALL.SPECIES.REPORTED == 1) %>%
    # repfreq
    mutate(TOT.LISTS = n_distinct(GROUP.ID)) %>% 
    group_by(COMMON.NAME) %>% 
    summarise(NO.LISTS = n_distinct(GROUP.ID),
              TOT.LISTS = min(TOT.LISTS)) %>% 
    mutate(REP.FREQ = 100*NO.LISTS/TOT.LISTS)
  
  return(data0)
  
}

data_KAU <- data_KAU %>% calc_repfreq()
data_TS <- data_TS %>% calc_repfreq()
data_KL <- data_KL %>% calc_repfreq()


# STEP 3: Get top 5 common species and compare (create new table?)

data_KAU <- data_KAU %>% 
  arrange(desc(REP.FREQ)) %>% 
  slice(1:5)
data_TS <- data_TS %>% 
  arrange(desc(REP.FREQ)) %>% 
  slice(1:5)
data_KL <- data_KL %>% 
  arrange(desc(REP.FREQ)) %>% 
  slice(1:5)

comparison <- data.frame(POSITION = 1:5,
                         KAU = data_KAU$COMMON.NAME,
                         TS = data_TS$COMMON.NAME,
                         KL = data_KL$COMMON.NAME)

write.csv(comparison, file = "outputs/comparison.csv")

# or any other format; several read/write functions exist


# Graph of district-wise stats ------------------------------------------------------

# ggplot works in layers
fig1 <- ggplot(data = tot_specs) +
  geom_col(mapping = aes(x = COUNTY, y = NO.SP),
           fill = "navyblue") +
  # geom_col(mapping = aes(x = fct_reorder(COUNTY, NO.SP, .desc = TRUE), y = NO.SP),
  #          fill = "navyblue") +
  labs(x = "District", y = "Number of species") +
  theme_classic()

ggsave(plot = fig1, filename = "outputs/fig1.png",
       width = 12, height = 8, units = "in", dpi = 300)


# Map of eBirding locations ----------------------------------------------------------

library(sf)

# convert data into spatial objects, using lat-long info in our data as coordinates
# (can later try replacing data_ebd with data_mydata, for personal eBird map)
data_sf <- data_ebd %>% 
  st_as_sf(coords = c("LONGITUDE", "LATITUDE"))

# ggplot works in layers
map <- ggplot(data = data_sf) +
  geom_sf(colour = "#FCFA53", size = 0.05, stroke = 0.5, alpha = 1) +
  labs(title = "Point map") +
  theme_void() +
  theme(plot.background = element_rect(fill = "black", colour = NA),
        panel.background = element_rect(fill = "black", colour = NA),
        plot.title = element_text(hjust = 0.5, colour = "#FCFA53")) 

ggsave(plot = map, filename = "outputs/map.png", 
       # use png(), not ragg::agg_png() which does anti-aliasing, removing crispness of points
       device = png,
       width = 7, height = 7, units = "in", dpi = 300)

# Exercise --------------------------------------------------------------------------

# 2. Using your personal eBird data, get your life list (common names)

lifelist

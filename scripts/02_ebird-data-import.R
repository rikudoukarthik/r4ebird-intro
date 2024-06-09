# tidyverse is an umbrella package (https://www.tidyverse.org/packages/)
library(tidyverse)
library(skimmr)


# eBird data: EBD vs My Data
# EBD every month (https://ebird.org/data/download/ebd)
# My Data can be downloaded anytime (download NOW from https://ebird.org/downloadMyData )

# Make sure you are in the correct R PROJECT! Also tweak Global Options.


# loading EBD -----------------------------------------------------------------------

# Defining input file
rawpath <- "data/ebd_IN-KL_202404_202404_relApr-2024.txt"

# Selecting columns of interest.
# Run skimmr::read.ebd(rawpath, cols_print_only = TRUE) to decide which of 50 columns are 
# necessary for your analysis, and modify this vector accordingly.
# For larger datasets, excluding unnecessary columns reduces the size of the imported object
# and makes it easier to work with it.
my_cols <- c("CATEGORY","EXOTIC.CODE","COMMON.NAME","OBSERVATION.COUNT",
             "LOCALITY.ID","LOCALITY.TYPE","REVIEWED","APPROVED","LAST.EDITED.DATE",
             "STATE","STATE.CODE","COUNTY","COUNTY.CODE",
             "LATITUDE","LONGITUDE","OBSERVATION.DATE","TIME.OBSERVATIONS.STARTED","OBSERVER.ID",
             "PROTOCOL.TYPE","DURATION.MINUTES","EFFORT.DISTANCE.KM","LOCALITY","BREEDING.CODE",
             "NUMBER.OBSERVERS","ALL.SPECIES.REPORTED","GROUP.IDENTIFIER","SAMPLING.EVENT.IDENTIFIER",
             "TRIP.COMMENTS","SPECIES.COMMENTS", "HAS.MEDIA")

data_ebd <- skimmr::read.ebd(rawpath, cols_sel = my_cols)

# how does the data look?
head(data_ebd)
# for Excel-like view
View(data_ebd)


# loading My eBird Data -------------------------------------------------------------

# Steps are slightly simpler since it is a .csv, and a smaller file.
# We can do the same steps for column selection (my_cols), but small file so not essential.

data_mydata <- read.csv(file = "data/MyEBirdData.csv")

# how does the data look?
head(data_mydata)
# for Excel-like view
View(data_mydata)

# structure is similar to EBD, but column names different and fewer columns
names(data_mydata)

# they can be renamed for consistency
data_mydata <- data_mydata %>% 
  # removing unnecessary columns and renaming necessary ones
  dplyr::select(-c(Scientific.Name, Area.Covered..ha., ML.Catalog.Numbers)) %>% 
  # for uniformity with regular EBD
  magrittr::set_colnames(c("SAMPLING.EVENT.IDENTIFIER", "COMMON.NAME", "TAXONOMIC.ORDER",
                           "OBSERVATION.COUNT", "STATE.CODE", "COUNTY", 
                           "LOCALITY.ID", "LOCALITY", "LATITUDE", "LONGITUDE", 
                           "OBSERVATION.DATE", "TIME.OBSERVATION.STARTED", "PROTOCOL.TYPE",
                           "DURATION.MINUTES", "ALL.OBS.REPORTED", "EFFORT.DISTANCE.KM",
                           "NUMBER.OBSERVERS", "BREEDING.CODE", 
                           "SPECIES.COMMENTS", "TRIP.COMMENTS"))

head(data_mydata)


# saving for later use --------------------------------------------------------------

# very TIDY data (1 row for 1 observation; 1 column for 1 info type)
# only VALUES in cells of table are data; visual elements (colour, font, etc.) do not matter

# Save as .RData which can be loaded directly in future sessions.
save(data_ebd, data_mydata, file = "data/data.RData") 

rm(list = ls()) # clean R workspace (environment) completely
# also Restart RStudio Session (ctrl+shift+F10)
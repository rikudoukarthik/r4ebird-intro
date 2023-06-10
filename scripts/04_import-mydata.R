# loading data ###

# Steps are slightly simpler since it is a .csv, and a smaller file.
# We can do the same steps for column selection (preimp, nms, etc.), but small file so not essential.

data <- read.csv(file = "data/MyEBirdData.csv")

# how does the data look?
head(data)

# structure is similar, but column names different and fewer columns
names(data)


# they can be renamed for consistency
data <- data %>% 
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

head(data)

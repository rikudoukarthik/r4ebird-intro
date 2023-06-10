# eBird data: EBD vs My Data
# EBD every month (https://ebird.org/data/download/ebd)
# My Data can be downloaded anytime (download NOW from https://ebird.org/downloadMyData )


# loading data ###

# Make sure you are in the correct R PROJECT! Also tweak Global Options.

# Defining input file
rawpath <- "data/ebd_IN-KL_202304_202304_relApr-2023.txt"

# Creating vector containing names of columns of interest.
# Go through metadata file to decide which of 50 columns are necessary for your analysis,  
# and modify this vector accordingly.
preimp <- c("CATEGORY","EXOTIC.CODE","COMMON.NAME","OBSERVATION.COUNT",
            "LOCALITY.ID","LOCALITY.TYPE","REVIEWED","APPROVED","LAST.EDITED.DATE",
            "STATE","STATE.CODE","COUNTY","COUNTY.CODE",
            "LATITUDE","LONGITUDE","OBSERVATION.DATE","TIME.OBSERVATIONS.STARTED","OBSERVER.ID",
            "PROTOCOL.TYPE","DURATION.MINUTES","EFFORT.DISTANCE.KM","LOCALITY","BREEDING.CODE",
            "NUMBER.OBSERVERS","ALL.SPECIES.REPORTED","GROUP.IDENTIFIER","SAMPLING.EVENT.IDENTIFIER",
            "TRIP.COMMENTS","SPECIES.COMMENTS", "HAS.MEDIA")

# Defining which columns to import and which to not
nms <- names(read.delim(rawpath, nrows = 1, sep = "\t", header = T, quote = "", stringsAsFactors = F,
                        na.strings = c(""," ", NA)))
nms
# we don't need all these columns. select columns using preimp

nms[!(nms %in% preimp)] <- "NULL"
nms[nms %in% preimp] <- NA

# IMPORTANT: always ensure that all the arguments are specified, to avoid import errors.
data <- read.delim(rawpath, colClasses = nms, sep = "\t", header = T, quote = "",
                   stringsAsFactors = F, na.strings = c(""," ",NA))

# how does the data look?
head(data)

# very TIDY data (1 row for 1 observation; 1 column for 1 info type)
# only VALUES in cells of table are data; visual elements (colour, font, etc.) do not matter


# Save as .RData which can be loaded directly in future sessions.
save(data, file = "data/data.RData") 

rm(list = ls()) # clean R workspace (environment) completely


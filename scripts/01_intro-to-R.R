# What is R?
print("R is an open-source programming language for statistical computing, data analysis and data visualisation.")

# Essentially, inputs produce outputs.
1 + 1
# When using RStudio IDE, inputs can be either in the console, or in scripts that can be saved for reference.
1*2

# For most tasks, temporary inputs-outputs are not sufficient. Then we ASSIGN them to OBJECTS.
two <- 1 + 1
# Now "two" is an object in our R environment. This can now be used for operations later.
# <- is the assignment operator.

two == 2

four <- 1 + 1

two == four

# Assigning other objects.
two_word <- "two"
prim_colours <- c("red", "green", "blue")
hex <- c(255, 255, 255)
colours_table <- data.frame(COLOURS = prim_colours, 
                            HEXCODES = hex)


# Objects can be of different classes
class(two); class(two_word); class(colours_table)
# Data can be of different types (vectors, matrices, dataframes, lists)
# vector vs dataframe (how many dimensions?)
str(hex); str(prim_colours)
str(colours_table)
dim(hex); dim(colours_table)


# R is a very explicit language. WYSIWYG.
weight_kg <- 100
weight_lb <- 2.2 * weight_kg
weight_lb

weight_kg <- 50
# weight_lb = ???
weight_lb

# Commands in R are sequential: order matters!
weight_lb <- 2.2 * weight_kg
weight_lb
# Also means exact spellings matter
weight_LB # does not exist!


# Repeated calculations/operations can be wrapped into FUNCTIONS, only input changes each time.
convert_kg_to_lb <- function(kg) {
  
  lb <- 2.2 * kg
  
  return(lb)
  
}

convert_kg_to_lb(75); convert_kg_to_lb(27.42); convert_kg_to_lb(250); convert_kg_to_lb(67.2345)
# If needed, these can be assigned to objects


# There are MANY predefined functions, available in sets called PACKAGES

# R is not only extremely powerful and flexible, but also allows work to be transparent and reproducible.


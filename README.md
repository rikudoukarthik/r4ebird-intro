# Using R for analyses using eBird data: An introduction

This is an introductory crash course to using R for analysis of eBird data, originally created for the R workshop during Kerala Bird Monitoring Meet (KBMM) 2023 (see [that version](https://github.com/rikudoukarthik/r4ebird-intro/releases/tag/v2023.06) of the repo). 

This quick course is designed in the form of a workshop session of around 2 hours. It is structured as follows.

## Chapter 0: Setup

This is a set of preparations steps *before* the workshop begins. This includes setting up your local directory (ideally as an "R Project") and getting the necessary data files in place.

### Download and install R and RStudio

R is a programming language, while RStudio is an application that allows you to easily use R. See [this simple tutorial](https://rstudio-education.github.io/hopr/starting.html) for how to quickly download and install both.

### Install some essential packages

Packages are sets of predefined functions that can be used directly for specific requirements. This will be explored using examples during the workshop, but you should set up your system to have some basic packages installed and ready beforehand.

Run the following lines of code in the RStudio "console" tab:

```
install.packages("tidyverse")
devtools::install_github("rikudoukarthik/skimmr")
install.packages("sf")
```

If you face errors with this code, such as endless failed download attempts (refer the messages being produced in the console), try restarting RStudio with administrator rights and then running the code. If that doesn't work, delete all previous instances of R and RStudio from your computer and install both afresh.

### Download this project directory locally

There are two main ways to create your own local copy of this project directory:

1. For participants of the KBMM 2024 R workshop, use the Google Drive link that was shared with you and download the *entire folder* (not individual subfolders). It is important to retain this folder structure as is. (*Note: this already includes the latest EBD data we will use in the workshop.*)
1. For Git users, clone this GitHub repository onto your system

  1.1. Follow the steps in [this quick tutorial](https://argoshare.is.ed.ac.uk/healthyr_book/clone-an-existing-github-project-to-new-rstudio-project.html#fig:chap14-fig-clone) to clone the repository from GitHub onto a specified local directory.
    
  1.1. Since the EBD data have not been committed to the GitHub repository, these need to be downloaded separately [from eBird](https://ebird.org/data/download/ebd) and stored in `data/`. In the workshop, we use the dataset filtered for the latest available month and for the state of Kerala, so you are recommended to apply these same filters when downloading.
    
**NOTE:** It is important that the entire directory is downloaded, including the R Project file (`r4ebird-intro.Rproj`). This is a crucial element of setting up the directory, and offers several benefits  such as ability to refer to files using relative paths, and more broadly, reproducibility. See [this short explainer](https://rfortherestofus.com/2022/10/rstudio-projects) for why it is the preferred method of working in RStudio. If you're interested in the advanced nitty-gritties, see [this](https://r4ds.hadley.nz/workflow-scripts.html#projects) or [this](https://www.tidyverse.org/blog/2017/12/workflow-vs-script/) article on the importance of project-oriented workflows.

### Download your own My eBird Data

Your personal eBird data can be downloaded from [here](https://ebird.org/india/downloadMyData). This file is likely to be smaller than the EBD. We will use this to understand differences from EBD and to explore interesting patterns in your personal birding.

## Chapter 0.9: Overview (5 min)

Before we begin, we will quickly go over some of the main processes and outputs we will be performing/generating during this workshop. This is to give an immediate idea of what to expect. 

Run the R script fully on your system. Examine the outputs that are produced.

Refer: `scripts/00_overview.R`

## Chapter 1: Introduction to R (15 min)

- Introducing mechanics of R through simple examples
- Input-output, assigning to objects
- Classes of objects, types of data
- Importance of sequence and explicit commands
- Converting repeated commands into functions, packages

Refer: `scripts/01_intro-to-R.R`

## Chapter 2: eBird data types & importing data (30 min)

- Types of eBird data
  - eBird Basic Dataset
  - My eBird Data
- Importing eBird data

Refer: `scripts/02_ebird-data-import.R`

## Chapter 3: Analysing eBird Basic Dataset (EBD) (60 min)

- Adding useful columns to eBird data
- Birding summaries from eBird data
- SIDE NOTE: Benefits of "piping" with %>% and tidy workflow
- The famous "reporting frequency"!
  - Comparing 5 most common species in different areas
  - Example of how to create and use functions
  - Save results of analysis for sharing
- Creating and saving graph
- Creating and saving map of eBirding locations
  - Working with spatial data

Refer: `scripts/03_EBD-analyses.R`

## Chapter 4: Further practice (10 min)

Quick exercises to do at home, using what we learned.

## Additional resources

- [R for Data Science](https://r4ds.hadley.nz/)
  - This *free* and comprehensive online textbook contains all the information you will need when working with R
- [R coding etiquette](https://ourcodingclub.github.io/tutorials/etiquette/index.html)
  - Some best practices and styles to develop for good coding
- Video tutorials on using R
  - Videos 8-12 in [this YouTube playlist](https://www.youtube.com/playlist?list=PLwFqvDRX_4sJ0HnNGXlWjd8A7vFi2k0wp) of a biodiversity science course (relatable).
  - [Another YouTube playlist](https://www.youtube.com/playlist?list=PLwFqvDRX_4sLZYeVgDQGINEXrGkgeg3Td) of a different course
  - [Further videos]( (https://www.youtube.com/playlist?list=PL1BRV4y5o32AtvEy565FRAfHnEn5TgsQ4)) on working with ecological data in R
- Online forums like [StackOverflow](https://stackoverflow.com/)
  - Incredibly active and helpful community that helps each other. Your specific question has probably been asked before, and people have probably given great answers.
- AI chatbots like [ChatGPT](https://chatgpt.com/)
  - Since R is a language, these tools can be incredibly useful to troubleshoot your problematic code or to help you write code for the task you have in mind.
SO, gpt

The utility of R is not limited to just data analysis; one can also use it to create well-formatted documents like reports, presentations, etc., with markdown as well as the typesetting features of LaTeX.

- [R Markdown: The Definitive Guide](https://bookdown.org/yihui/rmarkdown/)
- [R Markdown Cheatsheet](https://www.rstudio.com/wp-content/uploads/2015/02/rmarkdown-cheatsheet.pdf)


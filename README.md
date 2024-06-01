# r4ebird-intro

This is an introductory crash course to using R for analysis of eBird data, originally created for the R workshop during Kerala Bird Monitoring Meet (KBMM) 2023 (see [that version](https://github.com/rikudoukarthik/r4ebird-intro/releases/tag/v2023.06) of the repo). 

This quick course is designed in the form of a workshop session of around 2 hours. It is structured as follows.

## Chapter 0: Setup

This is a set of preparations steps *before* the workshop begins. This includes setting up your local directory (ideally as an "R Project") and getting the necessary data files in place.

### Download and install R and RStudio

### Install some essential packages

"Packages" will be explored during the workshop.

enter commands into console

if facing errors with certain packages, refer this troubleshooting guide
else remove old instance of R and RStudio and install afresh

### Download this project directory locally

There are two main ways to create your own local copy of this project directory:

1. For participants of the KBMM 2024 R workshop, use the Google Drive link that was shared with you and download the *entire folder* (not individual subfolders). It is important to retain this folder structure as is. (*Note: this already includes the latest EBD data we will use in the workshop.*)
1. For Git users, clone this GitHub repository onto your system
    1.1 Follow the steps in [this quick tutorial](https://argoshare.is.ed.ac.uk/healthyr_book/clone-an-existing-github-project-to-new-rstudio-project.html#fig:chap14-fig-clone) to clone the repository from GitHub onto a specified local directory.
    1.1 Since the EBD data have not been committed to the GitHub repository, these need to be downloaded separately [from eBird](https://ebird.org/data/download/ebd) and stored in `data/`. In the workshop, we use the dataset filtered for the latest available month and for the state of Kerala, so you are recommended to apply these same filters when downloading.
    
**NOTE:** It is important that the entire directory is downloaded, including the R Project file (`r4ebird-intro.Rproj`). This is a crucial element of setting up the directory, and offers several benefits  such as ability to refer to files using relative paths, and more broadly, reproducibility. See [this short explainer](https://rfortherestofus.com/2022/10/rstudio-projects) for why it is the preferred method of working in RStudio. If you're interested in the advanced nitty-gritties, see [this](https://r4ds.hadley.nz/workflow-scripts.html#projects) or [this](https://www.tidyverse.org/blog/2017/12/workflow-vs-script/) article on the importance of project-oriented workflows.

### Download your own My eBird Data

Your personal eBird data can be downloaded from [here](https://ebird.org/india/downloadMyData). This file is likely to be smaller than the EBD. We will use this to understand differences from EBD and to explore interesting patterns in your personal birding.

## Chapter 0.9: Overview (5 min)

Before we begin, we quickly go over some of the main processes and outputs we will be performing/generating during this workshop. This is to give an immediate idea of what to expect. 

Run the R script fully on your system. Examine the outputs that are produced.

Refer: `scripts/00_overview.R`

## Chapter 1: Introduction to R (15 min)

## Chapter 2: eBird data types & importing data (30 min)

Data types
Importing data

## Chapter 3: Analysing eBird Basic Dataset (EBD) (60 min)

## Chapter 4: Further practice (10 min)

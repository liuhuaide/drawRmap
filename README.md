# Shiny Analysis App

Welcome to the Shiny Analysis App, a Shiny application based on R designed for interactive data analysis using the CntoAPI package.

## Introduction

This application allows users to select different datasets (such as `mtcars` or `iris`) and use a slider to choose the number of observations to display. The application dynamically showcases a table view of the selected dataset.

## Features

- Dataset selection
- Slider for selecting the number of observations to display
- Dynamic table updates

## Tech Stack

- R
- Shiny
- CntoAPI

## Prerequisites

Before running the application, make sure you have the following R packages installed:

- `shiny`
- `CntoAPI`

You can install these packages using the following commands:

```r
install.packages("shiny")
# If you haven't installed CntoAPI yet, install it from GitHub
if (!requireNamespace("remotes", quietly = TRUE)) {
    install.packages("remotes")
}
remotes::install_github("liuhuaide/CntoAPI")

#!/usr/bin/env Rscript
# @Author: vargash1
# @Name:   Vargas, Hector
# @Email:  vargash1@wit.edu
# @Date:   2015-07-31 00:33:56
# @Last Modified by:   vargash1
# @Last Modified time: 2015-08-02 00:02:11
library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(

  # Application title
  titlePanel("Hector Vargas Linear Regression"),

  # for nice math output
  withMathJax(),

  #data variable selector
  fluidRow(
  	column(3,
  		selectInput("select", label = h3("Select Variable"),
  			choices = list(
  				"Season Analysis was Peformed" = 1, 
  				"Age at Time of Analysis" = 2,
  				"Childish Diseases (eg: chicken pox, measles, mumps, polio)" = 3,
  				"Accident/Serious Trauma " = 4,
  				"Surgical Intervention " = 5,
  				"High Fevers in the Last Year" = 6,
  				"Frequency of Alcohol Consumption" = 7,
  				"Smoking Habit" = 8, 
  				"Hours Spent Sitting Daily" = 9), selected = 1))
  	),

    mainPanel(
    	tabsetPanel(type = "tabs",
    		tabPanel("Plot",plotOutput("Plot")),
    		tabPanel("Coefficients.",uiOutput("cofvar")),
    		tabPanel("Summary",verbatimTextOutput("summary")),
    		tabPanel("Formula",uiOutput("lrformula")),
	   		tabPanel("Data Set",verbatimTextOutput("dataset")),
	   		tabPanel("About Me",uiOutput("aboutme"))
    	)
    )
  )
)
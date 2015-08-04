#!/usr/bin/env Rscript
# @Author: vargash1
# @Name:   Vargas, Hector
# @Email:  vargash1@wit.edu
# @Date:   2015-07-31 00:34:02
# @Last Modified by:   vargash1
# @Last Modified time: 2015-08-02 00:22:43

library(shiny)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
	# ---------------------------------------------
	# renders plot to main page
  	output$Plot <- renderPlot({
	  	# read in csv
	  	data_in <<- read.csv("input.csv")
	  	attach(data_in)
	  	
	  	# react to user variable change
	  	l <<- list(SEASON,AGE,DIS,ACC,SURG,FEVER,ALCHOL,SMOKE,SIT)
	  	slt <- as.integer(input$select)
	  	targ <- l[[slt]]

	  	# simple way to make our labels pretty
	  	lbl <- list("Season Analysis was performed (Winter: -1, Spring: -0.33, Summer: 0.33, Fall: 1)",
	  		"Age at time of Analysis (18-36)",
	  		"Childish Diseases (Yes:0 , No:1)",
	  		"Accident/Serious Trauma (Yes:0 , No:1)",
	  		"Surgical Intervention (Yes:0 , No:1)",
	  		"High Fevers in the Last Year (< 3 months ago: -1, > 3 months ago: 0, No: 1)",
	  		"Frequency of Alcohol Consumption (Several per Day, Every Day, Several per Week,Once a Week, Hardly)",
	  		"Smoking Habit (Never: -1, Occasional: 0, Daily: 1)",
	  		"Hours Spent Sitting Daily(0-16)")
		x_lb <- lbl[slt]
	  	
	  	# linear reg and plot to page 
	  	a <- lm(OUT~targ)
	  	plot(targ,OUT,
	    	main = "Linear Regression on Feritility of Males",
	    	xlab = x_lb,
	    	ylab = "Diagnosis, Normal(0) Altered(1)")
	    abline(a)
	  })
	# ---------------------------------------------
	# correlation variables 
	output$cofvar <- renderUI({
		tmp1 <- as.integer(input$select)
		tmp2 <- l[[tmp1]]
		tmp2_cor <- cor(tmp2,OUT)
		withMathJax(
			sprintf("$$r =  %.03f $$",tmp2_cor),
			sprintf("$$r^{2} =  %.03f$$",tmp2_cor^2)
		)
	})
	# ---------------------------------------------
	# generate summary of data of selected variable 
	output$summary <- renderPrint({
		tmp1 <- as.integer(input$select)
		tmp2 <-	l[[tmp1]]
		summary(tmp2)
	})
	# ---------------------------------------------
	# output formula using LaTeX 
	output$lrformula <- renderUI({
		tmp1 <- as.integer(input$select)
		tmp2 <- l[[tmp1]]
		lmodel <- lm(OUT~tmp2)
		x <- lmodel$coefficients[1]
		y <- lmodel$coefficients[2]
		withMathJax(sprintf("$$f = %.03f + %.03f x$$",x,y))
	})
	# ---------------------------------------------
	# print out dataset
	output$dataset <- renderPrint({
		print(data_in)
	})
	# ---------------------------------------------
	# About me
	output$aboutme <- renderUI({
		withMathJax(
			helpText("Hector Vargas"),
			helpText("Computer Science 2016 "),
			helpText("Final Project for MATH505 "),
			helpText("Professor: Gary Simundza ")
		)
	})
})
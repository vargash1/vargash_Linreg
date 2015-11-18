#Final Project for MATH505
This is a repo for my final project on linear regression using R and the R package, Shiny. Shiny allows the developer to create reactive apps with R. My app allows you to select a variable from the data and will try to see if its correlated with male fertility. 

###Install Shiny
```R
	#in R session
	install.packages("shiny")
```

###Usage
[Visit the project hosted on ShinyApps!](https://vargash1.shinyapps.io/vargash)
```R
	#to use locally
	#from your terminal
	./launch.r
	
	#or within an R Session
	library("shiny")
	runApp("src")

```

###Output
The generated page consists of tabs and upon change of selected varible, the out of the following will change. 

* Plot of Results and Selected Varible
* Linear Model on Plot
* Correlation Coefficient
* Correlation of Determination
* Linear Regression Forumla


###Data Set
The Data Set I used can be found [here](https://archive.ics.uci.edu/ml/datasets/Fertility)

###What you will see
![alt Text](http://i.imgur.com/yayLuV1.png "Sample Run")
![alt Text](http://i.imgur.com/5VLHR0I.png "Sample Run")
![alt Text](http://i.imgur.com/jtqNaVA.png "Launch using R shell")

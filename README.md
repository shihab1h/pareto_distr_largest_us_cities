# Fitting a Pareto Distribution to the Population Data from the Largest 200 US Cities using QRM Package in R

This repo is in the context of a Risk Management course.

Data contains the populations of the largest 200 US cities. The Mean Excess Plot suggests this distribution could be reasonably modelled as a Pareto. 

![MEP](https://github.com/shihab1h/pareto_distr_largest_us_cities/blob/main/MEP.png)

The parameters of the Pareto distribution are estimated from a reasonable section of the MEP. Since this is an estimate the heavy tail distribution, the right side of the MEP ought to be used for the estimate. However, the right-most points contain very small sample sizes, and hence a reasonable intervel was identified for the estimates.

![MEP](https://github.com/shihab1h/pareto_distr_largest_us_cities/blob/main/param.png)

Theta is estimated at around 1.54. 
The HTML file is a more readable render of RStudio output (akin to a Jupyter notebook file).

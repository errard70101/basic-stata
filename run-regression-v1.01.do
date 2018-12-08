* This file is created to illustrate the procedures of running regressions and
* testing hypothesis.
* Last edited: Dec. 7th, 2018.
* Created by Shih-Yang Lin


**== load data ==**
sysuse auto, clear


**== run regressions ==**

* run the first regression
regress price mpg headroom trunk weight length displacement if foreign == 0

* store regression results
estimates store reg1, title(Local Cars)

* run the second regression
regress price mpg headroom trunk weight length displacement if foreign == 1

* store regression results
estimates store reg2, title(Foreign Cars)

* show different estimation results
suest reg1 reg2

* display covariance matrix
matrix list e(V)


**== hypothesis test ==**

* test mpg = 0
test mpg

* test if the coefficients are equal between two regressions
test [reg1_mean]mpg = [reg2_mean]mpg

* test if coefficients vary between groups (Chow test)
test [reg1_mean = reg2_mean]

* find more details from the official documents
help test

help suest


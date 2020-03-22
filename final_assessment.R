#Insurance rates, part 1
library(tidyverse)
library(dslabs)
data(death_prob)
head(death_prob)
 
#Question 1a
#The death_prob data frame from the dslabs package contains information about the estimated probability of death within 1 year (prob) for different ages and sexes.
#Use death_prob to determine the death probability of a 50 year old female, p.
p <- death_prob %>% filter(sex == "Female" & age == 50) %>% select(prob)
p
 
#Question 1b
#The loss in the event of the policy holder's death is -$150,000 and the gain if the policy holder remains alive is the premium $1,150.s
#What is the expected vlue of the company's net profit on one policy for a 50 year old female?
(-150000 * p) + 1150 * (1-p)

#Question 1c
#Calculate the standard error of the profit on one policy for a 50 year old female.
sqrt(1) * abs(-150000-1150) * sqrt((1-p) * p)

#Question 1d
#What is the expected value of the company's profit over all 1,000 policies for 50 year old females?
exp_f <-1000*((-150000 * p) + 1150 * (1-p))

#Question 1e
#What is the standard error of the sum of the expected value over all 1,000 policies for 50 year old females?
se_f <- sqrt(1000) * abs(-150000-1150) * sqrt((1-p) * p)

#Question 1f
#Use the Central Limit Theorem to calculate the probability that the insurance company loses money on this set of 1,000 policies.
pnorm(0, exp_f, se_f)

#Question 2a
#Use death_prob to determine the probability of death within one year for a 50 year old male.
p <- death_prob %>% filter(sex == "Male" & age == 50) %>% select(prob)

#Question 2b
#Suppose the company wants its expected profits from 1,000 50 year old males with $150,000 life insurance policies to be $700,000.
mu<-700000
n <-1000
a <--150000

premium <- ((mu/n) - a * p)/(1 - p)

#Question 2c
#Using the new 50 year old male premium rate, calculate the standard error of the sum of 1,000 premiums.
se_m <- sqrt(1000) * abs(-150000-b) * sqrt((1-p) * p)

#Question 2d
#What is the probability of losing money on a series of 1,000 policies to 50 year old males?
pnorm(0, mu, se_m)

#Insurance rates, part 3
#Question 5a
#Calculate the premium required for a 5% chance of losing money given  𝑛=1000  loans, probability of death  𝑝=0.015 , and loss per claim  𝑙=−150000.  
#Save this premium as x for use in further questions.
l <- -150000
z <- qnorm(0.05)
p <- 0.015
n<- 1000
x <- -l*( n*p - z*sqrt(n*p*(1-p)))/ ( n*(1-p) + z*sqrt(n*p*(1-p)))

#Question 5b
#What is the expected profit per policy at this rate?
l*p + x*(1-p)

#Question 5c
#What is the expected profit over 1,000 policies?
n*(l*p + x*(1-p)) 
 
#Question 5d
#Run a Monte Carlo simulation with B=10000to determine the probability of losing money 
#on 1,000 policies given the new premium x, loss on a claim of $150,000, and probability of claim  𝑝=.015 . 
#Set the seed to 28 before running your simulation.
 
#What is the probability of losing money here?
B <-10000
p <- 0.015
n <- 1000
l <- -150000

set.seed(28)
gain <- replicate(B, {
  draws <- sample(c(x, l), n, replace = TRUE, prob=c(1-p, p))
  sum(draws)
})

mean(gain<0)
 
#The company cannot predict whether the pandemic death rate will stay stable. Set the seed to 29, then write a Monte Carlo simulation that for each of  𝐵=10000  iterations:
#randomly changes  𝑝  by adding a value between -0.01 and 0.01 with sample(seq(-0.01, 0.01, length = 100), 1)
#uses the new random  𝑝  to generate a sample of  𝑛=1,000  policies with premium x and loss per claim  𝑙=−150000 
#returns the profit over  𝑛  policies (sum of random variable)

#Question 6a
#What is the expected value over 1,000 policies?
B <-10000
p <- 0.015
n <- 1000
l <- -150000

set.seed(29)
gain <- replicate(B, {
  new_p <- p + sample(seq(-0.01, 0.01, length = 100), 1)
  draws <- sample(c(x, l), n, replace = TRUE, prob=c(1-new_p, new_p))
  sum(draws)
})
mean(gain)

#Question 6b
#What is the probability of losing money?
mean(gain<0)
 
#Question 6c
#What is the probability of losing more than $1 million
mean(gain < -10^6) 
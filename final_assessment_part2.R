#Questions 3 and 4: insurance rates, part 2
#A lethal pandemic disease increases the probability of death within 1 year for a 50 year old to .015. 
#Unable to predict the outbreak, the company has sold 1,000 $150,000 life insurance policies for $1,150.

#Question 3a
#What is the expected value of the company's profits over 1,000 policies?
p_loss = .015
loss =  -150000
n <- 1000
profit = 1150

exp_val <- n*(loss*p_loss + profit*(1-p_loss))
exp_val
 
#Question 3b
#What is the standard error of the expected value of the company's profits over 1,000 policies? 
se <- sqrt(1000) * abs(loss-profit) * sqrt((1-p_loss) * p_loss)

#Question 3c
#What is the probability of the company losing money?
pnorm(0, exp_val, se)

#Question 3d
#Suppose the company can afford to sustain one-time losses of $1 million, but larger losses will force it to go out of business.
#What is the probability of losing more than $1 million?
pnorm(-1*10^6, exp_val, se)
 
#Question 3e
#Investigate death probabilities p <- seq(.01, .03, .001).
#What is the lowest death probability for which the chance of losing money exceeds 90%?
prob_loss <- sapply(p,function(p) {
  ex <- n*((loss*p) + profit*(1-p))
  se <-  sqrt(1000) * abs(loss-profit) * sqrt((1-p) * p)
  pnorm(0, ex, se)
})

table <- data.frame(dp = p, prob = prob_loss)
table %>% filter(prob > .90) %>% select(dp) %>% min()
 
#Question 3f
#Investigate death probabilities p <- seq(.01, .03, .0025).
#What is the lowest death probability for which the chance of losing over $1 million exceeds 90%?
prob_loss <- sapply(p,function(p) {
  ex <- n*((loss*p) + profit*(1-p))
  se <-  sqrt(1000) * abs(loss-profit) * sqrt((1-p) * p)
  pnorm(-1*10^6, ex, se)
})

table <- data.frame(dp = p, prob = prob_loss)
table %>% filter(prob > .90) %>% select(dp) %>% min()
 
#Question 4a
#What is the reported profit (or loss) in millions (that is, divided by 10^6)?
set.seed(25)

p <- .015
loss <- -150000
profit <- 1150
n <- 1000

outcomes <- sample(c(loss, profit), n, prob = c(p, 1-p), replace = TRUE)
sum(outcomes)/10^6
 
#Question 4b
#What is the observed probability of losing $1 million or more?
profits <- replicate(B, { 
  outcomes <- sample(c(loss, profit), n, replace =TRUE, prob = c(p_loss, (1-p_loss)))
sum(outcomes)/10^6
})

mean(profits < -1)
 
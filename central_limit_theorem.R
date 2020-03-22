#The Central Limit Theorem

#1. American Roulette probability of winning money
# Assign a variable `p_green` as the probability of the ball landing in a green pocket
p_green <- 2 / 38
# Assign a variable `p_not_green` as the probability of the ball not landing in a green pocket
p_not_green <- 1-p_green
# Define the number of bets using the variable 'n'
n <- 100
# Calculate 'avg', the expected outcome of 100 spins if you win $17 when the ball lands on green and you lose $1 when the ball doesn't land on green
avg <- n * (17*p_green + -1*p_not_green)
# Compute 'se', the standard error of the sum of 100 outcomes
se <- sqrt(n) * (17 - -1)*sqrt(p_green*p_not_green)
# Using the expected value 'avg' and standard error 'se', compute the probability that you win money betting on green 100 times.
pnorm(0, avg, se, lower.tail = FALSE)

#2. American Roulette Monte Carlo simulation
# Assign a variable `p_green` as the probability of the ball landing in a green pocket
p_green <- 2 / 38
# Assign a variable `p_not_green` as the probability of the ball not landing in a green pocket
p_not_green <- 1-p_green
# Define the number of bets using the variable 'n'
n <- 100
# The variable `B` specifies the number of times we want the simulation to run. Let's run the Monte Carlo simulation 10,000 times.
B <- 10000
# Use the `set.seed` function to make sure your answer matches the expected result after random sampling.
set.seed(1)
# Create an object called `S` that replicates the sample code for `B` iterations and sums the outcomes.
S <- replicate(B, {data <- sample(c(17, -1), n, replace = TRUE, prob = c(p_green, p_not_green))
sum(data)
})
S
# Compute the average value for 'S'
mean(S)
# Calculate the standard deviation of 'S'
sd(S)

#3. American Roulette Monte Carlo vs CLT
# Calculate the proportion of outcomes in the vector `S` that exceed $0
mean(S > 0)
#4. American Roulette average winnings per bet
# Use the `set.seed` function to make sure your answer matches the expected result after random sampling.
set.seed(1)
# Define the number of bets using the variable 'n'
n <- 10000
# Assign a variable `p_green` as the probability of the ball landing in a green pocket
p_green <- 2 / 38
# Assign a variable `p_not_green` as the probability of the ball not landing in a green pocket
p_not_green <- 1 - p_green
# Create a vector called `X` that contains the outcomes of `n` bets
X <- sample(c(-1, 17), n, replace = TRUE, prob = c(p_not_green , p_green))
# Define a variable `Y` that contains the mean outcome per bet. Print this mean to the console.
Y <- mean(X) 
Y

#5. American Roulette per bet expected value
# Assign a variable `p_green` as the probability of the ball landing in a green pocket
p_green <- 2 / 38
# Assign a variable `p_not_green` as the probability of the ball not landing in a green pocket
p_not_green <- 1 - p_green
# Calculate the expected outcome of `Y`, the mean outcome per bet in 10,000 bets
x<- c(-1,17)
px<- c(p_not_green, p_green)
sum(x * px)

#6. American Roulette per bet standard error
# Define the number of bets using the variable 'n'
n <- 10000
# Assign a variable `p_green` as the probability of the ball landing in a green pocket
p_green <- 2 / 38
# Assign a variable `p_not_green` as the probability of the ball not landing in a green pocket
p_not_green <- 1 - p_green
# Compute the standard error of 'Y', the mean outcome per bet from 10,000 bets.
sqrt(n) * abs(17 - -1)*sqrt(p_green*p_not_green)/n

#6. American Roulette winnings per game are positive
# We defined the average using the following code
avg <- 17*p_green + -1*p_not_green
# We defined standard error using this equation
se <- 1/sqrt(n) * (17 - -1)*sqrt(p_green*p_not_green)
# Given this average and standard error, determine the probability of winning more than $0. Print the result to the console.
1 - pnorm(0,avg, se)

#7. American Roulette Monte Carlo again
# The variable `n` specifies the number of independent bets on green
n <- 10000
# The variable `B` specifies the number of times we want the simulation to run
B <- 10000
# Use the `set.seed` function to make sure your answer matches the expected result after random number generation
set.seed(1)
# Generate a vector `S` that contains the the average outcomes of 10,000 bets modeled 10,000 times
S<- replicate(B, { data <- sample(c(-1, 17), n, replace = TRUE, prob = c(p_not_green , p_green))
mean(data)
})
# Compute the average of `S`
mean(S)
# Compute the standard deviation of `S`
sd(S)

#8. American Roulette comparison
# Compute the proportion of outcomes in the vector 'S' where you won more than $0
mean(S>0)

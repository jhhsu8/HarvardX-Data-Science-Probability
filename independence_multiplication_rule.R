#Independence and Multiplication Rule

#1. Sampling with replacement

cyan <- 3
magenta <- 5
yellow <- 7

# Assign the variable 'p_yellow' as the probability that a yellow ball is drawn from the box.
p_yellow = yellow / (yellow + cyan + magenta)

# Using the variable 'p_yellow', calculate the probability of drawing a yellow ball on the sixth draw. Print this value to the console.
p_yellow

#2. Rolling a die

# Assign the variable 'p_no6' as the probability of not seeing a 6 on a single roll.
p_no6  = 5/6

# Calculate the probability of not seeing a 6 on six rolls using `p_no6`. Print your result to the console: do not assign it to a variable.
(5/6)**6

#3. Probability the Celtics win a game

# Assign the variable `p_cavs_win4` as the probability that the Cavs will win the first four games of the series.
p_cavs_win4 = (0.6)**4
p_cavs_win4

# Using the variable `p_cavs_win4`, calculate the probability that the Celtics win at least one game in the first four games of the series.
1- p_cavs_win4

#4. Monte Carlo simulation for Celtics winning a game

# This line of example code simulates four independent random games where the Celtics either lose or win. Copy this example code to use within the `replicate` function.
simulated_games <- sample(c("lose","win"), 4, replace = TRUE, prob = c(0.6, 0.4))

# The variable 'B' specifies the number of times we want the simulation to run. Let's run the Monte Carlo simulation 10,000 times.
B <- 10000

# Use the `set.seed` function to make sure your answer matches the expected result after random sampling.
set.seed(1)

# Create an object called `celtic_wins` that replicates two steps for B iterations: (1) generating a random four-game series `simulated_games` using the example code, then (2) determining whether the simulated series contains at least one win for the Celtics.
celtic_wins <- replicate(B, {simulated_games<-sample(c("lose","win"), 4, replace = TRUE, prob = c(0.6, 0.4))
any("win" %in% simulated_games)
})

# Calculate the frequency out of B iterations that the Celtics won at least one game. Print your answer to the console.
  mean(celtic_wins)

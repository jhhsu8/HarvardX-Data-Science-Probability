#Continuous Probability

#1. Distribution of female heights - 1

# Assign a variable 'female_avg' as the average female height.
female_avg <- 64

# Assign a variable 'female_sd' as the standard deviation for female heights.
female_sd <- 3

# Using variables 'female_avg' and 'female_sd', calculate the probability that a randomly selected female is shorter than 5 feet. Print this value to the console.
pnorm(60, 64, 3)


#2. Distribution of female heights - 2

# Assign a variable 'female_avg' as the average female height.
female_avg <- 64

# Assign a variable 'female_sd' as the standard deviation for female heights.
female_sd <- 3

1-pnorm(72,64,3)

#3. Distribution of female heights - 3

# Assign a variable 'female_avg' as the average female height.
female_avg <- 64

# Assign a variable 'female_sd' as the standard deviation for female heights.
female_sd <- 3

# Using variables 'female_avg' and 'female_sd', calculate the probability that a randomly selected female is between the desired height range. Print this value to the console.

pnorm(67,64,3)-pnorm(61,64,3)


#3. Distribution of female heights - 4

# Assign a variable 'female_avg' as the average female height. Convert this value to centimeters.
female_avg <- 64*2.54

# Assign a variable 'female_sd' as the standard deviation for female heights. Convert this value to centimeters.
female_sd <- 3*2.54

# Using variables 'female_avg' and 'female_sd', calculate the probability that a randomly selected female is between the desired height range. Print this value to the console.
pnorm(67*2.54,female_avg,female_sd)-pnorm(61*2.54,female_avg,female_sd)

Probability of 1 SD from average

# Assign a variable 'female_avg' as the average female height.
female_avg <- 64

# Assign a variable 'female_sd' as the standard deviation for female heights.
female_sd <- 3

# To a variable named 'taller', assign the value of a height that is one SD taller than average.

taller <- female_avg + female_sd
# To a variable named 'shorter', assign the value of a height that is one SD shorter than average.
shorter <- female_avg - female_sd

# Calculate the probability that a randomly selected female is between the desired height range. Print this value to the console.
pnorm(taller,female_avg,female_sd)-pnorm(shorter,female_avg,female_sd)

#4. Distribution of male heights

# Assign a variable 'male_avg' as the average male height.
male_avg <- 69

# Assign a variable 'male_sd' as the standard deviation for male heights.
male_sd <- 3

# Determine the height of a man in the 99th percentile of the distribution.
qnorm(0.99,male_avg,sd=3)

#5. Distribution of IQ scores

# The variable `B` specifies the number of times we want the simulation to run.
B <- 1000

# Use the `set.seed` function to make sure your answer matches the expected result after random number generation.
set.seed(1)

# Create an object called `highestIQ` that contains the highest IQ score from each random distribution of 10,000 people.
B <- 1000
highestIQ <- replicate(B, {
    simulated_data <- rnorm(10000, 100, 15)    # generate 800 normally distributed random heights
    max(simulated_data)    # determine the tallest height 
})

highestIQ

# Make a histogram of the highest IQ scores.
hist(highestIQ)

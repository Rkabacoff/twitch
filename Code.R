## Modern Data Visualization with R
## Rob Kabacoff, Ph.D. Wesleyan University

# install.packages("ggplot2")

library(ggplot2)

# import data
url <- "https://bit.ly/3bsMwsS"
Salaries <- read.csv(url)

# review data
str(Salaries)
summary(Salaries)

# simple bar plot
ggplot(data=Salaries, aes(x=rank)) + 
  geom_bar()

# stacked bar plot
ggplot(data=Salaries, aes(x=rank, fill=sex)) + 
  geom_bar()

# grouped bar plot
ggplot(data=Salaries, aes(x=rank, fill=sex)) + 
  geom_bar(position="dodge")

# filled bar plot
ggplot(data=Salaries, aes(x=rank, fill=sex)) + 
  geom_bar(position="fill")


# histogram
ggplot(data=Salaries, aes(x=salary)) + 
  geom_histogram()


# frequency polygon
ggplot(data=Salaries, aes(x=salary)) + 
  geom_freqpoly()

# grouped frequency polygons
ggplot(data=Salaries, aes(x=salary, color=rank)) + 
  geom_freqpoly(size=2)

# kernal density plot
ggplot(data=Salaries, aes(x=salary)) + 
  geom_density(fill="red")

# grouped kernal density plot
ggplot(data=Salaries, aes(x=salary, fill=rank)) + 
  geom_density(alpha=.3)

# boxplot
ggplot(data=Salaries, aes(x=rank, y=salary)) + 
  geom_boxplot()


# cleveland dot plot
df <- mtcars
df$cars <- row.names(df)
ggplot(data=df, aes(x=mpg, y=cars, mpg)) + 
  geom_point()

ggplot(data=df, aes(x=mpg, y=reorder(cars, mpg))) + 
  geom_point()

# strip plot
ggplot(data=Salaries, aes(x=salary, y=rank)) +
  geom_point()

# jittered strip plot
ggplot(data=Salaries, aes(x=salary, y=rank, color=rank)) + 
  geom_jitter() +
  theme(legend.position="none")


# scatter plot
ggplot(data=Salaries, aes(x=yrs.since.phd, y=salary)) + 
  geom_point()

# scatter plot with fit
ggplot(data=Salaries, aes(x=yrs.since.phd, y=salary)) + 
  geom_point() + 
  geom_smooth()

# scatter plot with line of best fit
ggplot(data=Salaries, aes(x=yrs.since.phd, y=salary)) + 
  geom_point() + 
  geom_smooth(method="lm", formula=y~x)

# grouping
ggplot(data=Salaries, aes(x=yrs.since.phd, y=salary, 
                          color=rank)) + 
  geom_point()

ggplot(data=Salaries, aes(x=yrs.since.phd, y=salary, 
                          color=rank, shape=sex)) + 
  geom_point()

# facets
ggplot(data=Salaries, aes(x=yrs.since.phd, y=salary)) + 
  geom_point() + 
  facet_grid(. ~ sex)

# line charts
ggplot(economics, aes(date, unemploy)) + geom_line()

ggplot(economics, aes(date, unemploy)) + 
  geom_line(linetype="dotted", color="blue", size=1)

ggplot(data=Salaries, aes(x=yrs.since.phd, y=salary)) + 
  geom_point() + 
  facet_grid(sex ~ rank)

# scales
ggplot(mtcars, aes(x=wt, y=mpg)) + geom_point() +
  scale_x_continuous(breaks=seq(1,6,1), limits=c(1, 6)) +
  scale_y_continuous(breaks=seq(5, 35, 5),limits=c(5,35))

ggplot(Salaries, aes(x=rank)) + geom_bar() +
  scale_x_discrete(limits = c("Prof", "AsstProf", "AssocProf"))

ggplot(Salaries, aes(x=rank)) + geom_bar() +
  scale_x_discrete(limits = c("Prof", "AsstProf", "AssocProf"),
                   labels = c("Full\nProfessor", "Assistant\nProfessor" ,                
                              "Associate\nProfessor"))

# colors/fills
ggplot(Salaries, aes(x=rank, fill=rank)) + geom_bar() +
  scale_fill_manual(values=c("red", "green", "blue"))

ggplot(Salaries, aes(x=rank, fill=rank)) + geom_bar() +
  scale_fill_brewer()

ggplot(Salaries, aes(x=rank, fill=rank)) + geom_bar() +
  scale_fill_brewer(palette = "Set1")

# annotations
ggplot(data=mtcars, aes(x=wt, y=mpg, color=factor(am))) + 
  geom_point(size=2) +
  labs(title="Relationship of Auto Weight to Mileage", 
       subtitle="By Auto Transmission Type",
       caption = "Data from Motor Trend Magazine 1974",
       x = "Weight in Thousand Pounds", 
       y="Miles Per Gallon",
       color = "Transmission Type")

ggplot(data=mtcars, aes(x=wt, y=mpg)) + geom_point() +
  geom_hline(yintercept=20, color="red") +
  annotate("text", x=5, y=21, label="Average Mileage", color="red")  








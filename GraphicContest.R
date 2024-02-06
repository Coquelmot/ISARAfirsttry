install.packages("tidyverse")
install.packages('tinytex')                 
tinytex::install_tinytex()

library(tinytex)

data("cars")
names(cars)
cars
ggplot(data = cars, aes(x = cars[,1], y = cars[,2])) +
geom_point(color = "red") +
labs(title = "Distance d'arrêt en fonction de la vitesse",
     x = "Vitesse",
     y = "Distance d'arrêt") +
  geom_smooth(method = "lm") +
  scale_color_discrete(palette = "Set1") +
  theme_minimal() +
  theme(plot.title = element_text(face = "bold",color = "blue"))



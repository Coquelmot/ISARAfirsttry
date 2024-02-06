##On définit la working directory
setwd("C:/Users/remli/Documents/Perso/Cours/4A/OPEN")

##Installation des packages
#install.packages("tidyverse")

#install.packages('tinytex')
#tinytex::install_tinytex()

#install.packages("devtools")
#devtools::install_github("r-lib/conflicted")

#install.packages("palmerpenguins")
#install.packages("ggthemes")

##Pour clean les values
#rm(list = ls()) 

#Pour lancer les packages à utiliser
library(tidyverse); library(tinytex); library(conflicted); library(palmerpenguins); library(ggthemes)

penguins<-palmerpenguins::penguins
view(penguins)

ggplot(data = penguins,
       mapping = aes(x = flipper_length_mm, y = body_mass_g)) +
  geom_point(aes(color = species, shape = species)) +
  geom_smooth(method = "lm") +
  labs(
    title = "Body mass and flipper length",
    subtitle = "Dimensions for Adelie, Chinstrap, and Gentoo Penguins",
    x = "Flipper length (mm)", y = "Body mass (g)",
    color = "Species", shape = "Species") +
  scale_color_colorblind()

# #Exercices

#     1.
# How many rows are in penguins? How many columns?

#    344 rows & 8 columns

#     2.
# What does the bill_depth_mm variable in the penguins data frame describe?
# Read the help for ?penguins to find out.

# bill_depth_mm = un nombre indiquant la longueur du bec (en millimètres)

#     3.
# Make a scatterplot of bill_depth_mm vs. bill_length_mm.
# That is, make a scatterplot with bill_depth_mm on the y-axis and bill_length_mm on the x-axis.
# Describe the relationship between these two variables.

ggplot(
  data = penguins,
  mapping = aes(x = flipper_length_mm, y = body_mass_g)) +
  geom_point(aes(color = species, shape = species)) +
  geom_smooth(method = "lm") +
  labs(
    title = "Bill depth and bill lenght",
    subtitle = "Dimensions for Adelie, Chinstrap, and Gentoo Penguins",
    x = "Bill depth (mm)", y = "Bill lenght (g)",
    color = "Species", shape = "Species") +
  scale_color_colorblind()

#La profondeur du bec influt sur sa largueur, les 2 valeurs sont codépendantes

#     4.
# What happens if you make a scatterplot of species vs. bill_depth_mm?
# What might be a better choice of geom?

# ggplot(
#   data = penguins,
#   mapping = aes(x = species, y = body_mass_g)) +
#   geom_point(aes(color = species, shape = species)) +
#   geom_smooth(method = "lm") +
#   labs(
#     title = "Species and bill lenght",
#     subtitle = "Dimensions for Adelie, Chinstrap, and Gentoo Penguins",
#     x = "Species", y = "Bill lenght (g)",
#     color = "Species", shape = "Species") +
#   scale_color_colorblind()

# On créé des lignes, ce n'est pas exploitable

ggplot(
  data = penguins,
  mapping = aes(x = species, y = body_mass_g)) +
  geom_line(aes(color = species)) +
  labs(
    title = "Species and bill lenght",
    subtitle = "Dimensions for Adelie, Chinstrap, and Gentoo Penguins",
    x = "Species", y = "Bill lenght (g)",
    color = "Species", shape = "Species") +
  scale_color_colorblind()

#geom_line semble être plus pertinent dans ce cas

#     5.  
# Why does the following give an error and how would you fix it?

# ggplot(data = penguins) + 
#   geom_point()

# Erreur parce qu'on ne défini pas x & y, il faut ajouter :
#   mapping = aes(x = "insérer une variable" , y = "insérer une variable"))


# What does the na.rm argument do in geom_point()?
# What is the default value of the argument?
# Create a scatterplot where you successfully use this argument set to TRUE.
# 
# Add the following caption to the plot you made in the previous exercise:
# “Data come from the palmerpenguins package.”
# Hint: Take a look at the documentation for labs().
# 
# Recreate the following visualization. What aesthetic should bill_depth_mm be mapped to?
#   And should it be mapped at the global level or at the geom level?

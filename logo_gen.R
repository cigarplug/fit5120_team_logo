library(ggplot2)

road <- function(x) {
  sin(x * 1.5 )
}

dots <- data.frame(x = c(-1, 1), y = c(-0.4, 0.4))

border_up <- data.frame(x = c(-3, 0, 3), y = c(0, 2, 0))
border_down <- data.frame(x = c(-3, 0, 3), y = c(0, -2, 0))

upper_line <-  function(q) 2/3*q + 2

lower_line <- function(q) 2/3*q - 2

# remotes::install_github("andrewheiss/reconPlots")
intersect_up <- reconPlots::curve_intersect(upper_line, road, empirical = F, domain = c(-3, 0))
intersect_down <- reconPlots::curve_intersect(lower_line, road, empirical = F, domain = c(0, 3))

ggplot() +
  stat_function(data = data.frame(x = c(-2, 2)), 
                mapping = aes(x),
                fun = road,
                size = 7, xlim = c(intersect_up$x, intersect_down$x)
                ) +
  geom_point(data = dots, aes(x = x, y = y), colour = "red", size = 8) +
  geom_line(data = border_up, aes(x = x, y = y), colour = "blue", size = 2)  +
  geom_line(data = border_down, aes(x = x, y = y), colour = "blue", size = 2) 

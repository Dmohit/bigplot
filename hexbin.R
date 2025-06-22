install.packages(c('hexbin', 'RColorBrewer', 'scales', 'ggplot2'))

library(hexbin)
library(RColorBrewer)
library(ggplot2)
library(scales)
library(grid)

data(diamonds)

##Add transparency
plot(y = diamonds$price, x = diamonds$carat, col = alpha(1, 0.07))

my_colors0 = colorRampPalette(rev(brewer.pal(11, 'Spectral')))
my_colors1 = colorRampPalette(brewer.pal(4, 'Blues'))
my_colors2 = colorRampPalette(brewer.pal(4, 'YlGnBu'))

myhex0 = hexbin(y = diamonds$price, x = diamonds$carat,
                xbnds = c(-0.5, 5.5), ybnds = c(270, 19050))

#plot(diamonds$price ~ diamonds$carat)
plot(myhex0, colramp = my_colors0)

myhex1 = hexbin(y = log(diamonds$price,2), x = diamonds$carat,
                xbnds = c(-0.5, 5.5), ybnds = c(8, 14.5))
plot(myhex1, colramp = my_colors0)
plot(myhex1, colramp = my_colors1)
plot(myhex1, colramp = my_colors2)

myhex2 = hexbin(y = log(diamonds$price,2), x = log(diamonds$carat,2),
                xbnds = c(-2.5, 2.5), ybnds = c(8, 14.5))
plot(myhex2, colramp = my_colors1)

# calculate lm predictions
lprice <- log(diamonds$price, 2)
lcart <- log(diamonds$carat, 2)
lm <- lm(lprice ~ lcart)

xp = seq(min(lcart), max(lcart) * 0.58, length=200)
yp = predict(lm, data.frame(lcart = xp))

p <- plot(myhex2, colramp = my_colors1)

# add lm line
pushHexport(p$plot.vp)
grid.lines(xp, yp, gp=gpar(col="red", lwd = 2.1, lty = 'dashed'), default.units = "native")
upViewport()

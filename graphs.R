png('Basic.png', 850, 850)
par(cex = 1.8)
plot(y = diamonds$price, x = diamonds$carat,
    main = 'Diamonds: Price vs Weight',
    xlab = 'Weight in Carats', ylab = "Price in USD",
    cex.lab = 1.25, cex.main = 1.5, cex = 1.6, col = 'steelblue')
dev.off()

png('Transparent.png', 850, 850)
par(cex = 1.8)
plot(y = diamonds$price, x = diamonds$carat,
    main = 'Diamonds: Price vs Weight',
    xlab = 'Weight in Carats', ylab = "Price in USD",
    cex.lab = 1.25, cex.main = 1.5, cex = 1.6,
    col = alpha('steelblue', 0.03))
dev.off()

myhex0 = hexbin(y = diamonds$price, x = diamonds$carat,
                xbnds = c(-0.5, 5.5), ybnds = c(270, 19050))

png('BasicHex.png', 850, 850)
par(cex = 1.8)
plot(myhex0, colramp = my_colors0,
    main = 'Diamonds: Price vs Weight',
    xlab = 'Weight in Carats', ylab = "Price in USD")
    #gp = gpar(cex = 1.25))# cex.main = 1.5, cex = 1.6))
dev.off()

png('BetterHex.png', 850, 850)
par(cex = 1.8)
plot(myhex1, colramp = my_colors1,
    main = 'Diamonds: Price vs Weight',
    xlab = 'Log Weight in Carats', ylab = "Price in USD")
    #gp = gpar(cex = 1.25))# cex.main = 1.5, cex = 1.6))
dev.off()

png('BestHex.png', 850, 850)
par(cex = 1.8)
plot(myhex2, colramp = my_colors1,
    main = 'Diamonds: Price vs Weight',
    xlab = 'Log Weight in Carats', ylab = "Log Price in USD")
    #gp = gpar(cex = 1.25))# cex.main = 1.5, cex = 1.6))
dev.off()

png('SmoothedHex.png', 850, 850)
par(cex = 1.8)
p <- plot(myhex2, colramp = my_colors1,
    main = 'Diamonds: Price vs Weight',
    xlab = 'Log Weight in Carats', ylab = "Log Price in USD")
# add lm line
pushHexport(p$plot.vp)
grid.lines(xp, yp, gp=gpar(col="red", lwd = 2.1, lty = 'dashed'), default.units = "native")
upViewport()
dev.off()

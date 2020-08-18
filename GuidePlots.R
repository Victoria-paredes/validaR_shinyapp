library(ggplot2)
savepdf <- function(p, name, h = 7/1.5, w = 9/1.5, res = NULL) {
  pdf(paste0(name, '.pdf'), height = h, width = w)
  print(p)
  dev.off()
}

##LITHIUM AAS DATA 19-05-21 - UNAM
cStock <- 129.5 * 0.187872 * 0.99 / 0.1200962
Std7   <- cStock * 0.7495 / 60.1995

LithiumF  <- data.frame(Conc = c(0.0000, 0.4725, 1.2025, 2.4371, 4.8029, 9.6060) * Std7 /
                          c(12.0000, 11.8008, 12.0137, 11.9934, 11.9848, 12.0406),
                        Signal = c(0.000, 0.019, 0.046, 0.095, 0.188, 0.364))

LiF <- ggplot(data = LithiumF, aes(x = Conc, y = Signal)) +
  theme_bw() + geom_point(size = 3, shape = 16)  +
  labs(y = 'Absorbancia (UA)', x = expression(paste('Concentración (mg k', g^{-1}, ')'))) +
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
        axis.text.x = element_text(color = "black"),
        axis.text.y = element_text(color = "black")) +
  scale_y_continuous(labels = function(x) sprintf("%.2f", x), breaks = seq(0, .37, .07)) +
  scale_x_continuous(limits = c(-1, 3), labels = function(x) sprintf("%.2f", x), breaks = seq(0, 2, .4)) +
  coord_cartesian(xlim = c(0, 2), ylim = c(0, 0.37)) +
  geom_smooth(method = 'lm', formula = y ~ x, fullrange = TRUE, color = 'black', size = 0.4, level = 0.999) +
  geom_segment(aes(x = -1, y = 0.285, xend = 1.627, yend = 0.285), size = 0.3, linetype = "dashed") +
  geom_segment(aes(x = 1.627, y = -1, xend = 1.627, yend = 0.285), size = 0.3, linetype = "dotted") +
  geom_segment(aes(x = 1.48, y = -1, xend = 1.48, yend = 0.285), size = 0.3, linetype = "dotted")  +
  geom_segment(aes(x = 1.55, y = -1, xend = 1.55, yend = 0.285), size = 0.3, linetype = "dashed") +
  geom_segment(aes(x = 1.48, y = 0, xend = 1.627, yend = 0), size = 0.3,
               arrow = arrow(ends = 'both', length = unit(x = 7, units = 'pt')))

print(LiF)

savepdf(LiF, name = 'diagrCalibLi999', h = 5, w = 6)


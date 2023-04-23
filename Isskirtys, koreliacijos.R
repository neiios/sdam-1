c <- c('Austria',
       'Belgium',
       'Bulgaria',
       'Croatia',
       'Cyprus',
       'Czechia',
       'Denmark',
       'Estonia',
       'Finland',
       'France',
       'Germany',
       'Greece',
       'Hungary',
       'Iceland',
       'Ireland',
       'Italy',
       'Latvia',
       'Lithuania',
       'Luxembourg',
       'Malta',
       'Netherlands',
       'Norway',
       'Poland',
       'Portugal',
       'Romania',
       'Slovakia',
       'Slovenia',
       'Spain',
       'Sweden',
       'Switzerland',
       'UK'
)
y1 <- c(7.3,
        8.6,
        12.7,
        3.3,
        7.8,
        6.2,
        10.4,
        11.3,
        8.3,
        8.7,
        10.3,
        4.7,
        12.5,
        21.5,
        5.0,
        14.5,
        8.3,
        4.6,
        6.3,
        17.4,
        7.3,
        9.9,
        4.8,
        11.8,
        16.4,
        8.6,
        4.2,
        17.9,
        7.5,
        4.4,
        10.7
)
y2 <- c(40.7,
        47.6,
        33.7,
        34.1,
        57.1,
        33.7,
        48.7,
        47.2,
        44.2,
        46.2,
        34.9,
        44.3,
        33.7,
        51.7,
        56.3,
        27.8,
        42.7,
        57.6,
        56.2,
        34.7,
        49.4,
        50.6,
        45.7,
        33.5,
        24.6,
        37.7,
        42.7,
        42.4,
        51.8,
        55.0,
        48.8
)
y3 <- c(96.0,
        98.5,
        82.4,
        81.0,
        95.3,
        91.5,
        100.0,
        92.8,
        89.3,
        100.0,
        96.0,
        75.2,
        95.7,
        97.4,
        100.0,
        94.9,
        96.0,
        91.0,
        96.1,
        95.3,
        96.9,
        97.5,
        93.0,
        93.7,
        86.3,
        82.2,
        93.1,
        98.0,
        95.9,
        73.6,
        100.0
)
y4 <- c(88.6,
        83.4,
        78.6,
        71.2,
        78.9,
        89.6,
        84.7,
        81.7,
        81.7,
        77.9,
        92.1,
        55.3,
        87.5,
        94.4,
        84.3,
        56.5,
        84.1,
        84.7,
        87.9,
        94.8,
        92.0,
        90.9,
        83.1,
        80.6,
        77.4,
        83.4,
        84.2,
        75.4,
        88.1,
        88.3,
        86.7
)
y5 <- c(15.1,
        8.5,
        2.5,
        2.9,
        6.7,
        8.5,
        23.5,
        19.7,
        28.5,
        18.6,
        8.2,
        4.5,
        6.0,
        21.5,
        12.5,
        8.1,
        6.7,
        6.6,
        18.0,
        10.9,
        19.1,
        19.7,
        5.7,
        10.3,
        0.9,
        4.0,
        11.4,
        10.5,
        31.4,
        31.6,
        14.6
)
y6 <- c(22.2,
        20.3,
        46.0,
        26.1,
        39.9,
        20.0,
        16.4,
        10.0,
        13.8,
        20.9,
        20.5,
        32.7,
        25.0,
        24.0,
        14.8,
        24.3,
        19.4,
        24.1,
        27.8,
        33.2,
        20.0,
        20.0,
        14.4,
        21.0,
        43.8,
        28.6,
        16.3,
        23.0,
        18.7,
        20.2,
        18.0
)
lentele <- data.frame(country = c, y1 = y1, y2 = y2, y3 = y3, y4 = y4, y5 = y5, y6 = y6)
print(lentele)

names = c('Y1', 'Y2', 'Y3', 'Y4', 'Y5', 'Y6')

boxplot(
  y1, y2, y3, y4, y5, y6, 
  names = names,
  ylab = 'Percentage %',
  main = 'Outliers'
)

legend("topleft", c('Y1 - Early leavers from education and training','Y2 - Tertiary educational attainment','Y3 - Early childhood education and care','Y4 - Employment rates of recent graduates', 'Y5 - Adult participation in learning', 'Y6 - Underachievement in reading, mathematics and science'), cex=0.718, bty='n', x.intersp = 0)

b1 <- boxplot.stats(y1)$out
b3 <- boxplot.stats(y3)$out
b4 <- boxplot.stats(y4)$out
b6 <- boxplot.stats(y6)$out

lentele[lentele$y1 %in% b1,]
lentele[lentele$y3 %in% b3,]
lentele[lentele$y4 %in% b4,]
lentele[lentele$y6 %in% b6,]

y1_clean = y1[-which(y1%in% b1)]
y3_clean = y3[-which(y3%in% b3)]
y4_clean = y4[-which(y4%in% b4)]
y6_clean = y6[-which(y6%in% b6)]

boxplot(
  y1_clean, y2, y3_clean, y4_clean, y5, y6_clean, 
  names = names,
  ylab = 'Percentage %',
  main = 'Outliers 2'
)

legend("topleft", c('Y1 - Early leavers from education and training','Y2 - Tertiary educational attainment','Y3 - Early childhood education and care','Y4 - Employment rates of recent graduates', 'Y5 - Adult participation in learning', 'Y6 - Underachievement in reading, mathematics and science'), cex=0.718, bty='n', x.intersp = 0)

#y1_clean
mean(y1_clean)
median(y1_clean)
var(y1_clean)
sd(y1_clean)
min(y1_clean)
max(y1_clean)
quantile(y1_clean, probs=0.25) 

#y3_clean
mean(y3_clean);
median(y3_clean);
var(y3_clean);
sd(y3_clean);
min(y3_clean);
max(y3_clean);
quantile(y3_clean, probs=0.25);

#y4_clean
mean(y4_clean);
median(y4_clean);
var(y4_clean);
sd(y4_clean);
min(y4_clean);
max(y4_clean);
quantile(y4_clean, probs=0.25);

#y6_clean
mean(y6_clean);
median(y6_clean);
var(y6_clean);
sd(y6_clean);
min(y6_clean);
max(y6_clean);
quantile(y6_clean, probs=0.25);

bb3 <- boxplot.stats(y3_clean)$out
bb4 <- boxplot.stats(y4_clean)$out
bb6 <- boxplot.stats(y6_clean)$out

lentele[lentele$y3 %in% bb3,]
lentele[lentele$y4 %in% bb4,]
lentele[lentele$y6 %in% bb6,]

y3_cclean = y3_clean[-which(y3_clean%in% bb3)]
y4_cclean = y4_clean[-which(y4_clean%in% bb4)]
y6_cclean = y6_clean[-which(y6_clean%in% bb6)]

boxplot(
  y1_clean, y2, y3_cclean, y4_cclean, y5, y6_cclean, 
  names = names,
  ylab = 'Percentage %',
  main = 'Outliers 3'
)

legend("topleft", c('Y1 - Early leavers from education and training','Y2 - Tertiary educational attainment','Y3 - Early childhood education and care','Y4 - Employment rates of recent graduates', 'Y5 - Adult participation in learning', 'Y6 - Underachievement in reading, mathematics and science'), cex=0.718, bty='n', x.intersp = 0)

bbb6 <- boxplot.stats(y6_cclean)$out
y6_ccclean = y6_cclean[-which(y6_cclean%in% bbb6)]

boxplot(
  y1_clean, y2, y3_cclean, y4_cclean, y5, y6_ccclean, 
  names = names,
  ylab = 'Percentage %',
  main = 'Outliers 4'
)

legend("topleft", c('Y1 - Early leavers from education and training','Y2 - Tertiary educational attainment','Y3 - Early childhood education and care','Y4 - Employment rates of recent graduates', 'Y5 - Adult participation in learning', 'Y6 - Underachievement in reading, mathematics and science'), cex=0.718, bty='n', x.intersp = 0)

lentele[lentele$y6 %in% bbb6,]

cor.test(lentele$y1, lentele$y2)
cor.test(lentele$y1, lentele$y3)
cor.test(lentele$y1, lentele$y4)
cor.test(lentele$y1, lentele$y5)
cor.test(lentele$y1, lentele$y6)

cor.test(lentele$y2, lentele$y3)
cor.test(lentele$y2, lentele$y4)
cor.test(lentele$y2, lentele$y5)
cor.test(lentele$y2, lentele$y6)

cor.test(lentele$y3, lentele$y4)
cor.test(lentele$y3, lentele$y5)
cor.test(lentele$y3, lentele$y6)

cor.test(lentele$y4, lentele$y5)
cor.test(lentele$y4, lentele$y6)

cor.test(lentele$y5, lentele$y6)



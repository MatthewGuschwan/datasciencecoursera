WAR App Presentation
========================================================
author: Matthew Guschwan
date: November 21, 2015

First Slide
========================================================

How can you compare the effectiveness of Major League 
Baseball Player?  Hitters vs. Pitchers?  Speedsters vs. 
Sluggers?  

- Home Runs?
- Runs Scored?
- Earned Run Average?



========================================================

Wins Against Replacement is a statistic that compares
the contribution that any player makes on the field.  
It does so by considering how that player performs 
relative to a hypothetical replacement player.

Details about WAR can be found at www.baseball-
reference.com

====


Take Bryce Harper, for example.  His WAR in 2013 was 3.7, 2014 was 1.0 and 2015 was 9.9.




```r
Harper13  <- 3.7
Harper14 <- 1.0
Harper15 <- 9.9

ThreeYAv  <- ((Harper13+Harper14+Harper15)/3)
ThreeYAv
```

```
[1] 4.866667
```


========================================================
Are you an optimist or pessimist?

If optimist

```
[1] 5.353333
```
If pessimist

```r
pessimist  <- ThreeYAv - .1*ThreeYAv
pessimist
```

```
[1] 4.38
```



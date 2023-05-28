library("QRM")
US200 <- read.csv(file='~\\Code\\Risk Mgt\\Week 4B - 200 largest US cities\\csvData.csv')
colnames(US200)
head(US200)

u1 <- 1*US200[180,4] # lower limit on pop is the 180th city entry in descending order (0.9 percentile)
u2 <- 2*u1
MEplot(US200$pop2022)
abline(v=c(u1,u2))

mod.u1=fit.GPD(US200$pop2022,threshold=u1)
mod.u2=fit.GPD(US200$pop2022,threshold=u2)

xi.u1=as.numeric(mod.u1$par.ests[1])
beta.u1=as.numeric(mod.u1$par.ests[2])

xi.u2=as.numeric(mod.u2$par.ests[1])
beta.u2=as.numeric(mod.u1$par.ests[2])

xip <- xiplot(US200$pop2022, models=50, start=mod.u2$n.exceed, end=mod.u1$n.exceed, reverse=TRUE)
abline(h=0.5,lty=3) # models above line have infinite variance
abline(h=1, lty=4) # models above line have infinite mean

RiskMeasures(mod.u1, p=c(0.99,0.995))
RiskMeasures(mod.u2, p=c(0.99,0.995))

qf.u1 <- function(p)
  qGPD(p,xi.u1,beta.u1)

excess.u1 <- sort(US200$pop2022[US200$pop2022>u1]-u1)
N=mod.u1$n.exceed

xi.mean <- mean(xip$y)
theta <- 1/xi.mean

xi.mean
theta

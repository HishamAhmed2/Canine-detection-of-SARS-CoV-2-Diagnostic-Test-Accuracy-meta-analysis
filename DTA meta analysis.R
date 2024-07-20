
rm(list = ls()) # remove all objects that have been generated before

install.packages('mada')

install.packages('mvtnorm')

install.packages('ellipse')

install.packages('mvmeta')

install.packages('meta')

install.packages('metafor')

install.packages('rmeta')

install.packages("lme4")

library(meta)


dta_shim <- data.frame(
  Id = c("Hag Ali 2021", "Grandjean 2022", "Kantele 2022", "ten Hagen 2022", "Guest 2022", "Jendrny 2021"),
  TP = c(15, 106, 392, 43, 957, 723),
  FN = c(3, 3, 35, 7, 190, 231),
  FP = c(26, 20, 75, 5, 172, 214),
  TN = c(3246, 206, 807, 65, 942, 4140))

#calcaulte sensitivity total effect size
sensitivity_logit <- metaprop(dta_shim$TP, dta_shim$TP+ dta_shim$FN, comb.fixed=FALSE, comb.random=TRUE, sm='Plogit', 
                              method.ci='CP', studlab=dta_shim$id)

print(sensitivity_logit, digits=3)

#forest plot
forest(sensitivity_logit, digits=3, rightcols=c('effect', 'ci'), xlab='Sensitivity')

#specificty
specificity_logit <- metaprop(dta_shim$TN, dta_shim$TN+ dta_shim$FP, comb.fixed=FALSE, comb.random=TRUE, sm='Plogit', 
                              method.ci='CP', studlab=dta_shim$id)

print(specificity_logit, digits=3)

#forest plot
forest(specificity_logit, digits=3, rightcols=c('effect', 'ci'), xlab='Specificity')

#odds ratio
DOR_model <- metabin(TP,TP+FP,FN,FN+TN, sm='OR', comb.fixed=FALSE,comb.random=TRUE, 
                     method='Inverse' ,dta_shim$id, data=dta_shim)
print(DOR_model)

forest(DOR_model, digits=3, rightcols=c('effect', 'ci'), xlab ='Diagnostic Odds Ratio')

#remove meta
detach(package:meta)

library(mada)

fit <- reitsma(dta_shim, correction.control='single')
summary(fit)

#SROC curve

plot(fit, sroclwd=2, xlim=c(0,1), ylim=c(0,1), main="SROC curve (bivariate model) for Diagnostic Test Accuracy" )
points(fpr(dta_shim), sens(dta_shim), pch=2)
legend("bottomleft", c("SROC", '95% CI region'), lwd=c(2,1))
text(0.8, 0.7, paste("AUC =", round(0.952, 3)), cex = 0.6, col = "black")
text(0.8, 0.65, paste("DOR =", round(227.207, 2)), cex = 0.6, col = "black")
text(0.8, 0.6, paste("Sensitivity =", round(0.869, 2)), cex = 0.6, col = "black")
text(0.8, 0.55, paste("Specificity =", round(0.971, 2)), cex = 0.6, col = "black")


#correlation between sensitivity and specificity
dta_shim$sn <- dta_shim$TP/(dta_shim$TP+dta_shim$FN)
dta_shim$sp <- dta_shim$TN/(dta_shim$FP+dta_shim$TN)
dta_shim$logitsn <- log(dta_shim$sn/(1-dta_shim$sn))
dta_shim$logitsp <- log(dta_shim$sp/(1-dta_shim$sp))

cor(dta_shim$logitsn, dta_shim$logitsp)

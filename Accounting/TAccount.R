t<-(read.csv("c:/disk x/TAccount.csv",header=F))
View(t)

assets <- t[t$V2=="Asset",]
View(assets)#$V1)

ContraAsset <- t[t$V2=="Contra Asset",]
View(ContraAsset)#$V1)

Liabilities <- t[t$V2=="Liability",]
View(Liabilities$V1)
View(t[t$V2=="Contra Liability",])

Expenses <- t[t$V2=="Expense",]
View(Expenses$V1)

Revenue <- t[t$V2=="Revenue",]
View(Revenue$V1)
View(t[t$V2=="Contra Revenue",])

Equity <- t[t$V2=="Equity",]
View(Equity$V1)

View(t[t$V2=="Gain",])
View(t[t$V2=="Loss",])




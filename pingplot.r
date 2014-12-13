data<-read.csv(file='stdin')
library(scales)
args <- commandArgs(TRUE)
if(length(args) != 1) stop("png|svg|pdf as first parameter")
switch(args[1],
	   pdf = pdf("pingplot.pdf",width=100,height=4),
	   png = png("pingplot.png",width=10000,height=400),
	   svg = svg("pingplot.svg",width=100,height=4),
	   stop("Format unknown"))

data$Time = as.POSIXct(data$Time,origin="1970-01-01")
#plot(data$Ping ~ data$Time,ylim=c(0,max(data$Ping)));
#lines(data$Ping ~ data$Time);

require(ggplot2)
ggplot(data=data, aes(Time,Ping)) + geom_line() + scale_x_datetime(breaks=pretty_breaks(n=30),minor_breaks=date_breaks("2 hour"))

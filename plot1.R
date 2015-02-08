DS=read.table(file,header=T,sep=";",na.strings="?")
#DS["Date"]=as.Date(DS[["Date"]],"%d/%m/%Y")
#k=strptime(paste(DS[["Date"]],DS[["Time"]]),"%Y-%m-%d %H:%M:%S")
k=strptime(paste(DS[["Date"]],DS[["Time"]]),"%d/%m/%Y %H:%M:%S")
#DS[["DateTime"]]<-k
# 2007-02-01 to 2007-02-02
DS_analyze<-DS[k>="2007-02-01"&k<"2007-02-03",]
hist(DS_analyze$Global_active_power, col="red",main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency")
dev.copy(png,file="plot1.png")
dev.off()

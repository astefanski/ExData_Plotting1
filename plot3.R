DS=read.table(file,header=T,sep=";",na.strings="?")
#DS["Date"]=as.Date(DS[["Date"]],"%d/%m/%Y")
#k=strptime(paste(DS[["Date"]],DS[["Time"]]),"%Y-%m-%d %H:%M:%S")
k=strptime(paste(DS[["Date"]],DS[["Time"]]),"%d/%m/%Y %H:%M:%S")
#DS[["DateTime"]]<-k
# 2007-02-01 to 2007-02-02
DS_analyze<-DS[k>="2007-02-01"&k<"2007-02-03",]
Sys.setlocale("LC_ALL", "English")

png(file="plot3.png")

plot(DS_analyze$DateTime,DS_analyze$Sub_metering_1,
     xlab="",ylab="Energy sub metering",type="l")
points(DS_analyze$DateTime,DS_analyze$Sub_metering_2,type="l", col="red")
points(DS_analyze$DateTime,DS_analyze$Sub_metering_3,type="l", col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col=c("black","red","blue"),lty="solid")

dev.off()

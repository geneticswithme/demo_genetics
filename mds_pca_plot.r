#git clone https://github.com/geneticswithme/demo_genetics.git
#在本地建立demo_genetics文件夹
#进入本地的demo_genetics目录下
#setwd("#path_to_demo_genetics")
setwd("G:/mywork/demo_genetics")
list.files()#查看该目录下的文件，至少要有plink.mds和plink.eigenvec文件

#对plink.mds 文件作图
mds <- read.table("mds.plink", header=T)
head(mds) #查看数据前几行
attach(mds) # 以列名作为变量名将每列数据载入R内存中。
table(FID) #查看家系及数目，这里的家系即是各个品种
plot(C1, C2, col= as.factor(FID)) #以第一mds和第二mds分别为x y坐标做散点图
legend("bottomleft",bty=n, cex=0.8, legend=unique(FID), border=F, fill=unique(as.factor(FID)))
#标注上图例
#以pdf格式保存作图结果
pdf("mdsplot.pdf",width=5,height=5)
plot(C1, C2, col= as.factor(FID)) 
legend("bottomleft",bty=n, cex=0.8, legend=unique(FID), border=F, fill=unique(as.factor(FID)))
dev.off()
#以png格式保存作图结果
png("mdsplot.png",width=400,height=400)
plot(C1, C2, col= as.factor(FID)) 
legend("bottomleft",bty=n, cex=0.8, legend=unique(FID), border=F, fill=unique(as.factor(FID)))
dev.off()
#detach(mds)#卸载R中mds数据框的列变量名

#对plink.eigenvec文件作图，基本上与上面相同，只需注意文件格式
pca<- read.table("mds.eigenvec", header=F)
colnames(pca)<-c("PopName","Id",paste("PCA",1:20,sep=""))
head(pca)
attach(pca)
table(PopName)
plot(PCA1, PCA2, col= as.factor(PopName)) #以第一mds和第二mds分别为x y坐标做散点图
legend("topright",bty=n, cex=0.8, legend=unique(PopName), border=F, fill=unique(as.factor(PopName)))
#标注上图例
#以pdf格式保存作图结果
pdf("mdsplot.pdf",width=5,height=5)
plot(PCA1, PCA2, col= as.factor(PopName)) 
legend("topright",bty=n, cex=0.8, legend=unique(PopName), border=F, fill=unique(as.factor(PopName)))
dev.off()
#以png格式保存作图结果
png("mdsplot.png",width=400,height=400)
plot(PCA1, PCA2, col= as.factor(PopName)) 
legend("topright",bty=n, cex=0.8, legend=unique(PopName), border=F, fill=unique(as.factor(PopName)))
dev.off()
#detach(pca)

#将mds和pca结果放在一起画图，保存为png格式
plot(PCA1,PCA2,col=as.factor(PopName))
legend("topright", bty="n",legend=unique(PopName),border=F, fill=unique(as.factor(PopName)))#标记上注释
png('mds_pca_plot.png',width=800,height=400)
par(mfcol=c(1,2))
plot(C1,C2,col=as.factor(FID),main="MDS Plot")#做C1和C2的散点图，根据FID标记不同颜色
legend("bottomleft",cex=0.8, bty="n",legend=unique(FID),border=F, fill=unique(as.factor(FID)))#标记上注释
plot(PCA1,PCA2,col=as.factor(PopName),main="PCA Plot")
legend("topright",cex=0.8, bty="n",legend=unique(PopName),border=F, fill=unique(as.factor(PopName)))
dev.off()


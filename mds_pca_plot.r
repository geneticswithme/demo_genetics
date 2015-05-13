#git clone https://github.com/geneticswithme/demo_genetics.git
#�ڱ��ؽ���demo_genetics�ļ���
#���뱾�ص�demo_geneticsĿ¼��
#setwd("#path_to_demo_genetics")
setwd("G:/mywork/demo_genetics")
list.files()#�鿴��Ŀ¼�µ��ļ�������Ҫ��plink.mds��plink.eigenvec�ļ�

#��plink.mds �ļ���ͼ
mds <- read.table("mds.plink", header=T)
head(mds) #�鿴����ǰ����
attach(mds) # ��������Ϊ��������ÿ����������R�ڴ��С�
table(FID) #�鿴��ϵ����Ŀ������ļ�ϵ���Ǹ���Ʒ��
plot(C1, C2, col= as.factor(FID)) #�Ե�һmds�͵ڶ�mds�ֱ�Ϊx y������ɢ��ͼ
legend("bottomleft",bty=n, cex=0.8, legend=unique(FID), border=F, fill=unique(as.factor(FID)))
#��ע��ͼ��
#��pdf��ʽ������ͼ���
pdf("mdsplot.pdf",width=5,height=5)
plot(C1, C2, col= as.factor(FID)) 
legend("bottomleft",bty=n, cex=0.8, legend=unique(FID), border=F, fill=unique(as.factor(FID)))
dev.off()
#��png��ʽ������ͼ���
png("mdsplot.png",width=400,height=400)
plot(C1, C2, col= as.factor(FID)) 
legend("bottomleft",bty=n, cex=0.8, legend=unique(FID), border=F, fill=unique(as.factor(FID)))
dev.off()
#detach(mds)#ж��R��mds���ݿ���б�����

#��plink.eigenvec�ļ���ͼ����������������ͬ��ֻ��ע���ļ���ʽ
pca<- read.table("mds.eigenvec", header=F)
colnames(pca)<-c("PopName","Id",paste("PCA",1:20,sep=""))
head(pca)
attach(pca)
table(PopName)
plot(PCA1, PCA2, col= as.factor(PopName)) #�Ե�һmds�͵ڶ�mds�ֱ�Ϊx y������ɢ��ͼ
legend("topright",bty=n, cex=0.8, legend=unique(PopName), border=F, fill=unique(as.factor(PopName)))
#��ע��ͼ��
#��pdf��ʽ������ͼ���
pdf("mdsplot.pdf",width=5,height=5)
plot(PCA1, PCA2, col= as.factor(PopName)) 
legend("topright",bty=n, cex=0.8, legend=unique(PopName), border=F, fill=unique(as.factor(PopName)))
dev.off()
#��png��ʽ������ͼ���
png("mdsplot.png",width=400,height=400)
plot(PCA1, PCA2, col= as.factor(PopName)) 
legend("topright",bty=n, cex=0.8, legend=unique(PopName), border=F, fill=unique(as.factor(PopName)))
dev.off()
#detach(pca)

#��mds��pca�������һ��ͼ������Ϊpng��ʽ
plot(PCA1,PCA2,col=as.factor(PopName))
legend("topright", bty="n",legend=unique(PopName),border=F, fill=unique(as.factor(PopName)))#�����ע��
png('mds_pca_plot.png',width=800,height=400)
par(mfcol=c(1,2))
plot(C1,C2,col=as.factor(FID),main="MDS Plot")#��C1��C2��ɢ��ͼ������FID��ǲ�ͬ��ɫ
legend("bottomleft",cex=0.8, bty="n",legend=unique(FID),border=F, fill=unique(as.factor(FID)))#�����ע��
plot(PCA1,PCA2,col=as.factor(PopName),main="PCA Plot")
legend("topright",cex=0.8, bty="n",legend=unique(PopName),border=F, fill=unique(as.factor(PopName)))
dev.off()


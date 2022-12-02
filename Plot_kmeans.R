donnees = read.table(file.choose(), sep=",", dec="." ,header=TRUE, fileEncoding = "latin1")
summary(donnees)
data=donnees[,c(185:190)]
summary(data)
data

annnéécentroids <- c(2018.99,2015.78,2017.58,2013.40)
prixcentroids <- c(32077.50,13106.61,14343.58,9235.72)
milecentroids <- c(5362.52,37711.65,13563.11,78258.57)
taxecentroids <- c(148.78,97.32,124.64,105.83)
mpgcentroids <- c(46.25,59.32,55.91,58.95)
moteurcentroids <- c(2.12,1.72,1.44,1.89)
mydatacentroids <- data.frame(annnéécentroids,prixcentroids,milecentroids,taxecentroids,mpgcentroids,moteurcentroids)
mydatacentroids
mydatacentroids.PCA<-PCA(mydatacentroids)
mydatacentroids.PCA
plot(mydatacentroids.PCA,axes=c(1,2),title="Graphe des individus de l'ACP")

plot(mydatacentroids.PCA,axes=c(1,2),choix="ind")

plot(mydatacentroids.PCA$ind$coord[,1],mydatacentroids.PCA$ind$coord[,2])


mydatacentroids.PCA$ind$coord[,3]

c(1,2)
plot(1,2,col="blue")

res.PCA<-PCA(data,graph=FALSE)


res.PCA$ind$coord[,1]
colors <- c("red", "green", "blue","yellow")
plot(res.PCA$ind$coord[,1],res.PCA$ind$coord[,2],col=colors[res.PCA$ind$coord$group])


data[1,]

plot(res.PCA,axes=c(1,2),col = "#0000FF")

lines(mydatacentroids$x.PCA,axes=c(1,2)$y,title="Graphe des individus de l'ACP", col='blue')
options(repr.plot.width = 5, repr.plot.height = 4) 

plot(res.PCA,axes=c(1,2),type="l", pch ="19",dotcolor="red")
plot(mydatacentroids.PCA,axes=c(1,2),title="Graphe des individus de l'ACP", colours='blue')


lines(res.PCA,c(1,2),title="Graphe des individus de l'ACP")
lines(mydatacentroids.PCA,axes=c(1,2))

res.PCA<-PCA(data,graph=FALSE)
plot.PCA(res.PCA,axes=c(2,3),choix='var',title="Graphe des variables de l'ACP")
plot.PCA(res.PCA,axes=c(2,3),title="Graphe des individus de l'ACP")

data=donnees[,c(185:190)]
data
resultat = PCA(data)#centré réduite
resultat
plot(resultat,choix="var",axes=c(1,3))


plot(mydatacentroids.PCA$ind$coord[,1],mydatacentroids.PCA$ind$coord[,2], xlab="Dim 1 (39.07%)",ylab="Dim 2 (22.04%)", xlim=c(-15,15), ylim=c(-10,15),col="red")
data[1,]
for (i in 1:87918){
  #print(i)
  point_proche=sqrt((res.PCA$ind$coord[i,1]-mydatacentroids.PCA$ind$coord[1,1])^2+(res.PCA$ind$coord[i,2]-mydatacentroids.PCA$ind$coord[1,2])^2)
  
  point=1
  for (j in 2:4){
    if((sqrt((res.PCA$ind$coord[i,1]-mydatacentroids.PCA$ind$coord[j,1])^2+(res.PCA$ind$coord[i,2]-mydatacentroids.PCA$ind$coord[j,2])^2))<(point_proche)){
      point_proche=sqrt((res.PCA$ind$coord[i,1]-mydatacentroids.PCA$ind$coord[j,1])^2+(res.PCA$ind$coord[i,2]-mydatacentroids.PCA$ind$coord[j,2])^2)
      point=j
      #print(point_proche)
      #print(point)
    }
  } 
  if(point==1){
    lines(res.PCA$ind$coord[i,1],res.PCA$ind$coord[i,2],pch="●",type="p",col="green",lty=2)
    print(data[i,])
  }
  if(point==2){
    lines(res.PCA$ind$coord[i,1],res.PCA$ind$coord[i,2],pch="●",type="p",col="blue",lty=2)
  }  
  if(point==3){
    lines(res.PCA$ind$coord[i,1],res.PCA$ind$coord[i,2],pch="●",type="p",col="yellow",lty=2)
  }  
  if(point==4){
    lines(res.PCA$ind$coord[i,1],res.PCA$ind$coord[i,2],pch="●",type="p",col="orange",lty=2)
  }  
  
}
lines(mydatacentroids.PCA$ind$coord[,1],mydatacentroids.PCA$ind$coord[,2],pch="X",type="p",col="black")

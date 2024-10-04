
# plot residue energy contributions 
energy_contribution <- function () {
	Acts <- c(51, 75, 135, 128, 132, 131, 161)  # residues to color red e.g c(100, 110, 112)
	Res <- c()
	Pos <- c()
	MM <- c()
	Polar <- c()
	Apolar <- c()
	Energy <- c()
	Color <- c()
	f = file('final_contrib_energy.dat', 'r')
	while(T){
		line = readLines(f, n=1)
		if(length(line) == 0){break}
		fg = strsplit(line, '[ ]+', fixed=F)
		fg <- unlist(fg)
		if(length(fg) != 9){next}
		
		MM <- c(MM, as.double(fg[2]))
	 	Polar <- c(Polar, as.double(fg[4]))
	 	Apolar <- c(Apolar, as.double(fg[6]))
	 	Energy <- c(Energy, as.double(fg[8]))
	 	
	 	fgg <- strsplit(fg[1], '-')
		fgg <- unlist(fgg)
		Res <- append(Res, fgg[1])
		Pos <- append(Pos, as.numeric(fgg[2]))
	 
	 	if(as.numeric(fgg[2]) %in% Acts) { 
			Color <- append(Color, 'red')
		 	#print(paste(fgg[2], fg[8]))
		}else {
			Color <- append(Color, 'black') 
		}
	}
	close(f)
	Res <- Res[-length(Res)]
	Pos <- Pos[-length(Pos)]
	MM <- MM[-length(MM)]
	Polar <- Polar[-length(Polar)]
	Apolar <- Apolar[-length(Apolar)]
	Energy <- Energy[-length(Energy)]
	Color <- Color[-length(Color)]
	
	png('residue_mm_contribution.png',width=3048,height=2048,res=150)
	par(mar=c(6,6,6,6))
	plot(Pos, MM, cex=2, cex.lab=2.7, cex.axis=2.5, type='h', lwd=7, lend=1, xlab="Residue position", ylab="Molecular Mechanics Energy (kJ/mol)", col=Color)
	abline(h=0, col="black", lwd=2)
	dev.off()

	png('residue_polar_contribution.png',width=3048,height=2048,res=150)
	par(mar=c(6,6,6,6))
	plot(Pos, Polar, cex=2, cex.lab=2.7, cex.axis=2.5, type='h', lwd=7, lend=1, xlab="Residue position", ylab="Polar Energy (kJ/mol)", col=Color)
	abline(h=0, col="black", lwd=2)
	dev.off()

	png('residue_apolar_contribution.png',width=3048,height=2048,res=150)
	par(mar=c(6,6,6,6))
	plot(Pos, Apolar, cex=2, cex.lab=2.7, cex.axis=2.5, type='h', lwd=7, lend=1, xlab="Residue position", ylab="Apolar Energy (kJ/mol)", col=Color)
	abline(h=0, col="black", lwd=2)
	dev.off()

	png('residue_energy_contribution.png',width=3048,height=2048,res=150)
	par(mar=c(6,6,6,6))
	plot(Pos, Energy, cex=2, cex.lab=2.7, cex.axis=2.5, type='h', lwd=7, lend=1, xlab="Residue position", ylab="Binding Energy (kJ/mol)", col=Color)
	abline(h=0, col="black", lwd=2)
	dev.off()
}


# plot binding energies over the simulation time
binding_energy <- function () {
	dat <- read.table('full_energy.dat', header=F, comment.char="#")
	len <- length(dat)
	pos <- c(0,10,20,30,40,50,60,70,80,90,100)
	label <- as.character(pos)
	
	png('binding_mm_energy.png',width=3048,height=2048,res=150)
	par(mar=c(6,6,6,6))
	plot(dat$V1/1000, unlist(dat[len-3]), cex=2, cex.lab=2.5, cex.axis=2, pch=16, type="b", lwd=2, xaxt='n', xlab="Time (ns)", ylab=expression(paste(Delta, "E"["MM"], "(kJ/mol)")), col='black')
	axis(1,at=pos,labels=label,las=1, cex.axis=2)
	dev.off()
	
	png('binding_polar_energy.png',width=3048,height=2048,res=150)
	par(mar=c(6,6,6,6))
	plot(dat$V1/1000, unlist(dat[len-2]), cex=2, cex.lab=2.5, cex.axis=2, pch=16, type="b", lwd=2, xaxt='n', xlab="Time (ns)", ylab=expression(paste(Delta, "G"["polar"], " (kJ/mol)")), col='black')
	axis(1,at=pos,labels=label,las=1, cex.axis=2)
	dev.off()
	
	png('binding_apolar_energy.png',width=3048,height=2048,res=150)
	par(mar=c(6,6,6,6))
	plot(dat$V1/1000, unlist(dat[len-1]), cex=2, cex.lab=2.5, cex.axis=2, pch=16, type="b", lwd=2, xaxt='n', xlab="Time (ns)", ylab=expression(paste(Delta, "G"["apolar"], " (kJ/mol)")), col='black')
	axis(1,at=pos,labels=label,las=1, cex.axis=2)
	dev.off()
	
	png('binding_energy.png',width=3048,height=2048,res=150)
	par(mar=c(6,6,6,6))
	plot(dat$V1/1000, unlist(dat[len]), cex=2, cex.lab=2.5, cex.axis=2, pch=16, type="b", lwd=2, xaxt='n', xlab="Time (ns)", ylab="Binding energy (kJ/mol)", col='black')
	axis(1,at=pos,labels=label,las=1, cex.axis=2)
	dev.off()

}

energy_contribution()
#binding_energy()





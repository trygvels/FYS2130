from scitools.std import *
from urllib2 import urlopen
from matplotlib.pyplot import *
url = 'http://www.uio.no/studier/emner/matnat/fys/FYS2130/v15/tempblindern10aar.txt'
infile  = urlopen(url)

N = sum(1 for line in urlopen(url))
data = zeros((N,5))


i = 0
for line in infile:
	date, year, gjennomsnitt, minTemp, maxTemp = line.split() 
	data[i][0] = float(date)             #Assigning values from document to array
	data[i][1] = float(year)	     #------------------""-------------------
	data[i][2] = float(gjennomsnitt)
	data[i][3] = float(minTemp)
	data[i][4] = float(maxTemp)
	i += 1

t = linspace(0,N,N)
frekv= t[:N/2]
X=fft.fft(data[:,3],N)/N

subplot(2,1,1)
plot(t,data[:,3])
title('Tidsbilde minTemp')
xlabel('Tid')
ylabel('Temperatur')

subplot(2,1,2)
plot(frekv,2*abs(X[:N/2]))
title('Absolutt-verdieravfrekvensspekteret')
xlabel('Frekvens (hz)')
ylabel('|X(frekv)|')
savefig('Oppgave8.png')
show()


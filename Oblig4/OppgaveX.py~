from scitools.std import *
from matplotlib.pyplot import *
N = 4096
t = linspace(0,1,N)
A = 1.4
B = 2.0
C = 0.
w1 =(2*pi)*400     #(400 i betydning Hz)
w2 = (2*pi)*600.
def f(t):
	f = A*sin(w1*t) + B*cos(w2*t) + C
	return f

#Oppgave A
subplot(2,1,1)
plot(t,f(t))
xlabel('Tid [s]')
ylabel('f(t) [m]')
title('Opprinneligsignal(tidsbildet)')


#Oppgave B
t = linspace(0,1,N/2)
frekv=(N/2)*t

X=fft.fft(f(t),N)/N

subplot(2,1,2)
plot(frekv,2*abs(X[:N/2])) # Vi plotter kun halvparten av fourierspekteret
title('Absolutt-verdieravfrekvensspekteret')
xlabel('Frekvens(Hz)')
ylabel('|X(frekv)|')
savefig('OppgaveX.png')
show()


#Oppgave C

#Vi vil bare plotte halvparten av spekteret, 
#fordi vi faar speiling over halvparten av samplingsfekvensen

#Oppgave D

#Vi ser at samplingsfrekvensen = N fordi det er saa mange punkter vi ser paa i lopet av ett sekund
#Som vi sa i oppgave C er samplingsteoremet
#tilfredsstilt fordi vi ser en speiling over halvparten av samplingsfrekvensen.

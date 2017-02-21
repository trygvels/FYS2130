s='tubalow.wav' ;
N=2^16;
nstart=1;
nslutt=N; 
[f,Fs]=audioread(s,[nstart nslutt]); 
g=f(:,1);
X=fft(g);


frekv=(Fs/2)*linspace(0,1,N/2);

plot(frekv,2*ifft(abs(X(1:N/2)))) %Invers fast fourier transform etter vi tar absoluttverdi
title('Absolutt-verdieravfrekvensspekteret (Oppgave e)')
xlabel('Frekvens(Hz)')
ylabel('|X(frekv)|')

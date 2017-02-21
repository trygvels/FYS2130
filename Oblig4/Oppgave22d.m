s='tubalow.wav' ;
N=2^16;
nstart=1; 
nslutt=N; 
[f,Fs]=audioread(s,[nstart nslutt]); 
g=f(:,1);
X=fft(g);

t = linspace(0,1.9, N/2)
plot(t,2*ifft(X(1:N/2))) %Invers fast fourier transform før vi tar absoluttverdi
title('Invers fouriertransformasjon (Oppgave d)')
xlabel('Tid [s]')
ylabel('Amplitude relativ enhet')

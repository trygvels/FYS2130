%Oppgave a

s='tubalow.wav' ; %Filnavn(fil må ligge i din arbeidsmappe)
N=2^16;
nstart=1;   %Første element nr du vil bruke i lydfilen
nslutt=N;   %Siste element nr du vil lese fra lydfilen
[f,Fs]=audioread(s,[nstart nslutt]); 
g=f(:,1);   %Henter ut ett monosignal fra stereosignalet f
X=fft(g);   %Fast Fourier Transform av lydsignalet

frekv=(Fs/2)*linspace(0,1,N/2);
plot(frekv,2*abs(X(1:N/2)))
title('Absolutt-verdieravfrekvensspekteret')
xlabel('Frekvens(Hz)')
ylabel('|X(frekv)|')

%3766 hz Piccolohigh gir A/H
%132.6 hz Tubalow gir C/D


%Oppgave b
%t = linspace(0,1.9,N);
%plot(t(1:N/20),g(1:N/20)) %plotter en liten del av tidssignalet
%title('Tidssignal')
%xlabel('Tid [s]')
%ylabel('g(t)')
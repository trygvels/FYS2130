
Fs = 44100;
recObj = audiorecorder(Fs, 16, 2);
get(recObj);
devinfo = audiodevinfo;
T = 3.0; % Lengde på lydopptaket i s
recordblocking(recObj, T);
minLyd = getaudiodata(recObj);
y = minLyd(:,2); % Plukker bare ut én av kanalene (H eller V)
N = 2^17; % Bruker 131072 av de 132300 punktene som ble samplet (v 3 s)
y = y(1:N);
g = fft(y)/N; 
F = g;

%Høy amplitude kan skyldes følsomhet i mikrofon eller feil i kilden (I app)
frekv = (Fs/2)*linspace(0,1,N/2); 
Ra = (1200^2*frekv.^4)./((frekv.^2+20.5^2).*sqrt((frekv.^2+107.7^2).*(frekv.^2+737.9^2)).*(frekv.^2+12200^2));

%beregner en relativ intensitet for hele lyden ved å summere opp
%kvadratet av alle amplituder (absoluttverdier) i frekvensspekteret 
%og normere resultatet ut fra hvor lang lydstreng som ble brukt.
absF = abs(F);
absF2 = absF.*absF; % Intensitetstetthet langs frekvensaksen
totI_iv = sum(absF2(2:N/2)); %Dropper første verdi, og summerer helt opp til N/2 for å unngå folding

%Referanse dB må justeres
%referanse_dB =  -110.2528;

%Ikke vektet (iv) intensitet i dB blir:
rel_dB_iv = 10*log10(totI_iv) %- referanse_dB

F = fft(y)/N;
absF= abs(F(1:N/2))'.*abs(Ra);
absF2 = absF.*absF;
totI_A = sum(absF2(2:N/2));

%Intensitet dB(A)
rel_dB_A = 10*log10(totI_A)  + 2.0 %- referanse_dB
%
% axes('LineWidth',1.5,'FontSize',15,'FontName','Arial');
% plot(frekv(1:N/2), absF2(1:N/2),'-r','LineWidth',1.5);
% xlabel('Frekvens [Hz]','FontSize',20,'FontName','Arial');
% ylabel('Intensitet [dB] (vilk.enh.)','FontSize',20,'FontName','Arial');
% title('','FontSize',20,'FontName','Arial');

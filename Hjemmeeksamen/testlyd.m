function testlyd(freq,ampl,kanal)
Fs = 44100; %Samplingsfrekvensen
N = 44100;
T = 1.00;

k = 7.2*10^(-3); %For riktig omhylling
t_ = 0.05;
t = linspace(0,T,N);
t1 = t(1:N/2);

omhyll1 = 1./(1+exp(-(t1-t_)/k)); %.^-1; % Se kommentar i teksten!
omhyll2 = fliplr(omhyll1);

omhyll = zeros(1,N);
omhyll(1:N/2) = omhyll1;
omhyll(N/2+1:N) = omhyll2;

oscillasjon = zeros(N,1);
oscillasjon = sin(2*pi*freq .*t);
signal = ampl * oscillasjon .* omhyll;
stereosignal = zeros(N,2);
% if (kanal == 1)
%     stereosignal(:,1) = signal(1:N);
%     ... % Se kommentar i teksten!
% end;
stereosignal(:,1) = signal(1:N); %spiller på begge ører
stereosignal(:,2) = signal(1:N); 
nBits = 24;
player = audioplayer(stereosignal,Fs,nBits);
playblocking(player);

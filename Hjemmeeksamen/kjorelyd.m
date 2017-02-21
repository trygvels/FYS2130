% Skript for å teste programmet ”testlyd”:

freq = [60 120 250 500 1000 2000 4000 8000];
intensitet = zeros(8,1);
ampl = 0.05; %Juster med aplitude på frekvens = 1000
p =0
for i=freq
    dB = 0
  
    str = 'l' % så while løkka starter
    p = p+1  % plukker ut element fra freq-listen
while str ~= 'x'
 ampl %printer volum
 kanal = 1;
 freq_ = i
 testlyd(freq_,ampl,kanal);
 
 %Spør om hva vi skal gjøre
 prompt = 'Increase or decrease volume? u/d = +/-1dB or U/D = +/-5dB, or enter for OK:  ';
 str = input(prompt, 's');
 
 if str == 'u'
    n = 1;
    dB = dB +1;
 end
 if str == 'd'
    n = -1;
    dB = dB -1;
 end
 if str == 'U'
    n = 5;
    dB = dB +5;
 end
 if str == 'D'
    n = -5;
    dB = dB -5;
 end
 if isempty(str)
     str = 'x';
     intensitet(p)=dB;
     n = 0;
 end
 ampl = ampl*10^(n/20) %Justerer amplitude med 1 eller 5 desibel
 
end
end


axes('LineWidth',1.5,'FontSize',15,'FontName','Arial');
plot(freq, intensitet,'-ro','LineWidth',1.5)
xlabel('Frekvens [Hz]','FontSize',20,'FontName','Arial');
ylabel('Intensitet [dB] (vilk.enh.)','FontSize',20,'FontName','Arial');
title('Audiogram','FontSize',20,'FontName','Arial');

%Plot Freq/Volum mot normalperson
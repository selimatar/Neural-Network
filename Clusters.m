%som algoritmasi kumeleme uzerine basit bir ornek uygulama

K=200; %Her kümedeki örnek sayisi
q=1.1; %Siniflarin ayrimi

%giris verisi için 4 küme belirle
p=[rand(1,K)+q rand(1,K)+q rand(1,K)-q rand(1,K)-q;
    rand(1,K)-q rand(1,K)+q rand(1,K)+q rand(1,K)-q];

%plot clusters
plot(p(1,:),p(2,:),'r.')
hold on
grid on

%som parametleri
dimensions=[100];
coverSteps=100;
initNeighbor=10;
topologyFcn='gridtop';
distanceFcn='linkdist';

%network
net1=selforgmap(dimensions,coverSteps,initNeighbor,topologyFcn,distanceFcn)

%train
[net1,Y]=train(net1,p);
%giris verisini ve som agirlik hesaplarini görüntüle
plotsompos(net1,p)
grid on
%komsuluk uzakliklari
plotsomnd(net1)
%her bir nöronun giris vektörüyle baglantisi
figure
plotsomhits(net1,p)
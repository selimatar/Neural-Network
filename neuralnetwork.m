%fonksiyon kullanarak ag egitme islemi nasil yapilir? hangi adimlar ne
%sekilde uygulanir? Ornek bir uygulama ile denedim. Tum sekliyle asagida
%anlatilmistir.

function [ net, yv, ye ] = neuralnetwork( input, target, training_rate, n1 ,n2, lrate )

%input : Gerceklesen verilerin girdileridir 
%target : Gercekle�en verilerin �iktilaridir(hedef �ikti)
%trainig_rate : Verilerin yuzde kaci training i�in kullanilacagini belirtir
%n1 : 1. gizli katmandaki n�ron sayisi
%n2 : 2. gizli katmandaki n�ron sayisi
%lrate : Learning rate (ogrenme orani)

%Fonksiyon yazmak i�in ilk �nce function yazilir.Her function end ile biter
%Function'dan sonra k�seli parantez i�inde �ikti almak istedigimiz
%de�i�kenler yaz�l�r.
%K�seli parantezden sonra = konup fonksiyonun adi yazilir.

%() arasina girdi degiskenleri yazilir.

%input degiskeni neural network girdisi
%target girdisi ger�eklesen degerler

%Girdi training ve validation olarak ayrilir.
%�iktilar da training ve validation olarak ayrilir.
%NN olustur
%Training girdileri ve training �iktilari kullanilarak ag egitilir.
%--) E�itilmi� nn

%Validation girdileri ve ciktilari aga verilir. Egitilmis agdan �ikan
%ciktilarla ger�ek ciktilar karsilastirilir.

%65 training %35 validation

noofdata=size(input,1);
%noofdata = aga girecek veri sayisi

ntd=round(noofdata*training_rate);
%ntd training i�in ayrilacak veri sayisini bulmak i�in 
%Training rate 0 ile 1 arasinda  olmalidir. �rn: 0.65 0.75
%55 veri, %70'i training i�in kullanilacak 55*0.70=38.5
%Bu y�zden round(noofdata*training _rate) yapilir. Cikan sonu� yuvarlanir.

%Girdileri training, validation i�in ayir.
%xt : training girdisi
%xv : validation girdisi

xt=input(1:ntd,:);
xv=input(ntd+1:end,:);

%Ger�eklesen sonucu de training ve validaiton i�in ayir.
%yt : Training i�in ger�eklesen data, hedef
%yv : Validation i�in ger�eklesen data, hedef

% x x x ---) neuralNetwork �ikti
yt=target(1:ntd);
yv=target(ntd+1:end);

%Verilerin s�tunlarda olmasi i�in
xt=xt';
xv=xv';
yt=yt';
yv=yv';

%Girdi verilerinin normalize edilmesi
%xtn : Training i�in normalize girdi verisi
%xvn : Validation i�in normalize girdi verisi

xtn=mapminmax(xt);
xvn=mapminmax(xv);

%Training output normalize edilir
%ytn : Normalize edilmis training target verileri

[ytn, ps]=mapminmax(yt);
%ps normalizasyonun nasil yapildigi ile ilgili bilgiyi tutar.

%�nce ag ojbesi olusturulur. Ag bilgilerini saklayacak olan degisken.
%newff komutu yeni bir feed forward Neural Network olusturur.
%newff(girdi, �ikti, hidden layerdaki n�ron sayisi, transfer fonksiyonu,
%egitim algoritmasi) seklinde kullanilir.
net=newff(xtn, ytn, [n1,n2], {}, 'trainbfg');
net.trainParam.lr=lrate;
net.trainParam.epochs=10000;
net.trainParam.goal=1e-10000000000;
net.trainParam.show=NaN;

%Agi egitme
%net agini egit, net aginin �zerine yaz.
%train(egitilecek agin adi, girdisi, �iktisi.
net=train(net, xtn, ytn);

%validation girdilerini gir, normalize validation �iktilarini elde et.
%yen : Normalize haldeki (0-1) validation ciktisi olsun.
yen=sim(net, xvn);

%yvn : Normalize validation �iktisi degeri.
%ye : Normalize olmayan validation �iktisi
ye=mapminmax('reverse', yen, ps);

ye=ye';%neurol network �iktisi
yv=yv';%ger�eklesen �ikti

end


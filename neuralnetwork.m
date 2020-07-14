%fonksiyon kullanarak ag egitme islemi nasil yapilir? hangi adimlar ne
%sekilde uygulanir? Ornek bir uygulama ile denedim. Tum sekliyle asagida
%anlatilmistir.

function [ net, yv, ye ] = neuralnetwork( input, target, training_rate, n1 ,n2, lrate )

%input : Gerceklesen verilerin girdileridir 
%target : Gercekleþen verilerin çiktilaridir(hedef çikti)
%trainig_rate : Verilerin yuzde kaci training için kullanilacagini belirtir
%n1 : 1. gizli katmandaki nöron sayisi
%n2 : 2. gizli katmandaki nöron sayisi
%lrate : Learning rate (ogrenme orani)

%Fonksiyon yazmak için ilk önce function yazilir.Her function end ile biter
%Function'dan sonra köseli parantez içinde çikti almak istedigimiz
%deðiþkenler yazýlýr.
%Köseli parantezden sonra = konup fonksiyonun adi yazilir.

%() arasina girdi degiskenleri yazilir.

%input degiskeni neural network girdisi
%target girdisi gerçeklesen degerler

%Girdi training ve validation olarak ayrilir.
%Çiktilar da training ve validation olarak ayrilir.
%NN olustur
%Training girdileri ve training çiktilari kullanilarak ag egitilir.
%--) Eðitilmiþ nn

%Validation girdileri ve ciktilari aga verilir. Egitilmis agdan çikan
%ciktilarla gerçek ciktilar karsilastirilir.

%65 training %35 validation

noofdata=size(input,1);
%noofdata = aga girecek veri sayisi

ntd=round(noofdata*training_rate);
%ntd training için ayrilacak veri sayisini bulmak için 
%Training rate 0 ile 1 arasinda  olmalidir. Örn: 0.65 0.75
%55 veri, %70'i training için kullanilacak 55*0.70=38.5
%Bu yüzden round(noofdata*training _rate) yapilir. Cikan sonuç yuvarlanir.

%Girdileri training, validation için ayir.
%xt : training girdisi
%xv : validation girdisi

xt=input(1:ntd,:);
xv=input(ntd+1:end,:);

%Gerçeklesen sonucu de training ve validaiton için ayir.
%yt : Training için gerçeklesen data, hedef
%yv : Validation için gerçeklesen data, hedef

% x x x ---) neuralNetwork çikti
yt=target(1:ntd);
yv=target(ntd+1:end);

%Verilerin sütunlarda olmasi için
xt=xt';
xv=xv';
yt=yt';
yv=yv';

%Girdi verilerinin normalize edilmesi
%xtn : Training için normalize girdi verisi
%xvn : Validation için normalize girdi verisi

xtn=mapminmax(xt);
xvn=mapminmax(xv);

%Training output normalize edilir
%ytn : Normalize edilmis training target verileri

[ytn, ps]=mapminmax(yt);
%ps normalizasyonun nasil yapildigi ile ilgili bilgiyi tutar.

%Önce ag ojbesi olusturulur. Ag bilgilerini saklayacak olan degisken.
%newff komutu yeni bir feed forward Neural Network olusturur.
%newff(girdi, çikti, hidden layerdaki nöron sayisi, transfer fonksiyonu,
%egitim algoritmasi) seklinde kullanilir.
net=newff(xtn, ytn, [n1,n2], {}, 'trainbfg');
net.trainParam.lr=lrate;
net.trainParam.epochs=10000;
net.trainParam.goal=1e-10000000000;
net.trainParam.show=NaN;

%Agi egitme
%net agini egit, net aginin üzerine yaz.
%train(egitilecek agin adi, girdisi, çiktisi.
net=train(net, xtn, ytn);

%validation girdilerini gir, normalize validation çiktilarini elde et.
%yen : Normalize haldeki (0-1) validation ciktisi olsun.
yen=sim(net, xvn);

%yvn : Normalize validation çiktisi degeri.
%ye : Normalize olmayan validation çiktisi
ye=mapminmax('reverse', yen, ps);

ye=ye';%neurol network çiktisi
yv=yv';%gerçeklesen çikti

end


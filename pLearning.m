%16-701-040 Selim Atar && %15-701-038 Fatih Çýplak %Birlikte kodlandý

function y = pLearning (x,hedef)
alpha = 0.1;
bias =0.5;

xSize=size(x,1); % giriþ sayýsý
xLength=length(x);
% weight = rand(1,xSize); % aðýrlýk deðerleri
weight = [0.5,0.8];

fprintf('Weigth deðerleri=%g \n',weight)
for i=1:xLength,
  y=0;
    for j=1:xSize,     
       
            y = y + x(j,i) * weight(j);  
    end
    y=y+bias;
    
        fprintf('Hesaplanan deðer y=%g \n',y)
    if(y<0)
        
        fprintf('Yeni y Deðeri=%g \n',0)
        temp=y;
        y=0;
        if(hedef(i)== y )
            fprintf('Koþul saðlandý =%g\n',temp);
        else
            fprintf('%g. iterasyonda koþullar saðlanamadý \n',i);
           newWeight = rand(1,xSize);
           fprintf('Weigth deðerleri yeniden hesaplandý=%g \n',weight)
            for c=1:xLength,
                ny=0;
                for v=1:xSize,
                ny = ny + x(v,c) * newWeight(v);
                end
                ny=ny+bias;
                    fprintf('Hesaplanan deðer y=%g \n',ny)
                 if(ny~=y)
                    
                    deltaW1=alpha*(hedef(c)-temp)*x(j-1,i);
                    deltaW2=alpha*(hedef(c)-temp)*x(j,i);
                    
                    if(c==xLength)
                    t1Delta=weight(j-1)+ deltaW1;
                    t2Delta=weight(j)+ deltaW2;
                    
                    fprintf('Hesaplanan deltaW1 deðerleri=%g \n',deltaW1)
                    fprintf('Hesaplanan t1Delta deðerleri=%g \n',t1Delta)
                    fprintf('Hesaplanan deltaW2 deðerleri=%g \n',deltaW2)
                    fprintf('Hesaplanan t2Delta deðerleri=%g \n',t2Delta)
                    
                    if(t1Delta==newWeight(v) && t2Delta==newWeight(v-1))
                        fprintf('Tekrardan %g. iterasyonda aðýrlýklar hesaplanarak tamamlandý.',c)
                    end
                    end
                 end     
            end
        end   
    else
         fprintf('Yeni y Deðeri=%g \n',1)
         temp=y;
         y=1;
        if(hedef(i)== y )
            fprintf('Koþul saðlandý =%g\n',temp);
        else
             fprintf('%g. iterasyonda koþullar saðlanamadý \n',i);
                       newWeight = [0.62,0.68];
            for c=1:xLength,
                ny=0;
                for v=1:xSize,
                ny = ny + x(v,c) * newWeight(v);
                end
                ny=ny+bias;
               
                    fprintf('Hesaplanan deðer y=%g \n',ny)
                if(ny~=y)
                    
                    deltaW1=alpha*(hedef(c)-temp)*x(j-1,i);
                    deltaW2=alpha*(hedef(c)-temp)*x(j,i);
                    
                    if(c==xLength)
                    t1Delta=weight(j-1)+ deltaW1;
                    t2Delta=weight(j)+ deltaW2;
                    
                    fprintf('Hesaplanan deltaW1 deðerleri=%g \n',deltaW1)
                    fprintf('Hesaplanan t1Delta deðerleri=%g \n',t1Delta)
                    fprintf('Hesaplanan deltaW2 deðerleri=%g \n',deltaW2)
                    fprintf('Hesaplanan t2Delta deðerleri=%g \n',t2Delta)

                    if(t1Delta==newWeight(v) && t2Delta==newWeight(v-1))
                        fprintf('%g. iterasyonda aðýrlýklar hesaplanarak tamamlandý.',c)
                    end
                    end
                end
            end
        end
    end
end
end

%16-701-040 Selim Atar && %15-701-038 Fatih Çýplak %Birlikte kodlandý
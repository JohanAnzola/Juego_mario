clear, clc
global fondo mpquieto mpsalto mpc1 mpc2 mpc3 mquieto msalto mc1 mc2 mc3 moneda enemigo hongo m0 m1 m2 m3 m4 m5 Temp pos_y pos_x Memoria mario Nm tam possalto xysalto L Nene posenemy
ima1=imread('Fondo.png');
ima2=imread('mariopquieto.png');
ima3=imread('mariopsalto.png');
ima4=imread('mariopc1.png');
ima5=imread('mariopc2.png');
ima6=imread('mariopc3.png');
ima7=imread('marioquieto.png');
ima8=imread('mariosalto.png');
ima9=imread('marioc1.png');
ima10=imread('marioc2.png');
ima11=imread('marioc3.png');
ima12=imread('moneda.png');
ima13=imread('enemigo.png');
ima14=imread('hongo.png');
ima15=imread('m0.png');
ima16=imread('m1.png');
ima17=imread('m2.png');
ima18=imread('m3.png');
ima19=imread('m4.png');
ima20=imread('m5.png');
%redimencionar tamaño
Escala=0.5;
%variables glovales
fondo=imresize(ima1,Escala);
Temp=fondo;
Memoria=fondo;
mpquieto=imresize(ima2,Escala);
mpsalto=imresize(ima3,Escala);
mpc1=imresize(ima4,Escala);
mpc2=imresize(ima5,Escala);
mpc3=imresize(ima6,Escala);
mquieto=imresize(ima7,Escala);
msalto=imresize(ima8,Escala);
mc1=imresize(ima9,Escala);
mc2=imresize(ima10,Escala);
mc3=imresize(ima11,Escala);
moneda=imresize(ima12,Escala);
enemigo=imresize(ima13,Escala);
hongo=imresize(ima14,Escala);
m0=imresize(ima15,Escala);
m1=imresize(ima16,Escala);
m2=imresize(ima17,Escala);
m3=imresize(ima18,Escala);
m4=imresize(ima19,Escala);
m5=imresize(ima20,Escala);
mario=mpquieto;
Nm=4;
tam=1;
Nmon=5;
Nhongo=1;
Nene=1;
Lmon=size(moneda);
Lhe=size(hongo);
contadordx=0;
xysalto=76;
possalto=0;

%Tamaños guarde su tamaño en una variable
L=size(mario);

%primera grafica
imshow(fondo(:,1:500,:));
%evalucaion de 
[x,y] = getpts;
if length(x)==1 && length(y)==1
   
    pos_ini_x=round(x);
    pos_ini_y=round(y);
    pos_y=pos_ini_y:pos_ini_y+L(1)-1;
    pos_x=pos_ini_x:pos_ini_x+L(2)-1;
    %remplace los valores de al imagen  peuqña en la grand
   
    %presente la imagen
    caer

else
    [x,y] = getpts
end

for i=1:6:1500
    %cree un arreglo que almacene las pociciones que bvaya a cambiar dejtro de
    %una imagen
    %seleciona tamño
    if tam==1
        marioq=mpquieto;
        marios=mpsalto;
        mario1=mpc1;
        mario2=mpc2;
        mario3=mpc3;
    else 
        marioq=mquieto;
        marios=msalto;
        mario1=mc1;
        mario2=mc2;
        mario3=mc3;
        
    end
    %seleciona mario
    if Nm == 4 || Nm == 5 || Nm==1
        mario=mario1;
        Nm=2;
    elseif Nm==2
        mario=mario2;
        Nm=3;
    else
        mario=mario3;
        Nm=1;
    end
       
    %grafica monedas
    if Nmon==5
        
        
        Memoria(328:327+Lmon(1),650:649+Lmon(2),:)=moneda;
        Memoria(328:327+Lmon(1),835:834+Lmon(2),:)=moneda;
        Memoria(328:327+Lmon(1),1074:1073+Lmon(2),:)=moneda;
        Memoria(328:327+Lmon(1),1120:1119+Lmon(2),:)=moneda;
        Memoria(328:327+Lmon(1),1164:1163+Lmon(2),:)=moneda;
        m=m0;
    elseif Nmon==4
        Memoria(328:327+Lmon(1),835:834+Lmon(2),:)=moneda;
        Memoria(328:327+Lmon(1),1074:1073+Lmon(2),:)=moneda;
        Memoria(328:327+Lmon(1),1120:1119+Lmon(2),:)=moneda;
        Memoria(328:327+Lmon(1),1164:1163+Lmon(2),:)=moneda;
        m=m1;
    elseif Nmon==3
        
        Memoria(328:327+Lmon(1),1074:1073+Lmon(2),:)=moneda;
        Memoria(328:327+Lmon(1),1120:1119+Lmon(2),:)=moneda;
        Memoria(328:327+Lmon(1),1164:1163+Lmon(2),:)=moneda;
        m=m2;
    elseif Nmon==2
        
        Memoria(328:327+Lmon(1),1120:1119+Lmon(2),:)=moneda;
        Memoria(328:327+Lmon(1),1164:1163+Lmon(2),:)=moneda;
        m=m3;
    elseif Nmon==1
        m=m4;
        Memoria(328:327+Lmon(1),1164:1163+Lmon(2),:)=moneda;
    else
        m=m5;
        Memoria=fondo;
    end
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %grafica hongo
    if Nhongo==1
     Memoria(326:325+Lhe(1),760:759+Lhe(2),:)=hongo;
    end
    %%%%%%%%%%%%%%%%%%%%%%%%%%
    if Nene==1 || Nene==2
      Memoria(326:325+Lhe(1),1235:1234+Lhe(2),:)=enemigo;  
    end
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %almacena oara poner el hongo
    Temp=Memoria(1:end,1+i:500+i,:);
    Temp(pos_y,pos_x,:)=mario;
    pos1y=pos_y(end,end);
    pos1x=pos_x(end,end);
    Temp(5:18,365:455,:)=m;
    imshow(Temp);
    
    %pixel en medio de pario
    pixel=impixel(Temp,pos1x+1,344);
    pixel2=impixel(Temp,pos1x+14,344);
    %comporar moneda y honho
    if(isequal(pixel,[116,91,6]) || isequal(pixel,[255,218,15]) || isequal(pixel,[141,111,7]) || isequal(pixel,[177,136,0]) || isequal(pixel,[204,158,0]) || isequal(pixel,[202,156,0]))
        Nmon=Nmon-1;
    elseif (isequal(pixel,[216,40,0]) && Nhongo==1) 
        Nhongo=0;
        tam=2
        pos_y=pos1y-63:pos1y;  
       
    
    elseif(isequal(pixel2,[151,72,0]))%enemigo
        xysalto=24
        mario=marios;
        L=size(mario);
        Temp=Memoria(1:end,1+i:500+i,:);
        Nene=2;
        salta
    else
        Nmon=Nmon;
    end
    %conprara eemigo y bloque
    if (isequal(pixel2,[170,225,25]) || isequal(pixel2,[182,250,27])||isequal(pixel2,[186,249,27]) || isequal(pixel2,[180,250,19]) || isequal(pixel2,[182,250,19]) || isequal(pixel2,[178,226,42]) || isequal(pixel2,[185,247,28]) || isequal(pixel2,[180,250,24]) || isequal(pixel2,[186,248,28]) || isequal(pixel2,[96,124,31]) || isequal(pixel2,[196,255,33]) || isequal(pixel2,[181,248,27]) || isequal(pixel2,[181,250,21]) ||isequal(pixel2,[184,249,21]) || isequal(pixel2,[184,250,27]) )
        xysalto=80
        mario=marios;
        L=size(mario);
        Temp=Memoria(1:end,1+i:500+i,:);
        a=11
        salta
        
    else
       
    end
    % contador desplazamienttopor salto
    if possalto==1
        contadordx=contadordx+4;
        if contadordx>=xysalto
           
            
            if Nene ==2
                 Memoria=fondo;
                 posenemy=1235-i;
            end
             Temp=Memoria(1:end,1+i:500+i,:);
            mario=marios;
            caer
        end
    else
        contadordx=0;
    end
    %%%%%%%%%%%%%%%
    
    if i<300
        pause(0.1);
    else
        pause(0.0001);
    end
    Memoria=fondo;
end

%cae al iniico
function caer()
global fondo Temp pos_y pos_x Memoria mario Nm tam  possalto xysalto L enemigo Nene posenemy



Memoria=Temp;
for i=1:5:420
    %cree un arreglo que almacene las pociciones que bvaya a cambiar dejtro de
    %una imagen
    pos_ini_x=pos_x(1:1);
    pos_ini_y=pos_y(1:1)+i;
    posy=pos_ini_y:pos_ini_y+L(1)-1;
    posx=pos_ini_x:pos_ini_x+L(2)-1;
    Memoria(posy,posx,:)=mario;
    if  Nene==2 && i<38
        enemy=imresize(enemigo,[38-i,38])
        Lenemy=size(enemy)
      Memoria(326+i:325+Lenemy(1)+i,posenemy:posenemy-1+Lenemy(2),:)=enemy;  
    end
    
    pixel=impixel(Memoria,pos_ini_x-1,pos_ini_y+L(1));
    %comparar arreglos
    
    if(isequal(pixel,[231,95,19]))
        Memoria=fondo;
        pos_x=posx;
        pos_y=posy-5;
        possalto=0;
        if  Nene==2
            Nene=3;
        end
        return
        
    else
        imshow(Memoria(:,1:500,:))
        pause(0.0001);
        Memoria=Temp;
    end
    
end
    possalto=0;
end

%salto
function salta()
global fondo  Temp pos_y pos_x Memoria mario Nm tam  possalto xysalto L



Memoria=Temp;
for i=1:5:420
    %cree un arreglo que almacene las pociciones que bvaya a cambiar dejtro de
    %una imagen
    pos_ini_x=pos_x(1:1);
    pos_ini_y=pos_y(1:1)-i;
    posy=pos_ini_y:pos_ini_y+L(1)-1;
    posx=pos_ini_x:pos_ini_x+L(2)-1;
    Memoria(posy,posx,:)=mario;
    pixel=impixel(Memoria,pos_ini_x+L(2)+18,pos_ini_y+L(1)-20);
    %comparar arreglos
    if(isequal(pixel,[107,136,254]))
        Memoria=fondo;
        pos_x=posx;
        pos_y=posy-5;
        possalto=1;
        return

    else
        imshow(Memoria)
        pause(0.0001);
        Memoria=Temp;
    end
end
    possalto=1;
end
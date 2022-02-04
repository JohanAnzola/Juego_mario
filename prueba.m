clear, clc
ima1=imread('marioquieto.png')
ima2=imread('Fondo.png')
%redimencionar tamaño
Escala=0.3;
ima3=imresize(ima1,Escala);
%guarde su tamaño en una variable
L=size(ima3)
global Temp
%rutia de movimiento
Memoria=ima2;
for i=10:5:1000
    %cree un arreglo que almacene las pociciones que bvaya a cambiar dejtro de
    %una imagen
    
    %almacena oara poner el hongo
    Temp=Memoria(1:end,1+i:end-2000+i,:);
   
    if i<500
         Temp(250:249+L(1),200:199+L(2),:)=ima3;
    imshow(Temp)
    pause(0.1)
    else
        caer(ima3,ima2)
    end
    i
end

function caer(ima3,ima2)
global Temp
Memoria=Temp;
L=size(ima3)

for i=10:5:580
    %cree un arreglo que almacene las pociciones que bvaya a cambiar dejtro de
    %una imagen
    pos_ini_x=10+i;
    pos_ini_y=420;
    pos_y=pos_ini_y:pos_ini_y+L(1)-1;
    pos_x=pos_ini_x:pos_ini_x+L(2)-1;
    Memoria(pos_y,pos_x,:)=ima3;
    pixel=impixel(ima2,pos_ini_x,pos_ini_y);
    %comparar arreglos
    if(isequal(pixel,[35,177,77]))
        break
    else
        imshow(Memoria)
        pause(0.1),
        Memoria=Temp;
    end
    
end
    
end
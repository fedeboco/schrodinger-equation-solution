function media=E_Ep(Nx,paso_x,Nb)
    media=zeros(5,7);
    qe=1.6e-19;
    
    densidad(:,1)=dlmread('libre_0.csv',',');
    densidad(:,2)=dlmread('libre_100.csv',',');
    densidad(:,3)=dlmread('libre_200.csv',',');
    densidad(:,4)=dlmread('libre_300.csv',',');
    densidad(:,5)=dlmread('libre_400.csv',',');
    
    densidad(:,6)=dlmread('barrera_0_0.25.csv',',');
    densidad(:,7)=dlmread('barrera_200_0.25.csv',',');
    densidad(:,8)=dlmread('barrera_425_0.25.csv',',');
    
    densidad(:,9)=dlmread('barrera_0_0.07.csv',',');
    densidad(:,10)=dlmread('barrera_200_0.07.csv',',');
    densidad(:,11)=dlmread('barrera_425_0.07.csv',',');
    
    densidad(:,12)=dlmread('barrera_0_0.025.csv',',');
    densidad(:,13)=dlmread('barrera_200_0.025.csv',',');
    densidad(:,14)=dlmread('barrera_425_0.025.csv',',');
    
    densidad(:,15)=dlmread('escalon_0_0.25.csv',',');
    densidad(:,16)=dlmread('escalon_200_0.25.csv',',');
    densidad(:,17)=dlmread('escalon_425_0.25.csv',',');
    
    densidad(:,18)=dlmread('escalon_0_0.07.csv',',');
    densidad(:,19)=dlmread('escalon_200_0.07.csv',',');
    densidad(:,20)=dlmread('escalon_425_0.07.csv',',');
    
    densidad(:,21)=dlmread('escalon_0_0.025.csv',',');
    densidad(:,22)=dlmread('escalon_200_0.025.csv',',');
    densidad(:,23)=dlmread('escalon_425_0.025.csv',',');
    
    for i=1:5
      media(i,1)=calc_media_x(densidad(:,i)*0,1,Nx,paso_x);
    end
    
    altura_V=0;  
  
    for j=2:7
      for i=1:3
        k=3*j+(i-1);
          
          if(k<15)
            if(k==6||k==9||k==12||k==15||k==18||k==21) 
              altura_V=0.25; 
            end
            if(k==7||k==10||k==13||k==16||k==19||k==22) 
              altura_V=0.07; 
            end
            if(k==8||k==11||k==14||k==17||k==20||k==23) 
              altura_V=0.025; 
            end
            for x=1:Nx
               V_barrera(x)=((0<x)&(x<(Nx/2))).*0+(((Nx/2)<x)&(x<((Nx/2)+Nb))).*(altura_V*qe)+((((Nx/2)+Nb)<x)&(x<Nx)).*0;
            end
          end
          if (k>=15)
            if(k==9||k==12||k==15||k==18||k==21) 
              altura_V=0.25; 
            end
            if(k==10||k==13||k==16||k==19||k==22) 
              altura_V=0.07; 
            end
            if(k==11||k==14||k==17||k==20||k==23) 
              altura_V=0.025; 
            end
            for x=1:Nx
              V_barrera(x)=((0<x)&(x<(Nx/2))).*0+(((Nx/2)<x)&(x<Nx)).*(altura_V*qe);
            end  
          end    
          
          suma=0;
          for z=1:Nx
            suma=suma+densidad(z,k)*V_barrera(z);
          end
          media(i,j)=suma;
          
          dlmwrite('medias_Ep.csv',media/qe,',');
      end
    end
end
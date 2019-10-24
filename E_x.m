function media=E_x(Nx,paso_x)

    media=zeros(5,7);

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
      media(i,1)=calc_media_x(densidad(:,i),1,Nx,paso_x);
      end
      
      for j=2:7
        for i=1:3
          media(i,j)=calc_media_x(densidad(:,3*j+(i-1)),1,Nx,paso_x);
        end
      end
      
    dlmwrite('medias_x.csv',media,',');
end
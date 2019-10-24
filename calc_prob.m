function prob=calc_prob(Nx,Nb)
    densidad(:,1)=dlmread('escalon_0_0.25.csv',',');
    densidad(:,2)=dlmread('escalon_200_0.25.csv',',');
    densidad(:,3)=dlmread('escalon_425_0.25.csv',',');
    densidad(:,4)=dlmread('escalon_0_0.07.csv',',');
    densidad(:,5)=dlmread('escalon_200_0.07.csv',',');
    densidad(:,6)=dlmread('escalon_425_0.07.csv',',');
    densidad(:,7)=dlmread('escalon_0_0.025.csv',',');
    densidad(:,8)=dlmread('escalon_200_0.025.csv',',');
    densidad(:,9)=dlmread('escalon_425_0.025.csv',',');
    
    prob=zeros(3,9); %probab. de encontrar particula dentro del escalon.
    for i=1:9
      for x=501:Nx
        prob(1,i)=prob(1,i)+densidad(x,i);
      end
    end
    
    densidad(:,1)=dlmread('barrera_0_0.25.csv',',');
    densidad(:,2)=dlmread('barrera_200_0.25.csv',',');
    densidad(:,3)=dlmread('barrera_425_0.25.csv',',');
    densidad(:,4)=dlmread('barrera_0_0.07.csv',',');
    densidad(:,5)=dlmread('barrera_200_0.07.csv',',');
    densidad(:,6)=dlmread('barrera_425_0.07.csv',',');
    densidad(:,7)=dlmread('barrera_0_0.025.csv',',');
    densidad(:,8)=dlmread('barrera_200_0.025.csv',',');
    densidad(:,9)=dlmread('barrera_425_0.025.csv',',');
    
    for i=1:9 %probab. de encontrar particula dentro de la barrera.
      for x=501:(501+Nb)
        prob(2,i)=prob(2,i)+densidad(x,i);
      end
    end
    for i=1:9 %probab. de encontrar particula pasando la barrera.
      for x=(501+Nb):Nx
        prob(3,i)=prob(3,i)+densidad(x,i);
      end
    end
    dlmwrite('proba.csv',prob,',');
        
end
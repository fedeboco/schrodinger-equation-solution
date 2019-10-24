function max_n_width=calc_max_n_width(Nx,paso_x)
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
    
    max=zeros(3,23);
    x_max=0;
    x_max_i=1;
    for i=1:23
      %Calculo del maximo
      max(1,i)=1;
      for x=2:Nx
        if (densidad(x,i)>=densidad(x_max_i,i))
          x_max=x*paso_x;
          x_max_i=x;
        end
      end
      
      max(2,i)=densidad(x_max_i,i);
          
      %Calculo del ancho para P/2 (con primer y último valor con esa imagen)
      root=max(2,i)/2;
      x=1;
      while(densidad(x,i)<=root)
        x++;
      end
      root_1=x;
      x=1;
      while(densidad(Nx+1-x,i)<=root)
        x++;
      end
      root_2=Nx+1-x;
      ancho=(root_2-root_1)*paso_x;
      max(3,i)=ancho;
      max(1,i)=x_max;
    end
    
    
    dlmwrite('maximos.csv',max,',');
end
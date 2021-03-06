function media=E_p(Nx,paso_x,hh,m)
      
    psi(:,1)=dlmread('libre_componentes_0.csv',',');
    psi(:,2)=dlmread('libre_componentes_100.csv',',');
    psi(:,3)=dlmread('libre_componentes_200.csv',',');
    psi(:,4)=dlmread('libre_componentes_300.csv',',');
    psi(:,5)=dlmread('libre_componentes_400.csv',',');
    
    psi(:,6)=dlmread('barrera_componentes_0_0.25.csv',',');
    psi(:,7)=dlmread('barrera_componentes_200_0.25.csv',',');
    psi(:,8)=dlmread('barrera_componentes_425_0.25.csv',',');
    
    psi(:,9)=dlmread('barrera_componentes_0_0.07.csv',',');
    psi(:,10)=dlmread('barrera_componentes_200_0.07.csv',',');
    psi(:,11)=dlmread('barrera_componentes_425_0.07.csv',',');
    
    psi(:,12)=dlmread('barrera_componentes_0_0.025.csv',',');
    psi(:,13)=dlmread('barrera_componentes_200_0.025.csv',',');
    psi(:,14)=dlmread('barrera_componentes_425_0.025.csv',',');
    
    psi(:,15)=dlmread('escalon_componentes_0_0.25.csv',',');
    psi(:,16)=dlmread('escalon_componentes_200_0.25.csv',',');
    psi(:,17)=dlmread('escalon_componentes_425_0.25.csv',',');
    
    psi(:,18)=dlmread('escalon_componentes_0_0.07.csv',',');
    psi(:,19)=dlmread('escalon_componentes_200_0.07.csv',',');
    psi(:,20)=dlmread('escalon_componentes_425_0.07.csv',',');
    
    psi(:,21)=dlmread('escalon_componentes_0_0.025.csv',',');
    psi(:,22)=dlmread('escalon_componentes_200_0.025.csv',',');
    psi(:,23)=dlmread('escalon_componentes_425_0.025.csv',',');     
    
    media=zeros(5,7);
    coef=i*hh/(2*paso_x);
    suma=0;
    
    for b=1:5 %desde 1 hasta 5
        suma=0;
        for c=2:Nx-1
          termino=(psi(c+1,b)-2*psi(c,b)+psi(c-1,b));
          suma=suma+c*(conj(psi(c,b))*termino-conj(termino)*psi(c,b));
        end
        media(b,1)=coef*suma;
    end
    
    
    for a=2:7
      for b=1:3
        suma=0;
        d=3*a+(b-1); % factor para seleccionar psi desde 6 hasta 23
        for c=2:Nx-1
           termino=(psi(c+1,d)-2*psi(c,d)+psi(c-1,d));
           suma=suma+c*(conj(psi(c,d))*termino-conj(termino)*psi(c,d));
        end
        media(b,a)=coef*suma;
      end
    end
    dlmwrite('medias_p.csv',media,',');
    
end
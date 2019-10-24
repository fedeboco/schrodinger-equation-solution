function void=plotear_escalon(Nx,qe)
    densidad_escalon_0_25=dlmread('escalon_0_0.25.csv',',');
    densidad_escalon_200_25=dlmread('escalon_200_0.25.csv',',');
    densidad_escalon_425_25=dlmread('escalon_425_0.25.csv',',');
    densidad_escalon_0_07=dlmread('escalon_0_0.07.csv',',');
    densidad_escalon_200_07=dlmread('escalon_200_0.07.csv',',');
    densidad_escalon_425_07=dlmread('escalon_425_0.07.csv',',');
    densidad_escalon_0_025=dlmread('escalon_0_0.025.csv',',');
    densidad_escalon_200_025=dlmread('escalon_200_0.025.csv',',');
    densidad_escalon_425_025=dlmread('escalon_425_0.025.csv',',');
    medias_Et=dlmread('medias_Et.csv',',');
    
    medias_Et_25=0;
    medias_Et_07=0;
    medias_Et_025=0;
   
    suma_25=0; suma_07=0; suma_025=0;
    
    for w=1:3
      suma_25=suma_25+medias_Et(w,2);
      suma_07=suma_07+medias_Et(w,3);
      suma_025=suma_025+medias_Et(w,4);
    end
    
    medias_Et_25=suma_25/3;
    medias_Et_07=suma_07/3;
    medias_Et_025=suma_025/3;
    
    for x=1:Nx
            posicion(x)=x;
            potencial(x)=((0<x)&(x<(Nx/2))).*0+(((Nx/2)<x)&(x<=Nx)).*(0.25*qe); 
     end
    escalon_fig=figure (2);
    set(escalon_fig, 'Position', [0 100 1280 420]);
    
    %PLOT PARA 0.25 eV ////////////////////////////////////////////////////
    subplot(1,3,1);
    r=linspace(0,1000,50);
    [AX,H1,H2]=plotyy (posicion,densidad_escalon_0_25,posicion,potencial/qe,@plot,@plot); hold on;
    get(AX(1));
    get(AX(2));
    set(AX(2),'ylim',[0 0.3]);
    title (AX(2), 'Densidad de probabilidad para escalon de 0.25 eV');
    ylabel (AX(1), 'Densidad');
    ylabel (AX(2), 'Potencial [eV]');
    xlabel (AX(1), 'Posicion [0.1 nm]');
    [AX,H3,H4]=plotyy (posicion,densidad_escalon_200_25,r,medias_Et_25,@plot,@plot); hold on;
    [AX,H5,H6]=plotyy (posicion,densidad_escalon_425_25,0,0,@plot,@plot); hold on;
    set(H1,'color','r')
    set(H3,'color','m')
    set(H4,'linestyle','-','color','g')     
    set(H5,'color','b') 
    h = legend ('t=425 fs',
                't=200 fs',
                't=0 fs',
                'Potencial',
                'Et',
                'location', 'southeast');
    grid; 
      
    %PLOT PARA 0.07 eV ////////////////////////////////////////////////////
    subplot(1,3,2);
    for x=1:Nx
            posicion(x)=x;
            potencial(x)=((0<x)&(x<(Nx/2))).*0+(((Nx/2)<x)&(x<=Nx)).*(0.07*qe); 
    end
    [AX,H1,H2]=plotyy (posicion,densidad_escalon_0_07,posicion,potencial/qe,@plot,@plot); hold on;
    get(AX(1));
    get(AX(2));
    set(AX(2),'ylim',[0 0.120]);
    title (AX(2), 'Densidad de probabilidad para escalon de 0.07 eV');
    ylabel (AX(1), 'Densidad');
    ylabel (AX(2), 'Potencial [eV]');
    xlabel (AX(1), 'Posicion [0.1 nm]');
    [AX,H3,H4]=plotyy (posicion,densidad_escalon_200_07,r,medias_Et_07,@plot,@plot); hold on;
    [AX,H5,H6]=plotyy (posicion,densidad_escalon_425_07,0,0,@plot,@plot);; hold on;
    set(H1,'color','r')
    set(H3,'color','m')
    set(H4,'linestyle','-','color','g')     
    set(H5,'color','b') 
    h = legend ('t=425 fs',
                't=200 fs',
                't=0 fs',
                'Potencial',
                'Et',
                'location', 'northeast');
    grid; 

    %PLOT PARA 0.025 eV ////////////////////////////////////////////////////
    subplot(1,3,3);
    for x=1:Nx
            posicion(x)=x;
            potencial(x)=((0<x)&(x<(Nx/2))).*0+(((Nx/2)<x)&(x<=Nx)).*(0.025*qe); 
    end 
    [AX,H1,H2]=plotyy (posicion,densidad_escalon_0_025,posicion,potencial/qe,@plot,@plot); hold on;
    get(AX(1));
    get(AX(2));
    set(AX(2),'ylim',[0 0.065]);
    title (AX(2), 'Densidad de probabilidad para escalon de 0.025 eV');
    ylabel (AX(1), 'Densidad');
    ylabel (AX(2), 'Potencial [eV]');
    xlabel (AX(1), 'Posicion [0.1 nm]');
    [AX,H3,H4]=plotyy (posicion,densidad_escalon_200_025,r,medias_Et_025,@plot,@plot); hold on;
    [AX,H5,H6]=plotyy (posicion,densidad_escalon_425_025,0,0,@plot,@plot);; hold on;
    set(H1,'color','r')
    set(H3,'color','m')
    set(H4,'linestyle','-','color','g')     
    set(H5,'color','b') 
    h = legend ('t=425 fs',
                't=200 fs',
                't=0 fs',
                'Potencial',
                'Et',
                'location', 'east');
    grid; 
    
end  
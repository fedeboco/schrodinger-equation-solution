function void=plotear_libre(void)
      densidad_libre_0=dlmread('libre_0.csv',',');
      densidad_libre_100=dlmread('libre_100.csv',',');
      densidad_libre_200=dlmread('libre_200.csv',',');
      densidad_libre_300=dlmread('libre_300.csv',',');
      densidad_libre_400=dlmread('libre_400.csv',',');
      medias_Et=dlmread('medias_Et.csv',',');
      
      media_Et=0;
      suma=0;
      for w=1:5
        suma=suma+medias_Et(w,1);
      end
      media_Et=suma/5;
      
      r1=linspace(0,1000,1000);
      r2=linspace(0,1000,50);
      
      figure (1,'Position',[50,50,1200,700]); 
      [AX,H1,H2]=plotyy(r1,densidad_libre_0,r2,media_Et,@plot,@plot); hold on;
      get(AX(1));
      get(AX(2));
      set(AX(2),'ylim',[0 0.065]);
      title (AX(2), 'Densidad de probabilidad para particula libre');
      ylabel (AX(1), 'Densidad');
      ylabel (AX(2), 'Energia [eV]');
      xlabel (AX(1), 'Posicion [0.1 nm]');
      
      [AX,H3,H4]=plotyy(r1,densidad_libre_100,0,0,@plot,@plot); hold on;
      [AX,H5,H6]=plotyy(r1,densidad_libre_200,0,0,@plot,@plot); hold on;
      [AX,H7,H8]=plotyy(r1,densidad_libre_300,0,0,@plot,@plot); hold on;
      [AX,H9,H10]=plotyy(r1,densidad_libre_400,0,0,@plot,@plot);
      
      set(H1,'color','r')
      set(H3,'color','b')
      set(H5,'color','g')
      set(H7,'color','m')     
      set(H9,'color','c')
      set(H2,'color','g','linestyle','-') 
      legend( "t=0 fs",
              "t=100 fs",
              "t=200 fs",
              "t=300 fs",
              "t=400 fs",
              "Et",
              'location','east');
      grid on;
end
function void=main(instante,caso, altura_V)

  %INVOCACION: main(instante(en fs),caso,altura del escalon (en eV))
  %xej: main(425e-15,3,0.07)

  %instante de tiempo para el cual se simula psi(x,tiempo)
  paso_x=0.1e-9; %paso de posicion dato
  paso_t=2e-17; %paso de tiempo dato en relacion a ra
  x0=10e-9; %posicion inicial dato
  desv=5e-9; %desvio estandar inicial dato
  h=6.62606957e-34; %constante de planck
  hh=h/(2*pi); %constante de planck/2pi
  b_w=5e-9; %ancho de la barrera de potencial "barrier width"
  m=9.11e-31; %masa 
  q=1.6e-31; %carga particula
  qe=1.6e-19; %carga electron
  vp=1.45e5; %velocidad probable inicial
  s_w=100e-9; %espacio donde transcurre el experimento "space width"
  Nx=round(s_w/paso_x); %cantidad de posiciones calculadas
  Nt=round(instante/paso_t); %cantidad de tiempos calculados
  Nb=round(b_w/paso_x);
  lambda=h/(m*vp) %longitud de onda
  densidad=zeros(1,Nx); %densidad de probablidad
  potencial=zeros(1,Nx); %potencial de interacción con partícula
  ra=hh*paso_t/(2*m*paso_x.^2); %DEBE SER <0,15 PARA V=0
  rb=paso_t/hh;
  paso=[paso_x paso_t];
  N=[Nx,Nt];
  
  [psi_t0_re,psi_t0_im]=psi_inicial(x0,lambda,desv,Nx,paso(1)); %calcula psi(x,0); devuelve 2 vectores para c/u
  [psi_re,psi_im]=normalizar_psi(psi_t0_re,psi_t0_im,Nx,paso(1)); %normaliza psi
  
  %Casos 1,2 y 3 procesan y guardan en .csv la densidad de probabilidad de
  %partícula libre, escalon y barrera respectivamente. Casos 4, 5 y 6 cargan
  %dichos archivos guardados y plotean las densidad respectivas. 7 Plotea todo.
  %8 Procesa esperanzas y varianzas (1 por cada tiempo y cada V). 9 Procesa todo.
  
  switch(caso) 
  
    case 1
      procesar_libre(psi_re,psi_im,ra,rb,N,instante,potencial);
    case 2  
      procesar_escalon(psi_re,psi_im,ra,rb,N,instante,qe,altura_V);
    case 3
      procesar_barrera(psi_re,psi_im,ra,rb,N,instante,qe,altura_V,Nb);
    case 4
      close all
      plotear_libre();
    case 5
      close all
      plotear_escalon(Nx,qe);
    case 6
      close all
      plotear_barrera(Nx,Nb,qe);
    case 7 %Plotea todo
      close all
      plotear_libre();
      plotear_escalon(Nx,qe);
      plotear_barrera(Nx,Nb,qe);
    case 8 %Calcular medias y varianzas
      %MEDIAS en eV///////////
      medias_x=E_x(Nx,paso_x);
      medias_Ec=E_Ec(Nx,paso_x,hh,m);
      medias_Ep=E_Ep(Nx,paso_x,Nb);
      medias_p=E_p(Nx,paso_x,hh,m);
      E_Et=(medias_Ec+medias_Ep)./qe;
      %VARIANZAS////////
      var_x(Nx,paso_x,medias_x);
      var_p=2*m.*medias_Ec./qe-medias_p.^2;
      
      dlmwrite('medias_Et.csv',abs(E_Et),',');
      dlmwrite('var_p.csv',abs(var_p),',');
    case 9 %Procesar todo
      procesar_todo(psi_re,psi_im,ra,rb,paso_x,paso_t,N,qe,Nb);
    case 10
      calc_prob(Nx,Nb);
    case 11 %Calcula maximos de P y "anchos" a P/2
      calc_max_n_width(Nx,paso_x);
    case 12
      verificar_ppio_incertidumbre(hh);
    otherwise
      'ERROR. Verifique el caso elegido.';
  end
end
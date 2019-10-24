function void=procesar_todo(psi_re,psi_im,ra,rb,paso_x,paso_t,N,qe,Nb)
  potencial=zeros(1,N(1));
  Nx=N(1);
  Nt=N(2);
  
  for i=0:4
    instante=i*100*10^-15;
    N(2)=round(instante/paso_t);
    procesar_libre(psi_re,psi_im,ra,rb,N,instante,potencial);
  end
  
  instante=0;
  N(2)=round(instante/paso_t);
  procesar_barrera(psi_re,psi_im,ra,rb,N,instante,qe,0.25,Nb);
  procesar_barrera(psi_re,psi_im,ra,rb,N,instante,qe,0.07,Nb);
  procesar_barrera(psi_re,psi_im,ra,rb,N,instante,qe,0.025,Nb);
  procesar_escalon(psi_re,psi_im,ra,rb,N,instante,qe,0.25,Nb);
  procesar_escalon(psi_re,psi_im,ra,rb,N,instante,qe,0.07,Nb);
  procesar_escalon(psi_re,psi_im,ra,rb,N,instante,qe,0.025,Nb);
  
  instante=200e-15;
  N(2)=round(instante/paso_t);
  procesar_barrera(psi_re,psi_im,ra,rb,N,instante,qe,0.25,Nb);
  procesar_barrera(psi_re,psi_im,ra,rb,N,instante,qe,0.07,Nb);
  procesar_barrera(psi_re,psi_im,ra,rb,N,instante,qe,0.025,Nb);
  procesar_escalon(psi_re,psi_im,ra,rb,N,instante,qe,0.25,Nb);
  procesar_escalon(psi_re,psi_im,ra,rb,N,instante,qe,0.07,Nb);
  procesar_escalon(psi_re,psi_im,ra,rb,N,instante,qe,0.025,Nb);
  
  instante=425e-15;
  N(2)=round(instante/paso_t)
  procesar_barrera(psi_re,psi_im,ra,rb,N,instante,qe,0.25,Nb);
  procesar_barrera(psi_re,psi_im,ra,rb,N,instante,qe,0.07,Nb);
  procesar_barrera(psi_re,psi_im,ra,rb,N,instante,qe,0.025,Nb);
  procesar_escalon(psi_re,psi_im,ra,rb,N,instante,qe,0.25,Nb);
  procesar_escalon(psi_re,psi_im,ra,rb,N,instante,qe,0.07,Nb);
  procesar_escalon(psi_re,psi_im,ra,rb,N,instante,qe,0.025,Nb);
end
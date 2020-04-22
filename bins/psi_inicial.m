function [psi_t0_re,psi_t0_im]=psi_inicial(x0,lambda,desv,Nx,paso_x)
  psi_t0_re=zeros(1,Nx);
  psi_t0_im=zeros(1,Nx);
    for i=1:Nx
      psi_t0_re(i)=exp(-((i*paso_x-x0)/desv).^2)*cos(2*pi*(i*paso_x-x0)/lambda);
      psi_t0_im(i)=exp(-((i*paso_x-x0)/desv).^2)*sin(2*pi*(i*paso_x-x0)/lambda);
    endfor
  psi_t0=[psi_t0_re,psi_t0_im];
endfunction
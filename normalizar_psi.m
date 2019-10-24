function [psi_re,psi_im]=normalizar_psi(psi_re,psi_im,Nx,paso_x)
  A=0;
  for i=1:Nx
    A=A+(psi_re(i).^2+psi_im(i).^2);
  endfor
  A=sqrt(A);
  psi_re=psi_re/A;
  psi_im=psi_im/A;
endfunction
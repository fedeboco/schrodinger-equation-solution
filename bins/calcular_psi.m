function [psi_re,psi_im]=calcular_psi(psi_re,psi_im,ra,rb,potencial,N)
  V=potencial;

  Nx=N(1);
  Nt=N(2);
  
  psi_re_0=psi_re(1);
  psi_re_f=psi_re(end);
  psi_im_0=psi_im(1);
  psi_im_f=psi_im(end);

  for i=1:Nt
      psi_re=psi_re(2:Nx-1)-ra*(psi_im(3:Nx)-2*psi_im(2:Nx-1)+psi_im(1:Nx-2))+rb.*V(2:Nx-1).*psi_im(2:Nx-1);
      psi_re=[psi_re_0 psi_re psi_re_f];
      psi_im=psi_im(2:Nx-1)+ra*(psi_re(3:Nx)-2*psi_re(2:Nx-1)+psi_re(1:Nx-2))-rb.*V(2:Nx-1).*psi_re(2:Nx-1);
      psi_im=[psi_im_0 psi_im psi_im_f];
  end

endfunction

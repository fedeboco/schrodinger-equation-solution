function [psi_re psi_im]=procesar_libre(psi_re,psi_im,ra,rb,N,instante,potencial)
      file_w=sprintf("libre_%d.csv",instante*10^15);
      file_w_comp=sprintf("libre_componentes_%d.csv",instante*10^15);
      
      [psi_re, psi_im]= calcular_psi(psi_re,psi_im,ra,rb,potencial,N); %calcula psi(x,instante)
      densidad=psi_re.^2+psi_im.^2;
      dlmwrite(file_w,densidad,',');
      dlmwrite(file_w_comp,psi_re+i*psi_im,',');
end
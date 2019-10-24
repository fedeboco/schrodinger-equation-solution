function [psi_re psi_im]=procesar_barrera(psi_re,psi_im,ra,rb,N,instante,qe,altura_V,Nb)
       Nx=N(1);
       file_w=sprintf("barrera_%d_%d.csv",instante*10^15,altura_V);
       file_w_comp=sprintf("barrera_componentes_%d_%d.csv",instante*10^15,altura_V);
   
       for x=1:Nx
        potencial(x)=((0<x)&(x<(Nx/2))).*0 + (((Nx/2)<x)&(x<((Nx/2)+Nb))).*(altura_V*qe) + ((((Nx/2)+Nb)<x)&(x<Nx)).*0;
       end
        [psi_re, psi_im]= calcular_psi(psi_re,psi_im,ra,rb,potencial,N); %calcula psi(x,instante)
        densidad=psi_re.^2+psi_im.^2;
        dlmwrite(file_w,densidad,',');
        dlmwrite(file_w_comp,psi_re+i*psi_im,',');
end
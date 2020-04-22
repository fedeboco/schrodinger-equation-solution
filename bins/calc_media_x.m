function media=calc_media_x(densidad,start,Nx,paso_x)
  media=0;
  for i=start:Nx
    media=media+densidad(i)*i*paso_x;
  end
end
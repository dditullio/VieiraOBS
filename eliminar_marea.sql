set @idmarea=;

delete from muestras_biologicas
where idmarea=@idmarea;
delete from muestras_bycatch
where idmarea=@idmarea;
delete from muestras_coccion
where idmarea=@idmarea;
delete from muestras_danio
where idmarea=@idmarea;
delete from muestras_rayas
where idmarea=@idmarea;
delete from muestras_rinde
where idmarea=@idmarea;
delete from muestras_senasa_callos
where idmarea=@idmarea;
delete from muestras_senasa_entera
where idmarea=@idmarea;
delete from muestras_talla
where idmarea=@idmarea;

delete from lances
where idmarea=@idmarea;
delete FROM vieira.mareas
where idmarea=@idmarea;
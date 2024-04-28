planta(cuajilote).
planta(cuasia).
planta(damiana).

trata(cuajilote, estrenimiento_cronico).
trata(cuajilote, anasarca).
trata(cuasia, diabetes).
trata(cuasia, artritis).
trata(cuasia, reumatismo).
trata(cuasia, dolores_cuerpo).
trata(cuasia, migrana).
trata(cuasia, dolor_estomago).
trata(damiana, impotencia_temporal).
trata(damiana, diabetes).
trata(damiana, nefritis).
trata(damiana, cistitis).
trata(damiana, problemas_vejiga).

advertencia(cuajilote, gastroenteritis).
advertencia(cuajilote, rectitis).
advertencia(cuajilote, enterocolitis).
advertencia(cuasia, ninguno).
advertencia(damiana, ninguno).

metodo_uso(cuasia, te_corteza).
metodo_uso(damiana, te).

cultura_herbolario(griegos).
cultura_herbolario(egipcios).
cultura_herbolario(chinos).
cultura_herbolario(aztecas).

uso_herbolario(griegos, asp_salix).
uso_herbolario(egipcios, aloe).
uso_herbolario(chinos, gingko).
uso_herbolario(aztecas, chocolatl).

derivado_de(aspirina, asp_salix).
derivado_de(digital, digitalis_purpurea).
derivado_de(morfina, papaver_somniferum).

uso_moderado(P) :- advertencia(P, gastroenteritis); advertencia(P, rectitis); advertencia(P, enterocolitis).
uso_tisana(P) :- metodo_uso(P, te); metodo_uso(P, te_corteza).
importancia_herbolario(Cultura, Planta) :- cultura_herbolario(Cultura), uso_herbolario(Cultura, Planta).
efectos_secundarios(Medicamento) :- derivado_de(Medicamento, Planta), planta(Planta), not(uso_herbolario(_, Planta)).
contraste_herbolario_medicina(Planta, Medicamento) :-
    planta(Planta), 
    derivado_de(Medicamento, Planta), 
    efectos_secundarios(Medicamento),
    write('La planta '), write(Planta),
    write(' tiene un derivado moderno llamado '), write(Medicamento),
    write(' que puede tener efectos secundarios.').

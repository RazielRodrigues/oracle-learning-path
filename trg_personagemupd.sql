crecreate or replace trigger trg_pers_upsal

before update
of salario
on personagem
for each row
  begin
  
    insert into log_personagem(id_log, id ,salario_velho, salario_novo, usuario, datahora)
      values(seq_log_progexec,:old.id,:old.salario,:new.salario,user,sysdate);
  
end;

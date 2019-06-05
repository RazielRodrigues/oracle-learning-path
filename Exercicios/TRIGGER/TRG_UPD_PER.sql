crecreate or replace trigger trg_pers_upsal

before update
of salario
on personagem
for each row
  begin
  
    insert into log_personagem(id_log, id ,salario_velho, salario_novo, usuario, datahora)
      values(seq_log_progexec,:old.id,:old.salario,:new.salario,user,sysdate);
  
end;



create or replace trigger trg_pers_upsal
before insert or update
of salario
on personagem
for each row
  begin
  
  if updating then
      insert into log_personagem(id_log,salario_velho, salario_novo, usuario,operacao ,datahora)
      values(:old.id,:old.salario,:new.salario,user,'update',sysdate);
  end if;
  
  if inserting then
      insert into log_personagem(id_log,salario_velho, salario_novo, usuario, operacao,datahora)
      values(:new.id,:old.salario,:new.salario,user,'insert',sysdate); 
  end if;
  
  if deleting then
      insert into log_personagem(id_log,salario_velho, salario_novo, usuario, operacao,datahora)
      values(:old.id,:old.salario,:new.salario,user,'delete',sysdate);
  end if;
  
end;


create or replace 
function func_aumprecoprod(p_id in number, p_taxa in number)

  return number
  
is

  retorno number(3) := 0;
  vqtde number(1);
  vpreco produto_rz.preco_produto%type;
  vpreconovo number;

begin
  
  if p_taxa > -15 and p_taxa <= 15 then
    if p_taxa is not null then
      select count(*) into vqtde from produto_rz where id_produto = p_id;
      
          if vqtde = 1 then
              select preco_produto into vpreco 
              from produto_rz 
              where id_produto = p_id;
                vpreconovo := vpreco + (vpreco * (p_taxa /100));
                  
                  if vpreconovo > 0 and vpreconovo <= 9999.99
                  and vpreconovo is not null then
                    
                    update produto_rz 
                    set preco_produto = vpreconovo, data_preco = sysdate
                    where p_id = id_produto;

                  else
                  retorno := -996;-- valor do preco novo fora da faixa
                  end if;
              
          else
          retorno := -997; -- id inexistente
          end if;
          
       else
       retorno := -998; -- taxa nula
       end if;
       
  else
    retorno := -999; -- porcentagem fora da faixa
  end if;

commit;
return retorno;
end;

create or replace 
package package_rz as

  function func_pega_sal(p_id in number)
  return number;
  
  function func_pega_dep(p_dep in number)
  return varchar2;

end package_rz;


-- CORPO DAS FUNÇÕES
create or replace package body package_rz as

function func_pega_sal(p_id in number)
return number;
is
  vsal number employees.salary%type;
begin
  select salary into vsal from employees
  where employee_id = p_id;
return vsal ;
end;

function func_pega_dep(p_dep in number)
return varchar2;
is
nomedep departments.departments_name%type;
begin
  select department_name into nomedep from employees e
  inner join departments d
  on e.employee_id = d.department_id;
return nomedep;
end;

end package_rz;
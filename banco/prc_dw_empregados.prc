CREATE OR REPLACE PROCEDURE prc_dw_empregados(data_base VARCHAR2)
IS
  vDataBase DATE := TO_DATE(data_base,'RRRR-MM-DD');
  CURSOR vEmpregados IS
  SELECT * 
  FROM hr.employees e
  WHERE e.hire_date >= vDataBase;
    
BEGIN
  DELETE dw_empregados;
  
  FOR empregado IN vEmpregados LOOP
      INSERT INTO dw_empregados(employee_id, 
                                first_name, 
                                last_name, 
                                email, 
                                phone_number, 
                                hire_date, 
                                job_id, 
                                salary, 
                                commission_pct, 
                                manager_id, 
                                department_id) 
               VALUES(empregado.employee_id, 
                      empregado.first_name, 
                      empregado.last_name, 
                      empregado.email, 
                      empregado.phone_number, 
                      empregado.hire_date, 
                      empregado.job_id, 
                      empregado.salary, 
                      empregado.commission_pct, 
                      empregado.manager_id, 
                      empregado.department_id);
  END LOOP;
  COMMIT;
EXCEPTION
    WHEN others THEN
    ROLLBACK;
    DBMS_OUTPUT.PUT_LINE ('Error');
END prc_dw_empregados;
/

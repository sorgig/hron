select first_name, last_name, title, department_id 
from employee, job;

--mostrare i dipendenti che hanno il salario minimo o il salario massimo
select e.first_name, e.last_name, e.salary
from employee e joim job j using (job_id)
where e.salary = j.min_salary or e.salary = j.max_salary;

--nome dei dipendenti che hanno base in UK
select e.first_name, e.last_name, l.country_id
from employee e join department d using (department_id)
	join location l using (location_id)
where country_id = 'UK';

--nome dei dipendenti e il manager associato
select d.name, e.first_name, e.last_name
from employee e join department d on e.employee_id = d.manager_id;

--nome di ogni dipartimento e, se esiste, relativo manager
select d.name, e.first_name, e.last_name
from employee e right outer join department d on e.employee_id = d.manager_id;

select count(*)
from employee;

select count(*)
from employee
where first_name = 'Peter';

select first_name, last_name
from employee 
where first_name like 'P%';

select count(*)
from employee 
where first_name like 'P%';




--esercizi su group by subquery e altra robina

--salario medio per job_id
select avg(salary) as avg_salary, job_id
from employee
group by job_id
order by avg_salary desc;

--somma salari per posizione
select sum(salary) as avg_salary, job_id
from employee
group by job_id
order by avg_salary desc;

--n dipendenti per job_id count star per tutte le righe
select count(*) as num_emp, job_id
from employee
group by job_id
order by num_emp desc;


select count(*) as num_emp, job_id
from employee
group by job_id
having job_id = 15
order by num_emp desc;





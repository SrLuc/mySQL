/*
Relatório 1 - 
Lista dos empregados admitidos entre 2022-01-01 e 2022-03-31, 
trazendo as colunas (Nome Empregado, CPF Empregado, Data Admissão,  Salário, Cidade Moradia, Número de Telefone), 
ordenado por data de admissão decrescente;
*/

select Em.CPF, Em.nome, Em.dataAdm, Em.salario, En.cidade, Te.numero
from Empregado as Em join Endereco as En join telefone as Te
on Em.cpf = Te.Empregado_CPF
where dataAdm >= '2022-01-01' and dataDem <= '2022-03-31';
/*VAZIA*/

/*
Lista dos empregados que ganham menos que a média salarial dos funcionários do Posto de Gasolina, trazendo as colunas 
(Nome Empregado, CPF Empregado, Data Admissão,  Salário, Cidade Moradia), ordenado por nome do empregado;
*/

select AVG(Em.salario)as mediaSalarial, Em.nome, Em.CPF, Em.dataAdm, Em.salario, En.cidade
from Empregado as Em join Endereco as En;
/*RODOU*/


/*
Lista dos empregados que são da cidade do Recife e possuem dependentes, trazendo as 
colunas (Nome Empregado, CPF Empregado, Data Admissão,  Salário, Cidade Moradia, Quantidade de Dependentes), ordenado por nome do empregado;
*/

select Em.nome, Em.CPF, Em.dataAdm, Em.salario, En.cidade, COUNT(parentesco) As quantidadeParentesco
from Empregado as Em JOIN dependente as Dep JOIN endereco as En
on Em.CPF = Dep.Empregado_CPF and En.Empregado_CPF = Dep.Empregado_CPF;
/*NAO TA TAO COERENTE/


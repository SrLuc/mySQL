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
	Relatório 2 -
	Lista dos empregados que ganham menos que a média salarial dos funcionários do Posto de Gasolina, trazendo as colunas 
	(Nome Empregado, CPF Empregado, Data Admissão,  Salário, Cidade Moradia), ordenado por nome do empregado;
*/

select AVG(Em.salario)as mediaSalarial, Em.nome, Em.CPF, Em.dataAdm, Em.salario, En.cidade
from Empregado as Em join Endereco as En;
/*RODOU*/


/*
	Relatório 3
	Lista dos empregados que são da cidade do Recife e possuem dependentes, trazendo as 
	colunas (Nome Empregado, CPF Empregado, Data Admissão,  Salário, Cidade Moradia, Quantidade de Dependentes), ordenado por nome do empregado;
*/

SELECT E.nome, E.CPF, E.dataAdm, E.salario, En.cidade, Dep.parentesco, count(Dep.parentesco) AS quantidadeParentes
FROM Empregado AS E JOIN Endereco AS En JOIN Dependente As Dep
ON E.cpf = En.Empregado_CPF AND Dep.empregado_CPF = E.cpf
GROUP BY E.CPF
ORDER BY E.nome;
/*RODOU*/


/*
	Relatório 4 - 
    Lista dos empregados com a quantidade total de vendas já realiza por cada Empregado, 
    trazendo as colunas (Nome Empregado, CPF Empregado, Sexo, Salário, Quantidade Vendas, Total Valor Vendido), ordenado por quantidade total de vendas realizadas;
*/

SELECT E.nome, E.CPF, E.sexo, E.salario, COUNT(V.idVendas) AS quantidadeVendas, SUM(V.valorTotal) AS valorTotalVendas
FROM empregado AS E JOIN vendas AS V
ON E.CPF = V.Empregado_CPF
GROUP BY E.CPF
ORDER BY V.idVendas;
/*RODOU KRL/

/*
	Relatório 5 - 
    Lista dos empregados que trabalham em cada departamento, 
    trazendo as colunas 
    (Nome Empregado, CPF Empregado, Salário, Nome da Ocupação, Número do Telefone do Empregado, Nome do Departamento, 
    Local do Departamento, Número de Telefone do Departamento, Nome do Gerente), 
    ordenado por nome do Departamento;
*/

SELECT E.nome, E.CPF, E.salario, O.nome AS Ocupação, D.nome AS DerpatamentoNome, D.localDep, T.numero AS FoneDepartamento, G.empregado_cpf
FROM Empregado AS E JOIN Gerente AS G JOIN Departamento AS D JOIN Telefone AS T JOIN Ocupacao AS O JOIN Trabalhar AS Ta
ON E.CPF = G.Empregado_CPF AND 
D.Gerente_Empregado_CPF = G.Empregado_CPF AND
G.empregado_cpf = E.CPF AND
E.CPF = T.Empregado_CPF AND
O.cbo = Ta.Ocupacao_cbo
GROUP BY E.nome
ORDER BY D.nome;
/*N to conseguindo*/


/*
	Relatório 6 - 
    Lista dos departamentos contabilizando o número total de empregados por departamento, trazendo as colunas 
    (Nome Departamento, Local Departamento, Total de Empregados do Departamento, Nome do Gerente, Número do Telefone do Departamento), ordenado por nome do Departamento;
*/

/*
	Relatório 7 - 
    Lista das formas de pagamentos mais utilizadas nas Vendas, informando quantas vendas cada forma de pagamento já foi relacionada, 
    trazendo as colunas (Tipo Forma Pagamento, Quantidade Vendas, Total Valor Vendido), ordenado por quantidade total de vendas realizadas;
*/

/*
	Relatório 8 - 
    Lista das Vendas, informando o detalhamento de cada venda quanto os seus itens, 
    trazendo as colunas (Data Venda, Nome Produto, Quantidade ItensVenda, Valor Produto, Valor Total Venda, Nome Empregado, Nome do Departamento), ordenado por Data Venda;
*/

/*
	Relatório 9 - 
    Balaço das Vendas, informando a soma dos valores vendidos por dia, 
    trazendo as colunas (Data Venda, Quantidade de Vendas, Valor Total Venda), ordenado por Data Venda;
*/

/*
	Relatório 10 - 
    Lista dos Produtos, informando qual Fornecedor de cada produto, 
    trazendo as colunas (Nome Produto, Valor Produto, Categoria do Produto, Nome Fornecedor, Email Fornecedor, Telefone Fornecedor), ordenado por Nome Produto;
*/

/*
	Relatório 11 - 
    Lista dos Produtos mais vendidos, informando a quantidade (total) de vezes que cada produto participou em vendas, 
    trazendo as colunas (Nome Produto, Quantidade (Total) Vendas), ordenado por quantidade de vezes que o produto participou em vendas;
*/


/*
	Relatório 12 - 
    Lista das vendas por departamentos contabilizando o número total de vendas por departamento, 
    trazendo as colunas (Nome Departamento, Local Departamento, Nome do Gerente,  Total de Vendas,  Valor Total das Vendas), ordenado por nome do Departamento;
*/




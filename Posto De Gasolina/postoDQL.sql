/*
	Relatório 1 - 
	Lista dos empregados admitidos entre 2022-01-01 e 2022-03-31, 
	trazendo as colunas (Nome Empregado, CPF Empregado, Data Admissão,  Salário, Cidade Moradia, Número de Telefone), 
	ordenado por data de admissão decrescente;
*/

	select E.nome, E.CPF, E.dataAdm, E.salario, En.cidade, T.numero
		from Empregado E
			join Endereco En on E.CPF = En.empregado_CPF and E.dataAdm >= '2022-01-01' and dataAdm <= '2023-03-31'
			join Telefone T on E.CPF = T.empregado_CPF;
												/*RODOU*/

/*
	Relatório 2 -
	Lista dos empregados que ganham menos que a média salarial dos funcionários do Posto de Gasolina, trazendo as colunas 
	(Nome Empregado, CPF Empregado, Data Admissão,  Salário, Cidade Moradia), ordenado por nome do empregado;
*/

	select E.nome, E.CPF, E.dataAdm, E.salario, En.cidade
		from Empregado E 
			join Endereco En
				on E.salario <= 1989 and E.CPF = En.empregado_CPF
					order by E.nome;
							/*RODOU*/


/*
	Relatório 3
	Lista dos empregados que são da cidade do Recife e possuem dependentes, trazendo as 
	colunas (Nome Empregado, CPF Empregado, Data Admissão,  Salário, Cidade Moradia, Quantidade de Dependentes), ordenado por nome do empregado;
*/

	select E.nome, E.CPF, E.dataAdm, E.salario, En.cidade, Dep.parentesco, count(Dep.parentesco) as quantidadeParentes
		from Empregado E 
			join Endereco En 
			join Dependente Dep
				on E.cpf = En.Empregado_CPF and Dep.empregado_CPF = E.cpf
					group by E.CPF
					order by E.nome;
							/*RODOU*/

/*
	Relatório 4 - 
    Lista dos empregados com a quantidade total de vendas já realiza por cada Empregado, 
    trazendo as colunas (Nome Empregado, CPF Empregado, Sexo, Salário, Quantidade Vendas, Total Valor Vendido), ordenado por quantidade total de vendas realizadas;
*/

	select E.nome, E.CPF, E.sexo, E.salario, COUNT(V.idVendas) quantidadeVendas, SUM(V.valorTotal) AS valorTotalVendas
		from empregado as E join vendas as V
			on E.CPF = V.Empregado_CPF
				group by E.CPF
				order by V.idVendas;
							/*RODOU*/

/*
	Relatório 5 - 
    Lista dos empregados que trabalham em cada departamento, 
    
    trazendo as colunas 
    (Nome Empregado, CPF Empregado, Salário, Nome da Ocupação, Número do Telefone do Empregado, Nome do Departamento, 
    Local do Departamento, Número de Telefone do Departamento, Nome do Gerente), 
    ordenado por nome do Departamento;
*/


/*
	Relatório 6 - 
    Lista dos departamentos contabilizando o número total de empregados por departamento, trazendo as colunas 
    (Nome Departamento, Local Departamento, Total de Empregados do Departamento, Nome do Gerente, Número do Telefone do Departamento), 
    ordenado por nome do Departamento;
*/




/*
	Relatório 7 - 
    Lista das formas de pagamentos mais utilizadas nas Vendas, informando quantas vendas cada forma de pagamento já foi relacionada, 
    trazendo as colunas (Tipo Forma Pagamento, Quantidade Vendas, Total Valor Vendido), ordenado por quantidade total de vendas realizadas;
*/

	select FP.tipoPag, count(V.idVendas) as QuantidadeVendas, sum(V.valorTotal)
		from Vendas V
			join FormaPag FP on FP.idFormaPag = V.idVendas and V.idVendas = FP.Vendas_idVendas
				group by FP.tipoPag
                order by QuantidadeVendas;
                /*rodou filha da puta*/

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
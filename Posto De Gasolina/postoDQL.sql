/*
	Relatório 1 - 
	Lista dos empregados admitidos entre 2022-01-01 e 2022-03-31, 
	trazendo as colunas (Nome Empregado, CPF Empregado, Data Admissão,  Salário, Cidade Moradia, Número de Telefone), 
	ordenado por data de admissão decrescente;
*/

	select E.nome, E.CPF, E.dataAdm, E.salario, En.cidade, T.numero
		from Empregado E
			join Endereco En on E.CPF = En.empregado_CPF and E.dataAdm >= '2022-01-01' and dataAdm <= '2023-03-31'
			join Telefone T on E.CPF = T.empregado_CPF
												

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



/*
	Relatório 3
	Lista dos empregados que são da cidade do Recife e possuem dependentes, trazendo as 
	colunas (Nome Empregado, CPF Empregado, Data Admissão,  Salário, Cidade Moradia, Quantidade de Dependentes), ordenado por nome do empregado;
*/

	select E.nome, E.cpf, E.dataAdm, E.salario, En.cidade, count(Dep.nome)"Quantidade de Dependente"
		from Empregado E
				join Endereco En on En.empregado_cpf = E.CPF
                join Dependente Dep on Dep.empregado_cpf = E.CPF
					group by E.dataAdm
                    order by En.cidade DESC;
							

	select E.nome, E.CPF, E.dataAdm, E.salario, En.cidade, Dep.parentesco, count(Dep.parentesco) as quantidadeParentes
		from Empregado E 
			join Endereco En 
			join Dependente Dep
				on E.cpf = En.Empregado_CPF and Dep.empregado_CPF = E.cpf
					group by E.CPF
					order by E.nome;

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


/*
	Relatório 5 - 
    Lista dos empregados que trabalham em cada departamento, 
    
    trazendo as colunas 
    (Nome Empregado, CPF Empregado, Salário, Nome da Ocupação, Número do Telefone do Empregado, Nome do Departamento, 
    Local do Departamento, Número de Telefone do Departamento, Nome do Gerente), 
    ordenado por nome do Departamento;
*/

	select E.nome, E.cpf, E.salario, T.numero "Telefone Do Empregado", D.nome, D.localDep, Eg.nome "Gerente", O.nome "Ocupação", Te.numero
		from Empregado E
			join Telefone T on T.empregado_cpf = E.cpf
            join Trabalhar Tra on Tra.empregado_cpf = E.cpf
            join Departamento D on Tra.empregado_cpf = D.gerente_empregado_Cpf
			join telefone Te on Te.departamento_idDepartamento = D.IdDepartamento
            join Ocupacao O on O.cbo = Tra.ocupacao_Cbo
            join gerente G on G.empregado_Cpf = d.gerente_empregado_cpf
            join Empregado Eg on Eg.cpf = G.empregado_cpf
				order by d.nome;

/*
	Relatório 6 - 
    Lista dos departamentos contabilizando o número total de empregados por departamento, trazendo as colunas 
    (Nome Departamento, Local Departamento, Total de Empregados do Departamento, Nome do Gerente, Número do Telefone do Departamento), 
    ordenado por nome do Departamento;
*/


	select D.nome, D.localDep, count(Tra.Empregado_cpf)"Quantidade de Empregado", Em.nome"Gerente", T.numero"Telefone Departamento"
		from Departamento D
			join Trabalhar Tra on Tra.Departamento_idDepartamento
			join Gerente G on G.empregado_cpf = D.gerente_empregado_cpf
            join Empregado E on E.cpf = G.empregado_cpf
            join Empregado Em on Em.cpf = G.empregado_Cpf
            join Telefone T on T.departamento_idDepartamento = D.idDepartamento
				group by T.numero
                order by D.nome;



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
                

	select FP.tipoPag, count(V.idVendas) as QuantidadeVendas, sum(V.valorTotal)
		from Vendas V
			join FormaPag FP on FP.idFormaPag = V.idVendas and V.idVendas = FP.Vendas_idVendas
				group by FP.tipoPag
                order by QuantidadeVendas;
                /*rodou filha da puta*/

/*
	Relatório 8 - 
    Lista das Vendas, informando o detalhamento de cada venda quanto os seus itens, 
    trazendo as colunas (Data Venda, Nome Produto, Quantidade ItensVenda, Valor Produto, Valor Total Venda, Nome Empregado, Nome do Departamento), 
    ordenado por Data Venda;
*/

	select dataVenda, Es.nome, Count(IV.Vendas_idVendas)"Quantidade ItensVenda", Es.valor, SUM(V.valorTotal)"Valor total Venda", E.nome, D.nome
		from Vendas V
			join ItensVenda IV on V.idVendas = IV.Vendas_idVendas
			join Estoque Es on Es.idProduto = IV.Estoque_idproduto
            join Empregado E on E.cpf = V.empregado_cpf
			join Trabalhar Tra on Tra.empregado_Cpf = E.cpf
            join Departamento D on D.gerente_empregado_Cpf
				group by ES.nome
				order by V.dataVenda;


/*
	Relatório 9 - 
    Balaço das Vendas, informando a soma dos valores vendidos por dia, 
    trazendo as colunas (Data Venda, Quantidade de Vendas, Valor Total Venda), ordenado por Data Venda;
*/

	select V.dataVenda, count(IV.Vendas_idVendas)"Quantidade de Vendas", sum(V.ValorTotal) "Valor Total de Venda"
		from Vendas V
			join ItensVenda IV on V.idVendas = IV.Vendas_idVendas
			join Estoque Es on Es.idProduto = IV.Estoque_idProduto
				group by date(V.dataVenda)
                order by V.dataVenda;
                
/*
	Relatório 10 - 
    Lista dos Produtos, informando qual Fornecedor de cada produto, 
    trazendo as colunas (Nome Produto, Valor Produto, Categoria do Produto, Nome Fornecedor, Email Fornecedor, Telefone Fornecedor), 
    ordenado por Nome Produto;
*/
	select E.nome"Produto", E.valor, E.categoria, F.nome"Fornecedor", F.email, T.numero"Numero do Fornecedor"
		from Fornecedor F
			join Compras C on C.fornecedor_cnpjcpf = F.cnpjcpf
            join Estoque E on E.idProduto = C.estoque_idProduto
            join ItensVenda IV on IV.estoque_idProduto = E.idproduto
            join Telefone T on T.Fornecedor_cnpjcpf = F.cnpjcpf;
/*
	Relatório 11 - 
    Lista dos Produtos mais vendidos, informando a quantidade (total) de vezes que cada produto participou em vendas, 
    trazendo as colunas (Nome Produto, Quantidade (Total) Vend
    as), ordenado por quantidade de vezes que o produto participou em vendas;
*/

	select Es.nome, count(IV.Vendas_idVendas) 
		from Estoque Es
			join ItensVenda IV on ES.idProduto = IV.Estoque_idProduto
				group by IV.vendas_idvendas
                order by Iv.vendas_idVendas;

/*
	Relatório 12 - 
    Lista das vendas por departamentos contabilizando o número total de vendas por departamento, 
    trazendo as colunas (Nome Departamento, Local Departamento, Nome do Gerente,  Total de Vendas,  Valor Total das Vendas), ordenado por nome do Departamento;
*/


	select De.nome"Nome Departamento", D.localDep, Eg.nome"Gerente", count(IV.vendas_idVendas)"Total de Vendas", sum(V.valorTotal)"Valor total das Vendas"
		from Departamento D
			join Gerente G on G.empregado_Cpf = D.gerente_empregado_Cpf
            join Empregado E on E.cpf = G.empregado_cpf
            join Empregado Eg on Eg.cpf = G.empregado_cpf
            join Vendas V on E.cpf = V.empregado_cpf
            join ItensVenda IV on V.idVendas = IV.vendas_idVendas
            join Departamento De on De.gerente_empregado_cpf = G.empregado_cpf
				group by IV.Vendas_idVendas
                order by De.nome;


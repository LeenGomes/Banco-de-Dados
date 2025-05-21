# Data Query Language

## DQL

''' sql

SELECTS [campos]
FROM [tabelas]
JOIN [tabelas] ON [relacionamentos]
WHERE [critérios]
GROUP BY [campos]
HAVING [critérios]
ORDER BY [campos]

# Consultas Básicas

# Listar todos os clientes pessoa física com seus nomes e CPFs.
SELECT nome, cpf
FROM pessoa_fisica
ORDER BY nome;

# Exibir o nome fantasia e CNPJ de todas as pessoas jurídicas cadastradas.
SELECT nome_fantasia, cnpj
FROM pessoa_juridica
ORDER BY nome_fantasia;

# Listar todos os emails cadastrados no sistema.
SELECT email
FROM email;

# Exibir todos os endereços do tipo "Residencial", mostrando logradouro, número e cidade.
SELECT *
FROM endereco
WHERE tipo LIKE 'Residencial'

# Listar todos os números de telefone do tipo "Movel".
SELECT 
FROM telefone
WHERE tipo LIKE 'Movel'

# Consultas Intermediárias

# Listar o nome e CPF de todas as pessoas físicas ativas.
SELECT pf.nome, pf.cpf
FROM pessoa_fisica pf
INNER JOIN cliente c ON pf.id = c.id 
WHERE c.ativo = TRUE

# Listar o nome fantasia e a quantidade de telefones cadastrados por pessoa jurídica.
SELECT pj.nome_fantasia, COUNT(t.numero) AS quantidade
FROM pessoa_juridica pj
INNER JOIN cliente c ON pj.id = c.id
LEFT JOIN telefone t ON  t.cliente_id = c.id
GROUP BY   pj.nome_fantasia


# Exibir o nome (PF ou PJ), o tipo de cliente e a cidade de todos os clientes que possuem endereço.

SELECT DISTINCT
    COALESCE(pessoa_fisica.nome, pessoa_juridica.nome_fantasia) AS nome,
    CASE
       WHEN pessoa_fisica.id IS NOT NULL THEN 'Pessoa Física'
       WHEN pessoa_juridica.id IS NOT NULL THEN 'Pessoa Jurídica'
    END AS tipo_cliente,
    endereco.cidade
FROM cliente
LEFT JOIN pessoa_fisica ON cliente.id = pessoa_fisica.id
LEFT JOIN pessoa_juridica ON cliente.id = pessoa_juridica.id
INNER JOIN endereco ON cliente.id = endereco.cliente_id;



# Exibir o nome e email de todas as pessoas físicas que possuem mais de um email cadastrado.
# Listar todos os clientes (PF e PJ) que não possuem nenhum telefone cadastrado.

Consultas Avançadas
# Listar o nome (PF ou PJ) de todos os clientes que possuem pelo menos dois telefones e pelo menos um email.
# Listar os nomes e cidades dos clientes (PF ou PJ) que têm endereços tanto residenciais quanto comerciais.
# Listar todos os clientes (PF e PJ) com todos os seus contatos (email, telefone e endereço), mesmo que alguns desses dados estejam ausentes.
# Exibir a quantidade total de clientes ativos e inativos, separando por tipo (PF e PJ).
Para cada cliente, exibir:
tipo (PF ou PJ),
nome,
total de emails,
total de telefones,
total de endereços. Ordenar pelo total de contatos (soma dos três).
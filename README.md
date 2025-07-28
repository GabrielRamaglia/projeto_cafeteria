# ☕ Sistema de Gerenciamento - Café Aroma

## 📋 Descrição do Projeto

Este projeto tem como objetivo modelar o banco de dados relacional do **Café Aroma**, uma rede emergente de cafeterias especializada em cafés especiais de diversas origens. A modelagem visa atender às necessidades de gerenciamento operacional e estratégico da rede, incluindo:

- Pedidos
- Clientes
- Produtos e ingredientes especiais
- Funcionários e suas localizações
- Promoções
- Filiais
- Notas fiscais

## 🧠 Contexto

O Café Aroma está em plena expansão e enfrenta desafios relacionados à organização de suas operações. A administração quer uma solução que:

- Registre detalhadamente os pedidos dos clientes, incluindo ingredientes adicionais e promoções aplicadas.
- Gerencie filiais, funcionários, endereços e contatos.
- Acompanhe o desempenho de produtos e preferências dos clientes.
- Auxilie na gestão de promoções sazonais e controle de estoque de ingredientes especiais.

## 🗂️ Estrutura da Modelagem

A modelagem foi realizada com base nos princípios da **normalização de dados**, buscando reduzir redundâncias e manter a integridade referencial. O projeto contempla as seguintes entidades principais:

### 👥 Funcionário
- Registro de funcionários com setor, remuneração, endereço e loja vinculada.
- Contato telefônico e e-mail.

### 🏬 Filial
- Cadastro de filiais com CNPJ, nome, telefone e localização.

### 📦 Produto
- Nome, valor, unidade de medida e validade.
- Possibilidade de associação a ingredientes especiais.

### 🧂 Ingredientes Especiais
- Itens adicionais que podem ser vinculados aos produtos ou pedidos.
- Controle de validade e quantidade.

### 📑 Pedido
- Registro de data, hora, forma de pagamento e nota fiscal.
- Ligação com cliente, produtos e promoções.

### 🎟️ Promoção
- Promoções aplicáveis aos produtos com descrição, validade e percentual de desconto.

### 📥 Nota Fiscal (NF)
- Armazena status e data/hora de emissão.

### 👤 Cliente
- Cadastro de clientes com CPF, nome, e-mail, telefone e endereço.

## 🔗 Relacionamentos

- **Relacionamentos N:M** foram tratados com tabelas auxiliares:
  - `PEDIDOS_PRODUTOS`
  - `PROD_PROMO`
  - `PROD_INGRED_ESPECIAIS`

- Todos os relacionamentos possuem **chaves estrangeiras** bem definidas.

## 🧱 Ferramentas Utilizadas

- Modelo desenvolvido no **Excel** com estrutura visual normalizada.
- Utilização de tipos SQL padrão como `VARCHAR`, `DECIMAL`, `DATE`, `TIME`, `INT`, `ENUM`.
- MySql Worckbench.
- DrawIo


##### 🗃️ Modelagem entidade relacionamento do projeto.
![Modelagem entidade relacionamento do projeto](https://github.com/GabrielRamaglia/projeto_cafeteria/blob/main/IMG/Cafe_MODELO_ENTIDADE_RELACIONAMENTO.png)

##### 🗃️ Modelagem relacional já norm\lizada até a 3° forma normal.
![Modelagem relacional já normalizada até a 3° forma normal](https://github.com/GabrielRamaglia/projeto_cafeteria/blob/main/IMG/CAFE_MODELAGEM_REACIONAL_NORMALIZADO.png)

## 🧑‍💻 Autor

Gabriel Ramaglia  
Estudante de Análise e Desenvolvimento de Sistemas | Foco em Ciência de Dados

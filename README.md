# AdventureWorks - Análise de Vendas
<img width="1021" height="576" alt="image" src="https://github.com/user-attachments/assets/ffe047c7-fc10-4755-8523-015d8aa7661c" />

O gráfico indica uma loja de materiais esportivos, onde o boné AWC Logo Cap é o produto mais vendido, bem à frente dos demais. O faturamento total é de $123,22 milhões, com crescimento forte entre 2011 e 2013. A queda em 2014 reflete dados parciais — a base cobre apenas até meados do ano — e não representa declínio real de vendas.


## Ferramentas Usadas
- SQL
- Power BI
  
## Modelagem
O projeto segue o padrão de modelagem dimensional (fato/dimensão), com views criadas no MySQL a partir do banco AdventureWorks2019:

- **vw_fato_vendas** — pedidos de venda (grão: pedido), com faturamento, data, cliente, vendedor e território
- **vw_fato_itens_venda** — itens de cada pedido (grão: item), com produto e quantidade
- **vw_dim_produtos** — produtos, categorias e subcategorias
- **vw_dim_clientes** — dados de clientes
- **vw_dim_vendedores** — dados de vendedores e território

Essa separação entre fatos (métricas) e dimensões (atributos descritivos) permite montar relacionamentos claros no Power BI e evita duplicação de dados.

## Como Reproduzir
1. Baixe o banco AdventureWorks2019 convertido para MySQL: [OLTP-AdventureWorks2019-MySQL](https://github.com/vishal180618/OLTP-AdventureWorks2019-MySQL)
2. Importe o arquivo `.sql` no MySQL Workbench
3. Execute os scripts da pasta `sql/01_views.sql` deste repositório para criar as views usadas no dashboard
4. Abra o arquivo `.pbix` no Power BI Desktop e conecte à sua instância local do MySQL
5. Atualize os dados (Atualizar) para carregar as informações

  

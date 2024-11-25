# **📚 Prova de Banco de Dados - Restaurante Manager 🍽️**

---

## **Olá, Professor Marinke! 👋**

Este é meu projeto de prova. Espero que o senhor goste tanto quanto eu gostei de desenvolvê-lo! Foi um grande desafio e uma oportunidade de colocar em prática os conhecimentos adquiridos em sala. Qualquer feedback será muito bem-vindo. 😊

---

## **📄 Descrição do Projeto**

Este projeto foi desenvolvido para gerenciar os dados relacionados às vendas diárias de um restaurante, incluindo:

- **Gerenciamento por mesa**: Cada mesa possui um número e status (Livre, Ocupada, Sobremesa, Ocupada-Ociosa).  
- **Pedidos e Produtos**: Registro de pedidos e produtos consumidos por mesa.  
- **Clientes**: Mesas podem ser abertas com ou sem identificação de clientes.  
- **Pagamentos**: Vendas são registradas com dados pertinentes, incluindo tipo de pagamento e valor total.  

---

## **🗂️ Estrutura do Banco de Dados**

O banco de dados foi modelado para atender às necessidades de um restaurante com as seguintes tabelas principais:  

1. **funcionarios**: Gerencia os funcionários do restaurante.  
2. **mesas**: Gerencia as mesas e seus status.  
3. **clientes**: Registra os dados dos clientes.  
4. **produtos**: Gerencia o estoque e informações dos produtos.  
5. **pedidos**: Associa mesas aos produtos solicitados.  
6. **produtos_pedidos**: Relaciona produtos e pedidos com quantidade.  
7. **pagamentos**: Controla os métodos de pagamento utilizados.  
8. **vendas**: Registra o fechamento de vendas por mesa.  

---

## **🛠️ Funcionalidades**

- **Adicionar novas mesas, funcionários e produtos.**  
- **Abrir mesas identificadas ou não por cliente.**  
- **Gerenciar pedidos e calcular o valor total automaticamente.**  
- **Registrar vendas com pagamento detalhado.**  
- **Redefinir status de uma mesa automaticamente após fechamento.**

---

## **📊 Consultas e Procedimentos**

### **Exemplo de consultas implementadas:**

1. **Total gasto por mesa e funcionário:**
   ```sql
   SELECT 
       f.nome AS Nome_Funcionario, 
       m.id AS Mesa_Atendida,      
       SUM(p.preco * pp.quantidade) AS Total_Gasto 
   FROM 
       funcionarios f
   JOIN 
       mesas m ON f.id = m.funcionario_id
   JOIN 
       pedidos ped ON m.id = ped.mesa_id
   JOIN 
       produtos_pedidos pp ON ped.id = pp.pedido_id
   JOIN 
       produtos p ON pp.produto_id = p.id
   GROUP BY 
       f.nome, m.id
   ORDER BY 
       f.nome, m.id;

---
**🎯 Conclusão
Este projeto representa um sistema de gerenciamento robusto e funcional para um restaurante. Foi uma excelente oportunidade para aplicar conceitos de modelagem de banco de dados, normalização e criação de consultas eficientes.**

---


**🙏 Agradecimento
Obrigado, Professor Marinke, por todo o aprendizado transmitido durante as aulas. Foi fundamental para a criação deste projeto. Espero que esteja à altura das expectativas! 😊**
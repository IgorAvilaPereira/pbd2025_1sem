# Lista 1

### Base de Dados

Vamos supor que temos uma tabela chamada `funcionarios` com a seguinte estrutura:
```sql
CREATE TABLE funcionarios (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100),
    data_nascimento date,
    departamento VARCHAR(50),
    salario numeric(10, 2)
);
```

### Exercícios

#### 1. Crie uma stored procedure para inserir um novo funcionário na tabela `funcionarios`.



#### 2. Crie uma function que retorne o nome de um funcionário com base em seu ID.



#### 3. Crie uma procedure que aumente o salário de um funcionário em 10% com base no ID.



#### 4. Crie uma stored procedure que delete um funcionário com base no ID.



#### 5. Crie uma function que retorne a média salarial de um departamento específico.



#### 6. Crie uma procedure que atualize o departamento de um funcionário.


#### 7. Crie uma function que retorne a quantidade de funcionários em um determinado departamento.



#### 8. Crie uma procedure que diminua o salário de um funcionário em 5% com base no ID.



#### 9. Crie uma function que retorne a soma dos salários de todos os funcionários.



#### 10. Crie uma stored procedure que liste todos os funcionários de um determinado departamento.



#### 11. Crie uma function que verifique se um funcionário existe na tabela com base no ID.



#### 12. Crie uma procedure que mude o nome de um funcionário com base no ID.



#### 13. Crie uma function que retorne a idade média dos funcionários.



#### 14. Crie uma procedure que insira vários funcionários de uma vez.


#### 15. Crie uma function que retorne o nome do funcionário mais jovem.




#### 16. Crie uma stored procedure que aplique um bônus salarial de acordo com a idade.



#### 17. Crie uma function que retorne a quantidade total de funcionários na tabela.



#### 18. Crie uma procedure que atualize o salário de todos os funcionários em 10%.


#### 19. Crie uma function que retorne o maior salário entre todos os funcionários.



#### 20. Crie uma stored procedure que delete todos os funcionários de um determinado departamento.



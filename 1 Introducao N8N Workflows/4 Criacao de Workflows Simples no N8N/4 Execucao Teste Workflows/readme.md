# Criação de Workflows Simples no N8N
Executando e Testando Workflows no **N8N**.

As informações são passadas entre os nós (**nodes** ) através de um arquivo com os dados no formato **JSON** (Javascript Objecct Notation).

**JSON**, ou JavaScript Object Notation, é um formato de texto leve para trocas de dados.

**API**, ou Interface de Programação de Aplicações, é um conjunto de regras e protcolos que permite que diferentes softwares se cminiquem e interajam entre si, trocando dados (muitas vezes no formato **JSON**) e funcionalidades.

## Hands-On: Testando e Otimizando Workflows para Resultados Confiáveis.

* Continuando  projeto anterior,
* Botão de **Stop** para a execução da autmação.
* Clique nos nós e visualize os dados no formato **JSON**.\
    **{{$json.action}}:** lê o valor da chave **action**.
* Clique no **execute** do nó **Edit Field**
* Se o **input** estiver vazio ele não conseguirá processar corretamente.
* Cada nó pode ser executado separadamente utilizando a opção **Execute Text**.
* Execute os nós, adicione uma mensagem ao chat, analise os dados gerados no formato **JSON** em cada node.
* Adicione mais um **node** e inclua a informações de **mensagem** e **tipo** e execute este nó.
* A aba **Executions** contém todo o histórico de execuções.
* Em cima de cada nó temos as opções: **Execution Step**, **Deactive**, **Delete**, **(três pontos que dá acesso ao menu com mais opções)
* Renomeie o primeiro nó **Edit Field** para **adiciona campo 'tipo'**. (aperte `space` sobre o nó).
* Renomeie o segundo nó **Edit Field** para **limpeza do json**. (aperte `space` sobre o nó).
* Renomei o nó **When chat message received** para **chat trigger**
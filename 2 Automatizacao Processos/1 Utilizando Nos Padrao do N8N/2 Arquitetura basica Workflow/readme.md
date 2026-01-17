# Utilizando Nós Padrão do N8N
Arquitetura básica de um Workflow

Será abordado *Conceitos e fundamentos que envolvem os nós padrão. (Nodes Standart)*

Automação tem início, meio e fim.

Arquitetura básica de qualquer workflow do **N8N**.

Workflow de exemplo: **Nodes Centrais - DIO**

* **Workflow**
    * **Início:** Node de Início: Trigger (Gatilho)
    É por onde entram os dados externos para uma aplicação **N8N**. (**TRIGGER**).
    * **Node de Processamento:** Data Processing. (**DATA**).
    * **Node de Fim:** Action (Saída). (**ACTION**).

* Exemplo de **Trigger**
    * **Webhook:** Recebe as informações em teste ou produção.\
    Utilizando a URL de teste, as infomações aparecerão na aba **Editor**.\
    Já utilizando a URL de execução, as infomações aparecerão na aba **Executions** em nível de log.\
    Ex: Test URL.\

    * **Principais métodos de Requisição(HTTP Method):**
        * **GET:**  Recebe as informações como parâmetros da requisição.\
        * **POST:** Recebe as infomrações no corpo da requisição.\
        Ex: POST.
    * **Path:** URL do seu Webhook.\
    Atenção: Cuidado com caracteres especiais.\
    Ex: nova_transacao
    * **Authentication:** Ex: None
    * **Respond:** Ex: Immediately
    * Clicar em **Execute workflow** no **Workflow**.

Simulando requisição: **REQBIN** ou **Insomnia**.

* **POST Requests Online**
    * Name: (incluir o URL para simular o POST)
    * Body: incluir o seguinte JSON:

        ```json
        {"moeda":"BRL"}
        ```
    
    Após clicar em **SEND** é retrnad o código 200 com a seguinte mensagem no corpo da requisição:

    * Body:

        ```json
        {"message": "Workflow was started"}
        ```
* Exemplo de node de processamento, **Data**
    * **HTTP Request:** No métoo **GET** é considerado um node de processamento.\ No modo **POST** é um **Node de Action**.
    No modo **GET** ele cruza uma informação e passa para um *end-point*, realizando uma função de uma API que retorna os dados baseados em uma informação, realizando uma espécie de cruzamento de dados, sendo um exemplo de procesamento\
    No modo **POST** ele persiste uma informação de modo que ela seja salva em seu destino, retornando uma mensagem padrão indicando o resultado desta ação.
        * Method: GET


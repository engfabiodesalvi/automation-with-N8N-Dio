# Utilizando Nós Padrão do N8N
Explorando os Tipos de Nós no N8N

* Nome do Workflow: `Nodes Centrais - DIO - 3`

* Partes da automação
    * **Tecnologia**
        * **Webhook**\
        Renomear o bloco para **Monitora par-moedas**\
        * **Test URL** `POST http://localhost:5678/webhook-test/nova_transacao`
        * **HTTP Method:** `POST`
        * **Path:** `nova_transacao`
        * **Authentication:** `None`
        * **Respond:** `Immediately`

    * **Financeiro**
        * **HTTP Request**
        API **Awesome** para obter a cotação de uma moeda em tempo real.\
        Site https://docs.awesomeapi.com.br/api-de-moedas#id-200.\
        **End point:** `GET` `https://economia.awesomeapi.com.br/json/last/:moedas`\
        Substituir **:moedas** pelo par de moedas que deseja consultar. Mais de um par de moedas sã separados por vígula.\
        **End point com os pares de moedas:** `GET` `https://economia.awesomeapi.com.br/last/USD-BRL,EUR-BRL,BTC-BRL`\

        * Renomear o bloco para **Consultar cotação do par-moeda**

        * Na aba **Parameters**        
            * **Method:** `GET`
            * **URL:** `https://economia.awesomeapi.com.br/last/USD-BRL`
            * **Authentication:** None
            
        * Execute o bloco para visualizar a cotação atual do par-moeda expecificado.\
        Pode ser necessário executar o **Workflow** e enviar uma solicitação `Post` utilizando um aplicativo como o **Insomnia**.

* Parametrizando a automação: passando um valor recebiado via `Post` para outro nó da automação.
    * Modificar a requisição `Post` enviada via **Insomnia**:
        ```json
        {
            "par-moeda":"USD-BRL"
        }
        ```
    * 

* **Financeiro** 
    * **HTTP Request**
        * **URL:**Selecione o modo **Expression** e clique em **expand** (ícone localiado à direita).
        Substitua `USD-BRL` para `{{ $json.body['par-moeda'] }}`.
        Este comando irá acessar o valor contido na chave `par-moeda` enviado através do arquivo **json**.\
        Modifique a **URL** para: `https://economia.awesomeapi.com.br/last/{{ $json.body['par-moeda'] }}`   

* Execute o **Workflow** e envie uma requisição `Post` com a chave par-moeda desejada dentro de um arquivo **json** e visualize o campo **output** do nó **HTTP Request**. Utilize um *software* semelhante ao **Insomnia** para realizar este passo.

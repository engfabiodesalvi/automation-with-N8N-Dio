# Utilizando Nós Padrão do N8N
Elaborando a combinação de um nó padrão.

Duplique o **Workflow** da atividade anterior e renomeie-a para **Nodes Centrais - DIO - 5**.

Exclua o nó **If**.

Modifique o nó **Swith** para ter a seguinte classificação baseada na oscilação do dólar:
* **Maior do que 5.95:** `Não comprar`
* **Menor ou igual a 5.95:** `Comprar muito`

* **Rule 1**
    * **Mode:** Rules
    * **Routing Rules**
        * **Rule 1**
            * **value1:** `{{ $json.valor_convertido }}`
            * **condition:** `# is greater than`
            * **value2:** `5.95`
            * **Rename Output** (selected)
                * **Output Name:** `Não Comprar`
            
        * **Rule 2** (Click on `Add Route Rule`)
            * **value1:** `{{ $json.valor_convertido }}`
            * **condition:** `# is less than or equal to`
            * **value2:** `5.95`
            * **Rename Output** (selected)
                * **Output Name:** `Comprar muito`
                        
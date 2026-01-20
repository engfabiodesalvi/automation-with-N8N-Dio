# Utilizando Nós Padrão do N8N
Outros nós padrão e suas características.

Duplique o projeto anterior, renomeie-o para **Nodes Centrais - DIO - 4** e e verifique as configurações.

Execute o **Workflow** para atualizar os valores.

Adicione um nó **Edit Fields** para modificar, adicionar ou remover campos do item.

* **Edit Fields**
    * **Fields to Set**
        * Renomeie o nó para **Conversão Dolar x Real**.
        * **name:** `valor_convertido`
        * **Type:** ``
        * **value:** `{{ $json.USDBRL.bid.toNumber().round(2) }}`. Fixa o resultado com duas casas decimais. (O curso utiliza toFixed(2), mas não aparece na versão que estou utilizando).


Adicione um nó **If** após o nó **Edit Fields**.

* **If**
    * Renomeie o nó para **Dolar acima de 5.25?**
    * **Conditions**
        * **value1:** `{{ $json.valor_convertido }}`
        * **condition:** `# Number > is greater than or equal to`
        * **value2:** `5.25`

Adicione um nó **Switch** após o nó **Edit Fields**.

* **Swith**
    * Renomeie o nó para **Cotação do Dolar**
    * **Mode:** Rules
    * **Routing Rules**
        * **Rule 1**        
            * **Value1:** `{{ $json.valor_convertido }}`
            * **condition:** `# Number > is greater than`
            * **value2:** `5.60`
            * **Rename Output:** `Selected`
                * **Output Name:** `Maior que 5.60`                

        * **Rule 2** (Clique em **Add Routing Rule**)
            * **Value1:** `{{ $json.valor_convertido }}`
            * **condition:** `# Number > is greater than`
            * **value2:** `5.45`
            * **Rename Output:** `Selected`
                * **Output Name:** `Maior que 5.45`

        * **Rule 3** (Clique em **Add Routing Rule**)
            * **Value1:** `{{ $json.valor_convertido }}`
            * **condition:** `# Number > is greater than`
            * **value2:** `5.25`
            * **Rename Output:** `Selected`
                * **Output Name:** `Maior que 5.25`

        * **Rule 4** (Clique em **Add Routing Rule**)
            * **Value1:** `{{ $json.valor_convertido }}`
            * **condition:** `# Number > is greater than`
            * **value2:** `5.18`
            * **Rename Output:** `Selected`
                * **Output Name:** `Maior que 5.18`
        
Execute o **Workflow** e verifique as saídas da automação.

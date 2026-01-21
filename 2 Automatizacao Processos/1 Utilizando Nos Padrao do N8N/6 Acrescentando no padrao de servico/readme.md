# Utilizando Nós Padrão do N8N
Acrescentando um nó padrão de serviço.

Duplique o **Workflow** da atividade anterior e renomeie-a para **Nodes Centrais - DIO - 6**.

Verifique as configurações dos blocos e execute o **Wokflow**.

Para esta etapa foi necessário:
* criar credenciais de acess no Google Cloude para acessar e editar as planilhas no google drive.
* criar uma senha de aplicativo na conta do google para poder enviar emails.
* utilizar um serviço de conexão em túnel qpara gerar uma conexão com certificaso SSL (https) para poder acessar as APIs. Utilizei o *quick tunnel* da *cloudeflare*. 

No *google drive* crie uma planilha com o nome **Cotação Dólar**
* Acrescente duas colunas: **Data-Hora** e **Cotação**
* Renomeie a aba para **Compra**.

No **Workflow** acrescente um nó **Google Sheets** com a funcionalidade **Append row in sheet** no ramo **Não comprar** do nó **Cotação do Dolar (Switch)**.

*  **Append row in sheet (Google Sheets)**
    * Renomeie para **Salva cotação na planilha**
    * **Credential to connect with:** Selecione a credencial já configurada **Google Sheets account** ou configure uma.
    * **Resource:** Sheet Within Document
    * **Operation:** Append Row
    * **Document:**
        * **From list:** Cotação Dolar (Planilha localizada no google drive)
    * **Sheet**
        * **From list:** Compra (Aba da planilha)
    * **Mapping Column Mode:** Map Each Column Manually
    * **Values to Send** (clique em atualizar no menu três pontinhos)
        * **Data-Hora:** `{{ $now.format('dd/MM/yyyy HH:mm') }}`
        * **Cotação:** `{{ $json.valor_convertido }}`

Para testar este nó force uma saída verdadeira no bloco **switch** ou conecte o nó da planilha em uma saída verdadeira para realizar um este.

Acrescente também um nó **Send email** com a funcionalidade **Send an Email** e conecte este nó na saída **Comprar muito** do nó **Cotação do Dolar (Switch)**.

* **Send email**
    * **Credential to connect with:** SMTP account (configure um acesso à conta)
    * **Operation:** Send
    * **From Email:** engfabiodesalvi@gmail.com
    * **To Email:** engfabiodesalvi@gmail.com
    * **Subject:** Cotação Dólar
    * **Email FOrmat:** HTML
    * **HTML:**

    ```html
    Olá!
    <br><br>
    O dólar está abaixo de R$ 5,95.
    <br><br>
    Cotação Atual: <strong>R$ {{ $json.valor_convertido.toString().replace('.',',') }}</strong>
    <br><br>
    Compre bastante!        
    ```

    * **Append n8n Attribution:** false
    * **Ignore SSL ISsues (Insecure):** true

Clique em **Execute step** para testar o envio do email.

Para configurar um *quick tunnel* digite um *promtp de comando* separado:
` cloudflared tunnel --url http://localhost:5678`

Atenção: Toda vez que for gerado um *quick tunnel* é necessário atualizar as varáveis do arquivo **.env** das configurações do Docker, atualizar o diretório nas credenciais de acesso do **Google Cloud** e desativar e ativar  container do **N8N**  no Docker.

Para desativar um conteiner: `docker compose down`
Para ativar um conteiner: `docker compose up -d`




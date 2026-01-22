# Integração com Serviços Populares no N8N
Integração nativa com o Google Sheet

## Google Sheets ou Google Planilhas

O **N8N** possui nós **Triggers** e nós **Actions** para o **Google Sheets**

* **Triggers**
    * **On row added**
    * **On row updated**
    * **On row added or updated**

* **Actions**
    
    * **Document Actions**
        * **Create spreadsheet**
        * **Delete spreadsheet**

    * **Sheet within document actions**
        * **Append or update row in sheet**
        * **Append row in sheet**
        * **Clear sheet**
        * **Create sheet**
        * **Delete sheet**
        * **Delete rows or columns from sheet**
        * **Get row(S) in sheet**
        * **Update row in sheet**
    
## Credencial Google

Para utilizar um nó é necessário criar uma nova credencial **Create new credencial** utilizando **OAuth2 (recommended)**.

Informar o **Auth Redirect URL** ao configurar o acesso **OAuth2** no **Google Cloude Console**.

Preecher os campos **Client ID** e **Client Secret** com os respectivos valores obtidos em **Google CLoud Console**.

Depois é necessário logar na conta para finalizar o processo de configuração da nova credencial.

## Google Cloud Console

Crie um novo projeto na pagina da **Google Cloud Console**.

### Criando um cliente

Vá em **APIs e serviços > Tela de permissão OAuth > Cientes > Criar cliente** e preencha os campos que forem requisitados.
 * **Tipo de aplicativo:** `Aplicativo da Web`
 * **Nome:** `entre com o nome do aplicativo`
 * **URIs de redirecionamento autorizados:** Utilize o **OAuth Redirect URL** disponível no **N8N** a criar uma credencial.

Salve e guarde as informações de **Client ID** e **Client Secret**.

Depois vá em **APIs e erviços > Biblioteca**:
* Pesquise por **Google Sheets API** e ative-a.
* Pesquise por **Google Drive Api** e ative-a.

Volte ao **N8N** e utilize estes dados para configura a credencial de acesso.

## Crie uma planilha de dados no google dive

Renomeie-a para **Artigos DIO** e inclua dados na planilha.

| Título | Descrição | URL | Status|
| :--- | :--- | :--- | :--- |
| Título 1 | Descrição 1 | https://www.google.com/ | Não enviado |
| Título 2 | Descrição 2 | https://www.google.com/ | Enviado |


## Workflow exemplo de uso de nó Google Sheet

Renomeie o wrkflow para **Google Sheets**.

Inclua um nó **Google Sheet** com a ação **Get row(s) in sheet**

* **Get row(s) in sheet**
    * **Credential t cnnect with:** `Google Sheets configurada`
    * **Resource:** ``Sheet Within Document`
    * **Operation:** `Get Row(s)`
    * **Document:**
        * **From list:** `Artigos DIO`
    * **Sheet:**
        * **From list:** `Pagina1` 
    * **Filters:**
        * **Column:** `Status`
        * **Value:** `Enviado` (depois testar com `Não enviado`)                      
    * **Combine Filters:** `AND`






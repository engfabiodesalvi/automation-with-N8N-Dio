# Utilizando Nós Padrão do N8N
Criando uma automação de um processo seletivo

A automação será responsável por ler os dados de uma planilha de candidados e analisar as informações, separando os candidatos em dois grupos através de um gatilho previamente agendado:

* **Os candidatos que atendem aos critérios de aprovação:** Os candidatos receberam um email individual e personalizado parabenizando a aprovação.
* **Os candidatos que não atendem aos critérios de aprovação:** Uma lista com os nomes dos candidatos será enviada por email ao responsável.

## Renomeando o Workflow

Renomeie o **workflow** para **Processo Seletivo RH - Parte 1**.

## Criando a planilha "Processo Seletivo"

Crie uma planilha de candidatos chamada "Processo Seletivo" no **Google Drive**.

Adicione a lista de candidados nesta planilha:

| Email | Nome | Anos Experiência |	Grau Escolaridade|
| :--- |:--- | :--- | :--- |
| engfabiodesalvi@gmail.com	| Fabio De Salvi | 6 | Superior |
| ana@teste.com.br	| Ana Julia	| 3	| Médio |
| pedro@email.com | Pedro Duarte | 6 | Superior|
| cecilia@info.com.br | Cecília Braga | 5 | Superior|
| clovis@helio.com | Clóvis Lima | 15 | Médio|

Renomeie a aba da planilha para "Candidatos"

## Parte 1 da automação

Adicione o primeiro nó **Schedule Trigger** que será responsável por iniciar a automação em uma data e horário previamente agendados:

* **Schedule Trigger**
    * Renomeie-o para **Dispara no dia 21/01/2026 às 6PM**. Utilize dados atuais.
    * **Trigger Interval:** Months
    * **Months Between Triggers:** 1
    * **Trigger at Day of Month:** 21
    * **Trigger at Hour:** 6pm
    * **Trigger at Minute:** 0

Adicione o nó **Google Sheets** com a ação **Get row(s) in sheet** na saída do nó **Schedule Trigger**:

* **Get row(s) in sheet**
    * Renomeie-o para **Obtém candidatos**.
    * **Credential to connect with:** Google sheet account (deve ser configurado as APIs em uma conta Google em **Google Cloud Console** e as credenciais devem ser adicinadas no **N8N** em **Overview > Credentials**)
    * **Resource:** Sheet Within Document
    * **Operation:** Get Row(s)
    * **Document:**
        * **From list:** Processo Seletivo
        * **From list:** Candidatos

Clique em **Execute step** para visualizar a lista de candidatos na aba **OUTPUT**

Adicione um nó **If** na saída do nó **Get row(s) in sheet** para separar os candidatos aprovados e os candidatos reprovados no processo seletivo:

* **If**
    * Renomeie-o para **Candidato aporovado?**
    * **Conditions**
        * **Condition1**
            * **Value1:** `{{ $json['Anos Experiência'] }}`
            * **Relatinship:** `# is greater than` (# numerical relationship)
            * **Value2:** `5`
        
        * **Relationship:** `AND`
        
        * **Condition2:** 
            * **Value1:** `{{ $json['Grau Escolaridade'].toLowerCase() }}`
            * **Relatinship:** `T is equal to` (T relationshit between strings)
            * **Value2:** `superior`

Clique em **Execute step** para visualizar a lista de candidatos aprovados e reprovados nas respectivas saídas `True Branch` e `False Branch` na aba **OUTPUT**    

Adicione um nó **Loop Over Items (Split in Batches)** no ramo **True Branch** do nó **If**.

* **Loop Over Items (Split in Batches)**
    * Renomeie-o para **Para cada candidato**
    * **Batch Size:** `1`

Clique em **Execute step** para visualizar o item na aba **Output**.

Adicione um nó **Send email** no ramo **loop** do nó **Loop Over Items (Split in Batches)**.

* **Send email**
    * Renomeie-o para **Envia email de aprovação**
    * **Credential to connect with:** SMTP account (configurar credencial)
    * **Operation:** Send
    * **From Email:** Eng Fabio De Salvi <engfabiodesalvi@gmail.com>
    * **To Email:** {{ $json.Nome }}<{{ $json.Email }}>
    * **Subject:** Você foi aprovado!
    * **Email format:** HTML
    * **HTML:**
        ```html
        Olá {{ $json.Nome.split(' ')[0] }}, tudo bem?
        <br><br>
        Passando aqui para informar que você foi aprovado para a próxima fase do processo seletivo.
        <br><br>
        Parabéns!
        ```
    * **Options:**
        * **Append n8n Attribution:** `deselected`

Clique em **Execute step** para visualizar o item na aba **Output**.

Adicione um nó **Wait** no ramo de saída do nó **Send email**.

* **Wait**
    * Renomeie-o para **Aguardar 5s**
    * **Resume:** After Time Interval
    * **Wait Amount:** 5,00
    * **Wait Unit:** Seconds

Clique em **Execute step** para visualizar o item na aba **Output**.

Conecte o ramo de saída do nó **Wait** na entrada do nó **Loop Over Items (Split in Batches)**.

Por fim clique em **Execute workflow** para executar a automação.

Os candidatos aprovados receberão um email com uma mensagem personalizada.

## Criando o tunnel

Para configurar um *quick tunnel* digite um *promtp de comando* separado:
`cloudflared tunnel --url http://localhost:5678`

Atenção: Toda vez que for gerado um *quick tunnel* é necessário atualizar as varáveis do arquivo **.env** das configurações do Docker, atualizar o diretório nas credenciais de acesso do **Google Cloud** e desativar e ativar  container do **N8N**  no Docker.

Para desativar um conteiner: `docker compose down`
Para ativar um conteiner: `docker compose up -d`
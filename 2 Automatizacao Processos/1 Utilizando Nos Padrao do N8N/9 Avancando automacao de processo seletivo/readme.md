# Utilizando Nós Padrão do N8N
Avançando na automação de um processo seletivo.

A automação será responsável por ler os dados de uma planilha de candidados e analisar as informações, separando os candidatos em dois grupos através de um gatilho previamente agendado:

* **Os candidatos que atendem aos critérios de aprovação:** Os candidatos receberam um email individual e personalizado parabenizando a aprovação.
* **Os candidatos que não atendem aos critérios de aprovação:** Uma lista com os nomes dos candidatos será enviada por email ao responsável.

## Renomeando o Workflow

Duplique o **Workflow Processo Seletivo RH - Parte 1** e renomeie-o para **Processo Seletivo RH - Parte 2**.

## Parte 2 da automação

Adicine um nó **Aggregate** no ramo **False** do nó **If**.

* **Aggregate**
    * Renomeie-o para **Gera array de nomes**
    * **Aggregate:** `Individual Fields`
    * **Fields To Aggregate:**
        * **Input Field Name:** `Nome`

Clique em **Execute step** para visualizar o array de nomes na aba **OUTPUT**.

Adidione um nó no ramo de saída do nó **Aggregate**.

* **Send email**
    * Renomeie-o para **Envia lista de candidatos reprovados**
    * **Credential to connect with:** SMTP account (configurar credencial)
    * **Operation:** Send
    * **From Email:** `Eng Fabio De Salvi <engfabiodesalvi@gmail.com>`
    * **To Email:** `Eng Fabio De Salvi <engfabiodesalvi@gmail.com>`
    * **Subject:** `Candidatos Reprovados`
    * **Email format:** `HTML`
    * **HTML:**
        ```html
        Olá colaborador Fabio!
        <br><br>
        Segue a relação dos candidatos reprovados no processo seletivo:
        <br><br>
        {{ $json.Nome.join('<br>') }}
        <br><br>
        Atenciosamente,
        <br>
        Equipe de Desenvolvimento
        ```
    * **Options:**
        * **Append n8n Attribution:** `deselected`    

Clique em **Execute workflow** para executar a automação.

Os candidatos aprovados no processo seletivo receberão um e-mail individualmente.

Um funcionário responsável receberá um e-mail com os nomes dos candidatos reprovados no processo seletivo.

## Criando o tunnel

Para configurar um *quick tunnel* digite um *promtp de comando* separado:
`cloudflared tunnel --url http://localhost:5678`

Atenção: Toda vez que for gerado um *quick tunnel* é necessário atualizar as varáveis do arquivo **.env** das configurações do Docker, atualizar o diretório nas credenciais de acesso do **Google Cloud** e desativar e ativar o container do **N8N**  no Docker.

Para desativar um conteiner: `docker compose down`
Para ativar um conteiner: `docker compose up -d`
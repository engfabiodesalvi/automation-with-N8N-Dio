# Integração com Serviços Populares no N8N
Integração nativa com o Telegram

## Telegram no N8N

O telegram utiliza **Token** e **API Key**.

O nó **Telegram** possui:

* **Triggers**
    * **On callback query**
    * **On channel post**
    * **On edited channel post**
    * **On Edited message**
    * **On inline query**
    * **On message**
    * **On pre checkout query**
    * **On shipping query**

* **Actions**

    * **Chat Actions**
        * **Get a chat**
        * **Get all administrators in a chat**
        * **Get a member in a chat**
        * **Leave a chat**
        * **Set description on a chat**
        * **Set a title on a chat**

    * **Callback Actions**
        * **Answer Query a callback**
        * **Answer an inline query callback**

    * **File Actions**
        * **Get a file**

    * **Message Actions**
        * **Delete a chat message**
        * **Edit a text message**
        * **Pin a chat message**
        * **Send an animated file**
        * **Send an audio file**
        * **Send a chat action**
        * **Send a document**
        * **Send a locaation**
        * **Send a media group message**
        * **Send a text message**
        * **Send message and wait for response**
        * **Send a photo message**
        * **Send a sticker**
        * **Send a video**
        * **Unpin a chat message**


## Obtendo o Access Token do Telegram

Procure pelo **BotFather** no **Telegram**.

Envie a mensagem `/newbot`.

Envie o **name** do **bot**. Ex `DIO bot`.

Envie o **username** do **bot**. Em minúsculo, sem espaços e pode conter hífen ou under. Ex `auttic_dio_bot`.

Guarde o **token** fornecido para poder realizar o acesso HTTP API.


## Workflow

Adicione um nó do **Telegram** com a ação **Send a text message**.

* **Send a text message**
    * **Creencial to connect with:** (configure uma credencial utilizando o **Access Token**)
* **Resouce:** `Message`
* **Operation:** `Send Message`
* **Chat ID:** `@fabricadeonhecimentos` (o usuário precisar estar como administradr no grupo)
* **Text:** `Testando envio pelo n8n`
* **Reply Markup:** `None`

* **Additional Markup:**
    * **Append n8n Attribution:** `(deselected)`    

Pode ser envido:
* Texto
* Link
* Imagem
* Audio

Clique em **Execute step** e veja se esta funcinando.
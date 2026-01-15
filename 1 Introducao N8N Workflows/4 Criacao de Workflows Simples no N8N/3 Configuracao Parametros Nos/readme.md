# Criação de Workflows Simples no N8N
Configurando Parâmetros dos Nós no **N8N**.

Cada **node**(nó) possui:
* uma **input** (entrada) que pode ter **PARAMETERS** ou não (é opcional),
* um **process** (processamento) que pode ter **PARAMETERS** ou não (é opcional)
* uma **output** (saída).

## Hands-On: Personalizando Parâmetros para fluxos Eficazes

* Abra o projeto iniciado no tópico anterior.
* Clique no nó **When chat message received**
* Verifique as partes do nó:
    * **input**
    * **output**
    Não é possível modificar o **process**
* Clique no nó **Edit Fields**
* Verifique as partes do nó:
    * **input**: resultado do nó anterior. Possui a infomação de entrada do chat.
    * **process**: 
        * Inclua os parêmetros **action** e **chatInput**.
        * Renomeie os parâmeros para **ação** e **mensagem**.
        * Adicione outro parêmetro e nomeie para **tipo** e atribua o valor **automática** para este atributo.
    * **output**
* Volte para a tela inicial do **workflow** e pressione `crtl + enter`para realizar uma execução da automação.

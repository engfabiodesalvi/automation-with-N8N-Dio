# Criação de Workflows Simples no N8N
Adicionando e Conectando Nós no **N8N**.

Nomenclaturas e definições:

* **Workflows:** Formados pelos **Nodes** 

* **Nodes = nós:** Pode ser uma aplicação ou uma automação.
Os nós possuem:
    * **triggers:** Eventos de gatilho. São ativados quando alguma coisa acontece. Ex: algum acesso ao banc de dados, uma alteração em uma planilha, etc.
    * **actions:** Executar alguma ação em um bloco. Ex: criar uma pasta, adicinar um pasta, etc.
    * **events:** Eventos são disparados pelo nó ao executar uma ação, de modo que outras automações possam saber o que foi realizado por este nó.

* **Steps = passos:** A sequência com que os nós são conectados formam os **Steps**, ou seja, cada **Node** é um **Step**.

**Projeto Hands-On: Conectando Nós para Automação Eficiente**

Utilize uma instalação do **N8N** para iniciar este projeto.

* Inicie um novo **Workflow**.
* Pressione `TAB` para adicionar um **trigger**.
Os gatilhos podem ser:
    * **Trigger manually:** São gatilhos gerados através de um clique, sendo os mais comuns.
    * **On app event:** São gatilhos gerados por eventos de outros aplicativos.
    * **On a schedule:** Os gatilhos são definidos para sere ativados diariamente, por hora ou um  intervalo customizado.
    * **On webhook call:**  Eventos gerados por uma aplicação web aivam o gatilho.
    * **On form submission:** Gatilho gerado por um envio de formulário.
    * **When executed by another workflow:**  Gatilho gerado pela execução de outro **workflow**, possibilitando formar uma automação utilizando outras automações.
    * **On chat message:** Gera um gatilho quando uma mensagem é enviada em um chat.
    * **When running evaluation:** Gera um gatilho quand alguma coisa esta sendo testada.
    * **Other ways:** Outras maneiras.

* Adicione o **trigger** **On chat message**. O chat pode ser acessado licando em **open chat**.
* Digite `Ola mundo!` no chat e tecle `Enter`.
* O nó deverá ser executado e a mensagem `Node executed successfully` deverá aparecer na tela.
* Dê um duplo clique sobre o nó para visualizar as seguintes informações de **output**:
    * **sessionId:** Id da sessão.
    * **action:** Tipo de ação    
    * **chatInput:** Valor enviado ao chat.
 Todo nó tem uma **input**, um **processing** e um **output**. O **output** de um nó é conectado no **input do próximo nó.

* Pressione `Tab` novamente e adicione um **Edit Filds (Set)** para Modificar, adicionar ou remover itens da saída do nó anterior.



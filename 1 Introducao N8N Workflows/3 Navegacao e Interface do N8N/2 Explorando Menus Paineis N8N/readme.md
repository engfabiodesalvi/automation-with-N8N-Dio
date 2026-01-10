# Navegação e Interface do N8N

Explorando menus, painéis e botões de ação

## Side bar

Menu lateral com as funcionalidades do N8N.
As opções são contextuais.

Visão geral:
* **Overview:**
    * **Workflows**
    * **Credentials**
    * **Executions**

Ajuda oficial do N8N:
* **Help**

## Panel

O painel fica localizado após o menu lateral e se extende até a lateral direita da página, abaixo de uma faixa de opções.

Ele á atualizado conforme a navegação do menu lateral.

O painel pode conter botões de ação.

## Action buttons

Os botões de ação estão locatlizados dentro do painel.

## Hands-On

Abra uma instalação do **N8N**.

* Vá no menu lateral e clique na opção *Overview*;
* No painel terá duas opções: **Start from scratch** e **Test a simple AI Agent example**. Selecione a segunda opção para escolher um template;
* A instalação do **N8N** no **Docker** apresenta apenas a opção **Start from scratch**. Dependendo do plano escolhid algumas funcionalidades poderão não aparecer. Escolha esta opção e inicie o projeto.
* Na parte superior digite o nome do *Workflow* para **Demo: My first AI Agent in n8n**.
* Inclua um elemento **Chat Trigger** clicando na opção **+***(Open nodes panel)* localizada no top do menu lateral direito. Procure por *Chat* e selecine o elemento **Chat Trigger**.
* Faça um teste digitando alguma mesnagem no *Chat*.  Chat pode ser acessado através de uma opção ao lado do icone do *Chat Trigger*.
* A funcionalidade do **AI Agent** depende do cadastro de credenciais de algum serviço como o *Open AI*, que srá realizado posteriormente.

Alguns planos permite organizar os projetos em pastas e permitir o acesso de usuários a projetos e credenciais.

É possível criar pastas para cada tipo de automação e mover os projetos para dentro das pastas através do arrastar e soltar padrão.

Organizar os projetos em pastas específicas ajuda a focar em autmações simples e objetivas.

Identificar os projetos internos e externos através de nomenclaturas claras e objetivas.

Os **Workflows** podems ser deletados de duas formas:

*   Transferindo o **Workflows** e as subpastas para dentro de utra pasta dentro da pasta deste projeto
*   Escluindo todos os arquivos dentro deste **Workflows** e suas subpastas.

Os **Projects** podem ser excluídos  utilizando o **Danger zone** localizado dentro da aba **Project settings**

*   Tranferindo seus **Worksflows** e **credencials** para outro projeto ou usuário.,
*   Deletando seus **workflows** e **credencials**
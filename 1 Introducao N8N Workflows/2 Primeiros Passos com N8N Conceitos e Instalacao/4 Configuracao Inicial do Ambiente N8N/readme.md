# N8N com Docker

Esse tipo de instalação permite uma fácil migração da instalação do **N8N** realizada em uma máquina local para um servidor na nuvem.

O **Docker** permite que a instalação rode dentro de um container.

Esse ambiente permite uma fácil migração entre sistemas.

* Maior liberdade de configurações de variáveis.
* Gratuito para criar um servidor local.
* Facilidade para Migrar entre Ambientes.

## Instalação do Docker

Clique na opção **Download Docker Desktop** na [**página oficial para instalar o Docker**](https://www.docker.com/get-started/).

 
## Instando o N8N

* Abra o **Docker** clicando no ícone do programa **Docker**.
* Realize o login no ambiente.
* Procure por uma imagem do **N8N** na aba **Search**
* Foi utilizado o **pull** da imagem **n8nio/n8n**
* Na aba **Imagens**, selecione a imagen **n8nio/n8n** e clique em **run**.
* Na caixa de diálogo adicione as sequintes **configurações opcionais**:
    * **Optional settings:**
        * **Container name:** n8n;
    * **Ports:** 
        * **Host port:** 5678;
    * **Volumes:** 
        * **Host path:** /Docker/docker_n8n;
        * **Container path:** /home/node/.n8n;
    * **Environment variables:**
        * **Variable:** GENERIC_TIMEZONE=America/Sao_Paulo;
        * **Value:** America/Sao_Paulo;
* Clique em **Run**.
* Vá para a aba **Containers**.
* Verifique o campo **Image** do container **n8n** e clique no link **"http://localhost:5678"**.
* Realize o **login** no ambiente **n8n**.
* Na aba **Usage and plan** inclua uma **activation key** para utilizar alguns recursos limitados de modo gratuito.

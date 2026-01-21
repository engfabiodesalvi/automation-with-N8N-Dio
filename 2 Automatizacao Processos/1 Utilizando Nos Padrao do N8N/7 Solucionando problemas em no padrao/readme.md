# Utilizando Nós Padrão do N8N
Solucionando problemas em um nó padrão.

Verificar se a automação possui algum ponto de entrada de dados que poderá ocasionar um erro durante o processamento dos nós.
* O nó **Webhook** sempre irá receber um requisição e irá passar para o próximo nó, podendo passar um parâmetro erado de forma não intencional.
* O nó **Http request** irá buscar a cotação da moeda desejada mas pode haver erros na requisição, como **end point** errado ou um par-moeda inválido, gerando um erro. Esses erros devem ser evitados de alguma forma para não serem propagados para os próximos blocos.


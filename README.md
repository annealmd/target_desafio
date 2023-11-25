# PROVA FLUTTER
Faça um aplicativo em Flutter que atenda os requisitos aqui listados se aproximando o máximo
possível das imagens de exemplo.

## Desisões de Projeto durante o desenvolvimento
### Uso de api externa MockApi
- O MockApi permite apenas o get, os outros endpoints não estão disponíveis na versão gratuita.
- O projeto usa o ToDo do **JsonPlaceHolder** que permite o CRUD completo porém não altera os dados no servidor. Sendo assim, foi feita uma pequena adaptação usando um set para não ter dados duplicados e também para que as alterações salvas com o sharedpreferences não fossem perdidas no loading.</br>
 **info_service_test.dart** mostra que todos os endpoints do CRUD estão funcionando de acordo a documentação.

### O foco de digitação permanente no campo 'Digite o seu texto'
- Por questão de design, aparência, o foco está no campo na abertura da página (info_page.dart) - porém, não está permanente.
- A alteração para foco permanente pode ser feita de forma simples comentando a linha 112 e descomentando a 113.</br>
                linha 112  autofocus: true, *//comenta essa linha*</br>
                linha 113 //focusNode: infoFocusNode, *// descomenta essa linha*

## Tela de login
Uma tela de autenticação onde o usuário é obrigado a digitar seu login e senha.
### A tela deve conter
- Um Campo de senha
- Um campo de texto para representar o Login
- Um Label descrito "Política de privacidade"
### Como tela deve se comportar
- Verificar e alertar se ambos os campos de Login e senha estão preenchidos.
- O campo senha não pode ter menos que dois caracteres.
- O campo senha não pode ter caracteres especiais, sendo apenas possível
informar 'a' até 'Z' e '0' até '9'.
- Ambos os campos não podem ultrapassar 20 caracteres.
- Ambos os campos não podem terminar com o caractere de espaço no final.
- Se ambas as informações estiveram preenchidas deve ir para a próxima tela.
- Ao tocar no label "Política de privacidade" uma página web direcionada para o
google.com.br deve ser aberta.

**Observações**

*Não é necessário validar as informações em uma API Externa, mas caso seja feito um mockAPI
contara como um diferencial*


<img src="login_page.png"  height="500">

## Tela de captura de informações
A tela deve salvar as informações digitadas pelo usuário em um card, listando essas informações
salvas e dando a opção de editar ou excluir. Essas informações não podem ser perdidas ao fechar
o app, ou seja, ao abrir a tela as informações salvas anteriormente devem ser mostradas na
ordem.
### A tela deve conter
- Um card principal e central
- Um campo de texto
### Como a tela deve se comportar
- O foco da digitação deve estar o tempo todo no campo de "Digite seu texto" e não pode
ser perdido ao interagir com a tela. 
- Ao acionar o "enter" o campo tem que verificar se a informação foi preenchida.
- O Card principal deve receber a informação digitada do campo.
- As informações precisam ser salvas e lidas utilizando a biblioteca shared_ preferences
(https://pub.dev/packages/shared_preferences)
- O Icone de excluir deve abrir um pop-up confirmando a ação.
- Obrigatório a utilização do plugin MOBX para a construção da tela.

  <img src="info_page.png"  height="500">

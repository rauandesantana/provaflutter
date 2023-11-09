# Flutter Authentication and Data Capture App

## Tela de Login

A tela de login possui os seguintes elementos:

[x] Um campo de senha.
[x] Um campo de texto para representar o login.
[x] Um rótulo intitulado "Política de Privacidade".

### Comportamento da Tela de Login

[x] Verifica e alerta se ambos os campos de login e senha estão preenchidos.
[x] O campo de senha não pode ter menos de dois caracteres.
[x] O campo de senha não pode conter caracteres especiais, aceitando apenas de 'a' a 'Z' e '0' a '9'.
[x] Ambos os campos não podem ter mais de 20 caracteres.
[x] Ambos os campos não podem terminar com espaço no final.
[x] Se ambas as informações estiverem preenchidas, o aplicativo deve avançar para a próxima tela.
[x] Ao tocar no rótulo "Política de Privacidade", uma página da web direcionada para google.com.br 
deve ser aberta.

## Tela de Captura de Informações

Esta tela salva as informações digitadas pelo usuário em um card, listando essas informações e 
oferecendo opções de edição ou exclusão. As informações salvas não são perdidas ao fechar o 
aplicativo.

### Elementos da Tela

[x] Um card principal e central.
[x] Um campo de texto.

### Comportamento da Tela de Captura de Informações

[x] O foco da digitação deve permanecer no campo "Digite seu texto" o tempo todo.
[x] Ao pressionar "enter", o campo deve verificar se a informação foi preenchida.
[x] O card principal deve exibir a informação digitada no campo.
[x] As informações são salvas e lidas usando a biblioteca shared_preferences 
(https://pub.dev/packages/shared_preferences).
[x] O ícone de exclusão deve abrir um pop-up confirmando a ação.
[x] O uso do plugin MOBX é obrigatório para a construção da tela.

## Recursos Adicionados:

### 1. MockAPI
[x] Integrei um MockAPI para simular a validação externa de informações, melhorando a robustez do
  aplicativo.

### 2. Splash Screen
[x] Adicionei uma splash screen para proporcionar uma transição suave ao iniciar o aplicativo,
  fornecendo uma experiência mais polida aos usuários.

### 3. Tela de Alerta
[x] Implementei uma tela de alerta para fornecer feedback de erro ao carregar as dependências.

### 4. GoRouter para Roteamento de Telas
[x] Implementei o GoRouter para simplificar o roteamento entre as telas, tornando a navegação mais 
intuitiva e eficiente.

### 5. Internacionalização
[x] Adicionei suporte para internacionalização, incluindo dois idiomas: Português e Inglês. Os 
usuários terão o idioma com base nas definições do sistema, por padrão Português.

### 6. Provider para Injeção de Dependência
[x] Utilizei o Provider para facilitar a injeção de dependência, melhorando a modularidade e a 
manutenção do código.

### 7. Sistema de Cadastro

[x] Adicionei um sistema de cadastro para permitir que novos usuários se registrem no aplicativo.

## Como Executar o Projeto:

1. Clone o repositório: `git clone https://github.com/rauandesantana/provaflutter.git`
2. Navegue até o diretório do projeto: `cd provaflutter`
3. Instale as dependências: `flutter pub get`
4. Execute o aplicativo: `flutter run`

O aplicativo oferece uma experiência mais rica e abrangente aos usuários, garantindo uma navegação 
suave e uma interface amigável.
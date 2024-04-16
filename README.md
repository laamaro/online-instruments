# README

## Versões:
  * Ruby 3.1.2
  * Rails 7.0.8.1

## Configurações e Base de Dados
* Ao clonar o projeto rodar:
  ```
  rails db:create db:migrate db:seed
  ```
  * O projeto vem com 3 usuários que serão criados pelo seeds (2 psicólogos e 1 avaliado), permitindo um login inicial com um dos três emails:
  * joao@psicologo.com (senha: 123123)
  * maria@psicologa.com (senha: 123123)
  * paula@paciente.com (senha: 123123)
* Após rodar as migrações, rodar:
  ```
  bundle
  ```
  * O projeto se baseia em algumas gemas principais:
  * - Para autenticação dos usuários:
    ```
    gem 'devise'
    ```
    - Para convite de novos usuários (psicólogo cadastrar um avaliado):
    ```
    devise_invitable
    ```
    - Para autorização de acesso dos usuários à cada rota:
    ```
    pundit
    ```
    - Para visualização dos emails recebidos (email de convite e email de novo instrumento):
    ```
    letter_opener
    ```
* A base de dados do projeto segue o seguinte schema:
  ![image](https://github.com/laamaro/online-instruments/assets/96585306/9275e743-180e-453b-9358-a34acdfc10fc)

## Observações
* Para a fase de desenvolvimento, é necessário trocar de conta ou deslogar todas as vezes que um email é recebido.
  * Email de Cadastro: Quando um psicólogo cadastra um usuário, um email é recebido. Neste caso, antes de clicar no link de confirmação enviado no email, é necessário deslogar da plataforma.
  * Email de Novo Instrumento: Quando um psicólogo aplica um novo instrumento ao avaliado, um email é enviado a este. Antes de clicar no link do email (que verifica os dados), é necessario estar logado na plataforma com o email do avaliado. 

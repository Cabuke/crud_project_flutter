# flutter_app

Como Rodar o Projeto

    Pré-requisitos: Liste todos os pré-requisitos necessários para rodar o projeto na máquina do usuário, como:
        Flutter SDK stable 3.16.9
        Dart 3.2
        Node.js v18.13.0 *Eu configurei um script para rodar o nodemon "npm run start" e ele começa a funcionar*
        Dispositivo Android/iOS ou emulador para rodar o aplicativo (ou o próprio celular habilitando o modo depuração nas configurações).

	Link para instalação e configuração do FLUTTER NO WIN: https://docs.flutter.dev/get-started/install/windows/desktop
	Link para instalação do Node.js no WIN: https://nodejs.org/en/learn/getting-started/how-to-install-nodejs
	
	
Configuração Do Ambiente De Desenvolvimento

    Frameworks e Toolkits: 
    	Dependências utilizadas no Node.js: bcrypt(para codificar a senha), dotenv(boas práticas de programação, utilização de uma environment para não publicar ou deixar vazar dados sigilosos da 		aplicação.), express(framework fundamental para a criação da nossa API em Node.js.), jsonwebtoken ou JWT(framework para criação e manipulação de tokens para realização de autenticações http e mais..) e o mongoose para gerenciar nosso banco de dados MongoDB atlas que esta em cloud.
    	Dependências utilizadas no Flutter: LineIcons(uma biblioteca para icones), animations e animate_do(biblioteca para realizar efeitos e animações nos widgets, mudanças de páginas, abrir e fechar componentes e mais..), http(para realização da conversão dos dados e fazer as integrações com a API), flutter_dotenv(também para trabalhar com environments, como forma de boa prática), shared_preferences(biblioteca para auxiliar na autenticação com token e salvar localmente).


    

Como Usar o App

    Login/Cadastro: 
        Como acessar a tela de login/cadastro: Ao buildar o app após a SplashScreen automaticamente cairá na tela de LOGIN/SIGNIN.
        Não coloquei um botão de LOGOUT, então será necessário dar o RESTART RELOAD do Flutter para voltar a tela de cadastro/login
        Utilizei token para o login e acesso das demais funções no app.

    Criação de Clientes: 
        A criação, modificação e exclusão de clientes está bem simples e fluído, com uma mensagem simples de erro ou de sucesso e uma listagem automática na tela principal, após o LOGIN.
        Para modificar um cliente basta clicar no seu card e alterar os dados ou o dado específico.
        Para excluir basta clicar no ícone de LIXEIRA (Cuidado pois não haverá como recuperar quaisquer dados excluído.),

    Desde ja muito obrigado e espero que goste, foi feito com muito carinho e dedicação!

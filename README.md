# README


Após clonar o repositorio, entre na pasta docker-files e rode os comandos:

> docker-compose build \
> docker-compose up -d

Ao finalizar ambos comandos, todos os dockers da aplicação estaram rodando, use o comando:

> docker exec -ti app bash

Com este comando, o seu terminal entrara dentro do docker app, e de lá rodamos:

> bundle install \
> bundle exec rails db:create \
> bundle exec rails db:migrate \
> bundle exec rails db:seed

Esses comandos servem, respectivamente, para: 1- baixar todas as gems do gemfile, 2- criar o banco de dados da aplicação
, 3- criar todas tabelas com seus respectivos campos, 4- povoar o banco com os dados necessarios inicialmente.

Após todos esses passos, já é possível rodar o comando:

> bundle exec puma -p 3000

E navegar na aplicação localmente.

O backoffice da aplicação é acessado a partir do /manager, sendo criado um usuario no seed, com email de: root@root.com
e senha 123456.
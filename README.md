# Travels API

Esse projeto foi criado para servir como repositório de planejamento de viagens.

### Dependências

- Docker
- docker-compose


### Instalação

Basta rodar o comando `docker-compose up` e o serviço estará pronto para receber requisições.


### Convenções de envio

Para buscar todas as viagens cadastradas:

> GET `http://127.0.0.1/api/v0/travels`

Exemplo de retorno:

```json
[
  {
    "id": 1,
    "destination": "Torontou",
    "origin": "São Paulo",
    "departure_date": "2021-06-25T00:00:00.000-03:00",
    "return_date": "2021-06-29T00:00:00.000-03:00",
    "created_at": "2021-06-20T13:10:56.925-03:00",
    "updated_at": "2021-06-20T13:10:56.925-03:00"
  }
]
```

Para cadastrar uma nova viagem:

> POST `http://127.0.0.1/api/v0/travels`

Passando como payload os dados da viagem.
Segue um exemplo de body:

```json
{
	"origin": "São Paulo",
	"destination": "Califórnia",
	"departure_date": "2021-06-25",
	"return_date": "2021-06-29"
}
```
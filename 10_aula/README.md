**Paramos no exercício 12 (da lista sobre triggers). O exercício 12 está _pendente_

**Requisições assíncronas JS e Flask: Ficou para outro dia":

```js
 <script>
        async function teste() {
            try {
                const response = await fetch("/teste");
                const data = await response.json();
                console.log(data);
            } catch (error) {
                console.error("Erro ao obter dados:", error);
            }
        }

        /*
        async function enviarDados() {
            const dados = {
                nome: 'Igor',
                idade: 30,
                cidade: 'Rio Grande'
            };

            try {
                const response = await fetch('/api/usuario', {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/json'
                    },
                    body: JSON.stringify(dados)
                });

                if (!response.ok) {
                    throw new Error('Falha na requisição');
                }

                const resultado = await response.json();
                console.log('Resposta do servidor:', resultado);
            } catch (error) {
                console.error('Erro ao enviar dados:', error);
            }
        }*/

        /*
        https://flask.palletsprojects.com/en/stable/patterns/javascript/
        */

    </script>
```

```python
@app.route("/teste")
def teste():    
    return {
        "username": "igor",
        "email": "igor.pereira@riogrande.ifrs.edu.br"
    }

@app.route("/teste_pagina")
def teste_pagina():    
    return render_template('teste.html')   
```


&nbsp;

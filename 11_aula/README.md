**Propor novo cronograma**

[lista_trigger.md](https://github.com/IgorAvilaPereira/pbd2025_1sem/blob/main/9_aula/lista_trigger_and_functions.md)

* Não fizemos o 14 e 15

**EXTRA: Requisições assíncronas JS e Flask:**

* **Exemplos:**

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


```python
   from flask import Flask, request, jsonify

   app = Flask(__name__)

   @app.route('/my_route', methods=['GET', 'POST'])
   def my_route():
       if request.method == 'GET':
           data = request.args.get('my_param')
           return jsonify({'message': f'Received GET request with parameter: {data}'})
       elif request.method == 'POST':
           data = request.get_json()
           return jsonify({'message': f'Received POST request with JSON data: {data}'})           
          
      
```

```python
from flask import request

@app.post("/user/<int:id>")
def user_update(id):
    user = User.query.get_or_404(id)
    user.update_from_json(request.json)
    db.session.commit()
    return user.to_json()
           
```          

```javascript           
           
   // Example using fetch for a GET request
   fetch('/my_route?my_param=my_value')
       .then(response => response.json())
       .then(data => console.log(data));

    // Example using fetch for a POST request with JSON data
   fetch('/my_route', {
       method: 'POST',
       headers: {
           'Content-Type': 'application/json'
       },
       body: JSON.stringify({key: 'value'})
   })
       .then(response => response.json())
       .then(data => console.log(data));
```

&nbsp;

[Baixar todo o material da aula](https://download-directory.github.io/?url=http://github.com/IgorAvilaPereira/pbd2025_1sem/tree/main/./11_aula)

&nbsp;

import psycopg2
from flask import Flask

app = Flask(__name__)

class ConexaoPostgreSQL:
  def __init__(self):
    pass
  def abreConexao(self):
    return psycopg2.connect("dbname=aula7 user=postgres password=postgres host=localhost")
  def criaPaciente(self, nome, cpf, data_nascimento):
    conn = self.abreConexao()
    cur = conn.cursor()
    sql = "INSERT INTO paciente (nome, cpf, data_nascimento) VALUES (%s, %s, %s);"
    cur.execute(sql, [nome, cpf, data_nascimento])
    conn.commit()
    cur.close()
    conn.close()
  def listar(self):
    conn = self.abreConexao()
    cur = conn.cursor()
    cur.execute("SELECT * FROM consulta")
    records = cur.fetchall()
    cur.close()
    conn.close()
    return records
  
#  flask --app index run
@app.route("/")
def hello_world():
    conexao = ConexaoPostgreSQL()
    rows = conexao.listar()
    # print(rows[0])
    return "<h1>"+str(rows[0][1]) + "</h1>"

# if __name__ == '__main__':   
    # nome = input("Nome")
    # cpf = input("cpf")
    # data_nascimento = input("data")
    # conexao = ConexaoPostgreSQL()
    # print(conexao.listar())
    # conexao.criaPaciente(nome, cpf, data_nascimento)

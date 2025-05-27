import psycopg2
from flask import Flask, redirect, render_template, request, url_for

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
  
class Medico:
  def __init__(self, crm = None, nome = None, id = 0):
    self.crm = crm
    self.nome = nome
    self.id = id

class MedicoDAO:  
  def __init__(self, conexao):
    self.conexao = conexao

  def adicionar(self, medico):
    try:
      conn = self.conexao.abreConexao()
      cur = conn.cursor()
      cur.execute("INSERT INTO medico (crm, nome) VALUES (%s, %s);", [medico.crm, medico.nome])
      conn.commit()
      cur.close()
      conn.close()
      return True
    except Exception as e:
      print(e)
      return False


  def deletar_medico(self, id):
    try:
      conn = self.conexao.abreConexao()
      cur = conn.cursor()
      cur.execute("DELETE FROM medico WHERE id = %s", [int(id)])
      conn.commit()
      cur.close()
      conn.close()
      return True
    except Exception as e:
      print(e)
      return False
   

  def listar_todos(self):
    vetMedico = []
    sql = "SELECT * FROM medico ORDER BY id"
    conn = self.conexao.abreConexao()
    cur = conn.cursor()
    cur.execute(sql)
    for registro in cur.fetchall():
        print(registro)
        medico = Medico(registro[2], registro[1], registro[0])
        vetMedico.append(medico)
    cur.close()
    conn.close()
    return vetMedico




  
#  flask --app index run
@app.route("/")
def index():
  conexao = ConexaoPostgreSQL()
  medicoDAO = MedicoDAO(conexao) 
  vetMedico = medicoDAO.listar_todos()
  return render_template("index.html", vetMedico = vetMedico) 

@app.route("/deletar_medico/<int:id>")
def deletar_medico(id):
  # print("ok"+str(id))
  conexao = ConexaoPostgreSQL()
  medicoDAO = MedicoDAO(conexao) 
  resultado = medicoDAO.deletar_medico(id)
  print(resultado)
  return redirect(url_for('index'))

@app.route("/medico_tela_adicionar")
def medico_tela_adicionar():
  return render_template("medico_tela_adicionar.html")

@app.route("/medico_adicionar", methods = ['POST'])
def medico_adicionar():
  medico = Medico()
  medico.crm = request.form['crm']
  medico.nome = request.form['nome']
  conexao = ConexaoPostgreSQL()
  medicoDAO = MedicoDAO(conexao) 
  resultado = medicoDAO.adicionar(medico)
  return redirect(url_for('index'))


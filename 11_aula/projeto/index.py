# PARAMOS NO 12 (PENDENTE) => 02/06/25
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

class Paciente:
  def __init__(self, nome = None, cpf = None, data_nascimento = None, id = 0):
    self.cpf = cpf
    self.nome = nome
    self.id = id
    self.data_nascimento = data_nascimento

class Consulta:
  def __init__(self, data_hora = None, paciente = None, medico = None, id = 0):
    self.data_hora = data_hora
    self.paciente = paciente
    self.medico = medico
    self.id = id

class MedicoDAO:  
  def __init__(self, conexao):
    self.conexao = conexao

  def editar(self, medico):
    try:
      conn = self.conexao.abreConexao()
      cur = conn.cursor()
      cur.execute("UPDATE medico SET crm = %s, nome = %s WHERE id = %s;", [medico.crm, medico.nome, medico.id])
      conn.commit()
      cur.close()
      conn.close()
      return True
    except Exception as e:
      print(e)
      return False
    
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
   
  def obter(self, id):
    sql = "SELECT * FROM medico WHERE id = %s;"
    conn = self.conexao.abreConexao()
    cur = conn.cursor()
    cur.execute(sql, [id])
    registro = cur.fetchone()
    medico = Medico(registro[1], registro[2], registro[0])
    cur.close()
    conn.close()
    return medico

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

class PacienteDAO:
  def __init__(self, conexao):
    self.conexao = conexao

  def adicionar(self, paciente):
    try:
      conn = self.conexao.abreConexao()
      cur = conn.cursor()
      cur.execute("INSERT INTO paciente (cpf, nome, data_nascimento) VALUES (%s, %s, %s);", [paciente.cpf, paciente.nome, paciente.data_nascimento])
      conn.commit()
      cur.close()
      conn.close()
      return True
    except Exception as e:
      print(e)
      return False

  def listar_todos(self):
    vetPaciente = []
    sql = "SELECT * FROM paciente ORDER BY id"
    conn = self.conexao.abreConexao()
    cur = conn.cursor()
    cur.execute(sql)
    for registro in cur.fetchall():
        print(registro)
        paciente = Paciente(registro[1], registro[2], registro[3], int(registro[0]))
        vetPaciente.append(paciente)
    cur.close()
    conn.close()
    return vetPaciente
  
  def obter(self, id):
    sql = "SELECT * FROM paciente WHERE id = %s;"
    conn = self.conexao.abreConexao()
    cur = conn.cursor()
    cur.execute(sql, [id])
    registro = cur.fetchone()
    paciente = Paciente(registro[1], registro[2], registro[3], int(registro[0]))
    cur.close()
    conn.close()
    return paciente

class ConsultaDAO:
  def __init__(self, conexao):
    self.conexao = conexao

  def adicionar(self, consulta):
    try:
      conn = self.conexao.abreConexao()
      cur = conn.cursor()
      cur.execute("INSERT INTO consulta (data_hora, paciente_id, medico_id) VALUES (%s, %s, %s);", [consulta.data_hora, consulta.paciente.id, consulta.medico.id])
      conn.commit()
      cur.close()
      conn.close()
      return True
    except Exception as e:
      print(e)
      return False
  
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


@app.route("/paciente_tela_adicionar")
def paciente_tela_adicionar():
  return render_template("paciente_tela_adicionar.html")

@app.route("/consulta_tela_adicionar")
def consulta_tela_adicionar():
  vetMedico = MedicoDAO(ConexaoPostgreSQL()).listar_todos()
  vetPaciente = PacienteDAO(ConexaoPostgreSQL()).listar_todos()
  return render_template("consulta_tela_adicionar.html", vetMedico = vetMedico, vetPaciente = vetPaciente)

@app.route("/medico_tela_editar/<int:id>")
def medico_tela_editar(id):
  conexao = ConexaoPostgreSQL()
  medicoDAO = MedicoDAO(conexao) 
  medico = medicoDAO.obter(id)
  return render_template("medico_tela_editar.html", medico=medico)

def erro(msg):
  return render_template("erro.html", msg=msg)


@app.route("/consulta_adicionar", methods = ['POST'])
def consulta_adicionar():
  consulta = Consulta()
  consulta.data_hora = request.form['data_hora']
  consulta.paciente = PacienteDAO(ConexaoPostgreSQL()).obter(int(request.form['paciente_id']))
  consulta.medico = MedicoDAO(ConexaoPostgreSQL()).obter(int(request.form['medico_id']))
  resultado = ConsultaDAO(ConexaoPostgreSQL()).adicionar(consulta)
  if (resultado is True): 
    return redirect(url_for('index'))
  else:
    return erro("Deu xabum!")

@app.route("/medico_adicionar", methods = ['POST'])
def medico_adicionar():
  medico = Medico()
  medico.crm = request.form['crm']
  medico.nome = request.form['nome']
  conexao = ConexaoPostgreSQL()
  medicoDAO = MedicoDAO(conexao) 
  resultado = medicoDAO.adicionar(medico)
  if (resultado is True): 
    return redirect(url_for('index'))
  else:
    return erro("Deu xabum!")
  

@app.route("/paciente_adicionar", methods = ['POST'])
def paciente_adicionar():
  paciente = Paciente()
  paciente.cpf = request.form['cpf']
  paciente.nome = request.form['nome']
  paciente.data_nascimento = request.form['data_nascimento']  
  resultado = PacienteDAO(ConexaoPostgreSQL()).adicionar(paciente)
  if (resultado is True): 
    return redirect(url_for('index'))
  else:
    return erro("Deu xabum!")


@app.route("/medico_editar", methods = ['POST'])
def medico_editar():
  medico = Medico()
  medico.id = int(request.form['id'])
  medico.crm = request.form['crm']
  medico.nome = request.form['nome']
  conexao = ConexaoPostgreSQL()
  medicoDAO = MedicoDAO(conexao) 
  resultado = medicoDAO.editar(medico)
  return redirect(url_for('index'))

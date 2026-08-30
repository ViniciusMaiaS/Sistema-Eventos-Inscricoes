import mysql.connector

try:
    conexao = mysql.connector.connect (
        host="localhost",
        user="root",
        password="toor",
)
    #OPERADOR TERNÁRIO
    print("Conectado com sucesso!!" if conexao.is_connected() else "Falha na conexão.")
    cursor = conexao.cursor()

    cursor.execute("CREATE DATABASE IF NOT EXISTS eventos")
    cursor.execute("USE eventos")

    print("Banco de dados 'eventos' selecionado com sucesso!")

except mysql.connector.Error as erro:
    print(f"Ocorreu um erro: {erro}")

finally:
    if 'cursor' in locals(): #cursor existe em cariaveis neste ponto de codigo?
        cursor.close()
    if 'conexao' in locals(): #cursor existe em cariaveis neste ponto de codigo?
        conexao.close()

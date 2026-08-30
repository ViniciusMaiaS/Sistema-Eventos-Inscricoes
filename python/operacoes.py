import mysql.connector

conexao = None
cursor = None

try:
    conexao = mysql.connector.connect(
        host="localhost",
        user="root",
        password="toor",
        database="eventos"
    )

    print("Conectado com sucesso!")

    cursor = conexao.cursor()

    # SELECT 1
    cursor.execute("SELECT * FROM participante")
    resultado = cursor.fetchall()

    print("\nParticipantes:")
    for participante in resultado:
        print(participante)

    # SELECT 2 com WHERE
    cursor.execute(
        "SELECT * FROM palestra WHERE id_evento = %s",
        (1,)
    )

    resultado = cursor.fetchall()

    print("\nPalestras do evento 1:")
    for palestra in resultado:
        print(palestra)

    # SELECT 3 com JOIN
    cursor.execute("""
        SELECT participante.nome, palestra.titulo, evento.nome
        FROM inscricao
        JOIN participante
        ON inscricao.id_participante = participante.id_participante
        JOIN palestra
        ON inscricao.id_palestra = palestra.id_palestra
        JOIN evento
        ON palestra.id_evento = evento.id_evento
    """)

    resultado = cursor.fetchall()

    print("\nInscrições:")
    for inscricao in resultado:
        print(inscricao)

    # INSERT
    cursor.execute(
        "INSERT INTO participante (nome, email, telefone) VALUES (%s, %s, %s)",
        ("Ana Souza", "ana@email.com", "11999999999")
    )

    conexao.commit()

    id = cursor.lastrowid

    print("\nParticipante inserido!")

    # UPDATE
    cursor.execute(
        "UPDATE participante SET telefone = %s WHERE id_participante = %s",
        ("11888888888", id)
    )

    conexao.commit()

    print("Participante atualizado!")

    # DELETE
    cursor.execute(
        "DELETE FROM participante WHERE id_participante = %s",
        (id,)
    )

    conexao.commit()

    print("Participante removido!")

except mysql.connector.Error as erro:
    print("Erro:", erro)

finally:
    if cursor:
        cursor.close()

    if conexao:
        conexao.close()

    print("Conexão fechada.")

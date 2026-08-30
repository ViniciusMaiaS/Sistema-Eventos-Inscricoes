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

    # INSERT
    cursor.execute(
        """
        INSERT INTO participante (nome, email, telefone)
        VALUES (%s, %s, %s)
        """,
        ("Ana Souza", "ana@email.com", "11999999999")
    )

    conexao.commit()

    id_participante = cursor.lastrowid

    print("\nParticipante inserido!")

    # SELECT 1
    cursor.execute("SELECT * FROM participante")
    resultado = cursor.fetchall()

    print("\nParticipantes:")
    for participante in resultado:
        print(participante)

    # UPDATE
    cursor.execute(
        """
        UPDATE participante
        SET telefone = %s
        WHERE id_participante = %s
        """,
        ("11888888888", id_participante)
    )

    conexao.commit()

    print("\nParticipante atualizado!")

    # Verifica UPDATE
    cursor.execute(
        "SELECT * FROM participante WHERE id_participante = %s",
        (id_participante,)
    )

    print("\nParticipante após atualização:")
    print(cursor.fetchone())

    # DELETE
    cursor.execute(
        """
        DELETE FROM participante
        WHERE id_participante = %s
        """,
        (id_participante,)
    )

    conexao.commit()

    print("\nParticipante removido!")

except mysql.connector.Error as erro:
    print("Erro:", erro)

finally:
    if cursor:
        cursor.close()

    if conexao:
        conexao.close()

    print("\nConexão fechada.")
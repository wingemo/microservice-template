# connection.py

import psycopg2  # Exempel: Om du använder PostgreSQL-databas

def connect_to_database():
    try:
        # Anslut till databasen
        connection = psycopg2.connect(user="username",
                                      password="password",
                                      host="localhost",
                                      port="5432",
                                      database="database_name")

        # Skapa en cursor
        cursor = connection.cursor()

        # Skriv SQL-frågan här och kör den med cursor.execute()

        # Kom ihåg att stänga cursor och anslutning när du är klar
        cursor.close()
        connection.close()

        print("Anslutning till databasen lyckades")

    except (Exception, psycopg2.Error) as error:
        print("Misslyckades med att ansluta till databasen:", error)

# Kör funktionen för att ansluta till databasen
if __name__ == '__main__':
    connect_to_database()

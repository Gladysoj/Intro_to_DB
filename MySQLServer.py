import mysql.connector
from mysql.connector import errorcode

def create_database():
    try:
        
        connection = mysql.connector.connect(
            host="localhost",      
            user="root",            
            password="12345"  
        )

        cursor = connection.cursor()

        try:
            cursor.execute("CREATE DATABASE IF NOT EXISTS alx_book_store")
            print("Database 'alx_book_store' created successfully!")
        except mysql.connector.Error as err:
            print(f"Failed to create database: {err}")

        cursor.close()
        connection.close()

    except mysql.connector.Error as err:
        
        if err.errno == errorcode.ER_ACCESS_DENIED_ERROR:
            print("Error: Invalid username or password.")
        elif err.errno == errorcode.ER_BAD_DB_ERROR:
            print("Error: Database does not exist.")
        else:
            print(f"Error: {err}")


if __name__ == "__main__":
    create_database()

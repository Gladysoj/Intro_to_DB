import mysql.connector
from mysql.connector import errorcode

def create_database():
    try:
        # Step 1: Connect to MySQL Server (not to a specific database yet)
        connection = mysql.connector.connect(
            host="localhost",       # Change if your MySQL server is remote
            user="root",            # Use your MySQL username
            password="12345"  # Replace with your actual password
        )

        cursor = connection.cursor()

        # Step 2: Try to create the database
        try:
            cursor.execute("CREATE DATABASE IF NOT EXISTS alx_book_store")
            print("Database 'alx_book_store' created successfully!")
        except mysql.connector.Error as err:
            print(f"Failed to create database: {err}")

        # Step 3: Close cursor and connection
        cursor.close()
        connection.close()

    except mysql.connector.Error as err:
        # Handle connection errors
        if err.errno == errorcode.ER_ACCESS_DENIED_ERROR:
            print("Error: Invalid username or password.")
        elif err.errno == errorcode.ER_BAD_DB_ERROR:
            print("Error: Database does not exist.")
        else:
            print(f"Error: {err}")

# Run the function
if __name__ == "__main__":
    create_database()

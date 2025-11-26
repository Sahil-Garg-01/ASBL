import sqlite3
import pandas as pd
import os

# Define file paths
base_dir = os.path.dirname(os.path.abspath(__file__))
customers_file = os.path.join(base_dir, 'csv/Customers.csv')
products_file = os.path.join(base_dir, 'csv/Products.csv')
orders_file = os.path.join(base_dir, 'csv/Orders.csv')
db_file = os.path.join(base_dir, 'db/asbl.db')


conn = sqlite3.connect(db_file)
cursor = conn.cursor()

def load_csv_to_db(csv_path, table_name):
    if os.path.exists(csv_path):
        try:
            df = pd.read_csv(csv_path)
            # Clean column names if necessary (strip whitespace)
            df.columns = df.columns.str.strip()
            
            # Write to SQLite
            df.to_sql(table_name, conn, if_exists='replace', index=False)
            print(f"Successfully loaded {table_name} from {csv_path}")
        except Exception as e:
            print(f"Error loading {table_name}: {e}")
    else:
        print(f"File not found: {csv_path}")

# Load tables
load_csv_to_db(customers_file, 'Customers')
load_csv_to_db(products_file, 'Products')
load_csv_to_db(orders_file, 'Orders')

print(f"\nDatabase created at: {db_file}")
print("You can now query this database using the SQLite extension in VS Code.")

conn.close()

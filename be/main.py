from fastapi import FastAPI
import mysql.connector

app = FastAPI()

db = mysql.connector.connect(
    host="db4free.net",
    user="myuserdb14",
    password="FaisalW14",
    database="testbackend14"
)



@app.get("/api")
async def root():
    cursor = db.cursor()
    cursor.execute("SELECT * FROM users")
    users = cursor.fetchall()
    cursor.close
    return users
import json
import pandas as pd
from sqlalchemy import create_engine
import os
from dotenv import load_dotenv

load_dotenv()

with open('output.json', 'r') as file:
    data = json.load(file)

import pandas as pd

df = pd.DataFrame(data)


engine = create_engine("postgresql+psycopg2://{}:{}@{}:{}/{}".format(
    os.getenv("DB_USER"),
    os.getenv("DB_PASSWORD"),
    os.getenv("DB_HOST"),
    os.getenv("DB_PORT"),
    os.getenv("DB_NAME")
))


df["id"] = df["id"].astype(str)

df.to_sql(
    "books_raw",
    con=engine,
    if_exists="append",
    index=False
)







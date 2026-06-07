import os
from dotenv import load_dotenv
from robot.api.deco import keyword
from pymongo import MongoClient

load_dotenv()

string_de_conexao = os.getenv('MONGO_URI')

client = MongoClient(string_de_conexao)

db = client['test']

@keyword('Remove task from database')
def remove_task_by_name(task_name):
    collection = db['tasks']
    collection.delete_many({'text': task_name})
    print('Removendo a tarefa '+ task_name )
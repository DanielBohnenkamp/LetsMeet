from bson.json_util import dumps
from pymongo import MongoClient
import json

if __name__ == '__main__':
    client = MongoClient()
    db = client.LetsMeet
    collection = db.users
    cursor = collection.find({})
    with open('collection.json', 'w') as file:
        json.dump(json.loads(dumps(cursor)), file)
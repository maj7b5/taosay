import json
from random import randint
import os
tjson = os.path.join(os.path.dirname(__file__),'tao.json')
tao = {}

def load():
    with open(tjson, 'r') as f:
        testao = json.load(f)
    return testao

tao = load()
keys = list(tao.keys())
i = randint(0,len(keys)-1)
print(tao[keys[i]])

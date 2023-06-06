import sys
args = sys.argv[1:]
file_path = args[0]
startrow = int(args[1])


import pandas as pd
from fuzzywuzzy import fuzz
from fuzzywuzzy import process
import json

df = pd.read_excel(file_path,skiprows=startrow-1)

def find_best_match(string, choices):
    return process.extractOne(string, choices, scorer=fuzz.token_sort_ratio)[0]

target_columns = ['ISBN','ชื่อเรื่องหนังสือ','ผู้แต่งเขียน','สำนักพิมพ์','ราคาปก','weightน้ำหนัก']


matches = []
for column in target_columns:
    best_match = find_best_match(column, df.columns)
    matches.append(best_match)

print(json.dumps({"matches": matches}))

###
# Generates SRA numbers for designated organism
###
import pandas as pd
import os
import json
from sys import argv
file_name = "_".join(argv[1:])
organism = " ".join(argv[1:])
df = pd.read_csv ('SraRunInfo.csv', low_memory = False)
column_names = ['scientific_name', 'model', 'occurences','bases']
df_results= pd.DataFrame(columns = column_names)

df_specific = df.loc[(df['ScientificName'] == organism) & (df['bases'] >= 100000000)]

df_specific = df_specific.sort_values(by =['bases'], ascending=False)

run_list = df_specific['Run'].to_list()
print(len(run_list))
with open(file_name+'_sraRuns.txt', 'w') as f:
	for i in range(0,len(run_list),10):
		line = ", ".join(run_list[i:i+10])
		print(line)
		line += "\n"
		f.write(line)


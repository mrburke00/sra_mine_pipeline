###
#Generates number of data samples of each organism and each sequencing 
#instrument over a threshold base value 
#Produces multiOrganism_results.csv
###
import pandas as pd
from EcoNameTranslator import to_common
import os
import json

df = pd.read_csv ('SraRunInfo.csv', low_memory = False)
column_names = ['scientific_name', 'model', 'occurences','bases']
df_results= pd.DataFrame(columns = column_names)

with open('tax_corpus.json') as json_file:
	corpus = json.load(json_file)



for index, row in df.iterrows():
	new_row = {}
	if row['bases'] >= 20000000000: #20gigabases threshold
		if row['ScientificName'] not in df_results['scientific_name'].values: #name and platform doesnt exist
			new_row['scientific_name'] = row['ScientificName']
			new_row['model'] = row['Model']
			new_row['occurences'] = 1
			new_row['bases'] = row['bases']
			df_results.loc[len(df_results)] = new_row
		else:
			if ((df_results['model'] == row['Model'])&(df_results['scientific_name'] == row['ScientificName'])).any(): #platform and name exist 
				index_list = df_results[(df_results['model'] == row['Model'])&(df_results['scientific_name'] == row['ScientificName'])].index.tolist()
				df_results.loc[index_list[0]]['occurences'] += 1
				df_results.loc[index_list[0]]['bases'] += row['bases']				
			else: #name exists but not platform
				new_row['scientific_name'] = row['ScientificName']
				new_row['model'] = row['Model']
				new_row['occurences'] = 1
				new_row['bases'] = row['bases']
				df_results.loc[len(df_results)] = new_row
df_final = df_results.sort_values(by =['scientific_name'])

scientific_names = df_final['scientific_name'].tolist()
common_names = []
for name in scientific_names:
	if name in corpus.keys():
		common_name = corpus[name]
		if common_name == '':
			common_name = 'UNK'
	else:
		common_name = 'UNK'
	common_names.append(common_name)

df_final['common_name'] = common_names
df_final.rename(columns = {'bases' : 'sum bases'}, inplace=True)
df_final.to_csv('multiOrganism_results.csv')


print('done')
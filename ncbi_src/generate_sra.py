###
# Generates SRA numbers for designated organism
###
import pandas as pd
import os
import json

df = pd.read_csv ('SraRunInfo(1).csv', low_memory = False)
column_names = ['scientific_name', 'model', 'occurences','bases']
df_results= pd.DataFrame(columns = column_names)

df_specific = df.loc[(df['ScientificName'] == 'Gallus gallus') & (df['bases'] >= 20000000000)]

df_specific = df_specific.sort_values(by =['bases'], ascending=False)
print(df_specific.iloc[0:50])
print(df_specific['Run'].head(50).to_list())
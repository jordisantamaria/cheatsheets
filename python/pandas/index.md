Basic
===============================================================================

```
df.iloc[:5,:]                  # Get all data from first 5 columns
df.head(n)                     # Return first n rows, default 5
df.tail(n)                     # Return last n rows, default 5
df.iloc[::3, -1] = np.nan      # Change values of filtered data
df.info()                      # To see type of column values and missing values
```

## Series

Serie is a dataframe column

```
serie = df['key']
serie.values          # Array with values of the serie
```

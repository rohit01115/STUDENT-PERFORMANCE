import pandas as pd
import numpy as np

print("Loading dataset...")

df = pd.read_csv("C:\\Users\\ROHIT\\OneDrive\\Desktop\\Student performance\\cleaned\\student-por - Copy.csv")


print("\nFirst 5 rows:")
print(df.head())

print("\nDataset information:")
print(df.info())

print("\nRows and columns:")
print(df.shape)

print("\nColumn names:")
print(df.columns.tolist())

print("\nPython analysis completed!")

# Basic data exploration

print("\nTotal number of rows:")
print(len(df))

print("\nDataset shape:")
print(df.shape)

print("\nColumn data types:")
print(df.dtypes)

print("\nStatistical summary:")
print(df.describe())

print("\nLast 5 rows:")
print(df.tail())

# Check missing values
print("\nMissing values:")
print(df.isnull().sum())

# Check duplicate rows
print("\nDuplicate rows:")
print(df.duplicated().sum())
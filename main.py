import sys
import pandas as pd
import matplotlib.pyplot as plt
df = pd.read_csv(sys.argv[1],sep='\t',names=['x','y'])
print(df.head())
print(df.describe())
freq_df = df.groupby(list(df.columns)).size().reset_index(name='Frequency')
print(freq_df.head())
print(df.shape,freq_df.shape)

# Normalize the frequency to be between 0 and 1 for color mapping
freq_df['normalized_freq'] = (freq_df['Frequency'] - freq_df['Frequency'].min()) / (freq_df['Frequency'].max() - freq_df['Frequency'].min())


plt.figure(figsize=(8, 6))
plt.scatter(freq_df['x'],freq_df['y'], s=100, c=freq_df['normalized_freq'], cmap='Blues', alpha=0.8)


plt.colorbar(label='Frequency (normalized)')

# Label the axes
plt.xlabel('X-axis')
plt.ylabel('Y-axis')
plt.title('Scatter Plot with Frequency Intensity')

# Show grid
#plt.grid(True)

# Step 3: Save the plot as a JPEG file
plt.savefig('vplot.jpeg', format='jpeg')
plt.close()

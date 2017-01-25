class: center, middle

# Overview of Data Analysis Tools

---

This is a high-level map to the current landscape of general-purpose data analysis tools. The main purpose is to point you in the direction of free tools that are easily accessible to non-experts, as well as what situations they are best suited.

---

## Spreadsheet Applications

Ubiquitous, graphical interface, shallow learning curve for easy tasks

- **Microsoft Excel** -- not free or open source but  everywhere and is what everyone knows
- **Google Sheets** -- not open source but free and easy to share/collaborate, if you trust Google and the cloud
- **[LibreOffice](https://www.libreoffice.org/) Calc** -- the most well-maintained open source office software suite

### What it's good for

- Small enough datasets to not give your computer a stroke
- You need to eyeball your dataset all at once
- If formatting, colored shading, or borders are useful for highlighting what you're looking at

### Beware
- **Autoformatting**, especially when reading a .csv file (e.g., it formats dates or times). One can avoid this by choosing `Import > Import as a Text File`.

---

## Programming / Code

Writing code to load and process data

### What it's good for

- Large datasets you don't need to look at all at once
- Repetitive computations or transformations
- Distribute code someone else can use to reproduce your work
- Extensible to do more advanced stuff, e.g., build apps, interactive visualizations, machine learning

### Recommended ecosystems

- R
- Python

Python will be more comfortable to people with software engineering/development experience.

---

## R

### Common libraries

A lot of common data frame and stats functionality are part of base or system packages.

- Advanced data frames: `dplyr`, `data.table`
- Reshaping: `tidyr`
- Plotting: `ggplot2`
- Time series: `zoo`
- Maps: `leaflet`
- Machine learning: `caret`

### Recommended way to get it / programming environment
- [RStudio](https://www.rstudio.com/products/rstudio/#Desktop)

---

## Python

## Common libraries

- Data frames: `pandas`
- Math and stats: `numpy`, `scipy`
- Plotting: `matplotlib`, `seaborn`
- Maps: `leaflet`
- Machine learning: `scikit-learn`

### Recommended way to get it
- [Anaconda](https://www.continuum.io/downloads) -- handles installing Python and any packages

### Recommended programming environment
- [Jupyter Notebook](http://jupyter.org/) -- can render natively on GitHub
- [Spyder](https://pythonhosted.org/spyder/)

---

## Other things you'll hear about

- SAS -- proprietary
- SPSS -- proprietary
- Julia -- open source and can do computations very quickly, but more for power users that care about speed
- Hadoop -- file system for big data
- Spark -- distributed computing for big data

---

## Storing Data

### .csv
- Stands for comma-separated values
- Used for tabular data
- Can basically be universally read by any tool
- Stored in plain text, so you can examine it without a program if you need to

### Others
- **Excel files (.xls / .xlsx)** -- if formatting is important to save, but otherwise avoid it because it can be harder to load
- **json** -- for unstructured data
- **binary formats** -- preserves datatypes, faster read/write than .csv. Includes: .rds in R, pickle in Python, feather

## Databases

### Do I need a database?

Databases have a lot of benefits but come with overhead. You might want to use a database if you:
- Require multiple people to write to it at the same time
- Need to maintain this dataset over time and integrity is important
- Are going to be reading and writing data regularly because it's supporting an application

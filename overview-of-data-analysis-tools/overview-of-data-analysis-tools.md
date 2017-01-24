# Overview of Data Analysis Tools

---

This is a high-level map to the current landscape of general-purpose data analysis tools. The main purpose is to point you in the direction of free tools that are easily accessible to non-experts, as well as what situations they are best suited.


## Spreadsheet Applications

**Microsoft Excel | LibreOffice Calc | Google Sheets**

### What it's good for

- Examining raw data of small datasets
- If formatting, colored shading, or borders are useful for highlighting certain values

### How to get it

### Beware
- **Autoformatting**, especially when reading a .csv file. One can avoid this by choosing Import > Import as a Text File.

---

## R

### How to get it
- RStudio

---

## Python

### How to get it
- Recommend using the [Anaconda] package manager.


---

## Other things you'll hear about

- SAS --
- SPSS --
- Julia -- can do computations very quickly, but more for power users
- Hadoop (HDFS) -- this is a file system
- Spark --

---

## Storing Data

### .csv
- Stands for comma-separated values
- Used for tabular data
- Can basically be universally read by any tool
- Stored in plain text, so you can examine it without a program if you need to

### Others
- Excel files (.xls / .xlsx) -- if formatting is important to save, but otherwise avoid it because it can be harder to load
- json -- for unstructured data
-

### Do I need a database?

Databases have a lot of benefits but come with overhead. You might want to use a database if you:
- Require multiple people to write to it at the same time
- Are going to be reading and writing data regularly because it's supporting an application

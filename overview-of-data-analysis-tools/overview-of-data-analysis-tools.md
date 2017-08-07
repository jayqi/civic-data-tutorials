class: center, middle

# Overview of Data Analysis Tools

---

This is a high-level map to the current landscape of general-purpose data analysis tools that are accessible to non-experts. The objective is to point you in the direction of common tools and what situations they are best suited, with an emphasis on tools that are free or open-source.

The four major topics are:
1. Analyzing data
2. Getting data
3. Storing data
4. Best practices

---

## (1) Analyzing Data

When you already have some data that you want to get some value out of.

---

### Spreadsheet Applications

Ubiquitous, graphical interface, shallow learning curve for easy tasks

- **Microsoft Excel** -- not free or open source but is everywhere and is what everyone knows
- **Google Sheets** -- not open source but free and easy to share/collaborate, if you trust your data to be in Google's cloud
- **[LibreOffice](https://www.libreoffice.org/) Calc** -- the most well-maintained open source office software suite

#### What it's good for

- Small enough datasets to not give your computer a stroke
- You need to eyeball your dataset all at once
- If formatting, colored shading, or borders are useful for highlighting what you're looking at
- Manual data entry

#### Beware
- **Autoformatting**: this can change values in your data, especially with date and times. Tips for avoiding:
    - When opening files, use `Import > Import as a Text File`
    - Formatting cells as `Text`. This needs to be done _before_ you enter or paste data.

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

Extensible (with open source libraries), easy to find resources and examples (Google, blogs, open workshops and tutorials, StackOverflow)

#### Which one?
For most purposes, they are fairly equivalent. Python will be more comfortable to people with software engineering/development experience.

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

### Proprietary languages/ecosystems

Powerful software packages that come with modules for many common statistical analyses. Have both some graphical interface tools and programming languages. Expensive, but often used by large companies or research institutions.

- SAS
- SPSS (IBM)
- MATLAB

### Advanced tools
- Julia -- open source language. Can do computations very quickly, but more for power users that care about speed.
- Scala
- Hadoop -- file system for big data
- Spark -- distributed computing for big data

---

## Business Intelligence Suites

Software designed for business users to quickly perform analytics and create visualizations and dashboards.

- Tableau
- Power BI (Microsoft)

Costs money to get subscripts or licenses. Often has free restricted versions.

---

## (2) Getting Data

## Where to get data?

Some good places to look:
- Institutional data portals (e.g., City of Chicago, data.gov)
- Quandl -- economic and financial data
- Enigma Public -- platform with mirrors of government datasets
- data.world -- social network for people to upload datasets
- Kaggle -- datasets used for competitions or uploaded by users

---

## APIs

Many websites have REST APIs:
- API: application programming interface -- entry point for interacting with the website with programming.
- REST: representational state transfer -- a particular design pattern that has become standard. It means you can expect the API to be structured a certain way.

You can use a *GET HTTP request* to retrieve data from the API.

## Easiest: Special packages

Someone (often the website owner) has created packages to make it easier query data through the API. Find out of this exists first.

RSocrata --  R package for interacting with the Socrata platform used by many government data portals. Created by City of Chicago

## In general:

You just need a way to make GET requests. Recommended:
- *Python*: requests library
- *R*:

---

## Web Scraping

Sometimes there is no API and you need to get unstructured data from webpages directly. There are some tools for downloading webpages and parsing the raw HTML to extract data.

R:
- rvest

Python:
- requests
- BeautifulSoup4

---

## (3) Storing Data


---

### Flat Files

Generally will need to be read into memory entirely to access.

#### .csv
- Stands for comma-separated values
- Used for tabular data
- Can basically be universally read by any tool
- Stored in plain text, so you can examine it without a program if you need to

#### Others
- **Excel files (.xls / .xlsx)** -- if formatting is important to save, but otherwise avoid it because it can be harder to load
- **json** -- for unstructured data
- **binary formats** -- preserves datatypes, faster read/write than .csv. Includes: .rds in R, pickle in Python, feather

---

### Databases

#### Do I need a database?

Databases have a lot of benefits but come with overhead. You might want to use a database if you:
- Require multiple people to write to it at the same time
- Need to maintain this dataset over time and integrity is important
- Are going to be reading and writing data regularly because it's supporting an application

---

## (4) Best Practices

- Documentation
- Reproducibility
- Version Control

### Documentation

- Comment your code
-

---

### Reproducibility

---

### Version Control

Git is overwhelmingly most popular software for version-control of code.

---

## Helpful Principles to Remember

When planning a project and selecting tools, keep in mind:

1. *Always Try Google* -- If you need something, try googling it. Chances are that something will turn up.
2. *Keep It Simple* -- Simple systems usually work better than complicated ones
3. *Minimum Viable Products* -- Get value sooner. Test your ideas. Fail fast, learn quickly.
4. *Sustainability* -- Sustain value over time. Product needs to be easily maintainable (possibly by others). Following best practices are important for this.

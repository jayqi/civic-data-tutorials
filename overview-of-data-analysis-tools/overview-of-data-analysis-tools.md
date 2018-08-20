class: center, middle

# Overview of Data Analysis Tools

---

### What is this about?

This is a high-level map to the current landscape of general-purpose data analysis tools that are accessible to non-experts.

The objective is to point you in the direction of common tools and what situations they are best suited, with an emphasis on tools that are free or open-source.

The four major topics are:
1. Analyzing data
2. Getting data
3. Storing data
4. Best practices

### This content is open source!

Check out the source code on [GitHub](https://github.com/jayqi/civic-data-tutorials/tree/master/overview-of-data-analysis-tools). Both markdown document and slide deck versions are there. 

---

## 1. Analyzing data

When you already have some data that you want to get some value out of.

Topics:
- Spreadsheet applications
- Programming / Code
- Business intelligence suites

---

### Spreadsheet applications

Ubiquitous; graphical interface; shallow learning curve for easy tasks

- **Microsoft Excel** -- not free or open source, but is everywhere and familiar
- **Google Sheets** -- not open source, but free and easy to share/collaborate, if you trust your data to be in Google's cloud
- **[LibreOffice](https://www.libreoffice.org/) Calc** -- the most well-maintained open source office software suite

#### What it's good for

- Small enough datasets to not give your computer a stroke
- You need to eyeball your dataset all at once
- If formatting, colored shading, or borders are useful for highlighting something
- Manual data entry

#### Beware
- **Autoformatting**: this can change values in your data, especially with timestamps. Tips for avoiding:
    - When opening files, use `Import > Import as a Text File`
    - Formatting cells as `Text`. Must be done _before_ you enter or paste data.

---

### Programming / Code

Writing code to load and process data

#### What it's good for

- Large datasets you don't need to look at all at once
- Repetitive computations or transformations
- Distributing/sharing code to collaborate, or so someone else can reproduce your work
- Extensible to do more advanced stuff, e.g., build apps, interactive visualizations, machine learning

---

### Which programming language?

#### Recommended ecosystems

- R
- Python

#### Key advantages

- Free
- Extensible (enormous number of open source libraries online)
- Easy to find resources and examples (Google, blogs, open tutorials and videos, StackOverflow)

#### Which one?

For most purposes, they are fairly equivalent. Python will be more comfortable to people with software engineering/development experience.

---

### R

#### Common libraries

A lot of common data frame and stats functionality are part of base or system packages.

- Advanced data frames: `dplyr` ([cheat sheet](https://github.com/rstudio/cheatsheets/raw/master/source/pdfs/data-transformation-cheatsheet.pdf)), `data.table` ([cheat sheet](https://s3.amazonaws.com/assets.datacamp.com/img/blog/data+table+cheat+sheet.pdf))
- Reshaping: `tidyr`
- Plotting: `ggplot2` ([cheat sheet](https://www.rstudio.com/wp-content/uploads/2016/11/ggplot2-cheatsheet-2.1.pdf)), `plotly`
- Time series: `zoo`
- GIS/Maps: `leaflet` ([tutorials](https://rstudio.github.io/leaflet/)), `sp`, `sf` ([GIS in R](https://www.jessesadler.com/post/gis-with-r-intro/))
- Natural language processing: `tm`, `quanteda`, `tidytext` ([book](https://www.tidytextmining.com/))
- Machine learning: `caret`

#### Recommended way to get it / programming environment
- [RStudio](https://www.rstudio.com/products/rstudio/#Desktop)

#### Additional resources

Many great cheat sheets from RStudio: [link](https://www.rstudio.com/resources/cheatsheets/)

---

### Python

#### Common libraries

- Data frames: `pandas` ([cheat sheet](https://github.com/pandas-dev/pandas/blob/master/doc/cheatsheet/Pandas_Cheat_Sheet.pdf))
- Math and stats: `numpy`, `scipy`
- Plotting: `matplotlib`, `seaborn`, `plotly`
- GIS/Maps: `folium`, `shapely`
- Natural language processing: `nltk`, `spaCy`
- Machine learning: `scikit-learn`

#### Recommended way to get it
- [Anaconda](https://www.continuum.io/downloads) -- handles installing Python and any packages

#### Recommended programming environment
- [Jupyter Notebook](http://jupyter.org/) -- can render natively on GitHub
- [Spyder](https://pythonhosted.org/spyder/) -- open source IDE, like MATLAB and RStudio
- [PyCharm](https://www.jetbrains.com/pycharm/) -- commercial IDE, free version available

---

### Other things you'll hear about: Proprietary packages

Powerful, paid software packages with modules for common statistical analyses. Have both some graphical interface tools and programming languages.

- SAS
- SPSS (IBM)
- MATLAB

Expensive, but often used by large companies or research institutions in many industries.

---

### Other things you'll hear about: Advanced tools

- **Julia** -- open source language; fast computations, but more for power users that care about high performance.
- **Scala** -- runs on Java virtual machine; fast, strongly typed; good if you're deploying at scale
- **Hadoop** -- distributed file system for "big data"
- **Spark** -- distributed computing framework for "big data"

#### Big data?

You only need "big data" tools (i.e., distributed computing) if your situation involves
- High **volume**: you can't fit it on the hard drive or in memory on one machine
- High **velocity**: you need the results of analyses instantaneously as new data is created

Most practical situations don't have those requirements and don't need "big data" tools.

---

### Business intelligence suites

Paid software designed for business users to quickly perform analytics and create visualizations and dashboards.

- Tableau
- Power BI (Microsoft)

Costs money to get subscriptions or licenses. Often has free, restricted versions. Some have license donation programs for nonprofits, e.g. [Tableau](https://www.tableau.com/foundation/license-donations).

Potential option if you need straightforward, professional-looking visualizations, but you don't have time to build up expertise or deal with customization for programming options.

---

## 2. Getting Data

Getting data can range in difficulty. If you're lucky, you can click a link and download a file.

We'll cover:
- Hitting APIs
- Scraping webpages

#### Some useful places to look for datasets

- Institutional data portals (e.g., [City of Chicago](https://data.cityofchicago.org), [data.gov](https://www.data.gov/))
- [Quandl](https://www.quandl.com/search?query=) -- economic and financial data (some free, some paid)
- [Enigma Public](https://public.enigma.com/) -- platform with mirrors of government datasets
- [data.world](https://data.world/) -- social network for people to upload datasets
- [Kaggle](https://www.kaggle.com/) -- datasets used for competitions or uploaded by users

These websites often have online viewers, easy download buttons, APIs, and special packages to download directly in R, Python, etc.

---

### What are APIs?

Many websites have REST API endpoints.
- API: application programming interface -- entry point for interacting with the website with programming.
- REST: representational state transfer -- a particular design pattern that has become standard. It means you can expect the API to be structured and behave in a certain way.

Key thing to know is that they have a standardized design, and you can use a **GET HTTP request** to retrieve data from the API endpoint.

Example: Chicago Building Permits
`https://data.cityofchicago.org/resource/9pkb-4fbf.json?_permit_type=PERMIT - RENOVATION/ALTERATION`


When to use APIs:
- The data is frequently changing, and you want to get the most up-to-date
- You only need a subset of the full dataset. You can put a query in the endpoint and get back only what you need.

Usually data is `json` format but some websites have `csv` options.

---

### Getting data from APIs

#### First: Check for special packages

Sometimes someone (often the website owner) has created packages ("clients") to make it easier query data through the API. This can make things a lot easier!

Examples:
- [`RSocrata`](https://github.com/Chicago/RSocrata) (R), [`sodapy`](https://pypi.python.org/pypi/sodapy) (Python) -- clients for Socrata platform used by many government data portals
- `Quandl` ([R](https://www.quandl.com/tools/r))  ([Python](https://www.quandl.com/tools/python)) -- clients for Quandl API
- [`twitteR`](https://www.rdocumentation.org/packages/twitteR/versions/1.1.9) (R), [`python-twitter`](https://github.com/bear/python-twitter) (Python) -- clients for Twitter API
- [`acs`](https://cran.r-project.org/package=acs) (R), [`census`](https://github.com/datamade/census) (Python) -- client for U.S. Census data

#### In general:

You just need a way to make GET requests. Recommended:
- **Browser**: if you just need one dataset, you can go to URL and save as text
- **Python**: [`requests`](http://docs.python-requests.org/en/master/) library
- **R**: [`httr`](https://cran.r-project.org/web/packages/httr/vignettes/quickstart.html) library

---

### Web scraping

Sometimes there is no API and you need to get unstructured data from webpages directly. There are some tools for downloading webpages and parsing the raw HTML to extract data.

R:
- [rvest](https://github.com/hadley/rvest)

Python:
- [requests](http://docs.python-requests.org/en/master/) -- for reading pages
- [BeautifulSoup4](https://www.crummy.com/software/BeautifulSoup/bs4/doc/) -- for parsing HTML

---

## 2. Storing data

How to store your data so you can use it again later.

- Flat files
- Databases

---

### Flat files

Generally will need to be read into memory entirely to access.

#### .csv (comma-separated values)
- Used for tabular data
- Can basically be universally read by any tool
- Stored in plain text, so you can examine it without special program if needed

#### .json (JavaScript object notation)
- For unstructured data
- Used widely for passing data over the web or between applications
- Stored in plain text, so you can examine it without special program if needed

#### Others
- **Excel files (.xls / .xlsx)** -- if formatting is important to save, but otherwise avoid it because it can be harder to load
- **binary formats** -- preserves datatypes, faster read/write than .csv, but larger file size. Includes: `.rds` in R, `pickle` in Python, `feather`

---

### Databases

A **database management systems** (a.k.a. database software) stores your data and lets users interact with it to query or update. Broad categories:
- **Relational** (**SQL**) -- row-oriented tabular data.
  - Examples: PostgreSQL, SQLite ([which to use](https://www.sqlite.org/whentouse.html))
- **NoSQL** -- high-volume data, high-velocity data, and/or flexible data structure (unstructured or non-tabular structure).
  - Types and examples: Document (MongoDB, Elasticsearch), Key-value (Redis), Column-oriented (Cassandra), Graph (Neo4j)

**Use SQL if you can. Most data will work with SQL.** Easy-to-use, easy to find expertise, data consistency guarantees.

#### Do I need a database?

Databases have benefits but come with overhead. You might want to use one if you:
- Require multiple people to write to it at the same time
- Need to maintain this dataset over time and integrity is important
- Are reading and writing data frequently because it's supporting an application
- Have a large dataset and typically only typically look at a subset

---

## 4. Best practices

Following best practices helps you get things done efficiently, make it easier to collaborate, and contributes to long-term success.

- Documentation
- Reproducibility
- Version control

---

### Documentation

Important because:
- Makes collaboration easier / makes collaboration possible
- You will remember when you did when you come back to it later
- Reduces mistakes

What to document:
- Why you made certain decisions
- Key results
- Comment your code
- Write instructions for how to use your code (README, package documentation)

Tools that make this easier:
- Rmarkdown -- easily write reports with embedded R code and results ([tutorial](http://rmarkdown.rstudio.com/lesson-1.html))
- R Notebooks (RStudio) and Jupyter Notebooks -- interactive coding that doubles as presentable report
- Roxygen2 (R) ([vignette](https://cran.r-project.org/web/packages/roxygen2/vignettes/roxygen2.html)), Python docstrings ([tutorial](http://www.pythonforbeginners.com/basics/python-docstrings)) -- for documenting packages you write

---

### Reproducibility

Someone else should be able to use the **same code** and **same data** to generate the **same results**.

This is a critical part of **science** part of data science. Others can understand what you did and check that it makes sense. It's also important for coming back to an analysis later.

One reason why documentation is important.

Package dependency management is important part. Tools:
- R: `packrat`
- Python: `anaconda`

---

### Version Control

#### Code
- **Git** is version-control software -- the overwhelmingly most popular option. ([interactive tutorial](https://try.github.io/levels/1/challenges/1))
- **GitHub** is a website that hosts (generally public) Git repositories. It's where people share open-source code. ([tutorial](https://guides.github.com/activities/hello-world/))

#### Project documentation

Wikis are great for collaborative project documentation and usually have built-in revision tracking.
- **GitHub built-in wiki** -- comes with each repo. For public, open-source projects.
- **MediaWiki** -- the software that powers Wikipedia.
- **DokuWiki** -- another popular, open-source wiki software

#### Data

- Git is for code, not for data.
- Not a solved problem. Active area of work. (Recently popular: [Pachyderm](https://github.com/pachyderm/pachyderm))

---

## Final tips

When planning a project and selecting tools, keep in mind:

1. **Always try Google** -- If you need something, try googling it. Chances are that something will turn up.
2. **Keep it simple** -- Simple systems usually work better than complicated ones.
3. **Minimum viable products** -- Learn quickly. Test your ideas. Fail fast.
4. **Consider sustainability** -- Sustain value over time. Product needs to be easily maintainable (possibly by others). Following best practices are important for this.

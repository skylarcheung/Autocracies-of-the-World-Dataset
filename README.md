# Autocracies-of-the-World-Dataset
## Data visualization: the <a href="https://fsi-live.s3.us-west-1.amazonaws.com/s3fs-public/res/Codebook.pdf"> Autocracies of the World Data Set</a> by Stanford's Center on Democracy, Development and the Rule of Law

### Part 1: What is this?<br>
Dr. Seva Gunitsky at the University of Toronto emailed me the other day. He asked about the relationship between single-party
states and personalist regimes over time. This question can be answered with graphs. To make these graphs, I started by finding the AoW dataset, which assigns countries personalism scores (on a scale of 0-2), as well as
their regime type from 1950 to 2012. There's a ton of data in the AoW dataset, but it needs to be sorted for my desired use. So, the code in this repository does
the sorting, and the turn-the-numbers-into-a-graph bit as well.
<br><br>
This repository is helpful if you want some code to show you two cool graphs. Not just to see the graphs, but to also copy my code to make graphs of your own using data from AoW.

### Part 2: How do I use this?
I've added a ton of comments into the R code, so you can just read the instructions indicated by the in-line comments to follow along. This repository includes the AoW dataset file, 
as well as the code I wrote. The code creates visualizations using ggplot2 and cleans up the data using dplyr. To get started, just download the files and start up R Studio.

### Part 3: Plans going forward:
Likely more datasets will be added to include variables like GDP per capita. The goal is to use R Studio's Shiny package to create some interactive graphics for the web.
<br><br>
Thanks for reading! Get in touch in the issues tab if you need anything!

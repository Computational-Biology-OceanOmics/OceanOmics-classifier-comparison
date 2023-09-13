# Code to run the OceanOmics classifier comparison scripts and figures

Launch analysis (RStudio): [![Binder](https://mybinder.org/badge_logo.svg)](https://mybinder.org/v2/gh/Hobbeist/reproducibility-template-R/HEAD?urlpath=rstudio)  
  
  
[![run with docker](https://img.shields.io/badge/run%20with-docker-0db7ed?labelColor=000000&logo=docker)](https://www.docker.com/) [![run with singularity](https://img.shields.io/badge/run%20with-singularity-1d355c.svg?labelColor=000000)](https://sylabs.io/docs/)

## Analysis
This repository contains all data and code to generate the figures and statistics for the analysis `XXXX`. Simply click on the above `binder` button to launch either a Rstudio or Jupyter notebook session in the browser, with access 
to all code and data in this GitHub repository. There, the code can interactively be changed and different plots and statistics can be (re-)created.

### What is binder?
For an overview of what binder is, please check out [this link](https://mybinder.org/).  

## Where does the data in this repo come from?

TODO 

# Documentation: Add documentation on any data created from raw files here

TODO

## How to run this

The entire analysis is based on R targets. Check out the repo, run `targets::tar_make()`, it should rerun the entire analysis and make all figures.

(regenerate the following using `cat('```mermaid', tar_mermaid(), '```', sep='\n')`)

```mermaid
graph LR
  style Legend fill:#FFFFFF00,stroke:#000000;
  style Graph fill:#FFFFFF00,stroke:#000000;
  subgraph Legend
    direction LR
    x7420bd9270f8d27d([""Up to date""]):::uptodate --- xbf4603d6c2c2ad6b([""Stem""]):::none
    xbf4603d6c2c2ad6b([""Stem""]):::none --- xf0bce276fe2b9d3e>""Function""]:::none
  end
  subgraph Graph
    direction LR
    x264c7e682ec442b2(["dendrogram"]):::uptodate --> xaf4a1b2829040c15(["saved"]):::uptodate
    x64d5b6c864f8ce9c>"save_plot"]:::uptodate --> xaf4a1b2829040c15(["saved"]):::uptodate
    xf2c68c9c4c5bbbc3(["classifier_distances"]):::uptodate --> x4cbe0500373226c1(["classifier_data"]):::uptodate
    x8279777903f3f13d>"get_classifier_data"]:::uptodate --> x4cbe0500373226c1(["classifier_data"]):::uptodate
    x4cbe0500373226c1(["classifier_data"]):::uptodate --> x264c7e682ec442b2(["dendrogram"]):::uptodate
    x994946b41121bfa6>"plot_dendrogram"]:::uptodate --> x264c7e682ec442b2(["dendrogram"]):::uptodate
  end
  classDef uptodate stroke:#000000,color:#ffffff,fill:#354823;
  classDef none stroke:#000000,color:#000000,fill:#94a4ac;
  linkStyle 0 stroke-width:0px;
  linkStyle 1 stroke-width:0px;
```
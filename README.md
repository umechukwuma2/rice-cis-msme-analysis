# Climate Information Services for Rice MSMEs

Replication code for the paper:

**Climate Information Services for Rice MSMEs: Access, Reliability, and Decision Use among Women- and Youth-Led Enterprises in Kenya and Nigeria**

## Overview
This repository contains analysis code for examining access to weather information,
perceived reliability, and delivery preferences among rice MSMEs in Kenya and Nigeria.

## Methods
- MSME typologies constructed using k-medoids clustering
- Descriptive analysis by value-chain role and country
- Ordered logistic regression models of perceived reliability
- Robust standard errors (HC1)

## Data availability
Survey, FGD, and KII data contain sensitive information and are not publicly shared.
Anonymized data may be requested from the corresponding author.

## Repository structure
- `code/` R scripts for analysis
- `data/` documentation of expected data structure
- `output/` generated figures and tables

## Software
R ≥ 4.2  
Packages: MASS, dplyr, sandwich, lmtest, pscl

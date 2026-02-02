############################################
# Project: Climate Information Services for Rice MSMEs
# File: 04_ordered_logit_models.R
# Purpose: Ordered logit models of perceived reliability
############################################

# Load required packages
library(MASS)        # polr()
library(dplyr)
library(sandwich)
library(lmtest)
library(pscl)

# Load prepared data
# (Data preparation script should create this file)
df <- read.csv("data/analysis_dataset.csv")

# Restrict to MSMEs with access to weather information
df <- df %>% filter(weather_access == 1)

# Outcome variable as ordered factor
df$reliability <- factor(
  df$reliability,
  levels = c(1, 2, 3, 4),
  ordered = TRUE
)

# MSME type (reference: Rice farmers)
df$msme_type <- relevel(
  factor(df$msme_type),
  ref = "Rice farmer"
)

############################################
# Model 1: Digital readiness only
############################################
m1 <- polr(
  reliability ~ digital_readiness,
  data = df,
  method = "logistic",
  Hess = TRUE
)

coeftest(m1, vcov = vcovHC(m1, type = "HC1"))

############################################
# Model 2: Structural controls
############################################
m2 <- polr(
  reliability ~ digital_readiness +
    country +
    education +
    msme_type,
  data = df,
  method = "logistic",
  Hess = TRUE
)

coeftest(m2, vcov = vcovHC(m2, type = "HC1"))

############################################
# Model 3: Information sources
############################################
m3 <- polr(
  reliability ~ digital_readiness +
    country +
    education +
    msme_type +
    source_government +
    source_mobile_app +
    source_social_media,
  data = df,
  method = "logistic",
  Hess = TRUE
)

coeftest(m3, vcov = vcovHC(m3, type = "HC1"))

############################################
# Model 4: Information quality constraints
############################################
m4 <- polr(
  reliability ~ digital_readiness +
    country +
    education +
    msme_type +
    source_government +
    source_mobile_app +
    source_social_media +
    not_localized +
    difficult_to_interpret +
    no_trust_accuracy +
    smartphone_internet,
  data = df,
  method = "logistic",
  Hess = TRUE
)

coeftest(m4, vcov = vcovHC(m4, type = "HC1"))

############################################
# Model fit statistics
############################################
logLik(m1); logLik(m2); logLik(m3); logLik(m4)
AIC(m1, m2, m3, m4)
BIC(m1, m2, m3, m4)

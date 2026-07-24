## Flow State: LogNormal BRMS Model
## For sbatch in computing cluster

library(brms)
library(tidyverse)

options(mc.cores = 3)


## Read in Data
#eas


## Fit lognormal model

prior_single <- c(
  # Mean model: mu
  prior(normal(log(28), 0.15), class = "Intercept"),
  prior(normal(0, 0.10), class = "b"),
  prior(exponential(5), class = "sd", group = "ui_userN"),
  
  # Variability model: sigma
  prior(normal(log(0.09), 0.5), class = "Intercept", dpar = "sigma"),
  prior(normal(0, 0.10), class = "b", dpar = "sigma"),
  prior(exponential(2), class = "sd", dpar = "sigma", group = "ui_userN")
)

bayes_all <- brm(
  bf(
    ci_cycleLength ~ 1 + 
      ci_age_group + 
      ui_ansMenarche_group + 
      ui_bmi_cat +
      ui_pcos_impute + 
      ui_endometriosis_impute + 
      ui_activitylevel +
      ci_spotting_logged + 
      ci_sickness_logged + 
      ci_mood_logged + 
      (1|ui_userN),
    sigma ~ 1 + 
      ci_age_group + 
      ui_ansMenarche_group + 
      ui_bmi_cat +
      ui_pcos_impute + 
      ui_activitylevel + 
      ci_spotting_logged + 
      ci_sickness_logged + 
      ci_mood_logged + 
      (1|ui_userN)
  ),
  family = lognormal(),
  data = eas,
  prior = prior_single,
  control = list(
    adapt_delta = 0.99,
    max_treedepth = 15
  ),
  save_pars = save_pars(all = TRUE),
  iter = 4000,
  warmup = 2000,
  chains = 3,
  backend = "rstan",
  init = 0,
  cores = 3,
  seed = 3
)


## Save model
saveRDS(bayes_all)

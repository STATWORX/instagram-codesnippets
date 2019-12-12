# Reshaping the old-fashioned way, manually specifying key and value
iris %>% 
  tidyr::gather(-Species, # select all columns but Species
                key = "key",
                value = "value"
  )

# Try to quickly print transformed tibble to console with tidyr::gather()
iris %>% 
  tidyr::gather(-Species) # throws an error

# Quickly print transformed tibble to console with tidyr::pivot_longer()
iris %>% 
  tidyr::pivot_longer(-Species) # works!

# Specify new column names with semantically sensible arguments
iris %>% 
  tidyr::pivot_longer(
    cols = -Species,
    names_to = "Measure",
    values_to = "Value"
  )

iris %>% tidyr::pivot_longer(cols = -Species, names_to = "Measure", values_to = "Value")

# Seamlessly separate multiple variables stored in column names
iris %>% 
  tidyr::pivot_longer(
    cols = -Species, # select all columns but Species
    names_to = c("Part", "Measure"), # two target col names to be created
    values_to = "Value",
    names_sep = "[.]" # regex to capture separator
  )
library(sparklyr)
library(nycflights13)
sc <- sparklyr::spark_connect(master = "local") # Set Spark Connection
df <- nycflights13::flights # Load Dataset to R Environment
df_nycflight <- copy_to(sc, df = df, name = "df_nycflight") # Copy Dataset to Spark
# Create a ML Pipeline with sparklyr
flights_pipeline <- ml_pipeline(sc) %>%
  ft_dplyr_transformer( 
    tbl = df_nycflight %>% dplyr::filter(!is.na(dep_delay)) %>%
      dplyr::mutate(month = paste0("m", month), day = paste0("d", day)) %>%
      dplyr::select(dep_delay, sched_dep_time, month, day, distance)) %>%
  ft_binarizer(input_col = "dep_delay",
               output_col = "delayed",
               threshold = 15) %>%
  ft_bucketizer(input_col = "sched_dep_time",
                output_col = "hours",
                splits = c(400, 800, 2400)) %>%
  ft_r_formula(delayed ~ month + day + hours + distance) %>%
  ml_logistic_regression()
# Train-Test Split
weights <- c(training = 0.7, test = 0.3) # Set weights for train-test split
partitioned_flights <- df_nycflight %>%  # Generate train-test split
  sdf_random_split(weights = weights)
# Train the model according to the ML pipeline generated before
fitted_pipeline <- ml_fit(flights_pipeline, partitioned_flights$training)
# Predict on Test Data
ml_predict(fitted_pipeline, partitioned_flights$test)
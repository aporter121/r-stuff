library(readxl)
library(writexl)
# Define the path to search
path_to_search <- path_to_search <- file.path("C:", "Users", "full", "path", "here")

# Create an empty list to store dataframes
all_data <- list()
excel_files <-list()

excel_files <- list.files(path_to_search, pattern = ".*.xlsx?$")

print(path_to_search)

if (dir.exists(path_to_search)) {
  print("Folder exists")
} else {
  print("Folder does not exist")
}

print(list.files(path_to_search) )


# Loop through each excel file
for (file in excel_files) {
  
  # Read the excel file, skipping the first 4 rows
  #df <- read_excel(file, skip = 4) 
  df <- read_excel(file, skip = 4, col_names = FALSE) 
  
  # Extract the first two columns (optional)
  df <- df[, 1:2] 
  
  # remove duplicate rows, where indicator name is repeated.
  df <- df[!duplicated(df$'...1'), ] 
  
  # Add file name as a new column
  df$file_name <- basename(file) 
  
  # Add the dataframe to the list
  all_data[[length(all_data) + 1]] <- df
}

# Combine all dataframes into a single dataframe
combined_df <- do.call(rbind, all_data)

# Print the combined dataframe
print(combined_df)

# Save the combined dataframe to an Excel file
write_xlsx(combined_df, "combined_data4.xlsx") 
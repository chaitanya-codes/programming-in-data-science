## ------------------------------------------------------------
## Student Marks Analytics — CSV Workflow (Base R only)
## ------------------------------------------------------------

## 0) File names
input_csv <- "students_input.csv"
students_rank_csv <- "students_by_rank.csv"
assessment_avg_csv <- "assessment_wise_averages.csv"
specialization_avg_csv <- "specialization_wise_averages.csv"

cat("Program started...\n")

## ------------------------------------------------------------
## 1) Create vectors from the table
## ------------------------------------------------------------

RegNo <- c("24BCE1001","24BCE1002","24BCE1003","24BCE1004","24BCE1005",
           "24BCE1006","24BCE1007","24BCE1008","24BCE1009","24BCE1010")

Name <- c("Aadesh Kumar","Bhavya Reddy","Charan Iyer","Divya Sharma",
          "Esha Nair","Farhan Khan","Gayathri Raj","Harish Kumar",
          "Ishita Menon","Jai Verma")

Programme <- c("B.Tech","B.Tech","B.Tech","B.Tech","B.Tech",
               "B.Tech","B.Tech","B.Tech","B.Tech","B.Tech")

Specialization <- c("CSE","AI","DS","IT","CSE","ECE","Cyber","AI","DS","IT")

Assess1 <- c(18,15,20,14,20,12,17,16,19,18)
Assess2 <- c(17,16,19,15,20,14,18,17,18,17)
Assess3 <- c(19,14,18,15,19,13,17,16,19,16)
Assess4 <- c(18,18,20,16,20,16,19,15,18,19)

## ------------------------------------------------------------
## 2) Create Data Frame
## ------------------------------------------------------------

students <- data.frame(
  RegNo, Name, Programme, Specialization,
  Assess1, Assess2, Assess3, Assess4,
  stringsAsFactors = FALSE
)

## Display structure and preview
str(students)
head(students)

## ------------------------------------------------------------
## 3) Write Input CSV
## ------------------------------------------------------------

write.csv(students, file = input_csv, row.names = FALSE, na = "")
cat("Input CSV created:", normalizePath(input_csv, winslash="/"), "\n")

## ------------------------------------------------------------
## 4) Read CSV for Analytics
## ------------------------------------------------------------

students_in <- read.csv(input_csv, stringsAsFactors = FALSE)

## Validate columns
assessment_cols <- c("Assess1","Assess2","Assess3","Assess4")
required_cols <- c("RegNo","Name","Programme","Specialization",assessment_cols)

missing_cols <- setdiff(required_cols, names(students_in))

if(length(missing_cols) > 0){
  stop("Missing columns:", paste(missing_cols, collapse=", "))
}

## Ensure assessment columns are numeric
for(col in assessment_cols){
  if(!is.numeric(students_in[[col]])){
    students_in[[col]] <- as.numeric(students_in[[col]])
  }
}

## ------------------------------------------------------------
## 5) Per Student Analytics
## ------------------------------------------------------------

students_in$Total <- rowSums(students_in[,assessment_cols])
students_in$Average <- students_in$Total / length(assessment_cols)

## Rank (highest total = rank 1)
students_in$Rank <- rank(-students_in$Total, ties.method="min")
students_in$Rank

## Sort by rank
students_ranked <- students_in[order(students_in$Rank, students_in$RegNo), ]
students_ranked

## Save ranked students
write.csv(students_ranked, students_rank_csv, row.names = FALSE)

cat("Ranked student data saved to:", normalizePath(students_rank_csv, winslash="/"), "\n")

## ------------------------------------------------------------
## 6) Assessment Wise Averages
## ------------------------------------------------------------

assessment_means <- colMeans(students_in[,assessment_cols], na.rm = TRUE)

assessment_avg_df <- data.frame(
  Assessment = names(assessment_means),
  Average = as.numeric(assessment_means),
  stringsAsFactors = FALSE
)

assessment_avg_df

write.csv(assessment_avg_df, assessment_avg_csv, row.names = FALSE)

cat("Assessment averages saved to:", normalizePath(assessment_avg_csv, winslash="/"), "\n")

## ------------------------------------------------------------
## 7) Specialization Wise Averages
## ------------------------------------------------------------

specialization_avg <- aggregate(
  students_in[,assessment_cols],
  by = list(Specialization = students_in$Specialization),
  FUN = function(x) mean(x, na.rm = TRUE)
)

specialization_avg

## Add overall average
specialization_avg$Overall_Average <- rowMeans(
  specialization_avg[,assessment_cols],
  na.rm = TRUE
)

specialization_avg$Overall_Average 

## Sort by overall average descending
specialization_avg <- specialization_avg[
  order(-specialization_avg$Overall_Average),
]

specialization_avg

write.csv(specialization_avg, specialization_avg_csv, row.names = FALSE)

cat("Specialization averages saved to:", normalizePath(specialization_avg_csv, winslash="/"), "\n")

cat("Program completed successfully.\n")
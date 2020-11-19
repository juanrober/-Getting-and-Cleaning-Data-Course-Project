setwd("C:/Users/52331/Documents/UCI HAR Dataset")
library(pacman)
p_load(tidyverse, scales)

caracteristicas <- read.csv("features.txt", header = FALSE, sep = ' ')
caracteristicas <- as.character(caracteristicas[,2])

base_tren_x <- read.table("./train/X_train.txt")
base_tren_actividad <- read.csv("./train/y_train.txt", header = FALSE, sep = " ")
base_tren_sujeto <- read.csv("./train/subject_train.txt", header = FALSE, sep = " ")

base_tren <- data.frame(base_tren_sujeto, base_tren_actividad, base_tren_x) 
names(base_tren) <- c(c("sujeto", "actividad"), caracteristicas)

base_prueba_x <- read.table("./test/X_test.txt")
base_prueba_actividad <- read.csv("./test/y_test.txt", header = FALSE, sep = " ")
base_prueba_sujeto <- read.csv("./test/subject_test.txt", header = FALSE, sep = " ")

base_prueba <- data.frame(base_prueba_sujeto, base_prueba_actividad, base_prueba_x)
names(base_prueba) <- c("sujeto", "actividad", caracteristicas)

base_completa <- rbind(base_tren, base_prueba)

media_sd <- grepl("mean|std", caracteristicas)
base_sub <- base_completa[,c(1, 2, media_sd + 2)]

etiquetas_actividades <- read.table("activity_labels.txt", header = FALSE)
etiquetas_actividades <- as.character(etiquetas_actividades[,2])
etiquetas_actividades
base_sub$actividad <- etiquetas_actividades[base_sub$actividad]

nombres_nuevos <- names(base_sub)
nombres_nuevos <- gsub("[(][)]", "", nombres_nuevos)
nombres_nuevos <- gsub("^t", "TimeDomain_", nombres_nuevos)
nombres_nuevos <- gsub("^f", "FrequencyDomain_", nombres_nuevos)
nombres_nuevos <- gsub("Acc", "Accelerometer", nombres_nuevos)
nombres_nuevos <- gsub("Gyro", "Gyroscope", nombres_nuevos)
nombres_nuevos <- gsub("Mag", "Magnitude", nombres_nuevos)
nombres_nuevos <- gsub("-mean-", "_Mean_", nombres_nuevos)
nombres_nuevos <- gsub("-std-", "_StandardDeviation_", nombres_nuevos)
nombres_nuevos <- gsub("-", "_", nombres_nuevos)
names(base_sub) <- nombres_nuevos

write.table(dataTable, "TidyData.txt", row.name=FALSE)

# Install the following packages if you have not already:
install.packages('ggplot2')
install.packages('ggcorrplot')

# Once or if the packages are installed, then load them into R:
library(ggplot2)
library(ggcorrplot)

# Set your working directory:
setwd('C:/Directory')

# Read in a CSV file containing your data. The file should have headings, with each column representing a different RS variable, and rows being the values: 
Data <- read.csv(file = 'C:/Directory/RS_Samples.csv', header = TRUE)

# View your data. In this example, there are 30 RS variables:
print(Data)

# Create a correlation matrix with custom colors:
P1 <- ggcorrplot(cor(Data), colors = c("chocolate4", "gray97", "gold3"), outline.color = "gray10")

# Customize other components of the plot, including text color, bar, and title:
P2 <- P1 + theme(axis.text.x=  element_text(color = "black", size = 7)) + theme(axis.text.y=  element_text(color = "black", size = 7)) + guides(fill = guide_colourbar(barheight = 16, title = "cor."))

# Save your correlation matrix as a jpg file:
ggsave("Correlation_Matrix.jpg", P2, width=19, height=19, units="cm", dpi=600)


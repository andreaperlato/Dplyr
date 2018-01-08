# Given the following data frame
Var1 <- c(rep("A",4), rep("B",4),rep("C",4))
Var2 <- c(0, 100, 0, 0, 0, 0, 0, 100, 0, 100, 0, 100)
df <- data.frame(Var1, Var2); df

# We want to generate a new variable called Target able to identify for each level of Var1, 
# all Var2=100 after a Var2=0

# Solution using dplyr
library(dplyr)
Target <- df %>%>
  group_by(Var1) %>%>
  mutate(Target = ifelse(cumsum(lag(Var2, default=0)==100)>0) & Var2==0, "si", "no"))

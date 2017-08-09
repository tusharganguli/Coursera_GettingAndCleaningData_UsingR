Final Project submission for the course - Getting and Cleaning Data
==================================================================
Author: Tushar Ganguli.
==================================================================

The original data was partitioned into training data (70%) and test data (30%). The data has been merged together as per the problem statement. 

# Variables in the data set not contained in the tidy data:
All variables which do not represent mean or standard deviation have been excluded.

# Variables contained in the tidy data:
The final tidy data set contains the following variables:

1. Subject :  User index who performed the activities.
              
   Unit Of Measurement: This is a categorical variable with 30 options as there were 30 volunteers for the experiment.

2. Activity : Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a               smartphone on the waist. 
                   
   Unit Of Measurement: This is a categorical variable with 6 options.

The final data set contains the average of each variable for each activity and each subject. These variables have been described in the original data set in features_info.txt: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

3. timeBasedBodyAcclerationMeanXAxis                      
4. timeBasedBodyAcclerationMeanYAxis                      
5. timeBasedBodyAcclerationMeanZAxis                      
6. timeBasedGravityAcclerationMeanXAxis                   
7. timeBasedGravityAcclerationMeanYAxis                   
8. timeBasedGravityAcclerationMeanZAxis                   
9. timeBasedBodyAcclerationJerkMeanXAxis                  
10. timeBasedBodyAcclerationJerkMeanYAxis                  
11. timeBasedBodyAcclerationJerkMeanZAxis                  
12. timeBasedBodyGyroMeanXAxis                             
13. timeBasedBodyGyroMeanYAxis                             
14. timeBasedBodyGyroMeanZAxis                             
15. timeBasedBodyGyroJerkMeanXAxis                         
16. timeBasedBodyGyroJerkMeanYAxis                         
17. timeBasedBodyGyroJerkMeanZAxis                         
18. timeBasedBodyAcclerationMagMean                        
19. timeBasedGravityAcclerationMagMean                     
20. timeBasedBodyAcclerationJerkMagMean                    
21. timeBasedBodyGyroMagMean                               
22. timeBasedBodyGyroJerkMagMean                           
23. frequencyBasedBodyAcclerationMeanXAxis                 
24. frequencyBasedBodyAcclerationMeanYAxis                 
25. frequencyBasedBodyAcclerationMeanZAxis                 
26. frequencyBasedBodyAcclerationMeanFrequencyXAxis        
27. frequencyBasedBodyAcclerationMeanFrequencyYAxis        
28. frequencyBasedBodyAcclerationMeanFrequencyZAxis        
29. frequencyBasedBodyAcclerationJerkMeanXAxis             
30. frequencyBasedBodyAcclerationJerkMeanYAxis             
31. frequencyBasedBodyAcclerationJerkMeanZAxis             
32. frequencyBasedBodyAcclerationJerkMeanFrequencyXAxis    
33. frequencyBasedBodyAcclerationJerkMeanFrequencyYAxis    
34. frequencyBasedBodyAcclerationJerkMeanFrequencyZAxis    
35. frequencyBasedBodyGyroMeanXAxis                        
36. frequencyBasedBodyGyroMeanYAxis                        
37. frequencyBasedBodyGyroMeanZAxis                        
38. frequencyBasedBodyGyroMeanFrequencyXAxis               
39. frequencyBasedBodyGyroMeanFrequencyYAxis               
40. frequencyBasedBodyGyroMeanFrequencyZAxis               
41. frequencyBasedBodyAcclerationMagMean                   
42. frequencyBasedBodyAcclerationMagMeanFrequency          
43. frequencyBasedBodyAcclerationJerkMagMean               
44. frequencyBasedBodyAcclerationJerkMagMeanFrequency      
45. frequencyBasedBodyGyroMagMean                          
46. frequencyBasedBodyGyroMagMeanFrequency                 
47. frequencyBasedBodyGyroJerkMagMean                      
48. frequencyBasedBodyGyroJerkMagMeanFrequency             
49. timeBasedBodyAcclerationStandardDeviationXAxis         
50. timeBasedBodyAcclerationStandardDeviationYAxis         
51. timeBasedBodyAcclerationStandardDeviationZAxis         
52. timeBasedGravityAcclerationStandardDeviationXAxis      
53. timeBasedGravityAcclerationStandardDeviationYAxis      
54. timeBasedGravityAcclerationStandardDeviationZAxis      
55. timeBasedBodyAcclerationJerkStandardDeviationXAxis     
56. timeBasedBodyAcclerationJerkStandardDeviationYAxis     
57. timeBasedBodyAcclerationJerkStandardDeviationZAxis     
58. timeBasedBodyGyroStandardDeviationXAxis                
59. timeBasedBodyGyroStandardDeviationYAxis                
60. timeBasedBodyGyroStandardDeviationZAxis                
61. timeBasedBodyGyroJerkStandardDeviationXAxis            
62. timeBasedBodyGyroJerkStandardDeviationYAxis            
63. timeBasedBodyGyroJerkStandardDeviationZAxis            
64. timeBasedBodyAcclerationMagStandardDeviation           
65. timeBasedGravityAcclerationMagStandardDeviation        
66. timeBasedBodyAcclerationJerkMagStandardDeviation       
67. timeBasedBodyGyroMagStandardDeviation                  
68. timeBasedBodyGyroJerkMagStandardDeviation              
69. frequencyBasedBodyAcclerationStandardDeviationXAxis    
70. frequencyBasedBodyAcclerationStandardDeviationYAxis    
71. frequencyBasedBodyAcclerationStandardDeviationZAxis    
72. frequencyBasedBodyAcclerationJerkStandardDeviationXAxis
73. frequencyBasedBodyAcclerationJerkStandardDeviationYAxis
74. frequencyBasedBodyAcclerationJerkStandardDeviationZAxis
75. frequencyBasedBodyGyroStandardDeviationXAxis           
76. frequencyBasedBodyGyroStandardDeviationYAxis           
77. frequencyBasedBodyGyroStandardDeviationZAxis           
78. frequencyBasedBodyAcclerationMagStandardDeviation      
79. frequencyBasedBodyAcclerationJerkMagStandardDeviation  
80. frequencyBasedBodyGyroMagStandardDeviation             
81. frequencyBasedBodyGyroJerkMagStandardDeviation

Summary choices:
The final data set contains a tidy data set with each subject grouped by each activity to calculate the average of all the above mentioned variables. 

Experimental study design:
The following steps were followed for data collection:
1. Retrieve the subject,activities performed and feature variables from the test and train data sets.
2. Merge the test and train data sets for each of the three data sets.
3. Retrieve the column indexes and names for all columns representing the mean and standard deviation from the features.txt file.
4. Process the column names so that they are more readable to the user.
5. Retrieve the columns from the feature variables data set for the mean and standard deviation data sets.
6. Update the column names for all columns as obtained in Step 4.
7. Combine the subject, activity and the filtered data set of features into a single data set.
8. Calculate the average of all variables, for each subject, grouped by each activity.


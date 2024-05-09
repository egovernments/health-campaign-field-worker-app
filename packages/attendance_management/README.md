Attendance Package

How HCM App interacts with Attendance Package

Below is the BLOC diagram of the components that are there in HCM App and attendance package and how the interaction happens
![AttendancePackage-Attendance-HCM drawio](https://github.com/egovernments/health-campaign-field-worker-app/assets/85437265/4f78a209-b8b0-405e-be82-769b7e67c8b9)



New files or changes needed in HCM App:

Add attendance package dependency in pubspec
Create a bloc which extends attendance listener class and create the override methods
Add typedef for repositories in untils/typedef
Initialize repo in network manager
Add navigation to manage attendance page from hcm app and pass the required fields


Sequence diagram of attendance package:
![image (4)](https://github.com/egovernments/health-campaign-field-worker-app/assets/85437265/9c8f2e91-941a-4792-a3df-93c9672be07e)




Name
Multiple word search-app

Description
This digital tool will allow users to search for multiple 
separated words in several PDF documents using Rstudio.

Author 
Marie Snedker, 201507534@post.au.dk

Software
- R, version 4.0+
- Rstudio 3.0+
- Rstudio packages: tidyverse, shiny, readtext

Data
Aarhus University annual reports, can be acquired from 
https://www.au.dk/om/profil/publikationer/. 
You can also use any PDF document on your computer as long 
as it is in your Rstudio working directory alongside the app.R file.

Usage
Approach 1: 
1. Download and unzip zip folder.  
2. Dubble click on app.R. 
3. If not already installed, install Rstudio packeges readtext, tidyverse and shiny. 
4. Click “Run app”-button. 
5. Now a user-face will open with three tabs: Word search, Documents, Result from multiple word search. 
The first tab will allow you to type in up to five search words. The name of the document(s) in which the word appears will show under each search word. 
The second tab shows all documents in the directory. The third tab will show in which document(s) all search words appear at the same time.
If error: check working directory.
If this approach doesn’t work, try approach 2. 

Approach 2: 
1. Open Rstudio. 
2. Press “file” and choose “new project…”, then choose “New Working Directory”. 
The program will then prompt you for a name and where to place the new working directory. 
The given name and position are not essential for the app. A new folder will now be added at your chosen location and with the given name. 
This folder contains a file called app.R. 
3. To use the app, open the app.R file (this will in most cases open automatically), and copy the script from GitHub. 
4. Place the PDF documents, that are to be analyzed, within the same folder as the app.R file. 
5. Press the “Run app” button in R-studio.

Acknowledgment
Tested and advised by Max Odsbjerg Pedersen. 

License
C-BY-SA 4.0, see attached License.

Project status
The project is still under development and contains a few bugs. For example, all search boxes need to be filled either by a word or space. 
The tool is most efficient on born digital material, but also works on documents which have undergone OCR-treatment.

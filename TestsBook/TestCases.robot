*** Settings ***
Resource  ../Operational/instructions.robot
Resource  ../Operational/locatorVariables.robot 

*** Test Cases ***
User should be able to land on Book details Page
    [Tags]      sanity
    Open India Bookstore
    Navigate to Category "Science and Technology"
    Click on "Astronomy" Sub Section
    Search for the book title 'Relativity: The Special and General Theory' in the Booklist
    Go to Expected Book details Page
    Verify User navigated to the expected book details
    Click on @Flipkart to buy the book
    Click on the Book 
    Add to cart



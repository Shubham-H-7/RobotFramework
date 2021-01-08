*** Settings ***
Library  SeleniumLibrary
Library  Collections

*** Keywords ***
Open India Bookstore
        Open Browser    ${url_books}   ${brows}
        Maximize Browser Window
        sleep  3s
        Execute Javascript  window.scrollTo(0, 600)

Navigate to Category "Science and Technology"
    ${category_count} =  Get Element Count   xpath=//*[@id='leftNavContainer']/ul/li
    sleep  3s
    FOR  ${i}   IN RANGE    1   ${category_count}
        ${dynamic_categ_name} =  Get Text   xpath=//*[@id="leftNavContainer"]/ul/li[${i}]/a
        Scroll Element Into View    xpath=//*[@id="leftNavContainer"]/ul/li[${i}]/a
        Log to Console  ${dynamic_categ_name}
        Exit For Loop If    "${dynamic_categ_name}" == "${Expected_category}"
    END
    Set Test Variable  ${static_categ_name}  xpath=//*[@id="leftNavContainer"]/ul/li[${i}]/a
    Log to Console  Step 2

Click on "Astronomy" Sub Section
    Mouse Over  ${static_categ_name}
    sleep   2s
    Mouse Over  ${Astronomy}
    sleep   3s
    Verify WebPage title  Astronomy
    Click Element   ${Astronomy}
    sleep   2s
    Verify WebPage title  ${Expected_Book_category}
    Log to Console  Step 3

Search for the book title 'Relativity: The Special and General Theory' in the Booklist
    ${bok_list} =  Get Element Count    xpath=//div[@class='col-md-9']/div
    FOR  ${j}  IN RANGE  2  ${bok_list}
        ${bok_names} =  Get Text  xpath=//div[@class='col-md-9']/div[${j}]/a/div[3]
        Exit For Loop If  "${bok_names}" == "${Expected_Book_Name}"
    END
    Set Test Variable  ${exact_bok_elem}  xpath=//div[@class='col-md-9']/div[${j}]/a/div[3]

    Log to Console  Step 4

Go to Expected Book details Page
    sleep  4s
    Click Element  ${exact_bok_elem}
    Log to Console  Step5

Verify User navigated to the expected book details
    Verify WebPage title  ${Expected_Book_Detailed_Name}
    Log to Console  Step 6

Click on @Flipkart to buy the book
    sleep  2s
    Click Element  ${Flipkart_elem}
    sleep  2s
    Log to Console  Step 7

Click on the Book
    Switch Window  NEW
    Click Element  ${Book}
    Log to Console  Step 8

Add to cart
    Switch Window  NEW
    Click Element  ${Cart}
    Log to Console  Step 9

Verify WebPage title
    [Arguments]  ${title_name}
    Wait Until Page Contains  ${title_name}
    Log to Console  Pass!
    

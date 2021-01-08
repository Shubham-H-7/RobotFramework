*** Variables ***

${url_books} =  https://www.indiabookstore.net/
${brows} =  gc
${Expected_category} =  Science & Technology
${Expected_Book_category} =  Astronomy
${Astronomy} =  xpath=//*[@id='leftNavContainer']/ul/li[19]/ul/li[3]
${Expected_Book_Name} =  Relativity: The Special and Ge...
${Expected_Book_Detailed_Name} =  Relativity: The Special and General Theory
${Flipkart_elem} =  xpath=//div/a[@title='Buy Relativity: The Special and General Theory... from Flipkart']  
${Book} =  xpath=//a[@title='Relativity']
${Cart} =  xpath=//button[@class='_2KpZ6l _2U9uOA _3v1-ww']

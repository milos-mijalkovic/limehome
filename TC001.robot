*** Settings ***

Library  ExtendedSelenium2Library


*** Variables ***

${Browser}  Chrome
${URL}  https://limehome-qa-task.herokuapp.com
${LastName1}  Mijalkovic
${Ref}  123456

*** Test Cases ***

TC_001

# Initializing browser and navigating to the page

    open browser  ${URL}  ${Browser}
    maximize browser window


# Filling in the data and proceeding to next step

    input text  id=mat-input-0  ${LastName1}
    input text  id=mat-input-1  ${Ref}
    click button  button=Submit

# Retrieving the value from the Last Name field and comparing the strings in variables

    ${LastName2}  get element attribute  id=mat-input-3@ng-reflect-model

    should be equal as strings  ${LastName1}  ${LastName2}


# Picking the date of birth in the calendar

    click button   xpath=//button[(@class='mat-icon-button')]
    double click element  xpath=/html[1]/body[1]/div[2]/div[2]/div[1]/mat-datepicker-content[1]/mat-calendar[1]/mat-calendar-header[1]/div[1]/div[1]/button[1]/span[1]
    double click element  xpath=//button[@class='mat-calendar-previous-button mat-icon-button']
    click element  xpath=//div[contains(text(),'1990')]
    click element  xpath=//div[contains(text(),'AUG')]
    click element  xpath=//tr[1]//td[2]//div[1]

# Changing the language to DK

    click element  id=mat-select-1
    click element  id=mat-option-161

# Cleaning up the environments after text execution

    close browser








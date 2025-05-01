***Settings***
Resource  ../locators/inventory-page-locators.robot
Resource  ../locators/login-page-locators.robot
Resource  ../helpers/common-actions.robot
Resource  ../pages/login-page.robot

***Keywords***

Login User
    [Arguments]  ${username}  ${password}
    Input Username    ${username}
    Input Password    ${password}
    Click Login button

Open Menu
    Verify Element    ${menuButton} 
    Click    ${menuButton}
    Sleep    0.5s    

Click Logout
    Verify Element    ${logoutButton}  
    Click    ${logoutButton}

Perform Logout
    Open Menu
    Click Logout
    Verify Element    ${sectionForm}

Verify Inventory Page
    Verify Element  ${inventoryList}
    ${count}=    Get Element Count    ${inventoryItem}
    Should Be Equal As Numbers    ${count}    6

Verify Inventory Page not shown anymore
    Verify Element Not Available  ${inventoryList}
    

Click On Item By Index
    [Arguments]    ${index}
    ${itemIndex}=    Evaluate    ${index} if ${index} > 0 else 1
    ${itemIndex}=    Evaluate    ${itemIndex} if ${itemIndex} <= 6 else 6
    ${itemLocator}=    Set Variable    (//div[contains(@class, "inventory_item")])[${itemIndex}]
    Verify Element     ${itemLocator}   
    Click    ${itemLocator}/div[contains(@class, "inventory_item_name")]

Click Inventory Item By Name
    [Arguments]    ${name}
    ${itemLocator}=    Set Variable    //div[contains(@class, "inventory_item_name") and text()="${name}"]
    Verify Element  ${itemLocator}
    Click    ${itemLocator}

Verify Inventory Item Details
    Verify Element  ${inventoryDetails}


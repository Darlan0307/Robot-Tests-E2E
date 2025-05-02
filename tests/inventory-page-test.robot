***Settings***
Resource  ../config/browser-config.robot
Resource  ../resources/pages/inventory-page.robot
Resource  ../resources/global-variables.robot

Suite Setup     Open SauceDemo
Suite Teardown  Finish Test Suite

***Test Cases***

As a User, I won't see the inventory page without logging in
    [Documentation]  Check that the inventory page is not displayed without logging in
    Verify Inventory Page not shown anymore

As a User, I will see Inventory Page
    [Documentation]  Check the inventory page when logging in correctly
    Login User    ${validUsername}    ${validPassword}
    Verify Inventory Page
    Perform Logout

As a User, I will see Inventory Item when click on it
    [Documentation]  login correctly
    ...  click on an item
    ...  check inventory item when click on it
    Login User    ${validUsername}    ${validPassword}
    Click Inventory Item By Name    Sauce Labs Backpack
    Verify Inventory Item Details
    Perform Logout

As a user, I want to add 2 items to the cart
     [Documentation]  after logging in and adding two items to the cart
    ...  then the cart page is accessed to check if you have two items
    Login User    ${validUsername}    ${validPassword}
    Click Inventory Item By Name    Sauce Labs Backpack
    Click Button By Class And Name    btn_inventory     Add to cart
    Click Button By Class And Name    back    Back to products
    Verify Current URL    https://www.saucedemo.com/inventory.html
    Click Inventory Item By Name    Sauce Labs Bike Light
    Click Button By Class And Name    btn_inventory     Add to cart
    Verify Number Of Items In Cart    2
    Perform Logout
*** Settings ***
Test Teardown     Close Browser
Library           SeleniumLibrary
Library           String



*** Variables ***
${browser}        chrome
${url_1}        https://prod.worldvision.in/landingPages/child/index.html
${url_2}        https://prod.worldvision.in/landingPages/child/index-2.html
${url_3}        https://prod.worldvision.in/landingPages/child/index-3.html
@{checkout_payment_list_text}    Powered by CC Avenue    Powered by AXIS BANK    POWERED BY HDFC BANK
@{SI_payment_list_text}    NET BANKING    Indian credit card    Debit card
@{checkout_payment_list_ind_passport}    Debit Card/Net banking/Wallets/Amex    Amazon Pay    International credit card    Indian credit cards    Offline Payment
${cash_covid19}    4500
${dry_ration}     1200
${hygiene_kit}    400
${general_donation_covid19}    1000
${onetime_donation_amt}    20000
${OTD_min_alert}    Minimum is ₹ 800.
${un_recog_name}     vxbxcxc
${un_recog_email}    dfgdfsfgdf@sdfds.fdssd
${E_MONTHY}    800
${E_QUARTERLY}    2400
${E_HALF}    4800
${E_ANNUALLY}    9600
${min_alert_gen_donation}    Minimum Amount is 800 for General Donataion
${max_alert_gen_donation}    Maximum Amount is 100000 for General Donataion
*** Test Cases ***
To Verify user should login as Website Registered User LP1
    Jenkins browser launch    ${url_1}
    #Local browser launch landingpage    ${url_1}    ${browser}
    Select child in landingpage
    Landing1 singin    Fin.felix@gmail.com    mega@123
    ${chck_payment_page}=    Run Keyword And Return Status    Element Should Be Visible    id=block-paymentmode
    Run Keyword If    'True'!='${chck_payment_page}'    Fail    "User login with valid credentials but payment gateway page not display"

To Verify User should reset the password with Unrecognized Username LP1
    Jenkins browser launch    ${url_1}
    #Local browser launch landingpage    ${url_1}    ${browser}
    Onetime donation LP1    2000
    Forgot password
    password reset with Unrecognized data    dummy
    password reset Unrecognized data alert    UnrecognizedUsername

To Verify User should reset the password with Unrecognized email ID LP1
    Jenkins browser launch    ${url_1}
    #Local browser launch landingpage    ${url_1}    ${browser}
    Select child in landingpage
    Forgot password
    password reset with Unrecognized data    fgfdgddf@dfg.fddsf
    password reset Unrecognized data alert    Unrecognized email ID
    
To verify support any child section amount is not adding with OTD LP1
    Jenkins browser launch    ${url_1}
    #Local browser launch landingpage    ${url_1}    ${browser}
    Page scrolling
    Click Element    xpath=.//ul[@class='nav nav-tabs']//li[2]
    Number of Children
    Onetime donation LP1    ${onetime_donation_amt}
    Landing1 singin    logimohan@gmail.com    logi
    #Checking payment gateway and amount
   
To Verify User should login with Valid Credentials LP1
    Jenkins browser launch    ${url_1}
    #Local browser launch landingpage    ${url_1}    ${browser}
    Select child in landingpage
    Landing1 singin    Fin.felix@gmail.com    mega@123
    ${chck_payment_page}=    Run Keyword And Return Status    Element Should Be Visible    id=block-paymentmode
    Run Keyword If    'True'!='${chck_payment_page}'    Fail    "User login with valid credentials but payment gateway page not display"

To Verify User should login with Invalid credentials LP1
    Jenkins browser launch    ${url_1}
    #Local browser launch landingpage    ${url_1}    ${browser}
    Select child in landingpage
    Landing1 singin    jfvfdjf@gds.asdas    123456
    ${chck_alert}=    Run Keyword And Return Status    Element Should Be Visible    xpath=.//div[@class='swal-modal']
    Run Keyword If    'True'!='${chck_alert}'    Fail    "Enter invalid credentials, alert not display"
    
To Verify User should login with email id only LP1
    Jenkins browser launch    ${url_1}
    #Local browser launch landingpage    ${url_1}    ${browser}
    Select child in landingpage
    Landing1 singin with email    jfvfdjf@gds.asdas
    ${chck_alert}=    Run Keyword And Return Status    Element Should Be Visible    id=signInPassErr
    Run Keyword If    'True'!='${chck_alert}'    Fail    "Enter email id only, but password alert not display"

To Verify user should login with Only Password LP1
    Jenkins browser launch    ${url_1}
    #Local browser launch landingpage    ${url_1}    ${browser}
    Select child in landingpage
    Landing1 singin with password    xccvcxvv
    ${chck_alert}=    Run Keyword And Return Status    Element Should Be Visible    id=signInEmailErr
    Run Keyword If    'True'!='${chck_alert}'    Fail    "Enter password only, but email alert not display"

To Verify user should login without Credentials LP1
    Jenkins browser launch    ${url_1}
    #Local browser launch landingpage    ${url_1}    ${browser}
    Select child in landingpage
    Landing1 singin without credentials
    #Check Email Alert
    ${chck_alert}=    Run Keyword And Return Status    Element Should Be Visible    id=signInEmailErr
    Run Keyword If    'True'!='${chck_alert}'    Fail    "Email id not entered, but alert not display"
    Input Text    name=email    sdfdsg
    Click Element    xpath=.//a[@class='btn btn-default wvSignIn']
    #Check Password Alert
    ${chck_alert}=    Run Keyword And Return Status    Element Should Be Visible    id=signInPassErr
    Run Keyword If    'True'!='${chck_alert}'    Fail    "Password not entered. but alert not display"    
    
Landing page1 ensure child and default amount display or not
    Jenkins browser launch    ${url_1}
    #Local browser launch landingpage    ${url_1}    ${browser}
    check default amt and child in page1
    
Landing page 1 select child using SI flow LP1
    Jenkins browser launch    ${url_1}
    #Local browser launch landingpage    ${url_1}    ${browser}
    Select child in landingpage1 using SI flow
    Capture Page Screenshot
    Landing singin
    Payment gateway list size and text for SI flow

To verify payment success for cc avenue payment gateway - For passport holder LP1
    Jenkins browser launch    ${url_1}
    #Local browser launch landingpage    ${url_1}    ${browser}
    Select child in landingpage
    Capture Page Screenshot
    Landing singin
    Payment gateway list size and text for indian passport holder
    CCavenue payment success flow

To verify payment failure for cc avenue payment gateway - For passport holder LP1
    Jenkins browser launch    ${url_1}
    #Local browser launch landingpage    ${url_1}    ${browser}
    Select child in landingpage
    Capture Page Screenshot
    Landing singin
    Payment gateway list size and text for indian passport holder
    CCAvenue payment failure flow

Donate RS 4000 through One Time Donation Payment flow LP1
    Jenkins browser launch    ${url_1}
    #Local browser launch landingpage    ${url_1}    ${browser}
    Onetime donation LP1    4000
    Landing1 singin    logimohan@gmail.com    logi
    Payment gateway list size and text for indian passport holder
    CCavenue payment success flow
    
To verify OTD should not accept Si LP1
    [Tags]    LP-1: Donate through one time donation
    Jenkins browser launch    ${url_1}
    #Local browser launch landingpage    ${url_1}    ${browser}
    Onetime donation LP1    1000
    Landingpage2 singin    Fin.felix@gmail.com    mega@123
    ${chck_SI_payment_sec}=    Run Keyword And Return Status    Element Should Be Visible    xpath=.//div[@class='payment-mode si-pop-4 tab-pane step-content']
    Run Keyword If    'True'=='${chck_SI_payment_sec}'    Fail    "Select Onetime donation but payment gateway display like SI" 
    
To verify One time donation amount field validation LP1
    Jenkins browser launch    ${url_1}
    #Local browser launch landingpage    ${url_1}    ${browser}
    Onetime donation LP1    100
    ${get_alert_msg}=    Get Text    id=directPaymentErr
    Run Keyword If    ${get_alert_msg}!=${OTD_min_alert}    Fail    "OTD enter amount 100, but validation '${OTD_min_alert}' alert not display"
    Clear Element Text    xpath=.//input[@name='directPayment']
    Onetime donation LP1    799
    Run Keyword If    ${get_alert_msg}!=${OTD_min_alert}    Fail    "OTD enter amount 799, but validation '${OTD_min_alert}' alert not display"
    Clear Element Text    xpath=.//input[@name='directPayment']
    Onetime donation LP1    800
    ${get_status_alert}=    Run Keyword And Return Status    Element Should Be Visible    id=directPaymentErr
    Run Keyword If    'True'=='${get_status_alert}'    Fail    "Enter minimum 800 amount but alert are display"
    #Need clarification for Max alert 
    
Landing page2 ensure child and default amount display or not LP2
    Jenkins browser launch    ${url_2}
    #Local browser launch landingpage    ${url_2}    ${browser}
    check default amt and child in page2
    
To Donate RS 3000 through One Time Donation LP2
    [Tags]    LP-2: Verify Donate thorugh One time donation
    Jenkins browser launch    ${url_2}
    #Local browser launch landingpage    ${url_2}    ${browser}
    Onetime donation LP2    3000
    Landing1 singin    logimohan@gmail.com    logi
    CCavenue payment success flow
    #Payment cover in ccAvenue not offline(Paytm)

To verify OTD flow should not lead to SI LP2
    [Tags]    LP-2: Verify Donate thorugh One time donation
    Jenkins browser launch    ${url_2}
    #Local browser launch landingpage    ${url_2}    ${browser}
    Onetime donation LP2    1000
    Landingpage2 singin    Fin.felix@gmail.com    mega@123
    ${chck_SI_payment_sec}=    Run Keyword And Return Status    Element Should Be Visible    xpath=.//div[@class='payment-mode si-pop-4 tab-pane step-content']
    Run Keyword If    'True'=='${chck_SI_payment_sec}'    Fail    "Select Onetime donation but payment gateway display like SI"

To verify One time donation amount field validation LP2
    [Tags]    LP-2: Verify Donate thorugh One time donation
    Jenkins browser launch    ${url_2}
    #Local browser launch landingpage    ${url_2}    ${browser}
    Onetime donation LP2    100
    ${get_alert_msg}=    Get Text    id=directPaymentErr
    Run Keyword If    ${get_alert_msg}!=${OTD_min_alert}    Fail    "OTD enter amount 100, but validation '${OTD_min_alert}' alert not display"
    Clear Element Text    xpath=.//input[@name='directPayment']
    Onetime donation LP1    799
    Run Keyword If    ${get_alert_msg}!=${OTD_min_alert}    Fail    "OTD enter amount 799, but validation '${OTD_min_alert}' alert not display"
    Clear Element Text    xpath=.//input[@name='directPayment']
    Onetime donation LP1    800
    ${get_status_alert}=    Run Keyword And Return Status    Element Should Be Visible    id=directPaymentErr
    Run Keyword If    'True'=='${get_status_alert}'    Fail    "Enter minimum 800 amount but alert are display"
    #Need clarification for Max alert

To Verify User should login with Invalid credentials LP2
    [Tags]    LP-2:Login Functionallity
    Jenkins browser launch    ${url_2}
    #Local browser launch landingpage    ${url_2}    ${browser}
    Select child in landingpage 2
    Landingpage2 singin    sdfhsdjf    1234
    ${chck_alert}=    Run Keyword And Return Status    Element Should Be Visible    xpath=.//div[@class='swal-modal']
    Run Keyword If    'True'!='${chck_alert}'    Fail    "Enter invalid credentials, alert not display"

To Verify User should login with valid credentials LP2
    [Tags]    LP-2:Login Functionallity
    Jenkins browser launch    ${url_2}
    #Local browser launch landingpage    ${url_2}    ${browser}
    Select child in landingpage 2
    Landingpage2 singin    logimohan@gmail.com    logi
    ${chck_payment_page}=    Run Keyword And Return Status    Element Should Be Visible    id=block-paymentmode
    Run Keyword If    'True'!='${chck_payment_page}'    Fail    "User login with valid credentials but payment gateway page not display"
    
To Verify User should login with email id only LP2
    [Tags]    LP-2:Login Functionallity
    Jenkins browser launch    ${url_2}
    #Local browser launch landingpage    ${url_2}    ${browser}
    Select child in landingpage 2
    Landing1 singin with email    jfvfdjf@gds.asdas
    ${chck_alert}=    Run Keyword And Return Status    Element Should Be Visible    id=signInPassErr
    Run Keyword If    'True'!='${chck_alert}'    Fail    "Enter email id only, but password alert not display"

To Verify user should login with Only Password LP2
    [Tags]    LP-2:Login Functionallity
    Jenkins browser launch    ${url_2}
    #Local browser launch landingpage    ${url_2}    ${browser}
    Select child in landingpage 2
    Landing1 singin with password    xccvcxvv
    ${chck_alert}=    Run Keyword And Return Status    Element Should Be Visible    id=signInEmailErr
    Run Keyword If    'True'!='${chck_alert}'    Fail    "Enter password only, but email alert not display"

To Verify user should login without Credentials LP2
    [Tags]    LP-2:Login Functionallity
    Jenkins browser launch    ${url_2}
    #Local browser launch landingpage    ${url_2}    ${browser}
    Select child in landingpage 2
    Landing1 singin without credentials
    #Check Email Alert
    ${chck_alert}=    Run Keyword And Return Status    Element Should Be Visible    id=signInEmailErr
    Run Keyword If    'True'!='${chck_alert}'    Fail    "Email id not entered, but alert not display"
    Input Text    name=email    sdfdsg
    Click Element    xpath=.//a[@class='btn btn-default wvSignIn']
    #Check Password Alert
    ${chck_alert}=    Run Keyword And Return Status    Element Should Be Visible    id=signInPassErr
    Run Keyword If    'True'!='${chck_alert}'    Fail    "Password not entered. but alert not display"
    
Landing page 2 select child and payment success in Checkout flow LP2
    Jenkins browser launch    ${url_2}
    #Local browser launch landingpage    ${url_2}    ${browser}
    Select child in landingpage 2
    Capture Page Screenshot
    Landing2 singin
    Payment gateway list size and text for indian passport holder
    CCavenue payment success flow

Landing page 2 select child using SI flow LP2
    Jenkins browser launch    ${url_2}
    #Local browser launch landingpage    ${url_2}    ${browser}
    Select child in landingpage2 using SI flow
    Capture Page Screenshot
    Landing2 singin
    Payment gateway list size and text for SI flow

Landing page2 Onetime donation LP2
    Jenkins browser launch    ${url_2}
    #Local browser launch landingpage    ${url_2}    ${browser}
    Onetime donation LP2    1000	
    Landing2 singin
    Payment gateway list size and text for indian passport holder

To verify OTD should not accept Si LP2
    Jenkins browser launch    ${url_2}
    #Local browser launch landingpage    ${url_2}    ${browser}
    Onetime donation LP2    1000
    Landingpage2 singin    Fin.felix@gmail.com    mega@123
    ${chck_SI_payment_sec}=    Run Keyword And Return Status    Element Should Be Visible    xpath=.//div[@class='payment-mode si-pop-4 tab-pane step-content']
    Run Keyword If    'True'=='${chck_SI_payment_sec}'    Fail    "Select Onetime donation but payment gateway display like SI"
    
Landing page2 select multiple child and payment success in Checkout flow LP2
    Jenkins browser launch    ${url_2}
    #Local browser launch landingpage    ${url_2}    ${browser}
    Select multi child in landingpage2 using checkout page


    
Landing page3 ensure child and default amount display or not LP3  
    Jenkins browser launch    ${url_3}
    #Local browser launch landingpage    ${url_3}    ${browser}
    ${chck_list_display}=    Get Element Count    xpath=.//div[@class='owl-item active']
    Run Keyword If    ${chck_list_display}<0    Fail    "In Landing page3 child is not display"
    ${Check_default_allow_btn_uncheck}=    Run Keyword And Return Status    Element Should Be Visible    xpath=.//div[@class='donatenowbtn']/a[contains(.,'DONATE NOW')]
    Run Keyword If    'True'!='${Check_default_allow_btn_uncheck}'    Fail    "By default 'Donate Now' button not display"
    ${chck_covid_sec_display}=    Run Keyword And Return Status    Element Should Be Visible    id=covid
    Run Keyword If    'True'!='${chck_covid_sec_display}'    Fail    "Landing page3 Covid section not display"
    ${chck_default_val_checked}=    Get Element Attribute    xpath=(.//div[@class='owl-item active']//div[@class='round']/label)[1]    class
    Run Keyword If    'active'!='${chck_default_val_checked}'    Fail    "Landing page3 in Child section default amount '800' not checked"

Landing page 3 select child and payment success in Checkout flow LP3
    Jenkins browser launch    ${url_3}
    #Local browser launch landingpage    ${url_3}    ${browser}
    ${get_sel_child_val}=    Select child in landingpage 3
    ${total_val}=    Get Text    xpath=.//span[@id='total']/b
    Run Keyword If    '₹${total_val}'!='${get_sel_child_val}'    Fail    "Total display amount and selected child amount are not equal"
    #Click Element    xpath=.//label[@for='allowAutoDebit']
    Click Element    xpath=.//div[@class='donatenowbtn']/a[contains(.,'DONATE NOW')]
    Capture Page Screenshot
    Landing singin
    Payment gateway list size and text for indian passport holder
    CCavenue payment success flow

Landing page3 select child using SI Flow LP3
    Jenkins browser launch    ${url_3}
    #Local browser launch landingpage    ${url_3}    ${browser}
    ${get_sel_child_val}=    Select child in landingpage 3
    ${total_val}=    Get Text    xpath=.//span[@id='total']/b
    Run Keyword If    '₹${total_val}'!='${get_sel_child_val}'    Fail    "Total display amount and selected child amount are not equal"
    Click Element    xpath=.//label[@for='allowAutoDebit']
    ${chck_covid_section_clickable}=    Run Keyword And Return Status    Click Element    id=cash2
    Run Keyword If    True==${chck_covid_section_clickable}    Fail    "When select child try to make payment using SI flow but Covid section is in enable mode"
    Click Element    xpath=.//div[@class='donatenowbtn']/a[contains(.,'PROCEED TO AUTO DEBIT')]
    Capture Page Screenshot
    Landing singin
    Payment gateway list size and text for SI flow

Landing page3 select dropdown val LP3
    Jenkins browser launch    ${url_3}
    #Local browser launch landingpage    ${url_3}    ${browser}
    ${chck_covid_sec_display}=    Run Keyword And Return Status    Element Should Be Visible    id=covid
    Run Keyword If    'True'!='${chck_covid_sec_display}'    Fail    "Landing page3 Covid section not display"
    Select From List By Value    id=cash2    ${hygiene_kit}
    Select From List By Value    id=cash3    ${cash_covid19}
    Select From List By Value    id=cash4    ${dry_ration}
    Input Text    id=email1    ${general_donation_covid19}
    ${get_total_val_dropdown}=    Evaluate    ${cash_covid19}+${dry_ration}+${hygiene_kit}+${general_donation_covid19}
    ${total_display_val}=    Get Text    xpath=.//span[@id='total']/b
    ${remove_comma_symbol}=    Remove symbol    ${total_display_val}    ,
    Run Keyword If    ${get_total_val_dropdown}!=${remove_comma_symbol}    Fail    "Drop down total value and overall total amount is differ"
    Click Element    xpath=.//span[@class='slider round']
    ${chck_child_diable}=    Get Element Attribute    id=childimg    class
    Run Keyword If    'childimagedis'!='${chck_child_diable}'    Fail    "Child section not disable when click 'Add Child Sponsorship'
    Click Element    xpath=.//div[@class='donatenowbtn']/a[contains(.,'DONATE NOW')]
    Landing3 singin
    Payment gateway list size and text for indian passport holder
    CCavenue payment success flow

Landing page3 select dropdown val and child LP3
    Jenkins browser launch    ${url_3}
    #Local browser launch landingpage    ${url_3}    ${browser}
    ${chck_covid_sec_display}=    Run Keyword And Return Status    Element Should Be Visible    id=covid
    Run Keyword If    'True'!='${chck_covid_sec_display}'    Fail    "Landing page3 Covid section not display"
    Select From List By Value    id=cash2    ${hygiene_kit}
    Select From List By Value    id=cash3    ${cash_covid19}
    Select From List By Value    id=cash4    ${dry_ration}
    Input Text    id=email1    ${general_donation_covid19}
    ${get_total_val_dropdown}=    Evaluate    ${cash_covid19}+${dry_ration}+${hygiene_kit}+${general_donation_covid19}
    ${get_sel_child_val}=    Select child in landingpage 3
    ${remove_symbol}=    Remove String    ${get_sel_child_val}    ₹
    ${child_and_dropdown_val}=    Evaluate    ${get_total_val_dropdown}+${remove_symbol}
    ${total_display_val}=    Get Text    xpath=.//span[@id='total']/b
    Run Keyword If    ${total_display_val}!=${child_and_dropdown_val}    Fail    "Drop down total value + selected child amount are differ in total amount"
    #Click Element    xpath=.//div[@class='donatenowbtn']/a[contains(.,'DONATE NOW')]
    #Landing3 singin
    #Payment gateway list size and text for indian passport holder
    #CCavenue payment success flow
	
To donate for Hygiene Kit for Covid 19 LP3
    Jenkins browser launch    ${url_3}
    #Local browser launch landingpage    ${url_3}    ${browser}
    ${chck_covid_sec_display}=    Run Keyword And Return Status    Element Should Be Visible    id=covid
    Run Keyword If    'True'!='${chck_covid_sec_display}'    Fail    "Landing page3 Covid section not display"
    Select From List By Value    id=cash2    ${hygiene_kit}
    ${total_display_val}=    Get Text    xpath=.//span[@id='total']/b
    Run Keyword If    ${total_display_val}!=${hygiene_kit}    Fail    "Selet drop down value from 'Hygiene Kit for Covid 19' and total value are different"
    Click Element    xpath=.//span[@class='slider round']
    ${chck_dis_child_sec}=    Run Keyword And Return Status    Click Element    xpath=(.//div[@class='owl-item active']//div[@class='stepwizard-step']//label)[2]
    Run Keyword If    'False'!='${chck_dis_child_sec}'    Fail    "Disable 'Add Child Sponsorship' section but Child section are in enable mode"
    ${chck_dis_allow_auto_btn}=    Run Keyword And Return Status    Click Element    xpath=.//label[@for='allowAutoDebit']
    Run Keyword If    'False'!='${chck_dis_allow_auto_btn}'    Fail    "Disable 'Add Child Sponsorship' section but 'Allow auto debit' are in enable mode"
    Click Element    xpath=.//div[@class='donatenowbtn']/a[contains(.,'DONATE NOW')]
    Landing1 singin    logimohan@gmail.com    logi
    #CCavenue payment success flow
    #Ensure acknowledgement

To donate for Cash Voucher for covid 19 LP3
    Jenkins browser launch    ${url_3}
    #Local browser launch landingpage    ${url_3}    ${browser}
    ${chck_covid_sec_display}=    Run Keyword And Return Status    Element Should Be Visible    id=covid
    Run Keyword If    'True'!='${chck_covid_sec_display}'    Fail    "Landing page3 Covid section not display"
    Select From List By Value    id=cash3    ${cash_covid19}
    ${total_display_val}=    Get Text    xpath=.//span[@id='total']/b
    ${remove_comma_symbol_total_val}=    Remove symbol    ${total_display_val}    ,
    Run Keyword If    ${remove_comma_symbol_total_val}!=${cash_covid19}    Fail    "Selet drop down value from 'Cash Voucher for covid 19' and total value are different"
    Click Element    xpath=.//span[@class='slider round']
    ${chck_dis_child_sec}=    Run Keyword And Return Status    Click Element    xpath=(.//div[@class='owl-item active']//div[@class='stepwizard-step']//label)[2]
    Run Keyword If    'False'!='${chck_dis_child_sec}'    Fail    "Disable 'Add Child Sponsorship' section but Child section are in enable mode"
    ${chck_dis_allow_auto_btn}=    Run Keyword And Return Status    Click Element    xpath=.//label[@for='allowAutoDebit']
    Run Keyword If    'False'!='${chck_dis_allow_auto_btn}'    Fail    "Disable 'Add Child Sponsorship' section but 'Allow auto debit' are in enable mode"
    Click Element    xpath=.//div[@class='donatenowbtn']/a[contains(.,'DONATE NOW')]
    Landing1 singin    logimohan@gmail.com    logi
    #CCavenue payment success flow
    #Ensure acknowledgement

To donate for Dry ration for a family LP3
    Jenkins browser launch    ${url_3}
    #Local browser launch landingpage    ${url_3}    ${browser}
    ${chck_covid_sec_display}=    Run Keyword And Return Status    Element Should Be Visible    id=covid
    Run Keyword If    'True'!='${chck_covid_sec_display}'    Fail    "Landing page3 Covid section not display"
    Select From List By Value    id=cash4    ${dry_ration}
    ${total_display_val}=    Get Text    xpath=.//span[@id='total']/b
    ${remove_comma_symbol_total_val}=    Remove symbol    ${total_display_val}    ,
    Run Keyword If    ${remove_comma_symbol_total_val}!=${dry_ration}    Fail    "Selet drop down value from 'Dry ration for a family' and total value are different"
    Click Element    xpath=.//span[@class='slider round']
    ${chck_dis_child_sec}=    Run Keyword And Return Status    Click Element    xpath=(.//div[@class='owl-item active']//div[@class='stepwizard-step']//label)[2]
    Run Keyword If    'False'!='${chck_dis_child_sec}'    Fail    "Disable 'Add Child Sponsorship' section but Child section are in enable mode"
    ${chck_dis_allow_auto_btn}=    Run Keyword And Return Status    Click Element    xpath=.//label[@for='allowAutoDebit']
    Run Keyword If    'False'!='${chck_dis_allow_auto_btn}'    Fail    "Disable 'Add Child Sponsorship' section but 'Allow auto debit' are in enable mode"
    Click Element    xpath=.//div[@class='donatenowbtn']/a[contains(.,'DONATE NOW')]
    Landing1 singin    logimohan@gmail.com    logi
    #CCavenue payment success flow
    #Ensure acknowledgement

To verify General Donation towards Covid -19 One time donation amount field validation LP3
    [Tags]    To verify one time donation functionality
    #Jenkins browser launch    https://prod.worldvision.in/landingPages/child/index-3.html
    Local browser launch landingpage    https://prod.worldvision.in/landingPages/child/index-3.html    ${browser}
    ${chck_covid_sec_display}=    Run Keyword And Return Status    Element Should Be Visible    id=covid
    Run Keyword If    'True'!='${chck_covid_sec_display}'    Fail    "Landing page3 Covid section not display"
    ##Enter 100 in input field to check the alert msg
    enter amount in general donation    100
    Click Element    xpath=.//span[@class='slider round']
    ${chck_dis_child_sec}=    Run Keyword And Return Status    Click Element    xpath=(.//div[@class='owl-item active']//div[@class='stepwizard-step']//label)[2]
    Run Keyword If    'False'!='${chck_dis_child_sec}'    Fail    "Disable 'Add Child Sponsorship' section but Child section are in enable mode"
    ${chck_dis_allow_auto_btn}=    Run Keyword And Return Status    Click Element    xpath=.//label[@for='allowAutoDebit']
    Run Keyword If    'False'!='${chck_dis_allow_auto_btn}'    Fail    "Disable 'Add Child Sponsorship' section but 'Allow auto debit' are in enable mode"
    Click Element    xpath=.//div[@class='donatenowbtn']/a[contains(.,'DONATE NOW')]
    ${get_alert_txtfor_100}=    Get Text    xpath=.//div[@class='swal-text']
    Run Keyword If    '${min_alert_gen_donation}'!='${get_alert_txtfor_100}'    Fail    "Enter Minimum amount '100' but ${min_alert_gen_donation} alert popup text not display"
    Click Element    xpath=.//button[@class='swal-button swal-button--confirm']
    Clear Element Text    id=email1
    ##Enter 799 in input field to check the alert msg
    enter amount in general donation    799
    Click Element    xpath=.//div[@class='donatenowbtn']/a[contains(.,'DONATE NOW')]
    ${get_alert_txtfor_799}=    Get Text    xpath=.//div[@class='swal-text']
    Run Keyword If    '${min_alert_gen_donation}'!='${get_alert_txtfor_799}'    Fail    "Enter Minimum amount '100' but ${min_alert_gen_donation} alert popup text not display"
    Click Element    xpath=.//button[@class='swal-button swal-button--confirm']
    Clear Element Text    id=email1
    ##Enter 800 in input field to accept the value
    enter amount in general donation    800
    Click Element    xpath=.//div[@class='donatenowbtn']/a[contains(.,'DONATE NOW')]
    ${display_reg}=    Run Keyword And Return Status    Element Should Be Visible    xpath=.//div[@id='accordion']
    Run Keyword If    'True'!='${display_reg}'    Fail    "Registration section not display"
    Click Element    xpath=.//div[@class='close-pop']
    Clear Element Text    id=email1
    ##Enter 100001 in input field to check the alert msg
    enter amount in general donation    100001
    Click Element    xpath=.//div[@class='donatenowbtn']/a[contains(.,'DONATE NOW')]
    ${get_alert_txtfor_100001}=    Get Text    xpath=.//div[@class='swal-text']
    Run Keyword If    '${max_alert_gen_donation}'!='${get_alert_txtfor_100001}'    Fail    "Enter Maximum amount '100001' but ${max_alert_gen_donation} alert popup text not display"
    Click Element    xpath=.//button[@class='swal-button swal-button--confirm']
    Clear Element Text    id=email1
    ##Enter 99999 in input field to accept the value and check payment page
    enter amount in general donation    99999
    Click Element    xpath=.//div[@class='donatenowbtn']/a[contains(.,'DONATE NOW')]
    ${display_reg}=    Run Keyword And Return Status    Element Should Be Visible    xpath=.//div[@id='accordion']
    Run Keyword If    'True'!='${display_reg}'    Fail    "Registration section not display"
    Landing1 singin    logimohan@gmail.com    logi
    ${login_success}=    Run Keyword And Return Status    Element Should Be Visible    id=block-checkoutpaymentprogress
    Run Keyword If    'True'!='${login_success}'    Fail    "Enter valid credentials but not get into payment page"
    
To Verify User should register account without Data LP3
    [Tags]    LP-3:Registration Functionallity
    #Jenkins browser launch    ${url_3}
    Local browser launch landingpage    ${url_3}    ${browser}
    # Click Donate amount in    800 Monthly
    Click Element    //div[@class='round']//label
    # Select Allow auto debit check box
    Click Element    //label[@for='allowAutoDebit']
    # Click PROCEED TO AUTO DEBIT button
    Click Element    //a[@class='btn btn-primary proceedtosi']
    # Check Alert should display in all fields
    # Click create a new Account
    Click Element    //a[@class='btn btn-default wv-signUp']
    # Required Message: Please enter your First name
    ${Fname}=    Run Keyword And Return Status    Element Should Be Visible    xpath=//div[@id='signUpfnameErr']
    Log To Console    Firstname Status:${Fname}
    Run Keyword If    'True'!='${Fname}'    Fail    "Without entering First Name after the click Create New Account, ' FirstName' error message not display"
    # Enter the FirstName
    Input Text    (//input[@class='form-control alphabet_valid'])[1]    Test
    # Click create a new Account
    Click Element    //a[@class='btn btn-default wv-signUp']
    # Required Message: Please enter your Last name
    ${Lname}=    Run Keyword And Return Status    Element Should Be Visible    xpath=//div[@id='signUplnameErr']
    Log To Console    Lastname Status:${Lname}
    Run Keyword If    'True'!='${Lname}'    Fail    "Enter the First Name after the click Create New Account, 'LastName' error message not display"
    # Enter the LastName
    Input Text    (//input[@class='form-control alphabet_valid'])[2]    testt
    # Click create a new Account
    Click Element    //a[@class='btn btn-default wv-signUp']
    # Required Message: Please enter your Email
    ${Email}=    Run Keyword And Return Status    Element Should Be Visible    xpath=//div[@id='signUpEmailErr']
    Log To Console    Email Status:${Email}
    Run Keyword If    'True'!='${Email}'    Fail    "Enter the Last Name after the click Create New Account, 'Email address' error message not display"
    # Enter the Email ID
    Input Text    (//input[@type='email'])[2]    test@gmail.com
    # Click create a new Account
    Click Element    //a[@class='btn btn-default wv-signUp']
    # Required Message: Please enter your Phone number
    ${Ph}=    Run Keyword And Return Status    Element Should Be Visible    xpath=//div[@id='signUpEmailErr']
    Log To Console    Phone Status:${Ph}
    Run Keyword If    'True'!='${Ph}'    Fail    "Enter the Email after the click Create New Account, 'Phone number' error message not display"
    # Enter the Phone number
    Input Text    (//input[@class='form-control'])[7]    9940613589
    # Click create a new Account
    Click Element    //a[@class='btn btn-default wv-signUp']
    # Required Message: Please enter the Confirm Password
    ${CPassword}=    Run Keyword And Return Status    Element Should Be Visible    xpath=//div[@id='signUpPassErr']
    Log To Console    C-Password Status:${CPassword}
    Run Keyword If    'True'!='${CPassword}'    Fail    "Enter the Phone Number after the click Create New Account, 'Confirm Password' error message not display"
    # Enter the Confirm Password
    Input Text    (//input[@type='password'])[1]    asdf
    # Click create a new Account
    Click Element    //a[@class='btn btn-default wv-signUp']
    # Required Message: Please enter the Re-Confirm Password
    ${RCPassword}=    Run Keyword And Return Status    Element Should Be Visible    xpath=//div[@id='signUpConPassErr']
    Log To Console    RC-Password Status:${RCPassword}
    Run Keyword If    'True'!='${RCPassword}'    Fail    "Enter the Confirm Password after the click Create New Account, 'Re-Confirm Password' error message not display"
    # Enter the Re-Confirm Password
    Input Text    (//input[@type='password'])[2]    asdf
    # Click create a new Account
    Click Element    //a[@class='btn btn-default wv-signUp']
    # Required Message: Please enter the Address 1
    ${Address-1}=    Run Keyword And Return Status    Element Should Be Visible    xpath=//div[@id='signUpaddrErr']
    Log To Console    Address-1 Status:${Address-1}
    Run Keyword If    'True'!='${Address-1}'    Fail    "Enter the Re-Confirm Password after the click Create New Account, 'Address 1' error message not display"
    # Enter the Address 1
    Input Text    (//input[@class='form-control'])[9]    Address1
    # Click create a new Account
    Click Element    //a[@class='btn btn-default wv-signUp']
    # Required Message: Please enter the Address 2
    ${Address-2}=    Run Keyword And Return Status    Element Should Be Visible    xpath=//div[@id='signUpaddrErr1']
    Log To Console    Address-2 Status:${Address-2}
    Run Keyword If    'True'!='${Address-2}'    Fail    "Enter the Address 1 after the click Create New Account, 'Address 2' error message not display"
    # Enter the Address 2
    Input Text    (//input[@class='form-control'])[10]    Address2
    # Click create a new Account
    Click Element    //a[@class='btn btn-default wv-signUp']
    # Required Message: Please enter the Postalcode
    ${Postalcode}=    Run Keyword And Return Status    Element Should Be Visible    xpath=//div[@id='signUpPscodeErr']
    Log To Console    Postalcode Status:${Postalcode}
    Run Keyword If    'True'!='${Postalcode}'    Fail    "Enter the Address 2 after the click Create New Account, 'Postalcode' error message not display"
    # Enter the Postalcode
    Input Text    (//input[@class='form-control'])[11]    656545
    # Click create a new Account
    Click Element    //a[@class='btn btn-default wv-signUp']
    # Required Message: Please enter the City
    ${City}=    Run Keyword And Return Status    Element Should Be Visible    xpath=//div[@id='signUpCityErr']
    Log To Console    City Status:${City}
    Run Keyword If    'True'!='${City}'    Fail    "Enter the Postalcode after the click Create New Account, 'City' error message not display"
    # Enter the City
    Input Text    (//input[@class='form-control'])[12]    assdg
    # Click create a new Account
    Click Element    //a[@class='btn btn-default wv-signUp']
    # Required Message: Please enter the State
    ${state}=    Run Keyword And Return Status    Element Should Be Visible    xpath=//div[@id='signUpStateErr']
    Log To Console    State Status:${state}
    Run Keyword If    'True'!='${state}'    Fail    "Enter the City after the click Create New Account, 'State' error message not display"
    # Enter the State
    Input Text    (//input[@class='form-control'])[13]    asdfg
    # Click create a new Account
    Click Element    //a[@class='btn btn-default wv-signUp']
    # Required Message: Please enter the Country
    ${Country}=    Run Keyword And Return Status    Element Should Be Visible    xpath=//div[@id='signUpCountryErr']
    Log To Console    Country Status:${Country}
    Run Keyword If    'True'!='${Country}'    Fail    "Enter the State after the click Create New Account, 'Country' error message not display"
    # Clear the postal Code
    Clear Element Text    (//input[@class='form-c
    ontrol'])[11]
    # Enter the Postal code
    Input Text    (//input[@class='form-control'])[11]    600095
    Sleep    3s
    # Click create a new Account
    Click Element    //a[@class='btn btn-default wv-signUp']
    # Required Message: Please enter the date of birth
    ${DOB}=    Run Keyword And Return Status    Element Should Be Visible    xpath=//div[@id='signUpDobErr']
    Log To Console    DOB Status:${DOB}
    Run Keyword If    'True'!='${DOB}'    Fail    "Enter the Postalcode after the click Create New Account, 'DOB' error message not display"
    # Select the Date of birth
    Click Element    //input[@id='wvdatepicker']
    Select From List By Value    //select[@class="ui-datepicker-year"]    1990
    Select From List By Value    //select[@class="ui-datepicker-month"]    6
    Click Link    xpath=(//a[@href="#"])[30]
    # Click create a new Account
    Click Element    //a[@class='btn btn-default wv-signUp']
    
To Verify User should login with Valid Credentials LP3
    [Tags]    LP-3:Login Functionallity
    Jenkins browser launch    ${url_3}
    #Local browser launch landingpage    ${url_3}    ${browser}
    ${get_sel_child_val}=    Select child in landingpage 3
    ${total_val}=    Get Text    xpath=.//span[@id='total']/b
    Run Keyword If    '₹${total_val}'!='${get_sel_child_val}'    Fail    "Total display amount and selected child amount are not equal"
    Click Element    xpath=.//div[@class='donatenowbtn']/a[contains(.,'DONATE NOW')]
    Landing1 singin    logimohan@gmail.com    logi
        ${login_success}=    Run Keyword And Return Status    Element Should Be Visible    id=block-checkoutpaymentprogress
    Run Keyword If    'True'!='${login_success}'    Fail    "Enter valid credentials but not get into login success"
    
To Verify User should login with Invalid credentials LP3
    [Tags]    LP-3:Login Functionallity
    Jenkins browser launch    ${url_3}
    #Local browser launch landingpage    ${url_3}    ${browser}
    ${get_sel_child_val}=    Select child in landingpage 3
    ${total_val}=    Get Text    xpath=.//span[@id='total']/b
    Run Keyword If    '₹${total_val}'!='${get_sel_child_val}'    Fail    "Total display amount and selected child amount are not equal"
    Click Element    xpath=.//div[@class='donatenowbtn']/a[contains(.,'DONATE NOW')]
    Landing1 singin    jfvfdjf@gds.asdas    123456
    ${chck_alert}=    Run Keyword And Return Status    Element Should Be Visible    xpath=.//div[@class='swal-modal']
    Run Keyword If    'True'!='${chck_alert}'    Fail    "Enter invalid credentials, alert not display"

To Verify user should login without Credentials LP3
    [Tags]    LP-3:Login Functionallity
    Jenkins browser launch    ${url_3}
    #Local browser launch landingpage    ${url_3}    ${browser}
    ${get_sel_child_val}=    Select child in landingpage 3
    ${total_val}=    Get Text    xpath=.//span[@id='total']/b
    Run Keyword If    '₹${total_val}'!='${get_sel_child_val}'    Fail    "Total display amount and selected child amount are not equal"
    Click Element    xpath=.//div[@class='donatenowbtn']/a[contains(.,'DONATE NOW')]
    Landing1 singin without credentials
    #Check Email Alert
    ${chck_alert}=    Run Keyword And Return Status    Element Should Be Visible    id=signInEmailErr
    Run Keyword If    'True'!='${chck_alert}'    Fail    "Email id not entered, but alert not display"
    Input Text    name=email    sdfdsg
    Click Element    xpath=.//a[@class='btn btn-default wvSignIn']
    #Check Password Alert
    ${chck_alert}=    Run Keyword And Return Status    Element Should Be Visible    id=signInPassErr
    Run Keyword If    'True'!='${chck_alert}'    Fail    "Password not entered. but alert not display"

To Verify User should login with email id only LP3
    [Tags]    LP-3:Login Functionallity
    Jenkins browser launch    ${url_3}
    #Local browser launch landingpage    ${url_3}    ${browser}
    ${get_sel_child_val}=    Select child in landingpage 3
    ${total_val}=    Get Text    xpath=.//span[@id='total']/b
    Run Keyword If    '₹${total_val}'!='${get_sel_child_val}'    Fail    "Total display amount and selected child amount are not equal"
    Click Element    xpath=.//div[@class='donatenowbtn']/a[contains(.,'DONATE NOW')]
    Landing1 singin with email    jfvfdjf@gds.asdas
    ${chck_alert}=    Run Keyword And Return Status    Element Should Be Visible    id=signInPassErr
    Run Keyword If    'True'!='${chck_alert}'    Fail    "Enter email id only, but password alert not display"

To Verify user should login with Only Password LP3
    [Tags]    LP-3:Login Functionallity
    Jenkins browser launch    ${url_3}
    #Local browser launch landingpage    ${url_3}    ${browser}
    ${get_sel_child_val}=    Select child in landingpage 3
    ${total_val}=    Get Text    xpath=.//span[@id='total']/b
    Run Keyword If    '₹${total_val}'!='${get_sel_child_val}'    Fail    "Total display amount and selected child amount are not equal"
    Click Element    xpath=.//div[@class='donatenowbtn']/a[contains(.,'DONATE NOW')]
    ${display_reg}=    Run Keyword And Return Status    Element Should Be Visible    xpath=.//div[@id='accordion']
    Run Keyword If    'True'!='${display_reg}'    Fail    "When click 'Donate Now' button Registration section not display"
    Landing1 singin with password    jfvfdjf@gds.asdas
    ${chck_alert}=    Run Keyword And Return Status    Element Should Be Visible    id=signInPassErr
    Run Keyword If    'True'!='${chck_alert}'    Fail    "Enter password only, but email alert not display"
    
To Verify user should reset the password without Entering Email and Username LP3
    [Tags]    LP-3:Login Functionallity
    Jenkins browser launch    ${url_3}
    #Local browser launch landingpage    ${url_3}    ${browser}
    ${get_sel_child_val}=    Select child in landingpage 3
    ${total_val}=    Get Text    xpath=.//span[@id='total']/b
    Run Keyword If    '₹${total_val}'!='${get_sel_child_val}'    Fail    "Total display amount and selected child amount are not equal"
    Click Element    xpath=.//div[@class='donatenowbtn']/a[contains(.,'DONATE NOW')]
    ${display_reg}=    Run Keyword And Return Status    Element Should Be Visible    xpath=.//div[@id='accordion']
    Run Keyword If    'True'!='${display_reg}'    Fail    "When click 'Donate Now' button Registration section not display"
    # Click signin in registration pageSSS
    Click Element    (//a[text()='Sign In'])[1]
    # Click Forgot Password?
    Click Element    //a[@class='forgot-password']
    # Click Submit button
    Click Element    //input[@id='edit-submit']
    # Alert should display in the password section
    ${pwd}=    Run Keyword And Return Status    Element Should Be Visible    xpath=//strong[@id='edit-name-error']
    Run Keyword If    'True'!='${pwd}'    Fail    "Without entering the Username or email address after clicking the submit button, 'Username or email address is required' alert error msg not display"

To Verify User should reset the password with Unrecognized email ID LP3
    [Tags]    LP-3:Login Functionallity
    Jenkins browser launch    ${url_3}
    #Local browser launch landingpage    ${url_3}    ${browser}
    ${get_sel_child_val}=    Select child in landingpage 3
    ${total_val}=    Get Text    xpath=.//span[@id='total']/b
    Run Keyword If    '₹${total_val}'!='${get_sel_child_val}'    Fail    "Total display amount and selected child amount are not equal"
    Click Element    xpath=.//div[@class='donatenowbtn']/a[contains(.,'DONATE NOW')]
    ${display_reg}=    Run Keyword And Return Status    Element Should Be Visible    xpath=.//div[@id='accordion']
    Run Keyword If    'True'!='${display_reg}'    Fail    "When click 'Donate Now' button Registration section not display"
    # Click signin in registration pageSSS
    Click Element    (//a[text()='Sign In'])[1]
    # Click Forgot Password?
    Click Element    //a[@class='forgot-password']
    Input Text    //input[@id='edit-name']    ${un_recog_email}
    # Click Submit button
    Click Element    //input[@id='edit-submit']
    # Alert should display in the password section
    ${pwd}=    Run Keyword And Return Status    Element Should Be Visible    xpath=(//div[@class='form-item--error-message'])[2]
    Run Keyword If    'True'!='${pwd}'    Fail    "Enter the unrecognized email ID after clicking the submit button, '${un_recog_email} is not recognized as a username or an email address' alert error msg not display"
    
    To Verify User should reset the password with Unrecognized Username LP3
    [Tags]    LP-3:Login Functionallity
    Jenkins browser launch    ${url_3}
    #Local browser launch landingpage    ${url_3}    ${browser}
    ${get_sel_child_val}=    Select child in landingpage 3
    ${total_val}=    Get Text    xpath=.//span[@id='total']/b
    Run Keyword If    '₹${total_val}'!='${get_sel_child_val}'    Fail    "Total display amount and selected child amount are not equal"
    Click Element    xpath=.//div[@class='donatenowbtn']/a[contains(.,'DONATE NOW')]
    ${display_reg}=    Run Keyword And Return Status    Element Should Be Visible    xpath=.//div[@id='accordion']
    Run Keyword If    'True'!='${display_reg}'    Fail    "When click 'Donate Now' button Registration section not display"
        # Click signin in registration pageSSS
    Click Element    (//a[text()='Sign In'])[1]
        # Click Forgot Password?        
    Click Element    //a[@class='forgot-password']       
    

    Input Text    //input[@id='edit-name']    ${un_recog_name}
    
    
       # Click Submit button
    Click Element    //input[@id='edit-submit']  
    
    # Alert should display in the password section
   ${pwd}=    Run Keyword And Return Status    Element Should Be Visible    xpath=(//div[@class='form-item--error-message'])[2] 
   Run Keyword If    'True'!='${pwd}'    Fail    "Enter the unrecognized name after clicking the submit button,'${un_recog_name} is not recognized as a username or an email address' alert error msg not display"

To Verify user should login as Website Registered User LP3
    [Tags]    LP-3:Login Functionallity
    Jenkins browser launch    ${url_3}
    #Local browser launch landingpage    ${url_3}    ${browser}
    ${get_sel_child_val}=    Select child in landingpage 3
    ${total_val}=    Get Text    xpath=.//span[@id='total']/b
    Run Keyword If    '₹${total_val}'!='${get_sel_child_val}'    Fail    "Total display amount and selected child amount are not equal"
    Click Element    xpath=.//div[@class='donatenowbtn']/a[contains(.,'DONATE NOW')]
    ${display_reg}=    Run Keyword And Return Status    Element Should Be Visible    xpath=.//div[@id='accordion']
    Run Keyword If    'True'!='${display_reg}'    Fail    "When click 'Donate Now' button Registration section not display"
        # # Click in Sign In 
    Click Element    (//a[text()='Sign In'])[1] 
        # Enter the Email ID
    Input Text    //input[@id='emailcheck']    logimohan@gmail.com       
        # Enter the Password
    Input Password    //input[@id='pwd']    logi  
    
    Click Element    (//a[text()='Submit'])[1]       
    
       
    # Alert should display in the password section
   ${payment}=    Run Keyword And Return Status    Element Should Be Visible    xpath=//span[text()='Payment Details']
   
   Run Keyword If    'True'!='${payment}'    Fail    "Enter the Valid credential after the click Submit button, 'Payment gateway page not display' "
   
To Verify User should create an account without uploading Passport Copy LP3

    [Tags]    LP-3:Registration Functionallity
    Jenkins browser launch    ${url_3}
    #Local browser launch landingpage    ${url_3}    ${browser}
    ${get_sel_child_val}=    Select child in landingpage 3
    ${total_val}=    Get Text    xpath=.//span[@id='total']/b
    Run Keyword If    '₹${total_val}'!='${get_sel_child_val}'    Fail    "Total display amount and selected child amount are not equal"
    Click Element    xpath=.//div[@class='donatenowbtn']/a[contains(.,'DONATE NOW')]
    ${display_reg}=    Run Keyword And Return Status    Element Should Be Visible    xpath=.//div[@id='accordion']
    Run Keyword If    'True'!='${display_reg}'    Fail    "When click 'Donate Now' button Registration section not display"
    FirstName
    LastName
    Email
    Phone no
    Confirm Password
    Re-Confirm Password
    Address1
    Address2
    Address3
    Postal code
    City
    State
    Country
    Click Element    //input[@id='wvdatepicker']
    Select From List By Value    //select[@class='ui-datepicker-year']    1990
    Select From List By Value    //select[@class='ui-datepicker-month']    6
    Click Link    xpath=(//a[@href='#'])[30]
    Click Element    //input[@id='otherNation']
    Create a new Account
    ${Other Passport Holder}=    Run Keyword And Return Status    Element Should Be Visible    xpath=//div[@id='signUpUploadErr']
    Run Keyword If    'True'!='${Other Passport Holder}'    Fail    "Enter all the fields select other passport in nationality then click Created button without upload passport copy, but 'please upload passport' error msg not display"

To Verify user should Register an account without Address LP3
    [Tags]    LP-3:Registration Functionallity
    Jenkins browser launch    ${url_3}
    #Local browser launch landingpage    ${url_3}    ${browser}
    ${get_sel_child_val}=    Select child in landingpage 3
    ${total_val}=    Get Text    xpath=.//span[@id='total']/b
    Run Keyword If    '₹${total_val}'!='${get_sel_child_val}'    Fail    "Total display amount and selected child amount are not equal"
    Click Element    xpath=.//div[@class='donatenowbtn']/a[contains(.,'DONATE NOW')]
    ${display_reg}=    Run Keyword And Return Status    Element Should Be Visible    xpath=.//div[@id='accordion']
    Run Keyword If    'True'!='${display_reg}'    Fail    "When click 'Donate Now' button Registration section not display"
          FirstName    
          LastName 
          Email   
          Phone no 
          Confirm Password 
          Re-Confirm Password  
          Postal code   
   Click Element    //input[@id='wvdatepicker']    
   Select From List By Value    //select[@class='ui-datepicker-year']    1990
   Select From List By Value    //select[@class='ui-datepicker-month']    6
   Click Link    xpath=(//a[@href='#'])[30]
             
   Create a new Account   
   
   ${Address-1}=    Run Keyword And Return Status    Element Should Be Visible    xpath=//div[@id='signUpaddrErr']
    
   Run Keyword If    'True'!='${Address-1}'    Fail    "Enter all the fields except Address 1 then click Created button, but 'Please enter the Address 1' error message not display" 

   Input Text    (//input[@class='form-control'])[9]   Address1    
   Create a new Account   
  
   ${Address-2}=    Run Keyword And Return Status    Element Should Be Visible    xpath=//div[@id='signUpaddrErr1']
    
   Run Keyword If    'True'!='${Address-2}'    Fail    "Enter all the fields except Address 2 then click Created button, but 'Please enter the Address 2' error message not display" 
     
   Input Text    (//input[@class='form-control'])[10]   Address2    
   Create a new Account   
   
   ${Address-3}=    Run Keyword And Return Status    Element Should Be Visible    xpath=//div[@id='signUpaddrErr2']
    
   Run Keyword If    'True'!='${Address-3}'    Fail    "Enter all the fields except Address 3 then click Created button, but 'Please enter the Address 3' error message not display"

To Verify user should Register an account without entering Password LP3
    [Tags]    LP-3:Registration Functionallity
    Jenkins browser launch    ${url_3}
    #Local browser launch landingpage    ${url_3}    ${browser}
    ${get_sel_child_val}=    Select child in landingpage 3
    ${total_val}=    Get Text    xpath=.//span[@id='total']/b
    Run Keyword If    '₹${total_val}'!='${get_sel_child_val}'    Fail    "Total display amount and selected child amount are not equal"
    Click Element    xpath=.//div[@class='donatenowbtn']/a[contains(.,'DONATE NOW')]
    ${display_reg}=    Run Keyword And Return Status    Element Should Be Visible    xpath=.//div[@id='accordion']
    Run Keyword If    'True'!='${display_reg}'    Fail    "When click 'Donate Now' button Registration section not display"
          FirstName    
          LastName 
          Email   
          Phone no 
	  Address1  
          Address2  
          Address3
          Postal code   
                
    
   Click Element    //input[@id='wvdatepicker']    
   Select From List By Value    //select[@class='ui-datepicker-year']    1990
   Select From List By Value    //select[@class='ui-datepicker-month']    6
   Click Link    xpath=(//a[@href='#'])[30]
   
           
   Create a new Account   
    
   ${CPassword}=    Run Keyword And Return Status    Element Should Be Visible    xpath=//div[@id='signUpPassErr']
   Run Keyword If    'True'!='${CPassword}'    Fail    "Enter all the fields except Confirm Password then click Created button, but 'Please enter the Confirm Password' alert message not display" 
   
   Input Text    (//input[@type='password'])[1]   asdf        
   Create a new Account

   ${RCPassword}=    Run Keyword And Return Status    Element Should Be Visible    xpath=//div[@id='signUpConPassErr']
   Run Keyword If    'True'!='${RCPassword}'    Fail    "Enter all the fields except Re-Confirm Password then click Created button, but 'Please enter the Re-Confirm Password' alert message not display"
*** Keywords ***
Jenkins browser launch
    [Arguments]    ${url}
    Set Selenium Speed    1s
    ${chrome_options} =    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    Call Method    ${chrome_options}    add_argument    headless
    Call Method    ${chrome_options}    add_argument    disable-gpu
    Call Method    ${chrome_options}    add_argument    no-sandbox
    Create WebDriver    Chrome    chrome_options=${chrome_options}
    Set Window Size    1366    768
    Go To    ${url}
    Set Browser Implicit Wait    15s

Local browser launch landingpage
    [Arguments]    ${baseurl}    ${browser}
    Set Selenium Speed    .5s
    Open Browser    ${baseurl}    ${browser}
    Maximize Browser Window
    Set Browser Implicit Wait    60s

CCavenue payment success flow
    #Wait Until Element Is Visible    xpath=.//div[@id='block-paymentmode']//div[@id='edit-payment-information-payment-method']/div/span[contains(.,'Powered by AXIS BANK')]
    #Click Element    xpath=.//div[@id='block-paymentmode']//div[@id='edit-payment-information-payment-method']/div/span[contains(.,'Powered by AXIS BANK')]/preceding-sibling::input
    #Click Element    xpath=.//div[@id='block-paymentmode']//div[@id='edit-payment-information-payment-method']/div/span[contains(.,'Powered by CC Avenue')]/preceding-sibling::input
    #Sleep    4s
    ${chck_ccaveneu_click}=    Get Element Attribute    xpath=.//div[@id='block-paymentmode']//div[@id='edit-payment-information-payment-method']/div/span[contains(.,'Powered by CC Avenue')]/parent::div    class
    Run Keyword If    '${chck_ccaveneu_click}'!='js-form-item form-item js-form-type-radio form-item-payment-information-payment-method js-form-item-payment-information-payment-method active'    Click Element    xpath=.//div[@id='block-paymentmode']//div[@id='edit-payment-information-payment-method']/div/span[contains(.,'Powered by CC Avenue')]/parent::div
    Click Element    xpath=.//input[@id='edit-actions-next']
    #${order_id}=    Get Text    xpath=.//span[@class='order-value']
    #Log To Console    Order id:${order_id}
    Click Element    xpath=(.//div[@id='OPTNBK']//span[2][contains(text(),'Net Banking')])[1]
    Select From List By Value    id=netBankingBank    AvenuesTest
    Click Element    xpath=(.//span[starts-with(text(),'Make')])[3]
    Click Element    xpath=.//input[@type='submit']
    ${payment_success_msg}=    Get Text    xpath=.//div[@class='payment-success-message']/h3
    Run Keyword If    'PAYMENT SUCCESSFULL'!='${payment_success_msg}'    Fail    "Payment successful page not display"
	
CCAvenue payment failure flow
    ${chck_ccaveneu_click}=    Get Element Attribute    xpath=.//div[@id='block-paymentmode']//div[@id='edit-payment-information-payment-method']/div/span[contains(.,'Powered by CC Avenue')]/parent::div    class
    Run Keyword If    '${chck_ccaveneu_click}'!='js-form-item form-item js-form-type-radio form-item-payment-information-payment-method js-form-item-payment-information-payment-method active'    Click Element    xpath=.//div[@id='block-paymentmode']//div[@id='edit-payment-information-payment-method']/div/span[contains(.,'Powered by CC Avenue')]/parent::div
    Click Element    xpath=.//input[@id='edit-actions-next']
    #${order_id}=    Get Text    xpath=.//span[@class='order-value']
    #Log To Console    Order id:${order_id}
    Click Element    xpath=(.//div[@id='OPTNBK']//span[2][contains(text(),'Net Banking')])[1]
    Select From List By Value    id=netBankingBank    AvenuesTest
    Click Element    xpath=(.//span[starts-with(text(),'Make')])[3]
    Select From List By Value    xpath=.//select[@name='PAID']    N
    Click Element    xpath=.//input[@type='submit']
    ${payment_success_msg}=    Get Text    xpath=.//div[@class='content block-content']/div/h3/span
    Log To Console    Payment failure text:${payment_success_msg}
    Run Keyword If    'PAYMENT FAILED'!='${payment_success_msg}'    Fail    "Payment Failure page not display"

enter amount in general donation
    [Arguments]    ${amt}
    Input Text    id=email1    ${amt}
    
Select child in landingpage
    Scroll Element Into View    xpath=.//div[@class='donatenow supportchildActive']
    Click Element    xpath=(.//div[@class='owl-item active'])[1]
    Click Element    xpath=(.//div[@id='mqhy']/div)[2]
    ${get_child_name}=    Get Text    xpath=(.//div[@class='owl-item active'])[2]//label/div[@class='sliderNameTag']/b
    ${get_child_img_chsrc}=    Get Element Attribute    xpath=(.//div[@class='owl-item active'])[2]//label/img    src
    ${get_val}=    Get Element Attribute    xpath=(.//div[@id='mqhy']/div)[2]/input    value
    Log To Console    Child name:${get_child_name}
    Log To Console    Child img src:${get_child_img_chsrc}
    Log To Console    Child amount:${get_val}
    Click Element    xpath=.//label[@for='allowAutoDebit']
    Click Element    xpath=.//div[@class='donatenowbtn text-right']/a[contains(.,'SPONSOR NOW')]
   
Select child in landingpage1 using SI flow
    Scroll Element Into View    xpath=.//div[@class='donatenow supportchildActive']
    Click Element    xpath=(.//div[@class='owl-item active'])[1]
    Click Element    xpath=(.//div[@id='mqhy']/div)[2]
    ${get_child_name}=    Get Text    xpath=(.//div[@class='owl-item active'])[2]//label/div[@class='sliderNameTag']/b
    ${get_child_img_chsrc}=    Get Element Attribute    xpath=(.//div[@class='owl-item active'])[2]//label/img    src
    ${get_val}=    Get Element Attribute    xpath=(.//div[@id='mqhy']/div)[2]/input    value
    Log To Console    Child name:${get_child_name}
    Log To Console    Child img src:${get_child_img_chsrc}
    Log To Console    Child amount:${get_val}
    Click Element    xpath=.//div[@class='donatenowbtn text-right']/a[contains(.,'PROCEED TO AUTO DEBIT')]

Select child in landingpage 2
    Scroll Element Into View    xpath=.//div[@class='owl-stage']
    Click Element    xpath=(.//div[@class='owl-item active']//div[@class='pic'])[1]
    ${get_child_img_src}=    Get Element Attribute    xpath=(.//div[@class='owl-item active']//div[@class='pic']/img)[2]    src
    ${get_child_name}=    Get Text    xpath=(.//div[@class='owl-item active']//div[@class='select-kid-dec']/p/strong)[2]
    ${get_def_val}=    Get Element Attribute    xpath=.//span[@class='irs-grid-text js-grid-text-0']/span    value
    Log To Console    Selected Child name in landing page 2:${get_child_name}
    Log To Console    Selected Child img src in landing page 2:${get_child_img_src}
    Log To Console    Selected Child default amount in landing page 2:${get_def_val}
    ${get_input_val}=    Get Element Attribute    xpath=.//input[@name='directPayment']    value
    Run Keyword If    '${get_def_val}'!='${get_input_val}'    Fail    "Default '800' amount and input displayed amount are different"
    Click Element    xpath=.//label[@for='allowAutoDebit']
    Click Element    xpath=.//div[@class='col-sm-4 textRight pn']//a[contains(.,'SPONSOR NOW')]

Select child in landingpage2 using SI flow
    Scroll Element Into View    xpath=.//div[@class='owl-stage']
    Click Element    xpath=(.//div[@class='owl-item active']//div[@class='pic'])[1]
    ${get_child_img_src}=    Get Element Attribute    xpath=(.//div[@class='owl-item active']//div[@class='pic']/img)[2]    src
    ${get_child_name}=    Get Text    xpath=(.//div[@class='owl-item active']//div[@class='select-kid-dec']/p/strong)[2]
    ${get_def_val}=    Get Element Attribute    xpath=.//span[@class='irs-grid-text js-grid-text-0']/span    value
    Log To Console    Selected Child name in landing page using SI flow:${get_child_name}
    Log To Console    Selected Child img src in landing page using SI flow:${get_child_img_src}
    Log To Console    Selected Child default amount in landing page using SI flow:${get_def_val}
    ${get_input_val}=    Get Element Attribute    xpath=.//input[@name='directPayment']    value
    Run Keyword If    '${get_def_val}'!='${get_input_val}'    Fail    "Default '800' amount and input displayed amount are different"
    Click Element    xpath=.//div[@class='col-sm-4 textRight pn']//a[contains(.,'PROCEED TO AUTO DEBIT')]

Onetime donation LP1
    [Arguments]    ${amt}
    Click Element    xpath=.//span[@class='toggle-handle btn btn-default btn-xs']
    Input Text    xpath=.//input[@name='directPayment']    ${amt}
    Click Element    xpath=.//div[@class='donatenowbtn text-right']//a[contains(.,'DONATE NOW')]

Onetime donation LP2
    [Arguments]    ${amt}
    Click Element    xpath=.//span[@class='toggle-handle btn btn-default btn-xs']
    Input Text    xpath=.//input[@name='directPayment']    ${amt}
    Click Element    xpath=.//div[@class='col-sm-4 textRight pn']//a[contains(.,'DONATE NOW')]

Select multi child in landingpage2 using checkout page
    Scroll Element Into View    xpath=.//div[@class='owl-stage']
    Click Element    xpath=(.//div[@class='owl-item active']//div[@class='pic'])[1]
    Click Element    xpath=(.//div[@class='owl-item active']//div[@class='pic'])[2]
    Click Element    xpath=(.//div[@class='owl-item active']//div[@class='pic'])[3]
    ${get_def_val}=    Get Element Attribute    xpath=.//span[@class='irs-grid-text js-grid-text-0']/span    value
    ${get_input_val}=    Get Element Attribute    xpath=.//input[@name='directPayment']    value
    ${get_total_val_}=    Evaluate    ${get_def_val}*3
    Log To Console    3 child totoal amt is:${get_total_val_}
    Run Keyword If    ${get_input_val}!=${get_total_val_}    Fail    "Select 3 child total amount is differ"
    
Select child in landingpage 3
    Click Element    xpath=(.//div[@class='owl-item active']//div[@class='stepwizard-step']//label)[2]
    ${get_child_img_src}=    Get Element Attribute    xpath=.//div[@class='owl-item active']//img    src
    ${get_child_name}=    Get Text    xpath=.//div[@class='owl-item active']//div[@class='sliderNameTag']/h4
    ${get_val}=    Get Text    xpath=(.//div[@class='owl-item active']//div[@class='stepwizard-step']/p/span[1])[2]
    Log To Console    Selected Child name in landing page 3:${get_child_name}
    Log To Console    Selected Child img src in landing page 3:${get_child_img_src}
    Log To Console    Selected Child amount in landing page 3:${get_val}
    Click Element    xpath=.//label[@for='allowAutoDebit']    
    [Return]    ${get_val}

Landing1 singin
    [Arguments]    ${username}    ${password}
    ${display_reg}=    Run Keyword And Return Status    Element Should Be Visible    xpath=.//div[@id='accordion']
    Run Keyword If    True!=${display_reg}    Fail    "Regsitration section not display"
    Click Element    xpath=.//a[@class='show-signin']
    Input Text    name=email    ${username}
    Input Text    id=pwd    ${password}
    Click Element    xpath=.//a[@class='btn btn-default wvSignIn']

Forgot password
    ${display_reg}=    Run Keyword And Return Status    Element Should Be Visible    xpath=.//div[@id='accordion']
    Log To Console    Status:${display_reg}
    Run Keyword If    True!=${display_reg}    Fail    "Regsitration section not display"
    Click Element    xpath=.//a[@class='show-signin']
    Click Element    xpath=.//a[@class='forgot-password']

password reset with Unrecognized data
    [Arguments]    ${dummy_Data}
    Input Text    id=edit-name    ${dummy_Data}
    Click Element    id=edit-submit

password reset Unrecognized data alert
    [Arguments]    ${unreg_username}
    ${chck_alert_}=    Run Keyword And Return Status    Element Should Be Visible    xpath=(.//div[@class='form-item--error-message'])[2]
    Run Keyword If    'True'!='${chck_alert_}'    Fail    "When enter '${unreg_username}', but alert not display"
    Switch Window    title=Child Sponsorship    Close Window
    
Landing1 singin with email
    [Arguments]    ${username}
    ${display_reg}=    Run Keyword And Return Status    Element Should Be Visible    xpath=.//div[@id='accordion']
    Run Keyword If    'True'!='${display_reg}'    Fail    "Regsitration section not display"
    Click Element    xpath=.//a[@class='show-signin']
    Input Text    name=email    ${username}
    Click Element    xpath=.//a[@class='btn btn-default wvSignIn']

Landing1 singin with password
    [Arguments]    ${password}
    ${display_reg}=    Run Keyword And Return Status    Element Should Be Visible    xpath=.//div[@id='accordion']
    Run Keyword If    'True'!='${display_reg}'    Fail    "Regsitration section not display"
    Click Element    xpath=.//a[@class='show-signin']
    Input Text    id=pwd    ${password}
    Click Element    xpath=.//a[@class='btn btn-default wvSignIn']

Landing1 singin without credentials
    ${display_reg}=    Run Keyword And Return Status    Element Should Be Visible    xpath=.//div[@id='accordion']
    Run Keyword If    'True'!='${display_reg}'    Fail    "Regsitration section not display"
    Click Element    xpath=.//a[@class='show-signin']
    Click Element    xpath=.//a[@class='btn btn-default wvSignIn']  
    
Landing singin
    ${display_reg}=    Run Keyword And Return Status    Element Should Be Visible    xpath=.//div[@id='accordion']
    Run Keyword If    'True'!='${display_reg}'    Fail    "Regsitration section not display"
    Click Element    xpath=.//a[@class='show-signin']
    Input Text    name=email    kumaran@xerago.com
    Input Text    id=pwd    test
    Click Element    xpath=.//a[@class='btn btn-default wvSignIn']

Landingpage2 singin
    [Arguments]    ${username}    ${password}
    ${display_reg}=    Run Keyword And Return Status    Element Should Be Visible    xpath=.//div[@id='accordion']
    Run Keyword If    'True'!='${display_reg}'    Fail    "Regsitration section not display"
    Click Element    xpath=.//a[@class='show-signin']
    Input Text    name=email    ${username}
    Input Text    id=pwd    ${password}
    Click Element    xpath=.//a[@class='btn btn-default wvSignIn']
    
Landing2 singin
    ${display_reg}=    Run Keyword And Return Status    Element Should Be Visible    xpath=.//div[@id='accordion']
    Run Keyword If    'True'!='${display_reg}'    Fail    "Regsitration section not display"
    Click Element    xpath=.//a[@class='show-signin']
    Input Text    name=email    kumaran@xerago.com
    Input Text    id=pwd    test
    Click Element    xpath=.//a[@class='btn btn-default wvSignIn']
 
Payment gateway list size and text for SI flow
    Sleep    5s
    Capture Page Screenshot
    ${SI_payment_list}=    Get Element Count    xpath=.//div[@class='payment-main-content']/div
    Run Keyword If    3!=${SI_payment_list}    Fail    "SI Flow payment gateway list mismatch"
    FOR    ${SI_payment_txt}    IN    @{SI_payment_list_text}
        ${SI_payment_txt_chck}=    Run Keyword And Return Status    Element Should Be Visible    xpath=.//div[@class='payment-main-content']/div[contains(.,'${SI_payment_txt}')]
        Run Keyword If    'True'!='${SI_payment_txt_chck}'    Fail    "SI flow payment gateway ${SI_payment_txt} text are mismatch"
    END
    
Payment gateway list size and text for indian passport holder
    Sleep    10s
    Capture Page Screenshot
    ${checkout_payment_list}=    Get Element Count    xpath=.//div[@id='block-paymentmode']//div[@id='edit-payment-information-payment-method']/div
    Run Keyword If    5!=${checkout_payment_list}    Fail    "Checkout flow Indian passport holder payment list are mismatch"
    FOR    ${bank_txt}    IN    @{checkout_payment_list_text}
        ${checkout_banklist_name_check}=    Run Keyword And Return Status    Element Should Be Visible    xpath=.//div[@id='block-paymentmode']//div[@id='edit-payment-information-payment-method']/div/span[contains(.,'${bank_txt}')]
        Run Keyword If    'True'!='${checkout_banklist_name_check}'    Fail    'Checkout Flow Indian passport holder Payment Gateway Powered by ${bank_txt} text is mismatch'
    END
    FOR    ${checkout_bank_txt}    IN    @{checkout_payment_list_ind_passport}
        ${checkout_banklist_name_check}=    Run Keyword And Return Status    Element Should Be Visible    xpath=.//div[@id='block-paymentmode']//div[@id='edit-payment-information-payment-method']/div/label[contains(.,'${checkout_bank_txt}')]
        Run Keyword If    'True'!='${checkout_banklist_name_check}'    Fail    'Checkout Flow Indian passport holder Payment Gateway ${bank_txt} text is mismatch'
    END

check default amt and child in page1
    Scroll Element Into View    xpath=.//div[@class='donatenow supportchildActive']
    ${chck_default_amt_sel}=    Get Element Attribute    xpath=(.//div[@id='mqhy']/div/input)[1]    checked
    Log To Console    Atrribute val is:${chck_default_amt_sel}
    Run Keyword If    'true'!='${chck_default_amt_sel}'    Fail    "By default '800' amount not in selected mode"
    ${get_child_count}=    Get Element Count    xpath=.//div[@class='selectchildslider owl-carousel owl-theme owl-loaded owl-drag']//div[@class='owl-stage']/div[@class='owl-item active']
    Run Keyword If    ${get_child_count}<0    Fail    "Child not display in slider section"
    ${chck_bf_allow_btn}=    Execute Javascript    return window.jQuery('#allowAutoDebit').prop('checked')
    Run Keyword If    'True'!='${chck_bf_allow_btn}'    Fail    "By default 'Allow auto debit' button not clicked"
    ${procced_btn_txt}=    Get Text    xpath=(.//div[@class='donatenowbtn text-right']/a)[2]
    Run Keyword If    'PROCEED TO AUTO DEBIT'!='${procced_btn_txt}'    Fail    "When 'Auto auto debit' is checked 'Proceed to auto debit' text is not display"
    Click Element    xpath=.//label[@for='allowAutoDebit']
    ${chck_af_alllow_btn}=    Execute Javascript    return window.jQuery('#allowAutoDebit').prop('checked')
    Run Keyword If    'False'!='${chck_af_alllow_btn}'    Fail    "After clicked 'Allow auto debit', button not change into uncheck"
    ${sponsor_btn_txt}=    Get Text    xpath=(.//div[@class='donatenowbtn text-right']/a)[1]
    Run Keyword If    'SPONSOR NOW'!='${sponsor_btn_txt}'    Fail    "When 'Auto auto debit' is unchecked 'Sponsor Now' text is not display"

check default amt and child in page2
    Scroll Element Into View    xpath=.//div[@class='owl-stage']
    ${get_child_count}=    Get Element Count    xpath=.//div[@class='owl-stage']/div[@class='owl-item active' and @class='owl-item']
    Run Keyword If    ${get_child_count}<0    Fail    "Child not display in slider section"
    ${chck_bf_allow_btn}=    Execute Javascript    return window.jQuery('#allowAutoDebit').prop('checked')
    Run Keyword If    'True'!='${chck_bf_allow_btn}'    Fail    "By default 'Allow auto debit' button not clicked"
    ${procced_btn_txt}=    Get Text    xpath=(.//div[@class='col-sm-4 textRight pn']/a)[2]
    Run Keyword If    'PROCEED TO AUTO DEBIT'!='${procced_btn_txt}'    Fail    "When 'Auto auto debit' is checked 'Proceed to auto debit' text is not display"
    Click Element    xpath=.//label[@for='allowAutoDebit']
    ${chck_af_alllow_btn}=    Execute Javascript    return window.jQuery('#allowAutoDebit').prop('checked')
    Run Keyword If    'False'!='${chck_af_alllow_btn}'    Fail    "After clicked 'Allow auto debit', button not change into uncheck"
    ${sponsor_btn_txt}=    Get Text    xpath=(.//div[@class='col-sm-4 textRight pn']/a)[1]
    Run Keyword If    'SPONSOR NOW'!='${sponsor_btn_txt}'    Fail    "When 'Auto auto debit' is unchecked 'Sponsor Now' text is not display"

Remove symbol
    [Arguments]    ${val}    ${sysmbol}
    ${output}=    Remove String    ${val}    ${sysmbol}
    [Return]    ${output}

Page scrolling
    Sleep    3s
    SeleniumLibrary.Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)

Number of Children
    ${A_MONTHY}=    Get Element Attribute    xpath=.//div[@id='mqhy']//div[1]//input    defaultValue
    Should Be Equal    ${A_MONTHY}    ${E_MONTHY}
    Log To Console    ${A_MONTHY}
    ${A_QUARTERLY}=    Get Element Attribute    xpath=.//div[@id='mqhy']//div[2]//input    defaultValue
    Should Be Equal    ${A_QUARTERLY}    ${E_QUARTERLY}
    Log To Console    ${A_QUARTERLY}
    ${A_HALF}=    Get Element Attribute    xpath=.//div[@id='mqhy']//div[3]//input    defaultValue
    Should Be Equal    ${A_HALF}    ${E_HALF}
    Log To Console    ${AHALF}
    ${A_ANNUALLY}=    Get Element Attribute    xpath=.//div[@id='mqhy']//div[4]//input    defaultValue
    Should Be Equal    ${A_ANNUALLY}    ${E_ANNUALLY}
    Log To Console    ${A_ANNUALLY}
    FOR    ${i}    IN RANGE    1    4
        Sleep    3s
        ${J}=    Evaluate    ${i} + 1
        Log To Console    Number of children
        Click Element    xpath=.//div[@id='sip_increase']
        ${result}=    Evaluate    ${E_MONTHY} * ${J}
        ${A_MONTHY}=    Get Element Attribute    xpath=.//div[@id='mqhy']//label[1]//span[1]    textContent
        ${A_MONTHY}=    Convert To Integer    ${A_MONTHY}
        Should Be Equal    ${result}    ${A_MONTHY}
        Log To Console    ${A_MONTHY}
        ${result}=    Evaluate    ${E_QUARTERLY} * ${J}
        ${A_QUARTERLY}=    Get Element Attribute    xpath=.//div[@id='mqhy']//label[@for='r2']//span    textContent
        ${A_QUARTERLY}=    Convert To Integer    ${A_QUARTERLY}
        Should Be Equal    ${A_QUARTERLY}    ${result}
        Log To Console    ${A_QUARTERLY}
        ${result}=    Evaluate    ${E_HALF} * ${J}
        ${A_HALF}=    Get Element Attribute    xpath=.//div[@id='mqhy']//label[@for='r3']//span    textContent
        ${A_HALF}=    Convert To Integer    ${A_HALF}
        Should Be Equal    ${A_HALF}    ${result}
        Log To Console    ${A_HALF}
        ${result}=    Evaluate    ${E_ANNUALLY} * ${J}
        ${A_ANNUALLY}=    Get Element Attribute    xpath=.//div[@id='mqhy']//label[@for='r4']//span    textContent
        ${A_ANNUALLY}=    Convert To Integer    ${A_ANNUALLY}
        Should Be Equal    ${A_ANNUALLY}    ${result}
        Log To Console    ${A_ANNUALLY}
    END

FirstName
    Input Text    (//input[@class='form-control alphabet_valid'])[1]    Test

LastName
    Input Text    (//input[@class='form-control alphabet_valid'])[2]    Testing

Email
    Input Text    (//input[@type='email'])[2]    test@gmail.com

Phone no
    Input Text    (//input[@class='form-control'])[7]    9940613589

Confirm Password
    Input Text    (//input[@type='password'])[1]    asdf

Re-Confirm Password
    Input Text    (//input[@type='password'])[2]    asdf

Address1
    Input Text    (//input[@class='form-control'])[9]    Address1

Address2
    Input Text    (//input[@class='form-control'])[10]    Address2

Address3
    Input Text    (//input[@class='form-control'])[11]    Address3

Postal code
    Input Text    (//input[@class='form-control'])[12]    602343

City
    Input Text    (//input[@class='form-control'])[13]    assdg

State
    Input Text    (//input[@class='form-control'])[14]    asdfg

Country
    Select From List By Index    //select[@id='country']    2

Create a new Account
    Click Element    //a[@class='btn btn-default wv-signUp']

*** Settings ***
Test Teardown     Close Browser
Library           SeleniumLibrary



*** Variables ***
${browser}        chrome
@{checkout_payment_list_text}    Powered by CC Avenue    Powered by AXIS BANK    POWERED BY HDFC BANK
@{SI_payment_list_text}    NET BANKING    Indian credit card    Debit card
@{checkout_payment_list_ind_passport}    Debit Card/Net banking/Wallets/Amex    Amazon Pay    International credit card    Indian credit cards    Offline Payment
${cash_covid19}    4500
${dry_ration}     1200
${hygiene_kit}    400
${general_donation_covid19}    1000
*** Test Cases ***
To Verify User should login with Valid Credentials
    Jenkins browser launch    https://uat.worldvision.in/landingPages/child/index.html
    #Local browser launch landingpage    https://uat.worldvision.in/landingPages/child/index.html    ${browser}
    Select child in landingpage
    Landing1 singin    Fin.felix@gmail.com    mega@123
    ${chck_payment_page}=    Run Keyword And Return Status    Element Should Be Visible    id=block-paymentmode
    Run Keyword If    'True'!='${chck_payment_page}'    Fail    "User login with valid credentials but payment gateway page not display"

To Verify User should login with Invalid credentials
    Jenkins browser launch    https://uat.worldvision.in/landingPages/child/index.html
    #Local browser launch landingpage    https://uat.worldvision.in/landingPages/child/index.html    ${browser}
    Select child in landingpage
    Landing1 singin    jfvfdjf@gds.asdas    123456
    ${chck_alert}=    Run Keyword And Return Status    Element Should Be Visible    xpath=.//div[@class='swal-modal']
    Run Keyword If    'True'!='${chck_alert}'    Fail    "Enter invalid credentials, alert not display"
    
Landing page1 ensure child and default amount display or not
    Jenkins browser launch    https://uat.worldvision.in/landingPages/child/index.html
    #Local browser launch landingpage    https://uat.worldvision.in/landingPages/child/index.html    ${browser}
    check default amt and child in page1
    
Landing page 1 select child using SI flow
    Jenkins browser launch    https://uat.worldvision.in/landingPages/child/index.html
    #Local browser launch landingpage    https://uat.worldvision.in/landingPages/child/index.html    ${browser}
    Select child in landingpage1 using SI flow
    Capture Page Screenshot
    Landing singin
    Payment gateway list size and text for SI flow

Landing page 1 select child and payment success in Checkout flow
    Jenkins browser launch    https://uat.worldvision.in/landingPages/child/index.html
    #Local browser launch landingpage    https://uat.worldvision.in/landingPages/child/index.html    ${browser}
    Select child in landingpage
    Capture Page Screenshot
    Landing singin
    Payment gateway list size and text for indian passport holder
    CCavenue payment success flow

Donate through One Time Donation Payment flow
    #Local browser launch landingpage    https://uat.worldvision.in/landingPages/child/index.html    ${browser}
    Jenkins browser launch    https://uat.worldvision.in/landingPages/child/index.html
    Onetime donation    1000
    Landing1 singin    logimohan@gmail.com    logi
    Payment gateway list size and text for indian passport holder
    CCavenue payment success flow
    
Landing page2 ensure child and default amount display or not
    Jenkins browser launch    https://uat.worldvision.in/landingPages/child/index-2.html
    #Local browser launch landingpage    https://uat.worldvision.in/landingPages/child/index-2.html    ${browser}
    check default amt and child in page2
    
Landing page 2 select child and payment success in Checkout flow
    Jenkins browser launch    https://uat.worldvision.in/landingPages/child/index-2.html
    #Local browser launch landingpage    https://uat.worldvision.in/landingPages/child/index-2.html    ${browser}
    Select child in landingpage 2
    Capture Page Screenshot
    Landing2 singin
    Payment gateway list size and text for indian passport holder
    CCavenue payment success flow

Landing page 2 select child using SI flow
    Jenkins browser launch    https://uat.worldvision.in/landingPages/child/index-2.html
    #Local browser launch landingpage    https://uat.worldvision.in/landingPages/child/index-2.html    ${browser}
    Select child in landingpage2 using SI flow
    Capture Page Screenshot
    Landing2 singin
    Payment gateway list size and text for SI flow

Landing page2 Onetime donation
    Jenkins browser launch    https://uat.worldvision.in/landingPages/child/index-2.html
    #Local browser launch landingpage    https://uat.worldvision.in/landingPages/child/index-2.html    ${browser}
    Onetime donation
    Landing2 singin
    Payment gateway list size and text for indian passport holder

To verify OTD should not accept Si
    Jenkins browser launch    https://uat.worldvision.in/landingPages/child/index-2.html
    #Local browser launch landingpage    https://uat.worldvision.in/landingPages/child/index-2.html    ${browser}
    Onetime donation    1000
    Landingpage2 singin    Fin.felix@gmail.com    mega@123
    ${chck_SI_payment_sec}=    Run Keyword And Return Status    Element Should Be Visible    xpath=.//div[@class='payment-mode si-pop-4 tab-pane step-content']
    Run Keyword If    'True'=='${chck_SI_payment_sec}'    Fail    "Select Onetime donation but payment gateway display like SI"
    
Landing page2 select multiple child and payment success in Checkout flow
    Jenkins browser launch    https://uat.worldvision.in/landingPages/child/index-2.html
    #Local browser launch landingpage    https://uat.worldvision.in/landingPages/child/index-2.html    ${browser}
    Select multi child in landingpage2 using checkout page
    
Landing page3 ensure child and default amount display or not
    #Jenkins browser launch    https://uat.worldvision.in/landingPages/child/index.html
    Local browser launch landingpage    https://uat.worldvision.in/landingPages/child/index.html    ${browser}
    ${chck_list_display}=    Get Element Count    xpath=.//div[@class='owl-item active']
    Run Keyword If    ${chck_list_display}<0    Fail    "In Landing page3 child is not display"
    ${Check_default_allow_btn_uncheck}=    Run Keyword And Return Status    Element Should Be Visible    xpath=.//div[@class='donatenowbtn']/a[contains(.,'DONATE NOW')]
    Run Keyword If    'True'!='${Check_default_allow_btn_uncheck}'    Fail    "By default 'Donate Now' button not display"
    ${chck_covid_sec_display}=    Run Keyword And Return Status    Element Should Be Visible    id=covid
    Run Keyword If    'True'!='${chck_covid_sec_display}'    Fail    "Landing page3 Covid section not display"
    ${chck_default_val_checked}=    Get Element Attribute    xpath=(.//div[@class='owl-item active']//div[@class='round']/label)[1]    class
    Run Keyword If    'active'!='${chck_default_val_checked}'    Fail    "Landing page3 in Child section default amount '800' not checked"

Landing page 3 select child and payment success in Checkout flow
    #Jenkins browser launch    https://uat.worldvision.in/landingPages/child/index-3.html
    Local browser launch landingpage    https://uat.worldvision.in/landingPages/child/index-3.html    ${browser}
    ${get_sel_child_val}=    Select child in landingpage 3
    ${total_val}=    Get Text    xpath=.//span[@id='total']/b
    Run Keyword If    '₹${total_val}'!='${get_sel_child_val}'    Fail    "Total display amount and selected child amount are not equal"
    #Click Element    xpath=.//label[@for='allowAutoDebit']
    Click Element    xpath=.//div[@class='donatenowbtn']/a[contains(.,'DONATE NOW')]
    Capture Page Screenshot
    Landing singin
    Payment gateway list size and text for indian passport holder
    CCavenue payment success flow

Landing page3 select child using SI Flow
    #Jenkins browser launch    https://uat.worldvision.in/landingPages/child/index-3.html
    Local browser launch landingpage    https://uat.worldvision.in/landingPages/child/index-3.html    ${browser}
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

Landing page3 select dropdown val
    #Jenkins browser launch    https://uat.worldvision.in/landingPages/child/index-3.html
    Local browser launch landingpage    https://uat.worldvision.in/landingPages/child/index-3.html    ${browser}
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

Landing page3 select dropdown val and child
    #Jenkins browser launch    https://uat.worldvision.in/landingPages/child/index-3.html
    Local browser launch landingpage    https://uat.worldvision.in/landingPages/child/index-3.html    ${browser}
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

Onetime donation
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
    ${display_reg}=    Run Keyword And Return Status    Element Should Be Visible    id=accordion
    Run Keyword If    True!=${display_reg}    Fail    "Regsitration section not display"
    Click Element    xpath=.//a[@class='show-signin']
    Input Text    id=email    ${username}
    Input Text    id=pwd    ${password}
    Click Element    xpath=.//a[@class='btn btn-default wvSignIn']
    
Landing singin
    ${display_reg}=    Run Keyword And Return Status    Element Should Be Visible    id=accordion
    Run Keyword If    True!=${display_reg}    Fail    "Regsitration section not display"
    Click Element    xpath=.//a[@class='show-signin']
    Input Text    id=email    kumaran@xerago.com
    Input Text    id=pwd    test
    Click Element    xpath=.//a[@class='btn btn-default wvSignIn']

Landingpage2 singin
    [Arguments]    ${username}    ${password}
    ${display_reg}=    Run Keyword And Return Status    Element Should Be Visible    id=accordion
    Run Keyword If    True!=${display_reg}    Fail    "Regsitration section not display"
    Click Element    xpath=.//a[@class='show-signin']
    Input Text    id=email    ${username}
    Input Text    id=pwd    ${password}
    Click Element    xpath=.//a[@class='btn btn-default wvSignIn']
    
Landing2 singin
    ${display_reg}=    Run Keyword And Return Status    Element Should Be Visible    id=accordion
    Run Keyword If    True!=${display_reg}    Fail    "Regsitration section not display"
    Click Element    xpath=.//a[@class='show-signin']
    Input Text    id=email    kumaran@xerago.com
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

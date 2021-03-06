*** Settings ***
Test Teardown     Close Browser
Library           SeleniumLibrary
Library           String



*** Variables ***
${browser}        chrome
${url_1}        https://uat.worldvision.in/landingPages/child/index.html
${url_2}        https://uat.worldvision.in/landingPages/child/index-2.html
${url_3}        https://uat.worldvision.in/landingPages/child/index-3.html
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
${un_recog_email}    dfgdfsfgdf@sdfds.fdssdfff
${city}           Chennai
${state}          Tamil Nadu
${E_MONTHY}    800
${E_QUARTERLY}    2400
${E_HALF}    4800
${E_ANNUALLY}    9600
${min_alert_gen_donation}    Minimum Amount is 800 for General Donataion
${max_alert_gen_donation}    Maximum Amount is 100000 for General Donataion
*** Test Cases ***
To Verify user should login as Website Registered User LP1
    [Tags]    LP-1:Login Functionallity
    Jenkins browser launch    ${url_1}
    #Local browser launch landingpage    ${url_1}    ${browser}
    Select child in landingpage
    Capture Page Screenshot
    Landing1 singin    Fin.felix@gmail.com    mega@123
    ${chck_payment_page}=    Run Keyword And Return Status    Element Should Be Visible    id=block-paymentmode
    Run Keyword If    'True'!='${chck_payment_page}'    Fail    "User login with valid credentials but payment gateway page not display"

To Verify User should reset the password with Unrecognized Username LP1
    [Tags]    LP-1:Login Functionallity
    Jenkins browser launch    ${url_1}
    #Local browser launch landingpage    ${url_1}    ${browser}
    Onetime donation LP1    2000
    Forgot password
    password reset with Unrecognized data    dummy
    password reset Unrecognized data alert    UnrecognizedUsername

To Verify User should reset the password with Unrecognized email ID LP1
    [Tags]    LP-1:Login Functionallity
    Jenkins browser launch    ${url_1}
    #Local browser launch landingpage    ${url_1}    ${browser}
    Select child in landingpage
    Forgot password
    password reset with Unrecognized data    fgfdgddf@dfg.fddsf
    password reset Unrecognized data alert    Unrecognized email ID
    
To Verify user should reset the password without Entering Email and Username LP1
    [Tags]    LP-1:Login Functionallity
    Jenkins browser launch    ${url_1}
    #Local browser launch landingpage    ${url_1}    ${browser}
    Select child in landingpage
    Forgot password
    Click Element    id=edit-submit
    password reset Unrecognized data alert    without Entering Email and Username
    
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
    [Tags]    LP-1:Login Functionallity
    Jenkins browser launch    ${url_1}
    #Local browser launch landingpage    ${url_1}    ${browser}
    Select child in landingpage
    Landing1 singin    Fin.felix@gmail.com    mega@123
    ${chck_payment_page}=    Run Keyword And Return Status    Element Should Be Visible    id=block-paymentmode
    Run Keyword If    'True'!='${chck_payment_page}'    Fail    "User login with valid credentials but payment gateway page not display"

To Verify User should login with Invalid credentials LP1
    [Tags]    LP-1:Login Functionallity
    Jenkins browser launch    ${url_1}
    #Local browser launch landingpage    ${url_1}    ${browser}
    Select child in landingpage
    Landing1 singin    jfvfdjf@gds.asdas    123456
    Sleep	15s
    ${chck_alert}=    Run Keyword And Return Status    Element Should Be Visible    id=signInPassErr
    Run Keyword If    'True'!='${chck_alert}'    Fail    "Enter invalid credentials, alert msg not display"
    
To Verify User should login with email id only LP1
    [Tags]    LP-1:Login Functionallity
    Jenkins browser launch    ${url_1}
    #Local browser launch landingpage    ${url_1}    ${browser}
    Select child in landingpage
    Landing1 singin with email    jfvfdjf@gds.asdas
    ${chck_alert}=    Run Keyword And Return Status    Element Should Be Visible    id=signInPassErr
    Run Keyword If    'True'!='${chck_alert}'    Fail    "Enter email id only, but password alert not display"

To Verify user should login with Only Password LP1
    [Tags]    LP-1:Login Functionallity
    Jenkins browser launch    ${url_1}
    #Local browser launch landingpage    ${url_1}    ${browser}
    Select child in landingpage
    Landing1 singin with password    xccvcxvv
    ${chck_alert}=    Run Keyword And Return Status    Element Should Be Visible    id=signInEmailErr
    Run Keyword If    'True'!='${chck_alert}'    Fail    "Enter password only, but email alert not display"

To Verify user should login without Credentials LP1
    [Tags]    LP-1:Login Functionallity
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
    [Tags]    Payment acknowledgment for other passport holder
    Jenkins browser launch    ${url_1}
    #Local browser launch landingpage    ${url_1}    ${browser}
    Select child in landingpage
    Capture Page Screenshot
    Landing singin
    Payment gateway list size and text for indian passport holder
    CCavenue payment success flow

To verify payment failure for cc avenue payment gateway - For passport holder LP1
    [Tags]    Payment acknowledgment for other passport holder
    Jenkins browser launch    ${url_1}
    #Local browser launch landingpage    ${url_1}    ${browser}
    Select child in landingpage
    Capture Page Screenshot
    Landing singin
    Payment gateway list size and text for indian passport holder
    CCAvenue payment failure flow

To Donate RS 4000 through One Time Donation LP1
    [Tags]    LP-1: Donate through one time donation
    Jenkins browser launch    ${url_1}
    #Local browser launch landingpage    ${url_1}    ${browser}
    Onetime donation LP1    4000
    Landing1 singin    logimohan@gmail.com    logi
    Payment gateway list size and text for indian passport holder
    CCavenue payment success flow
    
To verify OTD should not redirect to SI LP1
    [Tags]    LP-1: Donate through one time donation
    Jenkins browser launch    ${url_1}
    #Local browser launch landingpage    ${url_1}    ${browser}
    Onetime donation LP1    1000
    Landingpage2 singin    Fin.felix@gmail.com    mega@123
    ${chck_SI_payment_sec}=    Run Keyword And Return Status    Element Should Be Visible    xpath=.//div[@class='payment-mode si-pop-4 tab-pane step-content']
    Run Keyword If    'True'=='${chck_SI_payment_sec}'    Fail    "Select Onetime donation but payment gateway display like SI" 
    
To verify One time donation amount field validation LP1
    [Tags]    LP-1: Donate through one time donation
    #Jenkins browser launch    ${url_1}
    Local browser launch landingpage    ${url_1}    ${browser}
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

To Verify user should Register an account without Address LP1
    [Tags]    LP-1:Registration Functionality
    Jenkins browser launch    ${url}
    #Local browser launch landingpage    ${url_1}    ${browser}
    Select child in landingpage
    ${display_reg}=    Run Keyword And Return Status    Element Should Be Visible    xpath=.//div[@id='accordion']
    Run Keyword If    'True'!='${display_reg}'    Fail    "When click 'CTA' button Registration section not display"
    FirstName    test
    LastName    tesr
    Email    test@gmail.com
    Phone no    9940689789
    Confirm Password    asdf
    Re-Confirm Password    asdf
    Postal code    600099
    Create new Account
    ${Address-1}=    Run Keyword And Return Status    Element Should Be Visible    xpath=//div[@id='signUpaddrErr']
    Run Keyword If    'True'!='${Address-1}'    Fail    "Without Enter the Address1 then click Created button, 'Please enter the Address 1' alert message not display"
    Address1    Address1
    Create new Account
    ${Address-2}=    Run Keyword And Return Status    Element Should Be Visible    xpath=//div[@id='signUpaddrErr1']
    Run Keyword If    'True'!='${Address-2}'    Fail    "Enter the Address1 then click Created button, 'Please enter the Address 2' alert message not display"
    Address2    Address2
    Create new Account
    ${Address-3}=    Run Keyword And Return Status    Element Should Be Visible    xpath=//div[@id='signUpaddrErr2']
    Run Keyword If    'True'!='${Address-3}'    Fail    "Enter the Address2 then click Created button, 'Please enter the Address 3' alert message not display"

    
To Verify User should register an Account with Invalid data LP1
    [Tags]    LP-1:Registration Functionality
    Jenkins browser launch    ${url_1}
    #Local browser launch landingpage    ${url_1}    ${browser}
    Select child in landingpage
    ${display_reg}=    Run Keyword And Return Status    Element Should Be Visible    xpath=.//div[@id='accordion']
    Run Keyword If    'True'!='${display_reg}'    Fail    "When click 'CTA' button Registration section not display"
    FirstName    test@123
    Create a new Account
    ${Fname}=    Run Keyword And Return Status    Element Should Be Visible    xpath=//div[@id='signUpfnameErr']
    Run Keyword If    'True'!='${Fname}'    Fail    "Enter Invalid FirstName then click Created button, 'Please use alpha and space' alert message not display"
    FirstName    test
    LastName    test@1234
    Create a new Account
    ${Lname}=    Run Keyword And Return Status    Element Should Be Visible    xpath=//div[@id='signUplnameErr']
    Run Keyword If    'True'!='${Lname}'    Fail    "Enter Invalid LastName then click Created button, 'Please use alpha and space.' alert message not display"
    LastName    tests
    Email    test123@
    Create a new Account
    ${Email}=    Run Keyword And Return Status    Element Should Be Visible    xpath=//div[@id='signUpEmailErr']
    Run Keyword If    'True'!='${Email}'    Fail    "Enter Invalid Email id then click Created button, 'Please enter a valid Email' alert message not display"
    Email    test123@gmail.com
    Phone no    99406
    Create a new Account
    ${Phone}=    Run Keyword And Return Status    Element Should Be Visible    xpath=//div[@id='signInPhoneErr']
    Run Keyword If    'True'!='${Phone}'    Fail    "Enter Invalid Phone no then click Created button, 'Please enter a valid 10 digit Phone number' alert message not display"
    Phone no    9940613579
    Create a new Account
    Confirm Password    asdf
    ${CPassword}=    Run Keyword And Return Status    Element Should Be Visible    xpath=//div[@id='signUpPassErr']
    Run Keyword If    'True'!='${CPassword}'    Fail    "without Enter the Confirm Password then click Created button, 'Please enter the Password' alert message not display"
    Re-Confirm Password    asdff
    Create a new Account
    ${RCPassword}=    Run Keyword And Return Status    Element Should Be Visible    xpath=//div[@id='signUpConPassErr']
    Run Keyword If    'True'!='${RCPassword}'    Fail    "Enter the InvalidRe-Confirm Password after then click Created button, 'Please enter the Confirm Password' alert message not display"
    Re-Confirm Password    asdf
    Create a new Account
    Address1    Address1@
    ${Address-1}=    Run Keyword And Return Status    Element Should Be Visible    xpath=//div[@id='signUpaddrErr']
    Run Keyword If    'True'!='${Address-1}'    Fail    "Enter the Invalid Address1 then click Created button, 'Enter the valid Address 1' alert message not display"
    Address1    Address1
    Create a new Account
    Address2    Address2#
    ${Address-2}=    Run Keyword And Return Status    Element Should Be Visible    xpath=//div[@id='signUpaddrErr1']
    Run Keyword If    'True'!='${Address-2}'    Fail    "Enter the Invalid Address2    then click Created button, 'Enter the valid Address 2' alert message not display"
    Address2    Address2
    Create a new Account
    Address3    Address3$
    ${Address-3}=    Run Keyword And Return Status    Element Should Be Visible    xpath=//div[@id='signUpaddrErr2']
    Run Keyword If    'True'!='${Address-3}'    Fail    "Enter the Invalid Address3    then click Created button, 'Enter the valid Address 3' alert message not display"
    Address3    Address3
    Create a new Account
    Postal code    7457
    ${Postalcode}=    Run Keyword And Return Status    Element Should Be Visible    xpath=//div[@id='signUpPscodeErr']
    Run Keyword If    'True'!='${Postalcode}'    Fail    "Enter the InValid Postal code then click Created button, 'Please enter a valid 6 digit PostalCode' alert message not display"
    Postal code    789526
    Create a new Account
    City    @assdf
    ${City}=    Run Keyword And Return Status    Element Should Be Visible    xpath=//div[@id='signUpCityErr']
    Run Keyword If    'True'!='${City}'    Fail    "Enter the InValid City then click Created button, 'Please enter a valid City.' alert message not display"
    City    chenn
    Create a new Account
    State    $asdfg
    ${state}=    Run Keyword And Return Status    Element Should Be Visible    xpath=//div[@id='signUpStateErr']
    Run Keyword If    'True'!='${state}'    Fail    "Enter the InValid State then click Created button, 'Please enter a valid State.' alert message not display"
    State    asdf
    Create a new Account
    ${Country}=    Run Keyword And Return Status    Element Should Be Visible    xpath=//div[@id='signUpCountryErr']
    Run Keyword If    'True'!='${Country}'    Fail    "Without Select the Country then click Created button, 'Please select the Country' alert message not display"
    Country
    Create a new Account
    ${DOB}=    Run Keyword And Return Status    Element Should Be Visible    xpath=//div[@id='signUpDobErr']
    Run Keyword If    'True'!='${DOB}'    Fail    "Without select the DOB then click Created button, 'Please enter the date of birth' alert message not display"
    Click Element    //input[@id='wvdatepicker']
    Select From List By Value    //select[@class='ui-datepicker-year']    1990
    Select From List By Value    //select[@class='ui-datepicker-month']    6
    Click Link    xpath=(//a[@href='#'])[30]
    Create a new Account
    ${Indian Citizen}=    Run Keyword And Return Status    Element Should Be Visible    xpath=//div[@id='signUpNationlityErr']
    Run Keyword If    'True'!='${Indian Citizen}'    Fail    "Without selecting Indian Citizen checkbox then click Created button, 'Please select the Nationality' alert message not display"
    Indian Citizen
    Create a new Account
    
To Verify User should register account without Data LP1
    [Tags]    LP-1:Registration Functionality
    Jenkins browser launch    ${url_1}
    #Local browser launch landingpage    ${url_1}    ${browser}
    
    Select child in landingpage
    Wait Until Element Is Visible    xpath=//div[@id='accordion']    30s
    ${display_reg}=    Run Keyword And Return Status    Element Should Be Visible    xpath=.//div[@id='accordion']
    Run Keyword If    'True'!='${display_reg}'    Fail    "When click 'CTA' button Registration section not display"
    Create a new Account
    ${Fname}=    Run Keyword And Return Status    Element Should Be Visible    xpath=//div[@id='signUpfnameErr']
    Run Keyword If    'True'!='${Fname}'    Fail    "Without Enter the FirstName then click Created button, 'Please enter your First name' alert message not display"
    FirstName    test
    Create a new Account
    ${Lname}=    Run Keyword And Return Status    Element Should Be Visible    xpath=//div[@id='signUplnameErr']
    Run Keyword If    'True'!='${Lname}'    Fail    "Enter the FirstName then click Created button, 'Please enter your LastName' alert message not display"
    LastName    testt
    Create a new Account
    ${Email}=    Run Keyword And Return Status    Element Should Be Visible    xpath=//div[@id='signUpEmailErr']
    Run Keyword If    'True'!='${Email}'    Fail    "Enter the LastName then click Created button, 'Please enter your Email Id' alert message not display"
    Email    test@gmail.com
    Create a new Account
    ${Ph}=    Run Keyword And Return Status    Element Should Be Visible    xpath=//div[@id='signInPhoneErr']
    Run Keyword If    'True'!='${Ph}'    Fail    "Enter the Email Id then click Created button, 'Please enter your Phone number' alert message not display"
    Phone no    9940613587
    Create a new Account
    ${CPassword}=    Run Keyword And Return Status    Element Should Be Visible    xpath=//div[@id='signUpPassErr']
    Run Keyword If    'True'!='${CPassword}'    Fail    "Enter the Phone number then click Created button, 'Please enter the Confirm Password' alert message not display"
    Confirm Password    asdf
    Create a new Account
    ${RCPassword}=    Run Keyword And Return Status    Element Should Be Visible    xpath=//div[@id='signUpConPassErr']
    Run Keyword If    'True'!='${RCPassword}'    Fail    "Enter the Confirm Password after then click Created button, 'Please enter the Re-Confirm Password' alert message not display"
    Re-Confirm Password    asdf
    Create a new Account
    ${Address-1}=    Run Keyword And Return Status    Element Should Be Visible    xpath=//div[@id='signUpaddrErr']
    Run Keyword If    'True'!='${Address-1}'    Fail    "Enter the Re-Confirm Password then click Created button, 'Enter the valid Address 1' alert message not display"
    Address1    Address1
    Create a new Account
    ${Address-2}=    Run Keyword And Return Status    Element Should Be Visible    xpath=//div[@id='signUpaddrErr1']
    Run Keyword If    'True'!='${Address-2}'    Fail    "Enter the Address1 then click Created button, 'Enter the valid Address 2' alert message not display"
    Address2    Address2
    Create a new Account
    ${Address-3}=    Run Keyword And Return Status    Element Should Be Visible    xpath=//div[@id='signUpaddrErr2']
    Run Keyword If    'True'!='${Address-3}'    Fail    "Enter the Address2    then click Created button, 'Enter the valid Address 3' alert message not display"
    Address3    Address3
    Create a new Account
    ${Postalcode}=    Run Keyword And Return Status    Element Should Be Visible    xpath=//div[@id='signUpPscodeErr']
    Run Keyword If    'True'!='${Postalcode}'    Fail    "Enter the Address 3 then click Created button, 'Please enter the Postalcode' alert message not display"
    Postal code    604589
    Create a new Account
    ${City}=    Run Keyword And Return Status    Element Should Be Visible    xpath=//div[@id='signUpCityErr']
    Run Keyword If    'True'!='${City}'    Fail    "Enter the Postalcode then click Created button, 'Please enter the City' alert message not display"
    City    asdf
    Create a new Account
    ${state}=    Run Keyword And Return Status    Element Should Be Visible    xpath=//div[@id='signUpStateErr']
    Run Keyword If    'True'!='${state}'    Fail    "Enter the City then click Created button, 'Please enter the State' alert message not display"
    State    qwer
    Create a new Account
    ${Country}=    Run Keyword And Return Status    Element Should Be Visible    xpath=//div[@id='signUpCountryErr']
    Run Keyword If    'True'!='${Country}'    Fail    "Enter the State then click Created button, 'Please select the Country' alert message not display"
    Country
    Create a new Account
    ${DOB}=    Run Keyword And Return Status    Element Should Be Visible    xpath=//div[@id='signUpDobErr']
    Run Keyword If    'True'!='${DOB}'    Fail    "select the Country then click Created button, 'Please enter the date of birth' alert message not display"
    Select From List By Label    name=aboutwv    Online Ads
    Click Element    //input[@id='wvdatepicker']
    Select From List By Value    //select[@class='ui-datepicker-year']    1990
    Select From List By Value    //select[@class='ui-datepicker-month']    6
    Click Link    xpath=(//a[@href='#'])[30]
    Create a new Account
    ${Indian Citizen}=    Run Keyword And Return Status    Element Should Be Visible    xpath=//div[@id='signUpNationlityErr']
    Run Keyword If    'True'!='${Indian Citizen}'    Fail    "Select the date of birth then click Created button, 'Please select the Nationality' alert message not display"
    Indian Citizen
    Create a new Account
    
To Verify State and City get autofill after update pincode LP1
    [Tags]    LP-1:Registration Functionallity
    Jenkins browser launch    ${url_1}
    #Local browser launch landingpage    ${url_1}    ${browser}
    Select child in landingpage
    Sleep    10s    
    ${display_reg}=    Run Keyword And Return Status    Element Should Be Visible    xpath=.//div[@id='accordion']
    Run Keyword If    'True'!='${display_reg}'    Fail    "When click 'CTA' button Registration section not display"
    Register data    test    test    logi@gmail.com    9874565432    logi    logi    sfgsgsdgsgsdgsds    sfgsgsdgsgsdgsds    sfgsgsdgsgsdgsds    600099
    
    ${get_city_val}=    Get Element Attribute    //input[@name='city']    value
    Run Keyword If    '${city}'!='${get_city_val}'    Fail    "Enter valid pincode but City not auto filled"
    ${get_state_val}=    Get Element Attribute    //input[@name='state']    value
    Run Keyword If    '${state}'!='${get_state_val}'    Fail    "Enter valid pincode but State not auto filled"
    Edit Pincode auto populate    Chennai    Tamil Nadu 

To Verify User should Create a account with existing registered mail LP1
    [Tags]    LP-1:Registration Functionallity
    Jenkins browser launch    ${url_1}
    #Local browser launch landingpage    ${url_1}    ${browser}
    Select child in landingpage
    Sleep    5s    
    ${display_reg}=    Run Keyword And Return Status    Element Should Be Visible    xpath=.//div[@id='accordion']
    Run Keyword If    'True'!='${display_reg}'    Fail    "When click 'CTA' button Registration section not display"
    Register data    test    test    logimohan@gmail.com    9874565432    logi    logi    sfgsgsdgsgsdgsds    sfgsgsdgsgsdgsds    sfgsgsdgsgsdgsds    600099
    Select From List By Label    name=aboutwv    Online Ads
    Click Element    //input[@id='wvdatepicker']
    Select From List By Value    //select[@class='ui-datepicker-year']    1990
    Select From List By Value    //select[@class='ui-datepicker-month']    6
    Click Link    xpath=(//a[@href='#'])[30]
    Create a new Account
    ${Email}=    Run Keyword And Return Status    Element Should Be Visible    xpath=//div[@class='swal-text']
    Run Keyword If    'True'!='${Email}'    Fail    "Enter all the fields and Enter registered email then click Created button, but 'The Mobile Number or Username already taken', alert message not display"

To Verify User should register an account with invalid Email Id LP1
    [Tags]    LP-1:Registration Functionallity
    Jenkins browser launch    ${url_1}
    #Local browser launch landingpage    ${url_1}    ${browser}
    Select child in landingpage
    ${display_reg}=    Run Keyword And Return Status    Element Should Be Visible    xpath=.//div[@id='accordion']
    Run Keyword If    'True'!='${display_reg}'    Fail    "When click 'CTA' button Registration section not display"
    Register data    test    test    logimohan@gmail    9874565432    logi    logi    sfgsgsdgsgsdgsds    sfgsgsdgsgsdgsds    sfgsgsdgsgsdgsds    600099

    Click Element    //input[@id='wvdatepicker']
    Select From List By Value    //select[@class='ui-datepicker-year']    1990
    Select From List By Value    //select[@class='ui-datepicker-month']    6
    Click Link    xpath=(//a[@href='#'])[30]
    Create a new Account
    ${Email}=    Run Keyword And Return Status    Element Should Be Visible    xpath=//div[@id='signUpEmailErr']
    Run Keyword If    'True'!='${Email}'    Fail    "Enter all the fields and enter invalid Email id then click Created button, but 'Please enter a valid Email' alert message not display"

To Verify User should register create a account with invalid phonenumber LP1
    [Tags]    LP-1:Registration Functionallity
    Jenkins browser launch    ${url_1}
    #Local browser launch landingpage    ${url_1}    ${browser}
    Select child in landingpage
    ${display_reg}=    Run Keyword And Return Status    Element Should Be Visible    xpath=.//div[@id='accordion']
    Run Keyword If    'True'!='${display_reg}'    Fail    "When click 'CTA' button Registration section not display"
    Register data    test    test    logimohan@gmail.com    98745    logi    logi    sfgsgsdgsgsdgsds    sfgsgsdgsgsdgsds    sfgsgsdgsgsdgsds    600099
    Click Element    //input[@id='wvdatepicker']
    Select From List By Value    //select[@class='ui-datepicker-year']    1990
    Select From List By Value    //select[@class='ui-datepicker-month']    6
    Click Link    xpath=(//a[@href='#'])[30]
    Create a new Account
    ${Ph}=    Run Keyword And Return Status    Element Should Be Visible    xpath=//div[@id='signInPhoneErr']
    Run Keyword If    'True'!='${Ph}'    Fail    "Enter all the fields and enter invalid mobile number then click Created button, but 'Please enter a valid 10 digit Phone number' alert message not display"

To Verify User should Register an account without DOB LP1
    [Tags]    LP-1:Registration Functionallity
    Jenkins browser launch    ${url_1}
    #Local browser launch landingpage    ${url_1}    ${browser}
    Select child in landingpage
    ${display_reg}=    Run Keyword And Return Status    Element Should Be Visible    xpath=.//div[@id='accordion']
    Run Keyword If    'True'!='${display_reg}'    Fail    "When click 'CTA' button Registration section not display"
    Register data    test    test    logimohan@gmail.com    9874565432    logi    logi    sfgsgsdgsgsdgsds    sfgsgsdgsgsdgsds    sfgsgsdgsgsdgsds    600099
    Create a new Account
    ${DOB}=    Run Keyword And Return Status    Element Should Be Visible    xpath=//div[@id='signUpDobErr']
    Run Keyword If    'True'!='${DOB}'    Fail    "Enter all the fields except select the DOB then click Created button, but 'Please enter the date of birth' alert message not display"

To Verify User should Register account without Selecting a country LP1
    [Tags]    LP-1:Registration Functionallity
    Jenkins browser launch    ${url_1}
    #Local browser launch landingpage    ${url_1}    ${browser}
    Select child in landingpage       
    ${display_reg}=    Run Keyword And Return Status    Element Should Be Visible    xpath=.//div[@id='accordion']
    Run Keyword If    'True'!='${display_reg}'    Fail    "When click 'CTA' button Registration section not display"
    Register data    test    test    lofdf@dfgdf.fdg    9874565432    logi    logi    kldfjgldjfgdfhgg    kldfjgldjfgdfhgg    kldfjgldjfgdfhgg    600123    
    City    kjkjf
    State    jhjhfg
    Select From List By Index    //select[@id='country']    0 
    Create a new Account
    ${Country}=    Run Keyword And Return Status    Element Should Be Visible    xpath=//div[@id='signUpCountryErr']
    Run Keyword If    'True'!='${Country}'    Fail    "Enter all the fields except select the country then click Created button, but 'Please select the country' alert message not display"

To Verify user should Register an account without entering Password LP1
    [Tags]    LP-1:Registration Functionallity
    Jenkins browser launch    ${url_1}
    #Local browser launch landingpage    ${url_1}    ${browser}
    Select child in landingpage
    ${display_reg}=    Run Keyword And Return Status    Element Should Be Visible    xpath=.//div[@id='accordion']
    Run Keyword If    'True'!='${display_reg}'    Fail    "When click 'CTA' button Registration section not display"
    FirstName    test
    LastName    test
    Email    lofdf@dfgdf.fdg
    Phone no    9865698656
    Address1    sdfgdfggdfjkkjgxf
    Address2    sdfgdfggdfjkkjgxf
    Address3    sdfgdfggdfjkkjgxf
    Postal code    600099
    Click Element    //input[@id='wvdatepicker']
    Select From List By Value    //select[@class='ui-datepicker-year']    1990
    Select From List By Value    //select[@class='ui-datepicker-month']    6
    Click Link    xpath=(//a[@href='#'])[30]
    Create a new Account
    ${CPassword}=    Run Keyword And Return Status    Element Should Be Visible    xpath=//div[@id='signUpPassErr']
    Run Keyword If    'True'!='${CPassword}'    Fail    "Enter all the fields except Confirm Password then click Created button, but 'Please enter the Confirm Password' alert message not display"
    Confirm Password    logi
    Create a new Account
    ${RCPassword}=    Run Keyword And Return Status    Element Should Be Visible    xpath=//div[@id='signUpConPassErr']
    Run Keyword If    'True'!='${RCPassword}'    Fail    "Enter all the fields except Re-Confirm Password then click Created button, but 'Please enter the Re-Confirm Password' alert message not display"
    
To Verify User should create an account without uploading Passport Copy LP1
    [Tags]    LP-1:Registration Functionality
    Jenkins browser launch    ${url}
    #Local browser launch landingpage    ${url_1}    ${browser}
    Select child in landingpage
    ${display_reg}=    Run Keyword And Return Status    Element Should Be Visible    xpath=.//div[@id='accordion']
    Run Keyword If    'True'!='${display_reg}'    Fail    "When click 'CTA' button Registration section not display"
    Register datast    test    test    test@gmail.com    9875676543    logi    logi    ikjuytesfdwrf    ikjuytesfdwrf    ikjuytesfdwrf    600099
    Click Element    //input[@id='wvdatepicker']
    Select From List By Value    //select[@class='ui-datepicker-year']    1990
    Select From List By Value    //select[@class='ui-datepicker-month']    6
    Click Link    xpath=(//a[@href='#'])[30]
    Other Passport Holder
    Create new Account
    ${Passport Holder}=    Run Keyword And Return Status    Element Should Be Visible    xpath=//div[@id='signUpUploadErr']
    Run Keyword If    'True'!='${Passport Holder}'    Fail    "Without Upload passport copy then click Created button, 'Please upload passport' alert message not display"
    Create new Account
    
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
    Sleep    15s
    ${chck_alert}=    Run Keyword And Return Status    Element Should Be Visible    id=signInPassErr
    Run Keyword If    'True'!='${chck_alert}'    Fail    "Enter invalid credentials, alert not display"
    
To Verify user should login as Website Registered User LP2
    [Tags]    LP-2:Login Functionallity
    Jenkins browser launch    ${url_2}
    #Local browser launch landingpage    ${url_2}    ${browser}
    Select child in landingpage 2
    Landingpage2 singin    Fin.felix@gmail.com    mega@123
    ${chck_payment_page}=    Run Keyword And Return Status    Element Should Be Visible    id=block-paymentmode
    Run Keyword If    'True'!='${chck_payment_page}'    Fail    "User login with valid credentials but payment gateway page not display"

To Verify User should reset the password with Unrecognized Username LP2
    [Tags]    LP-2:Login Functionallity
    Jenkins browser launch    ${url_2}
    #Local browser launch landingpage    ${url_2}    ${browser}
    Select child in landingpage 2
    Forgot password
    password reset with Unrecognized data    dummy
    password reset Unrecognized data alert    UnrecognizedUsername
	
To Verify User should reset the password with Unrecognized email ID LP2
    [Tags]    LP-2:Login Functionallity
    Jenkins browser launch    ${url_2}
    #Local browser launch landingpage    ${url_2}    ${browser}
    Select child in landingpage 2
    Forgot password
    password reset with Unrecognized data    fgfdgddf@dfg.fddsf
    password reset Unrecognized data alert    Unrecognized email ID
    
To Verify user should reset the password without Entering Email and Username LP2
    [Tags]    LP-2:Login Functionallity
    Jenkins browser launch    ${url_2}
    #Local browser launch landingpage    ${url_2}    ${browser}
    Select child in landingpage 2
    Forgot password
    Click Element    id=edit-submit
    password reset Unrecognized data alert    without Entering Email and Username
    
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
    
    
To Verify State and City get autofill after update pincode LP2
    [Tags]    LP-2:Registration Functionallity
    Jenkins browser launch    ${url_2}
    #Local browser launch landingpage    ${url_2}    ${browser}
    Select child in landingpage 2
    Sleep    10s    
    ${display_reg}=    Run Keyword And Return Status    Element Should Be Visible    xpath=.//div[@id='accordion']
    Run Keyword If    'True'!='${display_reg}'    Fail    "When click 'Donate Now' button Registration section not display"
    Register data    test    test1    logisdfsd@sgsd.dsf    9856783421    logi    logi    sdfgdfggdfjkkjgxf    sdfgdfggdfjkkjgxf    sdfgdfggdfjkkjgxf    600099
    
    ${get_city_val}=    Get Element Attribute    name=city    value
    Run Keyword If    '${city}'!='${get_city_val}'    Fail    "Enter valid pincode but City not auto filled"
    ${get_state_val}=    Get Element Attribute    name=state    value
    Run Keyword If    '${state}'!='${get_state_val}'    Fail    "Enter valid pincode but State not auto filled"
    Edit Pincode auto populate    Chennai    Tamil Nadu

To Verify User should Create a account with existing registered mail LP2
    [Tags]    LP-2:Registration Functionallity
    Jenkins browser launch    ${url_2}
    #Local browser launch landingpage    ${url_2}    ${browser}
    Select child in landingpage 2
    Sleep    5s    
    ${display_reg}=    Run Keyword And Return Status    Element Should Be Visible    xpath=.//div[@id='accordion']
    Run Keyword If    'True'!='${display_reg}'    Fail    "When click 'Donate Now' button Registration section not display"
    Register data    test    test    logimohan@gmail.com    8975643423    logi    logi    sdfgdfggdfjkkjgxf    sdfgdfggdfjkkjgxf    sdfgdfggdfjkkjgxf    600099
    Select From List By Label    name=aboutwv    Online Ads
    Click Element    //input[@id='wvdatepicker']
    Select From List By Value    //select[@class='ui-datepicker-year']    1990
    Select From List By Value    //select[@class='ui-datepicker-month']    6
    Click Link    xpath=(//a[@href='#'])[30]
    Create a new Account
    Sleep    4s
    ${Email}=    Run Keyword And Return Status    Element Should Be Visible    xpath=//div[@class='swal-text']
    Run Keyword If    'True'!='${Email}'    Fail    "Enter all the fields and Enter registered email then click Created button, but 'The Mobile Number or Username already taken', alert message not display"

To Verify User should register an account with invalid Email Id LP2
    [Tags]    LP-2:Registration Functionallity
    Jenkins browser launch    ${url_2}
    #Local browser launch landingpage    ${url_2}    ${browser}
    Select child in landingpage 2
    Wait Until Element Is Visible    xpath=//div[@id='accordion']    30s
    ${display_reg}=    Run Keyword And Return Status    Element Should Be Visible    xpath=.//div[@id='accordion']
    Run Keyword If    'True'!='${display_reg}'    Fail    "When click 'Donate Now' button Registration section not display"
    Register data    test    test    logimohan@gmail    9856783421    logi    logi    sdfgdfggdfjkkjgxf    sdfgdfggdfjkkjgxf    sdfgdfggdfjkkjgxf    600099
    
    Click Element    //input[@id='wvdatepicker']
    Select From List By Value    //select[@class='ui-datepicker-year']    1990
    Select From List By Value    //select[@class='ui-datepicker-month']    6
    Click Link    xpath=(//a[@href='#'])[30]
    Create a new Account
    ${Email}=    Run Keyword And Return Status    Element Should Be Visible    xpath=//div[@id='signUpEmailErr']
    Run Keyword If    'True'!='${Email}'    Fail    "Enter all the fields and enter invalid Email id then click Created button, but 'Please enter a valid Email' alert message not display"

To Verify User should register create a account with invalid phonenumber LP2
    [Tags]    LP-2:Registration Functionallity
    Jenkins browser launch    ${url_2}
    #Local browser launch landingpage    ${url_2}    ${browser}
    Select child in landingpage 2
    ${display_reg}=    Run Keyword And Return Status    Element Should Be Visible    xpath=.//div[@id='accordion']
    Run Keyword If    'True'!='${display_reg}'    Fail    "When click 'Donate Now' button Registration section not display"
    Register data    test    test1    logimohan@gmail.com    98567    logi    logi    sdfgdfggdfjkkjgxf    sdfgdfggdfjkkjgxf    sdfgdfggdfjkkjgxf    600099
    
    Click Element    //input[@id='wvdatepicker']
    Select From List By Value    //select[@class='ui-datepicker-year']    1990
    Select From List By Value    //select[@class='ui-datepicker-month']    6
    Click Link    xpath=(//a[@href='#'])[30]
    Create a new Account
    ${Ph}=    Run Keyword And Return Status    Element Should Be Visible    xpath=//div[@id='signInPhoneErr']
    Run Keyword If    'True'!='${Ph}'    Fail    "Enter all the fields and enter invalid mobile number then click Created button, but 'Please enter a valid 10 digit Phone number' alert message not display"

To Verify User should Register an account without DOB LP2
    [Tags]    LP-2:Registration Functionallity
    Jenkins browser launch    ${url_2}
    #Local browser launch landingpage    ${url_2}    ${browser}
    Select child in landingpage 2
    ${display_reg}=    Run Keyword And Return Status    Element Should Be Visible    xpath=.//div[@id='accordion']
    Run Keyword If    'True'!='${display_reg}'    Fail    "When click 'Donate Now' button Registration section not display"
    Register data    test    test1    logimohan@gmail.com    9856783421    logi    logi    sdfgdfggdfjkkjgxf    sdfgdfggdfjkkjgxf    sdfgdfggdfjkkjgxf    600099
    
    Create a new Account
    ${DOB}=    Run Keyword And Return Status    Element Should Be Visible    xpath=//div[@id='signUpDobErr']
    Run Keyword If    'True'!='${DOB}'    Fail    "Enter all the fields except select the DOB then click Created button, but 'Please enter the date of birth' alert message not display"

To Verify User should Register account without Selecting a country LP2
    [Tags]    LP-2:Registration Functionallity
    Jenkins browser launch    ${url_2}
    #Local browser launch landingpage    ${url_2}    ${browser}
    Select child in landingpage 2
    ${display_reg}=    Run Keyword And Return Status    Element Should Be Visible    xpath=.//div[@id='accordion']
    Run Keyword If    'True'!='${display_reg}'    Fail    "When click 'Donate Now' button Registration section not display"
    Register data    test    test    logimohan@gmail.com    9856783421    logi    logi    sdfgdfggdfjkkjgxf    sdfgdfggdfjkkjgxf    sdfgdfggdfjkkjgxf    600123    
    City    kifdwe
    State    kifddf
    Select From List By Index    //select[@id='country']    0
    Create a new Account
    ${Country}=    Run Keyword And Return Status    Element Should Be Visible    xpath=//div[@id='signUpCountryErr']
    Run Keyword If    'True'!='${Country}'    Fail    "Enter all the fields except select the country then click Created button, but 'Please select the country' alert message not display"

To Verify user should Register an account without entering Password LP2
    [Tags]    LP-2:Registration Functionallity
    #Jenkins browser launch    ${url_2}
    Local browser launch landingpage    ${url_2}    ${browser}
    Select child in landingpage 2
    ${display_reg}=    Run Keyword And Return Status    Element Should Be Visible    xpath=.//div[@id='accordion']
    Run Keyword If    'True'!='${display_reg}'    Fail    "When click 'Donate Now' button Registration section not display"
    FirstName    logi
    LastName    mohan
    Email    logidsfsd@fsdf.dre
    Phone no    8975643423
    Address1    kxvfiytrefghuhj
    Address2    kxvfiytrefghuhj
    Address3    kxvfiytrefghuhj
    Postal code    600099
    Click Element    //input[@id='wvdatepicker']
    Select From List By Value    //select[@class='ui-datepicker-year']    1990
    Select From List By Value    //select[@class='ui-datepicker-month']    6
    Click Link    xpath=(//a[@href='#'])[30]
    Create a new Account
    ${CPassword}=    Run Keyword And Return Status    Element Should Be Visible    xpath=//div[@id='signUpPassErr']
    Run Keyword If    'True'!='${CPassword}'    Fail    "Enter all the fields except Confirm Password then click Created button, but 'Please enter the Confirm Password' alert message not display"
    Confirm Password    test
    Create a new Account
    ${RCPassword}=    Run Keyword And Return Status    Element Should Be Visible    xpath=//div[@id='signUpConPassErr']
    Run Keyword If    'True'!='${RCPassword}'    Fail    "Enter all the fields except Re-Confirm Password then click Created button, but 'Please enter the Re-Confirm Password' alert message not display"

To Verify User should create an account without uploading Passport Copy LP2
    [Tags]    LP-2:Registration Functionallity
    Jenkins browser launch    ${url_2}
    #Local browser launch landingpage    https://uat.worldvision.in/landingPages/child/index-2.html    ${browser}
    Select child in landingpage 2
    ${display_reg}=    Run Keyword And Return Status    Element Should Be Visible    xpath=.//div[@id='accordion']
    Run Keyword If    'True'!='${display_reg}'    Fail    "When click 'Donate Now' button Registration section not display"
    Register data    test    test    logimohvcx@gmail.com    9856765768    logi    logi    sdfgdfggdfjkkjgxf    sdfgdfggdfjkkjgxf    sdfgdfggdfjkkjgxf    600099   
    Click Element    //input[@id='wvdatepicker']
    Select From List By Value    //select[@class='ui-datepicker-year']    1990
    Select From List By Value    //select[@class='ui-datepicker-month']    6
    Click Link    xpath=(//a[@href='#'])[30]
    Click Element    //input[@id='otherNation']
    Create a new Account
    ${Other Passport Holder}=    Run Keyword And Return Status    Element Should Be Visible    xpath=//div[@id='signUpUploadErr']
    Run Keyword If    'True'!='${Other Passport Holder}'    Fail    "Enter all the fields select other passport in nationality then click Created button without upload passport copy, but 'please upload passport' error msg not display"

To Verify user should Register an account without Address LP2
    [Tags]    LP-2:Registration Functionallity
    Jenkins browser launch    https://uat.worldvision.in/landingPages/child/index-2.html
    #Local browser launch landingpage    https://uat.worldvision.in/landingPages/child/index-2.html    ${browser}
    Select child in landingpage 2
    ${display_reg}=    Run Keyword And Return Status    Element Should Be Visible    xpath=.//div[@id='accordion']
    Run Keyword If    'True'!='${display_reg}'    Fail    "When click 'Donate Now' button Registration section not display"
    FirstName    test
    LastName    test
    Email    logimjsdd@fsdd.das
    Phone no    9874565432
    Confirm Password    logi
    Re-Confirm Password    logi
    Postal code    600099
    Click Element    //input[@id='wvdatepicker']
    Select From List By Value    //select[@class='ui-datepicker-year']    1990
    Select From List By Value    //select[@class='ui-datepicker-month']    6
    Click Link    xpath=(//a[@href='#'])[30]
    Create a new Account
    ${Address-1}=    Run Keyword And Return Status    Element Should Be Visible    xpath=//div[@id='signUpaddrErr']
    Run Keyword If    'True'!='${Address-1}'    Fail    "Enter all the fields except Address 1 then click Created button, but 'Please enter the Address 1' error message not display"
    Address1    ldfofsdfmsdndsurosdj
    Create a new Account
    ${Address-2}=    Run Keyword And Return Status    Element Should Be Visible    xpath=//div[@id='signUpaddrErr1']
    Run Keyword If    'True'!='${Address-2}'    Fail    "Enter all the fields except Address 2 then click Created button, but 'Please enter the Address 2' error message not display"
    Address2    ldfofsdfmsdndsurosdj
    Create a new Account
    ${Address-3}=    Run Keyword And Return Status    Element Should Be Visible    xpath=//div[@id='signUpaddrErr2']
    Run Keyword If    'True'!='${Address-3}'    Fail    "Enter all the fields except Address 3 then click Created button, but 'Please enter the Address 3' error message not display"

To Verify User should register account without Data LP2
    [Tags]    LP-2:Registration Functionallity
    Jenkins browser launch    ${url_2}
    #Local browser launch landingpage    ${url_2}    ${browser}
    Select child in landingpage 2
    ${display_reg}=    Run Keyword And Return Status    Element Should Be Visible    xpath=.//div[@id='accordion']
    Run Keyword If    'True'!='${display_reg}'    Fail    "When click 'Donate Now' button Registration section not display"
    # Check Alert should display in all fields
    # Click create a new Account
    Create a new Account
    # Required Message: Please enter your First name
    ${Fname}=    Run Keyword And Return Status    Element Should Be Visible    xpath=//div[@id='signUpfnameErr']
    Run Keyword If    'True'!='${Fname}'    Fail    "Without entering First Name after the click Create New Account, ' FirstName' error message not display"
    # Enter the FirstName
    Input Text    (//input[@class='form-control alphabet_valid'])[1]    Test
    # Click create a new Account
    Create a new Account
    # Required Message: Please enter your Last name
    ${Lname}=    Run Keyword And Return Status    Element Should Be Visible    xpath=//div[@id='signUplnameErr']
    Run Keyword If    'True'!='${Lname}'    Fail    "Enter the First Name after the click Create New Account, 'LastName' error message not display"
    # Enter the LastName
    Input Text    (//input[@class='form-control alphabet_valid'])[2]    testt
    Create a new Account
    # Required Message: Please enter your Email
    ${Email}=    Run Keyword And Return Status    Element Should Be Visible    xpath=//div[@id='signUpEmailErr']
    Run Keyword If    'True'!='${Email}'    Fail    "Enter the Last Name after the click Create New Account, 'Email address' error message not display"
    # Enter the Email ID
    Input Text    (//input[@type='email'])[2]    test@gmail.com
    Create a new Account
    # Required Message: Please enter your Phone number
    ${Ph}=    Run Keyword And Return Status    Element Should Be Visible    xpath=//div[@id='signUpEmailErr']
    Run Keyword If    'True'!='${Ph}'    Fail    "Enter the Email after the click Create New Account, 'Phone number' error message not display"
    # Enter the Phone number
    Input Text    (//input[@class='form-control'])[7]    9940613589
    Create a new Account
    # Required Message: Please enter the Confirm Password
    ${CPassword}=    Run Keyword And Return Status    Element Should Be Visible    xpath=//div[@id='signUpPassErr']
    Run Keyword If    'True'!='${CPassword}'    Fail    "Enter the Phone Number after the click Create New Account, 'Confirm Password' error message not display"
    # Enter the Confirm Password
    Input Text    (//input[@type='password'])[1]    asdf
    # Click create a new Account
    Create a new Account
    # Required Message: Please enter the Re-Confirm Password
    ${RCPassword}=    Run Keyword And Return Status    Element Should Be Visible    xpath=//div[@id='signUpConPassErr']
    Run Keyword If    'True'!='${RCPassword}'    Fail    "Enter the Confirm Password after the click Create New Account, 'Re-Confirm Password' error message not display"
    # Enter the Re-Confirm Password
    Input Text    (//input[@type='password'])[2]    asdf
    # Click create a new Account
    Create a new Account
    # Required Message: Please enter the Address 1
    ${Address-1}=    Run Keyword And Return Status    Element Should Be Visible    xpath=//div[@id='signUpaddrErr']
    Run Keyword If    'True'!='${Address-1}'    Fail    "Enter the Re-Confirm Password after the click Create New Account, 'Address 1' error message not display"
    # Enter the Address 1
    Input Text    (//input[@class='form-control'])[9]    Address1
    # Click create a new Account
    Create a new Account
    # Required Message: Please enter the Address 2
    ${Address-2}=    Run Keyword And Return Status    Element Should Be Visible    xpath=//div[@id='signUpaddrErr1']
    Run Keyword If    'True'!='${Address-2}'    Fail    "Enter the Address 1 after the click Create New Account, 'Address 2' error message not display"
    # Enter the Address 2
    Input Text    (//input[@class='form-control'])[10]    Address2
    # Click create a new Account
    Create a new Account
    # Required Message: Please enter the Postalcode
    ${Postalcode}=    Run Keyword And Return Status    Element Should Be Visible    xpath=//div[@id='signUpPscodeErr']
    Run Keyword If    'True'!='${Postalcode}'    Fail    "Enter the Address 2 after the click Create New Account, 'Postalcode' error message not display"
    # Enter the Postalcode
    Input Text    (//input[@class='form-control'])[11]    656545
    # Click create a new Account
    Create a new Account
    # Required Message: Please enter the City
    ${City}=    Run Keyword And Return Status    Element Should Be Visible    xpath=//div[@id='signUpCityErr']
    Run Keyword If    'True'!='${City}'    Fail    "Enter the Postalcode after the click Create New Account, 'City' error message not display"
    # Enter the City
    Input Text    (//input[@class='form-control'])[12]    assdg
    # Click create a new Account
    Create a new Account
    # Required Message: Please enter the State
    ${state}=    Run Keyword And Return Status    Element Should Be Visible    xpath=//div[@id='signUpStateErr']
    Run Keyword If    'True'!='${state}'    Fail    "Enter the City after the click Create New Account, 'State' error message not display"
    # Enter the State
    Input Text    (//input[@class='form-control'])[13]    asdfg
    # Click create a new Account
    Create a new Account
    # Required Message: Please enter the Country
    ${Country}=    Run Keyword And Return Status    Element Should Be Visible    xpath=//div[@id='signUpCountryErr']
    Run Keyword If    'True'!='${Country}'    Fail    "Enter the State after the click Create New Account, 'Country' error message not display"
    # Clear the postal Code
    Clear Element Text    (//input[@class='form-control'])[11]
    # Enter the Postal code
    Input Text    (//input[@class='form-control'])[11]    600095
    # Click create a new Account
    Click Element    //a[@class='btn btn-default wv-signUp']
    # Required Message: Please enter the date of birth
    ${DOB}=    Run Keyword And Return Status    Element Should Be Visible    xpath=//div[@id='signUpDobErr']
    Run Keyword If    'True'!='${DOB}'    Fail    "Enter the Postalcode after the click Create New Account, 'DOB' error message not display"
    # Select the Date of birth
    Click Element    //input[@id='wvdatepicker']
    Select From List By Value    //select[@class="ui-datepicker-year"]    1990
    Select From List By Value    //select[@class="ui-datepicker-month"]    6
    Click Link    xpath=(//a[@href="#"])[30]
    # Click create a new Account
    Create a new Account
    
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
    Jenkins browser launch    https://prod.worldvision.in/landingPages/child/index-3.html
    #Local browser launch landingpage    https://prod.worldvision.in/landingPages/child/index-3.html    ${browser}
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
    Jenkins browser launch    ${url_3}
    #Local browser launch landingpage    ${url_3}    ${browser}
    # Click Donate amount in    800 Monthly
    Click Element    //div[@class='round']//label
    # Select Allow auto debit check box
    Click Element    //label[@for='allowAutoDebit']
    # Click PROCEED TO AUTO DEBIT button
    Click Element    //a[@class='btn btn-primary proceedtosi']
    # Check Alert should display in all fields
    # Click create a new Account        
    Create a new Account
    # Required Message: Please enter your First name
    ${Fname}=    Run Keyword And Return Status    Element Should Be Visible    xpath=//div[@id='signUpfnameErr']
    
    Run Keyword If    'True'!='${Fname}'    Fail    "Without entering First Name after the click Create New Account, ' FirstName' error message not display"
    # Enter the FirstName
    Input Text    (//input[@class='form-control alphabet_valid'])[1]    Test
    # Click create a new Account
    Create a new Account
    # Required Message: Please enter your Last name
    ${Lname}=    Run Keyword And Return Status    Element Should Be Visible    xpath=//div[@id='signUplnameErr']
    
    Run Keyword If    'True'!='${Lname}'    Fail    "Enter the First Name after the click Create New Account, 'LastName' error message not display"
    # Enter the LastName
    Input Text    (//input[@class='form-control alphabet_valid'])[2]    testt
    # Click create a new Account
    Create a new Account
    # Required Message: Please enter your Email
    ${Email}=    Run Keyword And Return Status    Element Should Be Visible    xpath=//div[@id='signUpEmailErr']
    
    Run Keyword If    'True'!='${Email}'    Fail    "Enter the Last Name after the click Create New Account, 'Email address' error message not display"
    # Enter the Email ID
    Input Text    (//input[@type='email'])[2]    test@gmail.com
    # Click create a new Account
    Create a new Account
    # Required Message: Please enter your Phone number
    ${Ph}=    Run Keyword And Return Status    Element Should Be Visible    xpath=//div[@id='signUpEmailErr']
    
    Run Keyword If    'True'!='${Ph}'    Fail    "Enter the Email after the click Create New Account, 'Phone number' error message not display"
    # Enter the Phone number
    Input Text    (//input[@class='form-control'])[7]    9940613589
    # Click create a new Account
    Create a new Account
    # Required Message: Please enter the Confirm Password
    ${CPassword}=    Run Keyword And Return Status    Element Should Be Visible    xpath=//div[@id='signUpPassErr']
    
    Run Keyword If    'True'!='${CPassword}'    Fail    "Enter the Phone Number after the click Create New Account, 'Confirm Password' error message not display"
    # Enter the Confirm Password
    Input Text    (//input[@type='password'])[1]    asdf
    # Click create a new Account
    Create a new Account
    # Required Message: Please enter the Re-Confirm Password
    ${RCPassword}=    Run Keyword And Return Status    Element Should Be Visible    xpath=//div[@id='signUpConPassErr']
    
    Run Keyword If    'True'!='${RCPassword}'    Fail    "Enter the Confirm Password after the click Create New Account, 'Re-Confirm Password' error message not display"
    # Enter the Re-Confirm Password
    Input Text    (//input[@type='password'])[2]    asdf
    # Click create a new Account
    Create a new Account
    # Required Message: Please enter the Address 1
    ${Address-1}=    Run Keyword And Return Status    Element Should Be Visible    xpath=//div[@id='signUpaddrErr']
    
    Run Keyword If    'True'!='${Address-1}'    Fail    "Enter the Re-Confirm Password after the click Create New Account, 'Address 1' error message not display"
    # Enter the Address 1
    Input Text    (//input[@class='form-control'])[9]    Address1
    # Click create a new Account
    Create a new Account
    # Required Message: Please enter the Address 2
    ${Address-2}=    Run Keyword And Return Status    Element Should Be Visible    xpath=//div[@id='signUpaddrErr1']
    
    Run Keyword If    'True'!='${Address-2}'    Fail    "Enter the Address 1 after the click Create New Account, 'Address 2' error message not display"
    # Enter the Address 2
    Input Text    (//input[@class='form-control'])[10]    Address2
    # Click create a new Account
    Create a new Account
    
    ${Address-2}=    Run Keyword And Return Status    Element Should Be Visible    xpath=//div[@id='signUpaddrErr1']
    
    Run Keyword If    'True'!='${Address-2}'    Fail    "Enter the Address 1 after the click Create New Account, 'Address 2' error message not display"
    # Enter the Address 2
    Input Text    (//input[@class='form-control'])[11]    address3
    # Click create a new Account
    Create a new Account

    # Required Message: Please enter the Postalcode
    ${Postalcode}=    Run Keyword And Return Status    Element Should Be Visible    xpath=//div[@id='signUpPscodeErr']
    
    Run Keyword If    'True'!='${Postalcode}'    Fail    "Enter the Address 2 after the click Create New Account, 'Postalcode' error message not display"
    # Enter the Postalcode
    Input Text    (//input[@class='form-control'])[12]    656545
    # Click create a new Account
    Create a new Account
    # Required Message: Please enter the City
    ${City}=    Run Keyword And Return Status    Element Should Be Visible    xpath=//div[@id='signUpCityErr']
    
    Run Keyword If    'True'!='${City}'    Fail    "Enter the Postalcode after the click Create New Account, 'City' error message not display"
    # Enter the City
    Input Text    (//input[@class='form-control'])[13]    assdg
    # Click create a new Account
    Create a new Account
    # Required Message: Please enter the State
    ${state}=    Run Keyword And Return Status    Element Should Be Visible    xpath=//div[@id='signUpStateErr']
    
    Run Keyword If    'True'!='${state}'    Fail    "Enter the City after the click Create New Account, 'State' error message not display"
    # Enter the State
    Input Text    (//input[@class='form-control'])[14]    asdfg
    # Click create a new Account
    Create a new Account
    # Required Message: Please enter the Country
    ${Country}=    Run Keyword And Return Status    Element Should Be Visible    xpath=//div[@id='signUpCountryErr']
    
    Run Keyword If    'True'!='${Country}'    Fail    "Enter the State after the click Create New Account, 'Country' error message not display"
    # Clear the postal Code
    Clear Element Text    (//input[@class='form-control'])[12]
    # Enter the Postal code
    Input Text    (//input[@class='form-control'])[12]    600095
    Sleep    3s
    # Click create a new Account
    Create a new Account
    
    # Required Message: Please enter the date of birth
    ${DOB}=    Run Keyword And Return Status    Element Should Be Visible    xpath=//div[@id='signUpDobErr']
    
    Run Keyword If    'True'!='${DOB}'    Fail    "Enter the Postalcode after the click Create New Account, 'DOB' error message not display"
    # Select the Date of birth
    Click Element    //input[@id='wvdatepicker']
    Select From List By Value    //select[@class="ui-datepicker-year"]    1990
    Select From List By Value    //select[@class="ui-datepicker-month"]    6
    Click Link    xpath=(//a[@href="#"])[30]
    # Click create a new Account
    Create a new Account


To Verify User should login with Valid Credentials LP3
    [Tags]    LP-3:Login Functionallity   
    Jenkins browser launch    ${url_3}    
    ${get_sel_child_val}=    Select child in landingpage 3
    ${total_val}=    Get Text    xpath=.//span[@id='total']/b
    ${total_val}=    Price convertion    ${total_val}
    Run Keyword If    '${total_val}'!='${get_sel_child_val}'    Fail    "Total display amount and selected child amount are not equal"
    Wait Until Element Is Visible    xpath=//div[@class='donatenowbtn']/a[contains(.,'DONATE NOW')]    30s
    Click Element    xpath=//div[@class='donatenowbtn']/a[contains(.,'DONATE NOW')]
    Landing1 singin    logimohan@gmail.com    logi
    ${login_success}=    Run Keyword And Return Status    Element Should Be Visible    id=block-checkoutpaymentprogress
    Run Keyword If    'True'!='${login_success}'    Fail    "Enter valid credentials but not get into login success"    

    
To Verify User should login with Invalid credentials LP3
    [Tags]    LP-3:Login Functionallity
    
    Jenkins browser launch    ${url_3}
    #Local browser launch landingpage    ${url_3}    ${browser}
    ${get_sel_child_val}=    Select child in landingpage 3
    ${total_val}=    Get Text    xpath=.//span[@id='total']/b
    ${total_val}    Convert to price    ${total_val}
    Run Keyword If    '${total_val}'!='${get_sel_child_val}'    Fail    "Total display amount and selected child amount are not equal"
    Click Element    xpath=.//div[@class='donatenowbtn']/a[contains(.,'PROCEED TO AUTO DEBIT')]
    Landing1 singin    jfvfdjf@gds.asdas    123456
    ${chck_alert}=    Run Keyword And Return Status    Element Should Be Visible    id=signInPassErr
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
    ${total_val}    Get Text    xpath=.//span[@id='total']/b
    ${actual_total_val}    Remove symbol    ${total_val}    ,    
    Log To Console    Total amount: ${actual_total_val} 
    Run Keyword If    '${actual_total_val}'!='${get_sel_child_val}'    Fail    "Total display amount and selected child amount are not equal"
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
    ${actual_total_val}    Remove symbol    ${total_val}    ,   
    Run Keyword If    '${actual_total_val}'!='${get_sel_child_val}'    Fail    "Total display amount and selected child amount are not equal"
    Click Element    xpath=.//div[@class='donatenowbtn']/a[contains(.,'DONATE NOW')]
    Sleep    4s
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
    Register data    test    testlf    losdf@fsdf.das    9867654543    logi    logi    lokhjgujmnhjfgre    lokhjgujmnhjfgre    lokhjgujmnhjfgre    600099
    
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
    FirstName    test
    LastName    testtest
    Email    lgfdgsdf@fdsfd.dsds
    Phone no    8764565432
    Confirm Password    logi
    Re-Confirm Password    logi
    Postal code    600099   
    Click Element    //input[@id='wvdatepicker']    
    Select From List By Value    //select[@class='ui-datepicker-year']    1990
    Select From List By Value    //select[@class='ui-datepicker-month']    6
    Click Link    xpath=(//a[@href='#'])[30]
             
    Create a new Account   
   
    ${Address-1}=    Run Keyword And Return Status    Element Should Be Visible    xpath=//div[@id='signUpaddrErr']
    
    Run Keyword If    'True'!='${Address-1}'    Fail    "Enter all the fields except Address 1 then click Created button, but 'Please enter the Address 1' error message not display" 

    Address1    dfsdfsdfdsdfdert
    Create a new Account   
  
    ${Address-2}=    Run Keyword And Return Status    Element Should Be Visible    xpath=//div[@id='signUpaddrErr1']
    
    Run Keyword If    'True'!='${Address-2}'    Fail    "Enter all the fields except Address 2 then click Created button, but 'Please enter the Address 2' error message not display" 
     
    Address2    dfsdfsdfdsdfdert
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
    FirstName    test
    LastName    test
    Email    ljikjsdf@grt.free
    Phone no    9856754322
    Address1    dfkooleresdd
    Address2    dfkooleresdd
    Address3    dfkooleresdd
    Postal code    600099   Click Element    //input[@id='wvdatepicker']    
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

To Verify User should Register account without Selecting a country LP3
    [Tags]    LP-3:Registration Functionallity
    Jenkins browser launch    ${url_3}
    #Local browser launch landingpage    ${url_3}    ${browser}
    ${get_sel_child_val}=    Select child in landingpage 3
    ${total_val}=    Get Text    xpath=.//span[@id='total']/b
    Run Keyword If    '₹${total_val}'!='${get_sel_child_val}'    Fail    "Total display amount and selected child amount are not equal"
    Click Element    xpath=.//div[@class='donatenowbtn']/a[contains(.,'DONATE NOW')]
    ${display_reg}=    Run Keyword And Return Status    Element Should Be Visible    xpath=.//div[@id='accordion']
    Run Keyword If    'True'!='${display_reg}'    Fail    "When click 'Donate Now' button Registration section not display"
    Register data    test    test    kjjg@fttr.fde    9875654321    logi    logi    kijyhhgtefdb    kijyhhgtefdb    kijyhhgtefdb    6098
    City    kiuyt
    State    kiuyt
    Create a new Account
    ${Country}=    Run Keyword And Return Status    Element Should Be Visible    xpath=//div[@id='signUpCountryErr']
    Run Keyword If    'True'!='${Country}'    Fail    "Enter all the fields except select the country then click Created button, but 'Please select the country' alert message not display"

To Verify User should Register an account without DOB LP3
    [Tags]    LP-3:Registration Functionallity
    Jenkins browser launch    ${url_3}
    #Local browser launch landingpage    ${url_3}    ${browser}
    ${get_sel_child_val}=    Select child in landingpage 3
    ${total_val}=    Get Text    xpath=.//span[@id='total']/b
    Run Keyword If    '₹${total_val}'!='${get_sel_child_val}'    Fail    "Total display amount and selected child amount are not equal"
    Click Element    xpath=.//div[@class='donatenowbtn']/a[contains(.,'DONATE NOW')]
    ${display_reg}=    Run Keyword And Return Status    Element Should Be Visible    xpath=.//div[@id='accordion']
    Run Keyword If    'True'!='${display_reg}'    Fail    "When click 'Donate Now' button Registration section not display"
    Register data    test    test    teste@gtyh.trre    9867654543    logi    logi    kiuhjuurmsdmdfsde    kiuhjuurmsdmegf    kiuhjuurmsdmegf    600099
    
    Create a new Account
    ${DOB}=    Run Keyword And Return Status    Element Should Be Visible    xpath=//div[@id='signUpDobErr']
    Run Keyword If    'True'!='${DOB}'    Fail    "Enter all the fields except select the DOB then click Created button, but 'Please enter the date of birth' alert message not display"

To Verify User should register create a account with invalid phonenumber LP3
    [Tags]    LP-3:Registration Functionallity
    Jenkins browser launch    ${url_3}
    #Local browser launch landingpage    ${url_3}    ${browser}
    ${get_sel_child_val}=    Select child in landingpage 3
    ${total_val}=    Get Text    xpath=.//span[@id='total']/b
    Run Keyword If    '₹${total_val}'!='${get_sel_child_val}'    Fail    "Total display amount and selected child amount are not equal"
    Click Element    xpath=.//div[@class='donatenowbtn']/a[contains(.,'DONATE NOW')]
    ${display_reg}=    Run Keyword And Return Status    Element Should Be Visible    xpath=.//div[@id='accordion']
    Run Keyword If    'True'!='${display_reg}'    Fail    "When click 'Donate Now' button Registration section not display"
    Register data    test    test    lhytr@gthj.fre    87656    logi    logi    lojdufjgfngf    lojdufjgfngffdg    lojdufjgfngfsd    600099
    
    Click Element    //input[@id='wvdatepicker']
    Select From List By Value    //select[@class='ui-datepicker-year']    1990
    Select From List By Value    //select[@class='ui-datepicker-month']    6
    Click Link    xpath=(//a[@href='#'])[30]
    Create a new Account
    ${Ph}=    Run Keyword And Return Status    Element Should Be Visible    xpath=//div[@id='signInPhoneErr']
    Run Keyword If    'True'!='${Ph}'    Fail    "Enter all the fields and enter invalid mobile number then click Created button, but 'Please enter a valid 10 digit Phone number' alert message not display"

To Verify User should register an account with invalid Email Id LP3
    [Tags]    LP-3:Registration Functionallity
    Jenkins browser launch    ${url_3}
    #Local browser launch landingpage    ${url_3}    ${browser}
    ${get_sel_child_val}=    Select child in landingpage 3
    ${total_val}=    Get Text    xpath=.//span[@id='total']/b
    ${final_val}    Remove symbol    ${total_val}    ,
    Log To Console    Total Val:${final_val}    
    Run Keyword If    '${final_val}'!='${get_sel_child_val}'    Fail    "Total display amount and selected child amount are not equal"
    Click Element    xpath=.//div[@class='donatenowbtn']/a[contains(.,'DONATE NOW')]
    Sleep    4s    
    ${display_reg}=    Run Keyword And Return Status    Element Should Be Visible    xpath=.//div[@id='accordion']
    Run Keyword If    'True'!='${display_reg}'    Fail    "When click 'Donate Now' button Registration section not display"
    Register data    test    test    lhytr@gthj    8765676987    logi    logi    lojdufjgfngf    lojdufjgfngffdg    lojdufjgfngfsd    600099
    Select From List By Label    name=aboutwv    Online Ads        
    Click Element    //input[@id='wvdatepicker']
    Select From List By Value    //select[@class='ui-datepicker-year']    1990
    Select From List By Value    //select[@class='ui-datepicker-month']    6
    Click Link    xpath=(//a[@href='#'])[30]
    Create a new Account
    Capture Page Screenshot    
    Sleep    5s    
    ${Email}=    Run Keyword And Return Status    Element Should Be Visible    xpath=//div[@id='signUpEmailErr']
    Run Keyword If    'True'!='${Email}'    Fail    "Enter all the fields and enter invalid Email id then click Created button, but 'Please enter a valid Email' alert message not display"

To Verify User should Create a account with existing registered mail LP3
    [Tags]    LP-3:Registration Functionallity
    Jenkins browser launch    ${url_3}
    #Local browser launch landingpage    ${url_3}    ${browser}
    ${get_sel_child_val}=    Select child in landingpage 3
    ${total_val}=    Get Text    xpath=.//span[@id='total']/b
    ${final_val}    Remove symbol    ${total_val}    ,
    Run Keyword If    '${final_val}'!='${get_sel_child_val}'    Fail    "Total display amount and selected child amount are not equal"
    Click Element    xpath=.//div[@class='donatenowbtn']/a[contains(.,'DONATE NOW')]
    Sleep    4s
    ${display_reg}=    Run Keyword And Return Status    Element Should Be Visible    xpath=.//div[@id='accordion']
    Run Keyword If    'True'!='${display_reg}'    Fail    "When click 'Donate Now' button Registration section not display"
    Register data    test    test    logimohan@gmail.com    8765656717    logi    logi    lojdufjgfngf    lojdufjgfngffdg    lojdufjgfngfsd    600099
    Select From List By Label    sel1    Tele-Caller
    Click Element    //input[@id='wvdatepicker']
    Select From List By Value    //select[@class='ui-datepicker-year']    1990
    Select From List By Value    //select[@class='ui-datepicker-month']    6
    Click Link    xpath=(//a[@href='#'])[30]
    Create a new Account
    Sleep    4s
    ${Email}=    Run Keyword And Return Status    Element Should Be Visible    xpath=//div[@class='swal-text']
    Run Keyword If    'True'!='${Email}'    Fail    "Enter all the fields and Enter registered email then click Created button, but 'The Mobile Number or Username already taken', alert message not display"

To Verify State and City get autofill after update pincode LP3
    [Tags]    LP-3:Registration Functionallity
    Jenkins browser launch    ${url_3}
    #Local browser launch landingpage    ${url_3}    ${browser}
    ${get_sel_child_val}=    Select child in landingpage 3
    ${total_val}=    Get Text    xpath=.//span[@id='total']/b
    ${total_val}    Convert to price    ${total_val}
    Run Keyword If    '${total_val}'!='${get_sel_child_val}'    Fail    "Total display amount and selected child amount are not equal"
    Click Element    xpath=.//div[@class='donatenowbtn']/a[contains(.,'PROCEED TO AUTO DEBIT')]
    Sleep    10s    
    ${display_reg}=    Run Keyword And Return Status    Element Should Be Visible    xpath=.//div[@id='accordion']
    Run Keyword If    'True'!='${display_reg}'    Fail    "When click 'Donate Now' button Registration section not display"
    Register data    test    test    logimohan@gmail.com    8765656717    logi    logi    lojdufjgfngf    lojdufjgfngffdg    lojdufjgfngfsd    600099
    
    ${get_city_val}=    Get Element Attribute    name=city    value
    Run Keyword If    '${city}'!='${get_city_val}'    Fail    "Enter valid pincode but City not auto filled"
    ${get_state_val}=    Get Element Attribute    name=state    value
    Run Keyword If    '${state}'!='${get_state_val}'    Fail    "Enter valid pincode but State not auto filled"
    Edit Pincode auto populate    Chennai    Tamil Nadu

Total amount should change instant based on inputs in add child sponsorship LP3
    [Tags]    To verify total amount variation
    Jenkins browser launch    ${url_3}
    #Local browser launch landingpage    ${url_3}    ${browser}
    ##Check default amount in 0 or not##
    ${total_val}=    Get Text    xpath=.//span[@id='total']/b
    Run Keyword If    0!=${total_val}    Fail    "After url load Bydefault total amount should be '0' but its not display like '0'"
    ##End##
    ${get_sel_child1_val}=    click any label val in child sec    1
    Click Element    xpath=.//button[@class='owl-next']
    ${check_child_dispaly or not}=    Run Keyword And Return Status    Element Should Be Visible    xpath=.//div[@class='owl-item active']
    Run Keyword If    'True'!='${check_child_dispaly or not}'    Fail    "Click child section next arrow button but child not display"
    ${get_sel_child2_val}=    click any label val in child sec    2
    ${remove_dollor_child1_val}    Remove symbol    ${get_sel_child1_val}    ₹
    ${remove_dollor_child2_val}    Remove symbol    ${get_sel_child2_val}    ₹
    ${remove_comma_child2_val}=    Remove symbol    ${remove_dollor_child2_val}    ,
    ${total_2_child_amt}=    Evaluate    ${remove_dollor_child1_val}+${remove_comma_child2_val}
    Log To Console    Total of 2 child amount is :${total_2_child_amt}
    ${total_val}=    Get Text    xpath=.//span[@id='total']/b
    ${remove_comma_in_total_amt}=    Remove symbol    ${total_val}    ,
    Log To Console    Overall totoal amount:${remove_comma_in_total_amt}
    Run Keyword If    ${total_2_child_amt}!=${remove_comma_in_total_amt}    Fail    "Selected 2 child amount and total amunt are different"
    ##Disbale child sponsorship section##
    Click Element    xpath=.//span[@class='slider round']
    ${chck_dis_child_sec}=    Run Keyword And Return Status    Click Element    xpath=(.//div[@class='owl-item active']//div[@class='stepwizard-step']//label)[2]
    Run Keyword If    'False'!='${chck_dis_child_sec}'    Fail    "Disable 'Add Child Sponsorship' section but Child section are in enable mode"
    ##Ensure disable child sponsoship total amount val##
    ${total_val}=    Get Text    xpath=.//span[@id='total']/b
    Run Keyword If    '0'!='${total_val}'    Fail    "Child sponsorship in disable mode but total amount not display '0' val"
    
*** Keywords ***
Jenkins browser launch
    [Arguments]    ${url}
    Set Selenium Speed    .5s
    ${chrome_options} =    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    Call Method    ${chrome_options}    add_argument    headless
    Call Method    ${chrome_options}    add_argument    disable-gpu
    Call Method    ${chrome_options}    add_argument    no-sandbox
    Create WebDriver    Chrome    chrome_options=${chrome_options}
    Set Window Size    1366    768
    Go To    ${url}
    Set Browser Implicit Wait    60s

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
    ${get_child_name}=    Get Text    xpath=(.//div[@class='owl-item active'])[1]//label/div[@class='sliderNameTag']/b
    ${get_child_img_chsrc}=    Get Element Attribute    xpath=(.//div[@class='owl-item active'])[1]//label/img    src
    ${get_val}=    Get Element Attribute    xpath=(.//div[@id='mqhy']/div)[1]/input    value
    Log To Console    Child name:${get_child_name}
    Log To Console    Child img src:${get_child_img_chsrc}
    Log To Console    Child amount:${get_val}
    Click Element    xpath=.//label[@for='allowAutoDebit']
    Click Element    xpath=.//div[@class='donatenowbtn text-right']/a[contains(.,'SPONSOR NOW')]
    Sleep	10s
   
Select child in landingpage1 using SI flow
    Scroll Element Into View    xpath=.//div[@class='donatenow supportchildActive']
    Click Element    xpath=(.//div[@class='owl-item active'])[1]
    Click Element    xpath=(.//div[@id='mqhy']/div)[2]
    ${get_child_name}=    Get Text    xpath=(.//div[@class='owl-item active'])[1]//label/div[@class='sliderNameTag']/b
    ${get_child_img_chsrc}=    Get Element Attribute    xpath=(.//div[@class='owl-item active'])[1]//label/img    src
    ${get_val}=    Get Element Attribute    xpath=(.//div[@id='mqhy']/div)[1]/input    value
    Log To Console    Child name:${get_child_name}
    Log To Console    Child img src:${get_child_img_chsrc}
    Log To Console    Child amount:${get_val}
    Click Element    xpath=.//div[@class='donatenowbtn text-right']/a[contains(.,'PROCEED TO AUTO DEBIT')]

Select child in landingpage 2
    Scroll Element Into View    xpath=.//div[@class='owl-stage']
    Click Element    xpath=(.//div[@class='owl-item active']//div[@class='pic'])[1]
    ${get_child_img_src}=    Get Element Attribute    xpath=(.//div[@class='owl-item active']//div[@class='pic']/img)[1]    src
    ${get_child_name}=    Get Text    xpath=(.//div[@class='owl-item active']//div[@class='select-kid-dec']/p/strong)[1]
    ${get_def_val}=    Get Element Attribute    xpath=.//span[@class='irs-grid-text js-grid-text-0']/span    value
    Log To Console    Selected Child name in landing page 2:${get_child_name}
    Log To Console    Selected Child img src in landing page 2:${get_child_img_src}
    Log To Console    Selected Child default amount in landing page 2:${get_def_val}
    ${get_input_val}=    Get Element Attribute    xpath=.//input[@name='directPayment']    value
    Run Keyword If    '${get_def_val}'!='${get_input_val}'    Fail    "Default '800' amount and input displayed amount are different"
    Click Element    xpath=.//label[@for='allowAutoDebit']
    Click Element    xpath=.//div[@class='col-sm-4 textRight pn']//a[contains(.,'SPONSOR NOW')]
    Sleep	10s

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
    ${final_get_val}=    Remove String Using Regexp    ${get_val}    \\D        
    Log To Console    Selected Child name in landing page 3: ${get_child_name}
    Log To Console    Selected Child img src in landing page 3: ${get_child_img_src}
    Log To Console    Selected Child amount in landing page 3: ${final_get_val}
    Sleep    5s    
    #Click Element    xpath=//div[@class='allow-auto-debit']      
    
    [Return]    ${final_get_val}

Landing1 singin
    [Arguments]    ${username}    ${password}
    Capture Page Screenshot
    ${display_reg}=    Run Keyword And Return Status    Element Should Be Visible    xpath=.//div[@id='accordion']
    Run Keyword If    'True'!='${display_reg}'    Fail    "Regsitration section not display"
    Click Element    xpath=.//a[@class='show-signin']
    Input Text    name=email    ${username}
    Input Text    id=pwd    ${password}
    Click Element    xpath=.//a[@class='btn btn-default wvSignIn']

Forgot password
    Capture Page Screenshot
    ${display_reg}=    Run Keyword And Return Status    Element Should Be Visible    xpath=.//div[@id='accordion']
    
    Run Keyword If    'True'!='${display_reg}'    Fail    "Regsitration section not display"
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
    Capture Page Screenshot
    ${display_reg}=    Run Keyword And Return Status    Element Should Be Visible    xpath=.//div[@id='accordion']
    Run Keyword If    'True'!='${display_reg}'    Fail    "Regsitration section not display"
    Click Element    xpath=.//a[@class='show-signin']
    Input Text    name=email    ${username}
    Click Element    xpath=.//a[@class='btn btn-default wvSignIn']

Landing1 singin with password
    [Arguments]    ${password}
    Capture Page Screenshot
    ${display_reg}=    Run Keyword And Return Status    Element Should Be Visible    xpath=.//div[@id='accordion']
    Run Keyword If    'True'!='${display_reg}'    Fail    "Regsitration section not display"
    Click Element    xpath=.//a[@class='show-signin']
    Input Text    id=pwd    ${password}
    Click Element    xpath=.//a[@class='btn btn-default wvSignIn']

Landing1 singin without credentials
    Capture Page Screenshot
    ${display_reg}=    Run Keyword And Return Status    Element Should Be Visible    xpath=.//div[@id='accordion']
    Run Keyword If    'True'!='${display_reg}'    Fail    "Regsitration section not display"
    Click Element    xpath=.//a[@class='show-signin']
    Click Element    xpath=.//a[@class='btn btn-default wvSignIn']  
    
Landing singin
    Capture Page Screenshot
    ${display_reg}=    Run Keyword And Return Status    Element Should Be Visible    xpath=.//div[@id='accordion']
    Run Keyword If    'True'!='${display_reg}'    Fail    "Regsitration section not display"
    Click Element    xpath=.//a[@class='show-signin']
    Input Text    name=email    aswin.l@live.in
    Input Text    id=pwd    test
    Click Element    xpath=.//a[@class='btn btn-default wvSignIn']

Landingpage2 singin
    [Arguments]    ${username}    ${password}
    Capture Page Screenshot
    ${display_reg}=    Run Keyword And Return Status    Element Should Be Visible    xpath=.//div[@id='accordion']
    Run Keyword If    'True'!='${display_reg}'    Fail    "Regsitration section not display"
    Click Element    xpath=.//a[@class='show-signin']
    Input Text    name=email    ${username}
    Input Text    id=pwd    ${password}
    Click Element    xpath=.//a[@class='btn btn-default wvSignIn']
    
Landing2 singin
    Capture Page Screenshot
    ${display_reg}=    Run Keyword And Return Status    Element Should Be Visible    xpath=.//div[@id='accordion']
    Run Keyword If    'True'!='${display_reg}'    Fail    "Regsitration section not display"
    Click Element    xpath=.//a[@class='show-signin']
    Input Text    name=email    kumaran@xerago.com
    Input Text    id=pwd    test
    Click Element    xpath=.//a[@class='btn btn-default wvSignIn']

Landing3 singin
    Capture Page Screenshot
    ${display_reg}=    Run Keyword And Return Status    Element Should Be Visible    xpath=.//div[@id='accordion']
    Run Keyword If    'True'!='${display_reg}'    Fail    "Regsitration section not display"
    Click Element    xpath=.//a[@class='show-signin']
    Input Text    id=emailcheck    kumaran@xerago.com
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
    [Arguments]    ${Fname}
    Input Text    //input[@name='fname']    ${Fname}

LastName
    [Arguments]    ${Lname}
    Input Text    //input[@name='lname']    Testing

Email
    [Arguments]    ${Email}
    Input Text    //input[@name='sigin-email']    ${Email}

Exist Email
    Input Text    //div[@class='form-group']/input[@name='sigin-email']    logimohan@gmail.com

Invalid Email
    Input Text    //div[@class='form-group']/input[@name='sigin-email']    testil.com

Phone no
    [Arguments]    ${Phone}
    Input Text    //input[@name='phonenumber']    ${Phone}

Invalid Phone no
    Input Text    //input[@name='phonenumber']    9940

Confirm Password
    [Arguments]    ${CPassword}
    Input Text    //input[@name='sigin-pass']    ${CPassword}

Re-Confirm Password
    [Arguments]    ${RCPassword}
    Input Text    //input[@name='sigin-conpass']    ${RCPassword}

Address1
    [Arguments]    ${Address-1}
    Input Text    //input[@name='address1']    ${Address-1}

Address2
    [Arguments]    ${Address-2}
    Input Text    //input[@name='address2']    ${Address-2}

Address3
    [Arguments]    ${Address-3}
    Input Text    //input[@name='address3']    ${Address-3}

Postal code
    [Arguments]    ${Postalcode}
    Input Text    //input[@name='postal-code']    ${Postalcode}

valid postal code
    Input Text    //input[@name='postal-code']    600099

City
    [Arguments]    ${City}
    Input Text    //input[@name='city']    ${City}

State
    [Arguments]    ${state}
    Input Text    //input[@name='state']    ${state}

Country
    Select From List By Index    //select[@id='country']    2

Create a new Account
    Click Element    //a[@class='btn btn-default wv-signUp']

Indian Citizen
    Click Element    //label[@id='indiapass']

Register data
    [Arguments]    ${Fname}    ${Lname}    ${Email}    ${Phone}    ${CPassword}    ${RCPassword}    ${Address1}    ${Address2}    ${Address3}    ${Postalcode}
    Input Text    //input[@name='fname']    ${Fname}
    Input Text    //input[@name='lname']    ${Lname}
    Input Text    //input[@name='sigin-email']    ${Email}
    Input Text    //input[@name='phonenumber']    ${Phone}
    Input Text    //input[@name='sigin-pass']    ${CPassword}
    Input Text    //input[@name='sigin-conpass']    ${RCPassword}
    Input Text    //input[@name='address1']    ${Address1}
    Input Text    //input[@name='address2']    ${Address2}
    Input Text    //input[@name='address3']    ${Address3}
    Input Text    //input[@name='postal-code']    ${Postalcode}
    
Convert to price
    [Arguments]    ${price}

    ${price}=    Remove String Using Regexp    ${price}    \\D        
    ${price}=    Convert To Integer    ${price}
    
    [Return]    ${price}    
    
Edit Pincode auto populate
    [Arguments]    ${city}    ${state}        
    
    Clear Element Text    name=city
    Input Text    name=city    ${city}
    
    Clear Element Text    name=state
    Input Text    name=state    ${state}    

Price convertion
    [Arguments]    ${total_val}
    
    ${total_val}=    Remove String Using Regexp    ${total_val}    \\D        
    ${total_val}=    Convert To Integer    ${total_val}

    [Return]    ${total_val}

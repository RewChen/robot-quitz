*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}          https://chiangmuan.igovapp.com/
${BROWSER}      Chrome

#Suite Setup OpenBrowser 
*** Test Cases ***

   F01.2_Login_Test
    [Documentation]    ทดสอบการล็อกอินจนถึงหน้ายินดีต้อนรับ
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Set Selenium Speed    0.5 seconds
    
    # 1. คลิกเข้าสู่ระบบ
    Wait Until Element Is Visible    xpath=//*[contains(text(), 'เข้าสู่ระบบ')]    timeout=15s
    Click Element    xpath=//*[contains(text(), 'เข้าสู่ระบบ')]
    
    # 2. คลิกปุ่ม LINE เพื่อไปหน้า QR Code (ตามรูป {93FCFF6D...}.png)
    Wait Until Page Contains    Login    timeout=15s
    Click Element    xpath=//a[contains(@class, 'btn-line')]
    
    # 3. จุดตรวจสอบสุดท้าย: รอให้คุณสแกน QR Code จนหน้าเปลี่ยนเป็น "ยินดีต้อนรับ"
    # ผมเพิ่มเวลาให้ 60 วินาทีเพื่อให้สแกนทันครับ
    Wait Until Page Contains    ยินดีต้อนรับ    timeout=60s
    Page Should Contain    ยินดีต้อนรับ
    
    [Teardown]    Close Browser
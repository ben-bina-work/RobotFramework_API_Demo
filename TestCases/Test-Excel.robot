*** Settings ***
 
Resource                  ../Settings/Libraries.robot
Resource                  ../Settings/Excel_Adaptor.robot


*** Test Cases ***
Read User Input Data From The Excel 
    [Tags]   dev
    Convert Data From File
    Log To Console  ${URL}

*** Settings ***
Resource                  ../Settings/Libraries.robot
Resource                  ../Actions/get_Json_data.robot
Resource                  ../Settings/Excel_Adaptor.robot
 

*** Test Cases ***	
			
Validate Data From Post API
    Convert Data From File
    ${json_object}      Get Json Collection From a URL      ${URL}      ${POST_CODE} 
    Log To Console  ${json_object}
    ${city_name}        Get City Name
    ${state_name}       Get State Name
    ${state_abbr}       Get State Abbreviation
    ${state_locality}   Get Locality
    Log To Console   \n|City: ${city_name} | State: ${state_name} | Abbr: ${state_abbr} | Locality: ${state_locality}

    Should Be Equal As Strings      ${CITY_NAME}       ${city_name}         msg=Checking City Name  
    Should Be Equal As Strings      ${STATE_NAME}      ${state_name}        msg=Checking State Name 
    Should Be Equal As Strings      ${LOCALITY}        ${state_locality}    msg=Checking State Locality 
    Should Be Equal As Strings      ${ABBREVIATION}    ${state_abbr}        msg=Checking State abbr 
     

      
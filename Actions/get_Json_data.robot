*** Settings ***
Resource                  ../Settings/Libraries.robot

 


*** Keywords ***
Get Json Collection From a URL
    [Arguments]         ${url}   ${postCode}
    ${postCode}         Convert To Integer  ${postCode}
    ${message}          Set Variable   URL: ${url}  POST_CODE: ${postCode}
    Log To Console  ${message}
    Log  ${message}
    ${result} =  Create Session     postcodeapi         ${url}
    ${resp}=	Get Request	 postcodeapi	/${postCode}.json
    Should Be Equal As Strings	${resp.status_code}	200
    #${json_object}  Set Variable  ${resp.json()}
    Set Suite Variable        ${json_object}        ${resp.json()}
    Log         ${json_object}
    [Return]   ${json_object}

Get City Name
    ${value}=	Get Value From Json	${json_object}	$..name	
     # Log To Console  ${value}
      ${v} =	Convert To List	${value}	
      ${cityName} =    Get From List   ${v}    0 
      Log       List: ${v}\n value:${cityName}  
      [Return]      ${cityName}      

Get State Name
    ${value}=	Get Value From Json	${json_object}	$..state.name
    ${v} =	Convert To List	${value}
    ${stateName} =    Get From List   ${v}    0
    Log      ${stateName}
    [Return]    ${stateName}

Get State Abbreviation
        ${value}=	Get Value From Json	${json_object}	$..state.abbreviation
    ${v} =	Convert To List	${value}
    ${stateAbbr} =    Get From List   ${v}    0
    Log      ${stateAbbr}
    [Return]    ${stateAbbr}

Get Locality
    ${value}=	Get Value From Json	${json_object}	$..locality
    ${v} =	Convert To List	${value}
    ${stateAbbr} =    Get From List   ${v}    0
    Log      ${stateAbbr}
    [Return]    ${stateAbbr}
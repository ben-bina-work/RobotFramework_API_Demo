*** Variable ***
${sheetName} =  Sheet1

*** Keywords ***
Get Excel Enteries
    ${my_dict} =  Create dictionary      
    Open Excel          post.xls
    ${rowCount} =  Get Row Count	${sheetName}
    ${columnCount} =  Get Column Count		${sheetName}
    : FOR    ${i}    IN RANGE    2    ${rowCount}
    \   ${v} =  Get Row Values 	 ${sheetName}	${i}
    \   ${key} =  Read Cell Data By Coordinates	${sheetName}  ${0}  ${i}
    \   ${value} =  Read Cell Data By Coordinates	${sheetName}  ${1}  ${i}
    \   Set To Dictionary	${my_dict}	 ${key}	${value}
    [Return]  ${my_dict}

Init Variables
        
    Set Suite Variable            ${URL}                                        ${empty}
    Set Suite Variable            ${POST_CODE}                                  ${empty}  
    Set Suite Variable            ${STATE_NAME}                                 ${empty}
    Set Suite Variable            ${LOCALITY}                                   ${empty}
    Set Suite Variable            ${CITY_NAME}                                  ${empty}
    Set Suite Variable            ${ABBREVIATION}                               ${empty}
 

Convert Data From File
        Init Variables       
        ${v} =  Get Excel Enteries

        ${tmp} =  Get From Dictionary	${v}  URL
        Set Suite Variable        ${URL}  ${tmp}

        ${tmp} =  Get From Dictionary	${v}  POST_CODE
        Set Suite Variable        ${POST_CODE}  ${tmp}

        ${tmp} =  Get From Dictionary	${v}  STATE_NAME
        Set Suite Variable        ${STATE_NAME}  ${tmp}      
        
        ${tmp} =  Get From Dictionary	${v}  LOCALITY
        Set Suite Variable        ${LOCALITY}  ${tmp}   
           
        ${tmp} =  Get From Dictionary	${v}  CITY_NAME
        Set Suite Variable        ${CITY_NAME}  ${tmp}   
        
        ${tmp} =  Get From Dictionary	${v}  ABBREVIATION
        Set Suite Variable        ${ABBREVIATION}  ${tmp}   
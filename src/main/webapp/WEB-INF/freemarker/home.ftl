<#ftl encoding="utf-8"/>

<html>
<head>
    <title>프리마커 샘플</title>
</head>
<body>
    <h1>프리마커 샘플</h1>
    서버 : ${serverTime}

    <h3>예제 1 - 연산자 사용</h3>
    <div>
        <#assign n1 = 10>
        <#assign n2 = 3>
        <#assign n3 = n1+n2>
        <p>n1 = ${n1}, n2 = ${n2}</p>
        <p>더하기 : n1 + n2 = ${n3}</p>
        <#assign n3 = n1/n2>
        <p>나누기 : n1 / n2 = ${n3}</p>
        <p>정수형 표시(floor) n1 / n2 = ${n3?floor}</p>
    </div>

    <h3>예제 2 - 문자열 합치기</h3>
    <div>
        <#assign str1 = "오늘도 어제와 같은 하루                  ">
        <#assign str2>
            변한게 없는 하루
        </#assign>
        <p>str1 = ${str1}, str2 = ${str2}</p>
        <#assign str3 = str1 + str2>
        <p>합치기 표현식 1(trim): ${str1?trim + str2?trim}</p>
        <p>합치기 표현식 2: ${str3}</p>
        <#assign len = str1?length>
        <p>문자길이(length) : ${len}</p>
        <p>문자길이(trim + length) : ${str1?trim?length}</p>
    </div>

    <h3>예제 3 - 문자열 자르기</h3>
    <div>
        <#assign ss = "ODN_202203">
        <#assign sb = ss?substring(4, 10)>
        <p>대상 문자열 = ${ss}</p>
        <p>문자열 자르기(substring) : ${sb}</p>
        <p>문자열 자르기(left_pad) : ${sb?left_pad(10, "0")}</p>
    </div>
    </div>

</body>
</html>
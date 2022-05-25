<#ftl encoding="utf-8"/>

<html>
<head>
    <title>프리마커 샘플</title>

    <style>
        .ex-contents {
            margin-bottom: 40px;
            border: 1px solid #c4c4c4;
            padding: 0px 10px 0px 10px;
        }
    </style>
</head>
<body>
    <h1>프리마커 샘플</h1>
    서버 : ${serverTime}

    <h3> 예제 1 - 연산자 사용</h3>
    <div id="ex1" class="ex-contents">
        <#assign n1 = 10/>
        <#assign n2 = 3/>
        <#assign n3 = n1+n2/>
        <p>n1 = ${n1}, n2 = ${n2}</p>
        <p>더하기 : n1 + n2 = ${n3}</p>
        <#assign n3 = n1/n2/>
        <p>나누기 : n1 / n2 = ${n3}</p>
        <p>정수형 표시(floor) n1 / n2 = ${n3?floor}</p>
    </div>

    <h3>예제 2 - 문자열 합치기</h3>
    <div id="ex2" class="ex-contents">
        <#assign str1 = "오늘도 어제와 같은 하루                  "/>
        <#assign str2>
            변한게 없는 하루
        </#assign>
        <p>str1 = ${str1}, str2 = ${str2}</p>
        <#assign str3 = str1 + str2/>
        <p>합치기 표현식 1(trim): ${str1?trim + str2?trim}</p>
        <p>합치기 표현식 2: ${str3}</p>
        <#assign len = str1?length/>
        <p>문자길이(length) : ${len}</p>
        <p>문자길이(trim + length) : ${str1?trim?length}</p>
        <p>특정문자 첫번째 자리에 추가(ensure_starts_with) : ${str1?ensure_starts_with("\"")}</p>
        <p>특정문자 마지막 자리에 추가(ensure_ends_with) : ${str1?ensure_ends_with("!")}</p>
    </div>

    <h3>예제 3 - 문자열</h3>
    <div id="ex3" class="ex-contents">
        <p><b>문자열 자르기</b></p>
        <#assign ss = "ODN_202203"/>
        <#assign sb = ss?substring(4, 10)/>
        <p>대상 문자열 = ${ss}</p>
        <p>문자열 자르기(substring) : ${sb}</p>
        <p>문자열 자르기(left_pad) : ${sb?left_pad(10, "0")} / ${sb?left_pad(10, "0")?length}</p>
        <p>문자열 자르기(right_pad) : ${sb?right_pad(10, "0")} / ${sb?right_pad(10, "0")?length}</p>
        <p><b>문자열 자르기 substring 대신 사용하는 문법 []</b></p>
        <p>문자열 자르기(4~9자리까지 [4..9]) : ${ss[4..9]}</p>
        <p>문자열 자르기(8부터 끝까지 [8..]) : ${ss[8..]}</p>
        <p>문자열 자르기(4부터 4개 [4..*4]) : ${ss[4..*4]}</p>
        <#assign target="foo.bar.txt"/>
        <p>대상 문자열 : ${target}</p>
        <p>특정문자 기준 자르기(keep_after) : ${target?keep_after(".")}</p>
        <p>특정문자 기준 자르기(keep_after_last) : ${target?keep_after_last(".")}</p>
        <p>특정문자 기준 자르기(keep_before) : ${target?keep_before(".")}</p>
        <p>특정문자 기준 자르기(keep_before_last) : ${target?keep_before_last(".")}</p>
        <p>특정문자 기준 자르기(remove_beginning) : ${target?remove_beginning("foo")}</p>
        <p>특정문자 기준 자르기(remove_ending) : ${target?remove_ending("txt")}</p>

        <p><b>return blooean</b></p>
        <#assign target="abcdef">
        <p>대상 문자열 : ${target}</p>
        <p>starts_with : ${target?starts_with("ab")?c}</p>
        <p>ends_with : ${target?ends_with("def")?c}</p>
        <p>contains : ${target?contains("ef")?c}</p>

        <p><b>대소문자</b></p>
        <p>대상 문자열 : ${target}</p>
        <p>첫글자 대문자(cap_first) : ${target?cap_first}</p>
        <p>첫글자 소문자(uncap_first) : ${"Abcdef"?uncap_first}</p>
        <P>대문자 변환(upper_case) : ${target?upper_case}</P>
        <p>소문자 변환(lower_case) : ${target?lower_case}</p>

        <p><b>return number</b></p>
        <#assign target="abcabc">
        <p>대상 문자열 : ${target}</p>
        <p>index_of : ${target?index_of("bc")}</p>
        <p>last_index_of : ${target?last_index_of("bc")}</p>
    </div>

    <h3>예제 4 - 형변환</h3>
    <div id="ex4" class="ex-contents">
        <p>string + int = string : ${str1 + n1}</p>
        <#assign nn = n1?string + n2?string/>
        <p>int -> string(string) : ${nn}</p>
        <p>string -> int(number) : ${nn?number + 100}</p>
    </div>

    <h3>예제 5 - 정수형</h3>
    <div id="ex5" class="ex-contents">
        <#assign x = 100000000 / 3/>
        <p>ftl는 천단위 이상 숫자는 꼼마 자동 입력 : ${x}</p>
        <p>정수표현 : ${x?string["0"]}</p>
        <p>소수점 첫째자리까지 : ${x?string["0.#"]}</p>
        <p>소수점 두번째자리까지 : ${x?string["0.##"]}</p>
        <p>소수점 세번째자리까지 : ${x?string["0.###"]}</p>
        <p>소수점 네번째자리까지 : ${x?string["0.####"]}</p>
    </div>

    <h3>예제 6 - boolean</h3>
    <div id="ex6" class="ex-contents">
        <p><b>True 케이스</b></p>
        <#assign b = ((2/2) == 1)/>
        <p>true, false 표현(string) : ${b?string}</p>
        <p>true, false 표현(c) : ${b?c}</p>
        <p>true, false 표현(string(true일경우, fales일경우)) : ${b?string("OK", "FAIL")}</p>
        <p>true, false 표현(then(true일경우, fales일경우)) : ${b?then(100, -1)}</p>
        <p><b>False 케이스</b></p>
        <#assign b = ((2/2) != 1)/>
        <p>true, false 표현(string) : ${b?string}</p>
        <p>true, false 표현(string(true일경우, fales일경우)) : ${b?string("OK", "FAIL")}</p>
        <p>true, false 표현(then(true일경우, fales일경우)) : ${b?then(100, -1)}</p>
    </div>

    <h3>예제 7 - if/elseif/else</h3>
    <div id="ex7" class="ex-contents">
        <#assign ff = ff!true/>
        <p>초기값(!) : ${ff?string}</p>
        <p>isNotNull(ff??) : ${ff???string}</p>
        <p>isNotNull(ee??) : ${ee???string}</p>
        <#if ee??>
            <p>ee가 Null이 아닌 경우(if) : ${ee}</p>
        <#elseif ff??>
            <p>ff가 Null이 아닌 경우(elseif) : ${ff?string}</p>
        <#else>
            <p>ee가 Null이고 ff가 Null일 경우(else) : FAIL</p>
        </#if>
    </div>

    <h3>예제 8 - 비교연산자</h3>
    <div id="ex8" class="ex-contents">
        <#assign ee = ee!100/>
        <p>ee : ${ee}</p>
        <p><b>비교 연산자로 >, >=는 사용할 수 없음</b></p>
        <#if ee?? && ee <= 200>
            <p>ee가 Null이 아니고 200보다 작은 경우(ee?? && ee < 200)</p>
        <#else>
            <p>ee가 Null이거나 200보다 큰 경우(else)</p>
        </#if>
        <p><b>gt: >, gte: >=, lt: <, lte: <= </b></p>
        <#assign compare1 = 200 gt 100/>
        <#assign compare2 = 200 gte 200/>
        <#assign compare3 = 200 lt 300/>
        <#assign compare4 = 300 lte 300/>
        <p>200 gt 100 : ${compare1?string}</p>
        <p>200 gte 200 : ${compare2?string}</p>
        <p>200 lt 300 : ${compare3?string}</p>
        <p>300 lte 300 : ${compare4?string}</p>
    </div>

    <h3>예제 9 - 반복문</h3>
    <div id="ex9" class="ex-contents">
        <p><b>1~10 개</b></p>
        <ul>
        <#list 1..10 as x>
            <li>${x?index} index : ${x}</li>
        </#list>
        </ul>
        <p><b>5부터 10개</b></p>
        <ul>
        <#list 5..*10 as x>
            <li>${x?index} index : ${x}</li>
        </#list>
        </ul>
        <p><b>15이면 break</b></p>
        <ul>
            <#list 5..*10 as x>
            <#if x == 15>
                <p>break!</p>
                <#break>
            <#else>
                <p>continue! => ${x}</p>
                <#continue>
            </#if>
        </#list>
        </ul>

        <p><b>list관련 함수</b></p>
        <#assign sequence = ["A", "B", "C", "D", "E", "F"]/>
        <#list sequence as item>
            <p>
                value : ${item} /
                _index : ${item_index} /
                _has_next(boolean) : ${item_has_next?string} /
                is_even_item(boolean) : ${item?is_even_item?string} /
                is_first(boolean) : ${item?is_first?string} /
                is_last(boolean) : ${item?is_last?string} /
                is_odd_item(boolean) : ${item?is_odd_item?string}
            </p>
            <#if item?index == 3>
                <p>STOP</p>
                <#break>
            <#else>
                <p>GOGO</p>
            </#if>
        </#list>
    </div>

    <h3>예제 10 - Sequence</h3>
    <div id="ex10" class="ex-contents">
        <p><b>배열(수정 혹은 삭제 불가능) []로 선언</b></p>
        <#assign sq = ["A", "B", "C"]/>
        <p>
            <#list sq as it>
                ${it?index} : ${it}<#sep>,
            </#list>
        </p>
        <p>A, B, C 중 1번째 : ${sq[1]}</p>
        <p>A, B, C 중 0번째 + 2번째 : ${sq[0] + sq[2]}</p>

        <p><b>배열끼리 조인 가능</b> (sep: 마지막 구분자는 표현하지 않음)</p>
        <#assign sq = sq + [100, 200, 300]/>
        <p>배열 사이즈(size) : ${sq?size}</p>
        <p>배열 조인 :
            <#list sq as it>
                ${it}<#sep>,
            </#list>
        </p>

        <p><b>배열 지정 index만 표시</b></p>
        <p>2 ~ 4번째 =>
            <#list sq[2..4] as it>
                ${it?index} : ${it} <#sep> /
            </#list>
        </p>
        <p>4번째부터 =>
            <#list sq[4..] as it>
                ${it?index} : ${it} <#sep> /
            </#list>
        </p>

        <p><b>타입이 숫자(is_number)이고 250보다 작으면 배열에 추가</b></p>
        <#assign sq2 = []/>
        <p>
            <#list sq as it>
                ${it}(${it?is_number?string})
                <#sep>,
                <#if it?is_number && it lt 250>
                    <#assign sq2 += [it]>
                </#if>
            </#list>
        </p>
        <p>결과 (join사용) : ${sq2?join(", ")}</p>

        <p><b>배열(is_sequence)일 경우 join으로 묶어서 표시</b></p>
        <#assign sq3 = ["A", "B", [1, 2, 3]]/>
        <p>
            <#list sq3 as it>
                <#if it?is_sequence>
                    ${it?join(", ")}(${it?is_sequence?string})
                <#else>
                    ${it}(${it?is_sequence?string})
                </#if>
                <#sep> /
            </#list>
        </p>
    </div>

    <h3>예제 11 - hashes</h3>
    <div id="ex11" class="ex-contents">
        <p><b>hash {}로 선언(hash만 .로 접근 가능)</b></p>
        <#assign ages = {"철이":23, "동이":25, "순이":"묻지마"}/>
        <p>동이(ages["동이"]) : ${ages["동이"]}</p>
        <p>순이(ages.순이) : ${ages.순이}</p>

        <p><b>같은 키가 있다면 덮어씀(+)</b></p>
        <#assign ages = ages + {"순이":15, "영희": 18}/>
        <p>순이 : ${ages.순이}</p>

        <p><b>수정 혹은 삭제 불가능(+=)</b></p>
        <#--<#assign ages.순이 = "안알려줌"/>-->
        <#assign ages += {"순이":"안알려줌"}/>
        <p>순이 : ${ages.순이}</p>

        <p><b>hash key값</b></p>
        <p>
            <#list ages?keys as name>
                ${name}
                <#sep>,
            </#list>
        </p>

        <p><b>hash value값</b></p>
        <p>
            <#list ages?values as age>
                ${age}
                <#sep>,
            </#list>
        </p>

        <p><b>hash key & value값</b></p>
        <#list ages as name, age>
            <p>
                ${name}님은 ${age}
                <#if age?is_number>
                    세
                </#if>
                입니다.
            </p>
        </#list>

        <p><b>나이값이 있고(is_number) 20살보다 많은 경우</b></p>
        <p>대상 =>
            <#list ages as name, age>
                ${name} : ${age}
                <#sep>,
            </#list>
        </p>
        <#assign ages2 = {}/>
        <#list ages as name, age>
            <#if age?is_number && age gt 20>
                <#assign ages2 += {name:age}/>
            </#if>
        </#list>
        <p>결과 =>
            <#list ages2 as name, age>
                ${name} : ${age}
                <#sep>,
            </#list>
        </p>

        <p><b>Sequence를 포함한 Hash</b></p>
        <#assign data = {"번호":123, "대상자목록":[123, 456, 789], "템플릿":{"title":"안녕하세요.", "param1": 20220504}}/>
        <p>대상자목록(data.대상자목록?join(", ")) : ${data.대상자목록?join(", ")}</p>
        <p>대상자목록(data.대상자목록[1]) : ${data.대상자목록[1]}</p>
        <p>템플릿의 title(data["템플릿"]["title"]) : ${data["템플릿"]["title"]}</p>
        <p>템플릿의 title(data.템플릿.title) : ${data.템플릿.title}</p>
        <p>템플릿의 param1(data.템플릿.param1) : ${data.템플릿.param1}</p>
        <p>템플릿의 param1(data.템플릿.param1?string(0)) : ${data.템플릿.param1?string(0)}</p>
    </div>

    <h3>예제 12 - 그외</h3>
    <div id="ex12" class="ex-contents">
        <p><b>switch</b></p>
        <#assign var = var!"large"/>
        <p>data : ${var}</p>
        <p>result :
            <#switch var>
                <#case "small">
                    This will be processed of if is small
                    <#break>
                <#case "medium">
                    This will be processed of if is medium
                    <#break>
                <#case "large">
                    This will be processed of if is large
                    <#break>
                <#default>
                    This will be processed of if is neither
            </#switch>
        </p>
        <p>
            <#list ['r','x','x','s'] as flag>
                <p>flag : ${flag}</p>
                <p>switch() : ${flag?switch('r', 'readable' 'w', 'writable', 'x', 'executable', 'unknown:'+ flag)}</p>
            </#list>
        </p>

        <p><b>attempt / recover (= try / catch)</b></p>
        <#assign sa1 = "가나다라"/>
        <#assign sa2 = 30/>
        <#attempt>
            <#assign na1 = sa1?number/>
        <#recover>
            <#assign na1 = 0/>
        </#attempt>
        <#attempt>
            <#assign na2 = sa2?number/>
        <#recover>
            <#assign na2 = 0/>
        </#attempt>
        <p>data : ${sa1} / ${sa2}</p>
        <p>결과(정상 : 숫자, 에러 : 0) => ${na1} / ${na2}</p>

        <p><b>function(반드시 return값 필요, 내부 출력 무시됨)</b></p>
        <p>global : 전역변수,  assign : 지역변수 , local : 지역변수(only function, macro)</p>
        <#function is_numeric param>
            <p>param : ${param}</p>
            <#local rslt = false/>
            <#attempt>
                <#if param?is_number><#local rslt = true></#if>
                <#if !param?is_number><#local rslt = false></#if>
                <#local n = param?number/>
            <#recover>
                <#local rslt = false/>
            </#attempt>
            <#return rslt>
        </#function>
        <#assign data = 123/>
        <p>param : ${data}</p>
        <p>function(is_numeric) : ${is_numeric(data)?string}</p>

        <#function avg x,y>
            <#return (x+y)/2/>
        </#function>
        <#assign x = 10/>
        <#assign y = 28/>
        <p>x: ${x} / y: ${y}</p>
        <p>function(avg) : ${avg(x, y)}</p>
    </div>
</body>
</html>
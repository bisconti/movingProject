function sendit(){
    const joinForm = document.joinForm;
    
    const userid = joinForm.userid;
    if(userid.value == ""){
        alert("아이디를 입력하세요!")
        userid.focus();
        return false;
    }
    if(userid.value.length < 5 || userid.value.length > 12){
        alert("아이디는 5자 이상 12자 이하로 입력하세요!");
        userid.focus();
        return false;
    }
    
    const result = document.getElementById("result");
    if(result.innerHTML == "&nbsp;"){
    	alert("아이디 중복검사를 진행해주세요!");
    	userid.focus();
    	return false;
    }
    if(result.innerHTML == "중복된 아이디가 있습니다!"){
    	alert("중복체크 통과 후 가입이 가능합니다!");
    	userid.focus();
    	return false;
    }
    
    const userpw = joinForm.userpw;
    const userpw_re = joinForm.userpw_re;
    if(userpw.value == ""){
        alert("비밀번호를 입력하세요!");
        userpw.focus();
        return false;
    }
    const reg = /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[~?!@#$%^&*_-]).{8,}$/;
    if(!reg.test(userpw.value)){
    	alert("비밀번4호는 8자 이상, 숫자, 대문자, 소문자, 특수문자를 모두 하나 이상 포함해야 합니다!");
    	return false;
    }
    if(/(\w)\1\1\1/.test(userpw.value)){
    	alert("같은 문자를 4번 연속해서 사용할 수 없습니다!")
    	userpw.focus();
    	return false;
    }
    if(userpw.value.search(/\s/) != -1){
    	alert("비밀번호는 공백을 포함할 수 없습니다!");
    	userpw.focus();
    	return false;
    }
    if(userpw_re.value == ""){
    	alert("비밀번호 확인을 해주세요!");
    	userpw_re.focus();
    	return false;
    }
    if(userpw.value != userpw_re.value){
    	alert("비밀번호 확인을 다시 해주세요!");
    	userpw.focus();
    	return false;
    }
    
    const username = joinForm.username;
    if(username.value == ""){
        alert("이름을 입력하세요!");
        username.focus();
        return false;
    }
    const exp_name = /^[가-힣]+$/;
    if(!exp_name.test(username.value)){
        alert("이름에는 한글만 입력하세요!");
        username.focus();
        return false;
    }

    const zipcode = joinForm.zipcode;
    if(zipcode.value == ""){
        alert("주소찾기를 진행해주세요!");
        sample6_execDaumPostcode();
        return false;
    }

    const addrdetail = joinForm.addrdetail;
    if(addrdetail.value == ""){
        alert("나머지 주소를 입력해주세요.")
        addrdetail.focus();
        return false;
    }
    
    const birthyear =joinForm.birth-year
    if(birthyear.value == ""){
    	alert("출생연도를 선택해주세요 !")
    	birth-year.래쳔
    } 
    return true;
}
function checkId(){
	const xhr = new XMLHttpRequest();
	const result = document.getElementById("result");
	const userid = document.joinForm.userid;
	if(userid.value == ""){
		alert("아이디를 입력하세요!");
		userid.focus();
		return false;
	}
	
	xhr.onreadystatechange = function(){
		if(xhr.readyState == 4){
			if(xhr.status == 200){
				let txt = xhr.responseText;
				txt = txt.trim();
				if(txt == "O"){
					result.innerHTML = "사용할 수 있는 아이디입니다!";
					
				}
				else{
					result.innerHTML = "중복된 아이디가 있습니다!";
					userid.value = "";
					userid.focus();
				}
			}
		}
	}
	
	xhr.open("GET",cp+"/user/checkidok.us?userid="+userid.value,true);
	xhr.send();
}
function sample6_execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var addr = ''; // 주소 변수
            var extraAddr = ''; // 참고항목 변수

            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                addr = data.roadAddress;
            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                addr = data.jibunAddress;
            }

            // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
            if(data.userSelectedType === 'R'){
                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraAddr !== ''){
                    extraAddr = ' (' + extraAddr + ')';
                }
                // 조합된 참고항목을 해당 필드에 넣는다.
                document.getElementById("sample6_extraAddress").value = extraAddr;
            
            } else {
                document.getElementById("sample6_extraAddress").value = '';
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('sample6_postcode').value = data.zonecode;
            document.getElementById("sample6_address").value = addr;
            // 커서를 상세주소 필드로 이동한다.
            document.getElementById("sample6_detailAddress").focus();
        }
    }).open();
}
// 생년월일 select박스 클릭시 이벤트 년 월 일 추가되는 이벤트 발생하도록 만드는 스크립트코드
//'출생 연도' 셀렉트 박스 option 목록 동적 생성
const birthYearEl = document.querySelector('#birth-year')
// option 목록 생성 여부 확인
isYearOptionExisted = false;
birthYearEl.addEventListener('focus', function () {
  // year 목록 생성되지 않았을 때 (최초 클릭 시)
  if(!isYearOptionExisted) {
    isYearOptionExisted = true
    for(var i = 1940; i <= 2022; i++) {
      // option element 생성
      const YearOption = document.createElement('option')
      YearOption.setAttribute('value', i)
      YearOption.innerText = i
      // birthYearEl의 자식 요소로 추가
      this.appendChild(YearOption);
    }
  }
});

const birthMonthEl = document.querySelector('#birth-month')
isMonthOptionExisted = false;
birthMonthEl.addEventListener('focus', function(){
    if(!isMonthOptionExisted){
        isMonthOptionExisted = true
        
        const MonthOption = document.createElement('option');
        MonthOption.setAttribute('value', 1);
        MonthOption.innerHTML = 1;
        MonthOption.setAttribute('value', 2);
        MonthOption.innerHTML = 2
        this.appendChild(MonthOption);
        
//        const MonthOption = document.createElement('option')
//        this.appendChild(MonthOption);
        
    }
})

const birthDayEl = document.querySelector('#birth-day')
isDayOptionExisted = false;
birthDayEl.addEventListener('focus', function(){
    if(!isDayOptionExisted){
        isDayOptionExisted = true
        for(var i = 01; i <=31; i++) {
            const DayOption = document.createElement('option')
            DayOption.setAttribute('value', i)
            DayOption.innerHTML = i
            this.appendChild(DayOption);
        }
    }
})
// 회원가입 terms 약관체크박스 여부확인.
    const termsForm = document.termsForm;
    const terms = termsForm.chked;
    let flag = false;
    function termscheck() {
        for(let term of terms){
            if(term.checked){
                flag = true;
            } else {
                alert("약관에 동의 후 다음버튼을 클릭해주세요 !")
                return false;
                break;
            }
        }
    }
    
 // 휴대폰번호 자동 하이픈설정
    function addHypen(obj) {
        var number = obj.value.replace(/[^0-9]/g, "");
        var phone = "";

        if(number.length < 4) {
            return number;
        } else if(number.length < 7) {
            phone += number.substr(0, 3);
            phone += "-";
            phone += number.substr(3);
        } else if(number.length < 11) {
            phone += number.substr(0, 3);
            phone += "-";
            phone += number.substr(3, 3);
            phone += "-";
            phone += number.substr(6);
        } else {
            phone += number.substr(0, 3);
            phone += "-";
            phone += number.substr(3, 4);
            phone += "-";
            phone += number.substr(7);
        }
        obj.value = phone;
    }












<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="../css/mypage.css" rel="stylesheet">
</head>
<body>
<%@include file="../common/header.jsp" %>
<div id="all">
	  <br><br><br>
      <form>
        <br><h2>"${userid}"님의 마이페이지</h2>
        <fieldset>
          <legend>INFO</legend>
          <table>
            <tr>
              <th colspan="2">
                <label for="userid">현재 이용중인 이용권은 "스탠다드 (HD)" 입니다.</label>
              </th>
            </tr>
            <tr>
              <th colspan="2">
                <label for="userpw">다음 결제일은 2022-12-30 일 입니다.</label>
              </th>
            </tr>
            <tr>
              <th><label for="username">이름</label></th>
              <td>
                <input type="text" name="username" id="username" value="name" readonly disabled/>
              </td>
            </tr>
            <tr>
              <th><label for="userid">아이디</label></th>
              <td>
                <input type="text" name="userid" id="userid" value="id" readonly disabled/>
              </td>
            </tr>
            <tr>
              <th><label for="username">구매금액</label></th>
              <td>
                <input type="text" name="username" id="username" value="9000원" readonly disabled/>
              </td>
            </tr>
            <tr>
              <th><label for="username">다운로드</label></th>
              <td>
                <input type="text" name="username" id="username" value="30회" readonly disabled/>
              </td>
            </tr>
            <tr>
              <th><label for="userid">구독</label></th>
              <td>
                <input type="text" name="userid" id="userid" value="월간이용권" readonly disabled/>
                <input type="button" value="구독취소" />
              </td>
            </tr>
          </table>
        </fieldset><br>
        <fieldset style="border: 1px solid red; width: 500px">
          <legend>PASSOWRD</legend>
          <table>
            <tr>
                <th><label for="userpw">현재 비밀번호</label></th>
                <td>
                  <input type="password" name="userpw" id="userpw" />
                </td>
              </tr>
            <tr>
              <th><label for="userpw">비밀번호</label></th>
              <td>
                <input type="password" name="userpw" id="userpw" />
              </td>
            </tr>
            <tr>
              <th><label for="userpw_re">비밀번호 확인</label></th>
              <td>
                <input type="password" name="userpw_re" id="userpw_re" onkeyup="pwcheck()"/>
                <input type="button" value="변경"/>
              </td>
            </tr>
          </table>
        </fieldset><br>
        <fieldset>
          <legend>PHONE</legend>
          <table>
            <tr>
              <th><label for="userid">휴대폰번호</label></th>
              <td>
                <input type="text" name="userid" id="userid" value="01011112222"/>
                <input type="button" value="인증번호" />
              </td>
            </tr>
            <tr>
              <th><label for="userid">인증번호입력</label></th>
              <td>
                <input type="text" name="userid" id="userid" />
                <input type="button" value="인증확인" />
              </td>
            </tr>
          </table>
        </fieldset><br>
        <fieldset>
          <legend>ARRDRESS</legend>
          <table>
            <tr class="zipcode_area">
              <th>우편번호</th>
              <td>
                <input
                  type="text"
                  id="sample6_postcode"
                  placeholder="우편번호"
                  name="zipcode"
                  value="333021"
                  onclick="sample6_execDaumPostcode()"
                />
                <input
                  type="button"
                  value="우편번호"
                  onclick="sample6_execDaumPostcode()"
                />
              </td>
            </tr>
            <tr class="addr_area">
              <th>주소</th>
              <td>
                <input
                  type="text"
                  id="sample6_address"
                  placeholder="주소"
                  name="addr"
                  value="경기도 평택시"
                  readonly
                />
              </td>
            </tr>
            <tr>
              <th>상세주소</th>
              <td>
                <input
                  type="text"
                  id="sample6_detailAddress"
                  placeholder="상세주소"
                  value="고속도로 422"
                  name="addrdetail"
                />
              </td>
            </tr>
            <tr>
              <th>참고항목</th>
              <td>
                <input
                  type="text"
                  id="sample6_extraAddress"
                  placeholder="참고항목"
                  name="addretc"
                  value="10335"
                  readonly
                  disabled
                  style="color: white"
                />
              </td>
            </tr>
          </table>
        </fieldset>
      </form>
    </div>
<%@include file="../common/footer.jsp" %>    
</body>
</html>
function datecheck(){
	const xhr = new XMLHttpRequest();
	const target = document.getElementsById("target_movie");		
	
	xhr.onreadystatechange = function(){
		if (xhr.readyState == 4) {
			if (xhr.status == 200) {
				let txt = xhr.responseText;
				txt = txt.trim();
				if (txt == "O") {
					alert("굿")
				}
				else{
					alert("구독 기간이 만료되었습니다. 갱신 후 다시 이용해 주세요.")
				}
			}
		}
	}
	
	xhr.open("GET",cp+"/user/subscribe.us?userid="+loginUser,true);
	xhr.send();
}	

	
	
	


	
	
	
	
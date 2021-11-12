function daumPost() {
    new daum.Postcode({
        oncomplete: function(data) {
           // R : 도로명, J : 지번
           console.log("data.userSelectedType : " + data.userSelectedType)
           console.log("data.roadAddress : " + data.roadAddress)
           console.log("data.jibunAddress : " + data.jibunAddress)
           console.log("data.zonecode : " + data.zonecode) // 우편번호
             
           var addr = ""
             if(data.userSelectedType === 'R'){
                addr = data.roadAddress
             }else{
                addr = data.jibunAddress
             }
          document.getElementById("addr1").value = data.zonecode // 아이디 값을 불러와서 우편번호를 넣음
           $("#addr2").val(addr) // 주소에 도로명인지 지번인지 들어온 값을 넣어줌
           
           $("#addr3").focus() // 상세주소로 포커스를 맞춤
        }
    }).open();   
}
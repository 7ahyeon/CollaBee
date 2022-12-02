	function getJsonDivision(categoryNum) {
    	
    	console.log("getJsonDivision 들어옴")
		
		$.ajax("../collections/getJsonDivision.do", {
			type: "get",
			data: {
				categoryNum:categoryNum
			},
			contentType: "application/json",
			dataType: "json",
			success: function(data){
				//alert("성공~~");
				console.log(data);
				
				let dispHtml = "";
				for (let divisionVO of data) {
					dispHtml += "<a href='${pageContext.request.contextPath}/collections/categories.do' class='list-group-item list-group-item-action category-list'>";
					dispHtml += divisionVO.division;
					dispHtml += "</a>";
				}
				
				$("#sub-category").html(dispHtml);
				
			},
			error: function(){
				alert("실패!~~");
				alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
			}
		}); 
	}
    
    $(function(){
        $("#category-box").mouseleave(function(){
            console.log("벗어남6~");
            console.log(this.name);
            $("#sub-category-box").css("display", "none");
        });
        $(".category-list").mouseover(function(){
            console.log("올려짐3~");
            console.log(this.name);
            
            $("#sub-category-box").css("display", "block");
            getJsonDivision(Number(this.name));
        });
        
        
    });



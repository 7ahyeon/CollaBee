$(function(){
    $(".category-list").mouseleave(function(){
        console.log("벗어남5~");
        console.log(this.name);
        $("#sub-category-box").css("display", "none");
    });
    $(".category-list").mouseover(function(){
        console.log("올려짐2~");
        console.log(this.name);
        
        $("#sub-category-box").css("display", "block");
        getJsonDivision(this.name);
    });
    
    
});


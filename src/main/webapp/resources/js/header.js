$(function(){
    $(".category-list").mouseleave(function(){
        console.log("벗어남~");
        console.log(this);
        $("#sub-category").css("display", "none");
    });
    $(".category-list").mouseover(function(){
        console.log("올려짐~");
        console.log(this);
        $("#sub-category").css("display", "block");
    });
});


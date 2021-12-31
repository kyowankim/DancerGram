import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    this.element.addEventListener("click", function(e){
        var post_id = e.target.getAttribute("data-id")
        const like_class = e.target.classList  
        const eleme = document.getElementsByClassName("total-likes-id" + post_id)[0]  
        var total_likes = parseInt(eleme.innerHTML.match(/(\d+)/)[0])  //Extracting only the integar value in text
        
        //sends a GEt request to the url, which passes the information of post_id to the likes_controllerer
        var oReq = new XMLHttpRequest();
        oReq.open("GET", "/post/like/" + post_id)
        oReq.send()

        
        if (like_class.contains("active")){
          eleme.innerHTML= `${total_likes - 1} likes`
          like_class.remove("active")
        } else {
          eleme.innerHTML= `${total_likes + 1} likes`
          like_class.add("active")
        }
        
    })
  }
}

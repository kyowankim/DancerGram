import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    this.element.addEventListener("click", function(e){
        document.getElementById("comment_comment").focus()
        
    })
  }
}

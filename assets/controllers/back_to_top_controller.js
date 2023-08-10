import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  connect() {
    this.element.classList.add('translate-y-[300%]','duration-300')
    this.element.classList.remove('hidden')

    document.addEventListener('scroll', () => {
        if (window.scrollY > 800) {
            this.show();
        } else {
            this.hide();
        }
  });
}


  show() {
    this.element.classList.remove("translate-y-[300%]");
  }

  hide() {
    this.element.classList.add("translate-y-[300%]");
  }
}


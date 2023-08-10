import { Controller } from "@hotwired/stimulus";

export default class extends Controller {

  connect() {
    let element = this.element
    let visibleClasses = element.dataset.visibleClasses.split(',')
    let invisibleClasses = element.dataset.invisibleClasses.split(',')
    let transitionClasses = element.dataset.transitionClasses.split(',')

    // console.log(visibleClasses,invisibleClasses,transitionClasses)
    addClassesToElement(invisibleClasses, element)
    addClassesToElement(transitionClasses, element)

    window.addEventListener("scroll", function(){
          if(isVisible(element)){
            addClassesToElement(visibleClasses, element)
            removeClassesToElement(invisibleClasses, element)
          }else{
            removeClassesToElement(visibleClasses, element)
            addClassesToElement(invisibleClasses, element)
          }
      });
    }
}

function isVisible(element)
{
    let rect = element.getBoundingClientRect();

    return window.innerHeight-rect.top >= 100
}

function addClassesToElement(classes, element)
{
  classes.forEach(className => element.classList.add(className))
}

function removeClassesToElement(classes, element)
{
  classes.forEach(className => element.classList.remove(className))
}

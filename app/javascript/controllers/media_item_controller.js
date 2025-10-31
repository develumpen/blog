import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="media-item"
export default class extends Controller {
  static values = {
    target: String
  }

  embed(event) {
    if(!this.hasTargetValue) return;

    const target = document.getElementById(this.targetValue);

    const imageUrl = event.target.src;
    const markdownImage = `![](${imageUrl})`;

    const startPosition = target.selectionStart;
    const endPosition = target.selectionEnd;
    
    target.value = target.value.substring(0, startPosition)
      + markdownImage
      + target.value.substring(endPosition, target.value.lenth);
  }
}

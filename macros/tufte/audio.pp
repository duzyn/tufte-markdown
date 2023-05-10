!comment(
// Audio (Only for HTML)
// Usage: !audio(CAPTION)(FILENAME1)(FILENAME2)(FILENAME3)(FILENAME4)
// Use html5media: https://github.com/etianen/html5media
// <script src="https://cdn.jsdelivr.net/npm/html5media@1.2.1/dist/api/1.2.1/html5media.min.js"></script>
)

!define(A)(1)
!define(audio)(
!ifeq(!format)(html)(
<div>
  <label for="audio-!A" class="margin-toggle">&#8853;</label>
  <input type="checkbox" id="audio-!A" class="margin-toggle"/>
  <span class="marginnote">!1</span>
  <audio controls>
    <source src="!2">
    !ifdef(3)(<source src="!3">)
    !ifdef(4)(<source src="!4">)
    !ifdef(5)(<source src="!5">)
  </audio>
</div>
!add(A)(1)
)
)
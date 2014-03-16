jQuery ->
  $(document).ready ->
    $('ul#page-nav a').click (e) -> 
      e.preventDefault()
      target = this.hash
      $('html, body').animate { 
        scrollTop: $(target).offset().top 
      }, '300', () ->
        window.location.hash = target

jQuery ->
  $('ul#page-nav a').click (e) -> 
    e.preventDefault()
    $('ul#page-nav li').removeClass 'active'
    $(this).parent().addClass 'active'

    target = this.hash
    $('html, body').animate { 
      scrollTop: $(target).offset().top 
    }, '300', () ->
      window.location.hash = target

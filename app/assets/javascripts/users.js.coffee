jQuery ->
  $(document).ready ->
    if $('form.edit_user').length > 0
      $('input#user_gravatar').bootstrapSwitch ->

      $('ul#edit-tabs li').click (e) ->
        ckeditor = CKEDITOR.instances['edit-ta']
        prevSectionName = $('ul#edit-tabs li.active').data 'id'
        prevSectionContent = ckeditor.getData()
        $('#user_' + prevSectionName + '_section').val prevSectionContent

        $('ul#edit-tabs li').removeClass 'active'
        $(this).addClass 'active'
        sectionName = $(this).data 'id'
        content = $('#user_' + sectionName + '_section').val()
        ckeditor.setData content

      $('input#edit-submit').click (e) ->
        e.preventDefault()
        sectionName = $('ul#edit-tabs li.active').data 'id'
        sectionContent = CKEDITOR.instances['edit-ta'].getData()
        $('#user_' + sectionName + '_section').val sectionContent
        $('form.edit_user').submit()

      # Initialize
      content = $('#user_welcome_section').val()
      CKEDITOR.instances['edit-ta'].setData content

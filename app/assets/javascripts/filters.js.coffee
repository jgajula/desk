class Template
  constructor: ->
    @success_flash = Handlebars.compile $('#success_message').html()
    @error_flash = Handlebars.compile $('#error_message').html()
    @label = Handlebars.compile $('#append_label').html()

Filter = {
  load_cases : (elem) ->
    $.getScript $(elem).attr('href')
    $('#filters li.active').removeClass("active")
    $(elem).closest("li").addClass("active")
}

Label = {
  add_label : (elem) ->
    $form = $(elem).closest "form"
    $.ajax {
      type: 'POST',
      url: $form.attr 'action'
      data: "_method=put&" + $form.serialize()
      success: ->
        Label.success elem
    }

  success : (elem) ->

    $('#flash_message').html($template.success_flash {msg: "Label added successfully"})
    $(elem)
    .closest(".panel-body")
    .find(".case_labels")
    .append($template.label({label: $(elem).val()}))

    $('option:selected', elem).remove()
    $(elem).closest('.case_new_label').remove() if $(elem).children('option').length <= 1
}

$ ->
  window.$template = new Template()

  $(document).ajaxError (event, jqxhr, settings, exception) ->
    $("#flash_message").html($template.error_flash {msg: jqxhr.responseText})

  $('.filter_link').on 'click', (e)->
    e.preventDefault()
    Filter.load_cases @

  $('.case_label_select').on 'change', ->
    Label.add_label @
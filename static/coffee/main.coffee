sty = sty || {}

sty.CODE_FIELD_ID = '#code-field'
sty.POST_URL = '/'
sty.SHORTEN_FORM_ID = '#shorten-form'
sty.URL_FIELD_ID = '#url-field'


# Initialize event handlers
sty.init = ->
  $(sty.SHORTEN_FORM_ID).on 'submit', sty.onFormSubmit
  $(sty.CODE_FIELD_ID).on 'blur', sty.isValidForm
  $(sty.URL_FIELD_ID).on 'blur', sty.isValidForm


# Handle a form submission
# @param {Event} e
# @return {boolean} Whether the submit was successful or not
sty.onFormSubmit = (e) ->
  e.preventDefault()

  if (!sty.isValidForm())
    return false

  data =
    url: $(sty.SHORTEN_FORM_ID).val()
    code: $(sty.CODE_FIELD_ID).val()

  $.post sty.POST_URL, data, sty.onResponse, 'json'

  return true


# @param data {Object}
# @param textStatus {string}
# @param jqXHR {jQuery.jqXHR}
sty.onResponse = (data, textStatus, jqXHR) ->
  switch data.response
    when 'created' then


sty.isValidForm = ->
  # TODO


# Kick things off
$ sty.init
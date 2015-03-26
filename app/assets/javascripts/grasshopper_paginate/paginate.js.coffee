$ ->
  $('body').on 'click', '.pagination .goto-gap', () ->
    root = $(this).closest('.grasshopper-pagination')
    root.find('ul').addClass 'hide'
    goto = root.find 'ul.goto'
    goto.removeClass 'hide'
    gotoInput = goto.find 'input.goto-page'
    gotoInput.focus().select()
    url = gotoInput.attr 'url'
    hiddenLink = goto.find 'a.hidden-link'
    totalPage = parseInt gotoInput.attr('total')
    gotoInput.keyup (event) ->
      if event.which == 13
        newPage = parseInt(gotoInput.val()) || 1
        newPage = totalPage if newPage > totalPage
        newUrl = url.replace 'page_number', newPage
        hiddenLink.attr 'href', newUrl
        hiddenLink.click()

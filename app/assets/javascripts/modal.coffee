$(document).on "turbolinks:load", ->

  # Menu Burger
	$navbarBurgers = Array::slice.call(document.querySelectorAll('.navbar-burger'), 0)

	if $navbarBurgers.length > 0
		$navbarBurgers.forEach ($el) ->
			$el.addEventListener 'click', ->
				target = $el.dataset.target
				$target = document.getElementById(target)
				$el.classList.toggle 'is-active'
				$target.classList.toggle 'is-active'

	# Modals open/close

  getAll = (selector) ->
    Array::slice.call document.querySelectorAll(selector), 0

  $html = document.documentElement
  $modals = getAll('.modal')
  $modalButtons = getAll('.modal-button')
  $modalCloses = getAll('.modal-background, .modal-close, .modal-card-head .delete, .modal-card-foot .button')

  closeModals = ->
    $html.classList.remove 'is-clipped'
    $modals.forEach ($el) ->
      $el.classList.remove 'is-active'


	if $modalButtons.length > 0
    $modalButtons.forEach ($el) ->
      $el.addEventListener 'click', ->
        target = $el.dataset.target
        $target = document.getElementById(target)
        $html.classList.add 'is-clipped'
        $target.classList.add 'is-active'

  
	if $modalCloses.length > 0
    $modalCloses.forEach ($el) ->
      $el.addEventListener 'click', ->
        closeModals()

  
	document.addEventListener 'keydown', (event) ->
    e = event or window.event
    if e.keyCode == 27
      closeModals()
      closeDropdowns()
    return
  return
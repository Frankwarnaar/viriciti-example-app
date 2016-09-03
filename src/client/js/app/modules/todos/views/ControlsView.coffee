class LayoutView extends Marionette.LayoutView
	template: require './../templates/controls.jade'

	ui:
		removeAll: '#rm_all'
		removeDone: '#rm_done'

	events:
		'click @ui.removeAll': 'removeAll'
		'click @ui.removeDone': 'removeDone'
		'mouseover @ui.removeAll' : 'onMouseOverRemoveAll'
		'mouseout @ui.removeAll' : 'onMouseOutRemoveAll'
		'mouseover @ui.removeDone' : 'onMouseOverRemoveDone'
		'mouseout @ui.removeDone' : 'onMouseOutRemoveDone'


	removeAll: ->
		this.collection.reset()

	removeDone: ->
		this.collection.each (todo) ->
			if todo.get 'done'
				todo.destroy()

	onMouseOverRemoveAll: ->
		$('.list-item').addClass 'remove-hover'

	onMouseOutRemoveAll: ->
		$('.list-item').removeClass 'remove-hover'

	onMouseOverRemoveDone: ->
		$('.done').addClass 'remove-hover'

	onMouseOutRemoveDone: ->
		$('.done').removeClass 'remove-hover'

module.exports = LayoutView
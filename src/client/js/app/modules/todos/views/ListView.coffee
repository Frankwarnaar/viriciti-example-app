class Todo extends Marionette.ItemView
	tagName: 'li'
	className: ->
		if this.model.get('done')
			return 'list-item done'
		else 
			return 'list-item'

	template: require './../templates/listitem.jade'

	ui:
		listItem: '.list-item'
		label: '.list-item__label'
		edit: '.list-item__edit'
		remove: '.list-item__remove'

	event:
		'click': 'toggleState'
		'click @ui.remove': 'removeTodo'

	toggleState: ->
		console.log('fsfdsa')

	removeTodo: ->
		console.log 'fsaf'
		this.model.destroy

class TodoList extends Marionette.CollectionView
	tagName: 'ul'
	className: 'list list--todos'
	childView: Todo

module.exports = TodoList
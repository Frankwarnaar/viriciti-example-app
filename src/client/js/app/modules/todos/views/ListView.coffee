class Todo extends Marionette.ItemView
	tagName: 'li'
	className: 'list-item'
	template: require './../templates/listitem.jade'

class TodoList extends Marionette.CollectionView
	tagName: 'ul'
	className: 'list list--todos'
	childView: Todo

module.exports = TodoList
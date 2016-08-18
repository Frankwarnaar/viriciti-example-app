class Todo extends Marionette.LayoutView
	tagName: 'li'
	template: require './../templates/listitem.jade'

class TodoList extends Marionette.CollectionView
	tagName: 'ul'
	childView: Todo

module.exports = TodoList
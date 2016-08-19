class Todo extends Marionette.ItemView
	tagName: 'li'
	className: ->
		if this.model.get 'done'
			return 'list-item done'
		else 
			return 'list-item'

	template: require './../templates/listitem.jade'

	ui:
		label: '.list-item__label'
		edit: '.list-item__edit'
		done: '.list-item__done-mark'
		remove: '.list-item__remove'

	events:
		'click @ui.done': 'toggleState'
		'mouseover @ui.done': 'onMouseOverDone'
		'mouseout @ui.done': 'onMouseOutDone'
		'click @ui.remove': 'removeTodo'
		'mouseover @ui.remove': 'onMouseOverRemove'
		'mouseout @ui.remove': 'onMouseOutRemove'
		'dblclick @ui.label': 'editTodo'
		'keydown @ui.edit' : 'keydownEdit'
		'focusout @ui.edit': 'focusOutEdit'

	toggleState: ->
		this.model.set 'done', !this.model.get 'done'
		this.$el.toggleClass 'done'

	removeTodo: ->
		this.model.destroy()

	onMouseOverRemove: ->
		this.$el.addClass('remove-hover')

	onMouseOutRemove: ->
		this.$el.removeClass('remove-hover')

	onMouseOverDone: ->
		this.$el.addClass('done-hover')

	onMouseOutDone: ->
		this.$el.removeClass('done-hover')

	editTodo: ->
		this.$el.addClass 'edit'
		this.ui.edit.focus()

	focusOutEdit: ->
		this.$el.removeClass 'edit'

		labelText = this.ui.edit.val()

		if labelText
			this.model.set 'label', this.ui.edit.val()
			this.ui.label.val this.ui.edit.val()

		else
			this.ui.label.val this.model.get 'label'
			this.ui.edit.val this.model.get 'label'

	keydownEdit: (e) ->
		enter_key = 13
		esc_key = 27

		if e.which is enter_key
			this.focusOutEdit()
			return

		if e.which is esc_key
			this.ui.edit.val this.model.get 'label'
			this.ui.label.val this.model.get 'label'
			this.$el.removeClass 'edit'

	modelEvents:
		change: 'render'

class TodoList extends Marionette.CollectionView
	tagName: 'ul'
	className: 'list list--todos'
	childView: Todo

module.exports = TodoList
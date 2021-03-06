TodoModel = require "../models/TodoModel"

class TodosCollection extends Backbone.Collection
	url:        "todos"
	model: 	    TodoModel

	initialize: ->
		@ioBind "create", @serverCreate

	serverCreate: (todo) =>
		@add todo

		@pop() if @length > 10

module.exports = TodosCollection
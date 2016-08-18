TodoModel = require "../models/TodoModel"

class TodosCollection extends Backbone.Collection

	url:        "todos"
	model: 	    TodoModel

module.exports = TodosCollection
PersonModel = require "../models/PersonModel"

class PersonsCollection extends Backbone.Collection

	url:        "persons"
	model: 	    PersonModel
	comparator: (person) -> -person.get "timestamp"

	initialize: ({ @controls }) ->
		@ioBind "create", @serverCreate

	serverCreate: (person) =>
		@add person unless @controls.get "pause"

module.exports = PersonsCollection
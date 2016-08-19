TodosCollection = require './../collections/TodosCollection'

FormView = require('./FormView');
ListView = require('./ListView');

class LayoutView extends Marionette.LayoutView

	template: require "../templates/layout.jade"
	regions:
		form: '.form'
		list: '.list'

	initialize: ->
		todosCollection = new TodosCollection

		@formView = new FormView collection: todosCollection
		@listView = new ListView collection: todosCollection

	onBeforeShow: ->
		@getRegion('form').show @formView
		@getRegion('list').show @listView

module.exports = LayoutView
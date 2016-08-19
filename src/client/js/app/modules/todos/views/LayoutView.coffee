TodosCollection = require './../collections/TodosCollection'

FormView = require('./FormView');
ListView = require('./ListView');

class LayoutView extends Marionette.LayoutView

	template: require "../templates/layout.jade"
	regions:
		form: '.form'
		list: '.list'

	initialize: ->
		todosCollection = new TodosCollection [
			{
				done: false
				label: 'Shopping'
			}
			{
				done: true
				label: 'Drinking'
			}
		]

		@formView = new FormView
		@listView = new ListView collection: todosCollection

	onBeforeShow: ->
		@getRegion('form').show @formView
		@getRegion('list').show @listView

module.exports = LayoutView
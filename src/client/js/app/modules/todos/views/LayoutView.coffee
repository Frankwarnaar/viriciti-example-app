TodosCollection = require './../collections/TodosCollection'

FormView = require('./FormView');
ListView = require('./ListView');
ControlsView = require('./ControlsView');

class LayoutView extends Marionette.LayoutView
	template: require "../templates/layout.jade"
	regions:
		form: '.form'
		list: '.list'
		controls: '.controls'

	initialize: ->
		todosCollection = new TodosCollection

		@formView = new FormView collection: todosCollection
		@listView = new ListView collection: todosCollection
		@controlsView = new ControlsView collection: todosCollection

	onBeforeShow: ->
		@getRegion('form').show @formView
		@getRegion('list').show @listView
		@getRegion('controls').show @controlsView

module.exports = LayoutView
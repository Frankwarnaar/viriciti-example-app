class LayoutView extends Marionette.LayoutView
	tagName: 'form'
	template: require './../templates/form.jade'
	
	triggers: 
		submit: 'add:todo:item'

	modelEvents:
		change: 'render'

	ui:
		content: '#content'

module.exports = LayoutView
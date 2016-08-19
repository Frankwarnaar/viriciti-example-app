class LayoutView extends Marionette.LayoutView
	tagName: 'form'
	template: require './../templates/form.jade'

	ui:
		label: '#label'

	events:
		'submit': 'onSubmit'
		'keydown @ui.label': 'onKeyDown'

	onSubmit: (e) ->
		e.preventDefault()

		enter_key = 13

		if this.ui.label.val().trim()
			this.collection.create
				done: false
				label: this.ui.label.val()

			this.ui.label.val ''

	onKeyDown: (e) ->
		esc_key = 27

		if e.which is esc_key
			this.ui.label.val ''


module.exports = LayoutView
Session.setDefault 'currentStep', ''

Template.home.helpers
  stepIs: (step) -> step is Session.get('currentStep')

Template.home.events
  'click .main-menu-block': (e) -> Session.set 'currentStep', $(e.currentTarget).data('step')
Session.setDefault 'inMaintenance', false

Template.loginBox04.rendered = ->
  vm = new LoginViewModel04()
  ko.applyBindings vm, document.getElementById('loginBox')
  Deps.autorun ->
    vm.inMaintenance Session.get('inMaintenance')
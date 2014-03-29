Session.setDefault 'inMaintenance', false

Template.loginBox05.rendered = ->
  vm = this.data.vm
  ko.applyBindings vm, document.getElementById(this.data.boxId)
  Deps.autorun ->
    vm.inMaintenance Session.get('inMaintenance')
class LoginViewModel
  constructor: ->
    @email = ko.observable ''
    @password = ko.observable ''
    @canSignIn = ko.computed => !!@email() and !!@password()

Template.loginBox01.rendered = ->
  vm = new LoginViewModel()
  ko.applyBindings vm, document.getElementById('loginBox01')
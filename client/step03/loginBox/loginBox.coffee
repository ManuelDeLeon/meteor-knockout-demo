Template.loginBox03.rendered = ->
  vm = new LoginViewModel03()
  ko.applyBindings vm, document.getElementById('loginBox')
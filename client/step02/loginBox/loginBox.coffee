Template.loginBox02.rendered = ->
  vm = new LoginViewModel02()
  ko.applyBindings vm, document.getElementById('loginBox02')
class @LoginViewModel02
  constructor: ->
    @email = ko.observable ''
    @password = ko.observable ''
    @canSignIn = ko.computed => !!@email() and !!@password()
    @errorMessage = ko.computed =>
      if !@email()
        "Email can't be blank"
      else if !@password()
        "Password can't be blank"
      else
        ""
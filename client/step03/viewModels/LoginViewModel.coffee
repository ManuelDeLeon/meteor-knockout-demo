Session.setDefault 'loginData',
  email: ''
  password: ''

class @LoginViewModel03
  constructor: ->
    data = Session.get 'loginData'
    @email = ko.observable data.email
    @password = ko.observable data.password
    ko.computed =>
      Session.set 'loginData',
        email: @email()
        password: @password()
    @canSignIn = ko.computed => !!@email() and !!@password()
    @errorMessage = ko.computed =>
      if !@email()
        "Email can't be blank"
      else if !@password()
        "Password can't be blank"
      else
        ""
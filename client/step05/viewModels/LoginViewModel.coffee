Session.setDefault 'loginData',
  email: ''
  password: ''

class @LoginViewModel05
  constructor: ->
    data = Session.get 'loginData'
    @email = ko.observable data.email
    @password = ko.observable data.password
    ko.computed =>
      Session.set 'loginData',
        email: @email()
        password: @password()
    @inMaintenance = ko.observable false
    @canSignIn = ko.computed => !!@email() and !!@password() and not @inMaintenance()
    @errorMessage = ko.computed =>
      if @inMaintenance()
        "System is in maintenance"
      else if !@email()
        "Email can't be blank"
      else if !@password()
        "Password can't be blank"
      else
        ""

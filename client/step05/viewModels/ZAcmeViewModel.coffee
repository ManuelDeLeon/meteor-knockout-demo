endsWith = (str, suffix) -> str.indexOf(suffix, str.length - suffix.length) isnt -1

class @AcmeViewModel05 extends LoginViewModel05
  constructor: ->
    super
    superCanSignIn = @canSignIn
    @canSignIn = ko.computed => superCanSignIn() and endsWith(@email(), "@acme.inc")
    superErrorMessage = @errorMessage
    @errorMessage = ko.computed =>
      if not endsWith(@email(), "@acme.inc")
        "Must be an Acme email"
      else
        superErrorMessage()
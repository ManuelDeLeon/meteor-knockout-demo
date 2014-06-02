class React
  @id = 0
  constructor: (data) ->
    React.id++

    addFunc = (name, value, that) ->
      that[name] = value

    addProp = (name, id, value, that) ->
      that[name] = (e) ->
        if arguments.length
          console.log "changing: #{name}"
        else
          console.log "reading: #{name}"
        Session.set(id, e) if arguments.length
        Session.get(id)
      Session.setDefault id, value

    addTemp = (name, tempName, that) ->
      Template[tempName][name] = -> that[name]()

    addEvent = (name, value, tempName, that) ->
      if typeof value is 'object'
        if value.text
          evt = {}
          evt["keyup " + value.text] = -> that[name] $(value.text).val()
          evt["paste " + value.text] = -> that[name] $(value.text).val()
          console.log "event for #{value.text}"
          Template[tempName].events evt

    for p of data
      pId = React.id + "-" + p
      value = data[p]
      if value instanceof Function
        addFunc p, value, this
      else if typeof value is 'object'
        addProp p, pId, value.value, this
      else
        addProp p, pId, value, this

    @init = (tempName) =>
      for p of data
        addTemp p, tempName, @
        addEvent p, data[p], tempName, @


@vm = new React
  email:
    value: 'a'
    text: '#inputEmail'
  password:
    text: '#inputPassword'
  errorMessage: ->
    if !this.email()
      "Email can't be blank"
    else if !this.password()
      "Password can't be blank"
    else
      ""

Template.loginBox07.created = ->
  vm.init 'loginBox07'

Template.loginBox07.events
  'click #signinButton': ->
    vm.email ''
    vm.password ''
if Meteor.isClient
  describe "Meteor Knockout Demo", ->
    describe "LoginViewModel", ->
      it "can't sign in without an email", ->
        vm = new LoginViewModel05()
        vm.email ''
        chai.assert.equal vm.canSignIn(), false
      it "can't sign in without a password", ->
        vm = new LoginViewModel05()
        vm.password ''
        chai.assert.equal vm.canSignIn(), false
      it "can sign in with email and password", ->
        vm = new LoginViewModel05()
        vm.email 'a@a.com'
        vm.password '123456'
        chai.assert.equal vm.canSignIn(), true
    describe "AcmeViewModel", ->
      it "can't sign in without an acme email", ->
        vm = new AcmeViewModel05()
        vm.email 'a@a.com'
        vm.password '123456'
        chai.assert.equal vm.canSignIn(), false
      it "can sign in with an acme email", ->
        vm = new AcmeViewModel05()
        vm.email 'a@acme.inc'
        vm.password '123456'
        chai.assert.equal vm.canSignIn(), true
var module = angular.module('ngTrailApp');

var adminController = function(authService, userModel) {
  var ctrl = this;

  ctrl.isAdmin = function() {
    console.log('is Admin :' + authService.isAdmin());
    if(!authService.isAdmin()) {
      window.location = '#/error';
    }
  };
  ctrl.isAdmin();

};

module.component('adminComponent', {
  template : `
    <div class="admin">
      <h3>Admin Page</h3>

    </div>
  `,

  controller : adminController,

  bindings : {
    user : '='
  },
});

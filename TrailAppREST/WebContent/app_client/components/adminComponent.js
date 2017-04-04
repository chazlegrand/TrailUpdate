var module = angular.module('ngTrailApp');

var adminController = function(authService, adminModel) {
  var ctrl = this;

  ctrl.isAdmin = function() {
    console.log('is Admin? : ' + authService.isAdmin());
    if(!authService.isAdmin()) {
      window.location = '#/error';
    }
  };
  ctrl.isAdmin();

  ctrl.trails = [];
  ctrl.loadTrails = function() {
    adminModel.getTrails()
    .then(function(resp) {
      ctrl.trails = resp.data;
    });
  };
  ctrl.loadTrails();

  ctrl.reports = [];
  ctrl.loadReports = function() {
    adminModel.getReports()
    .then(function(resp) {
      ctrl.reports = resp.data;
    });
  };
  ctrl.loadReports();
};

module.component('adminComponent', {
  template : `
    <div class="admin">
      <h3>Admin Page</h3>
      <ul>
        <li ng-repeat="trail in $ctrl.trails | orderBy:'name'">
        <h4>{{trail.name}}</h4>
    </div>
  `,

  controller : adminController,

  bindings : {
    user : '='
  },
});

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

  ctrl.deleteReport = function(id) {
    console.log("deleting report with id: " + id);
    adminModel.deleteReport(id);
  };
};

module.component('adminComponent', {
  templateUrl : 'app_client/templates/admin.view.html',
  controller : adminController,

  bindings : {
    user : '='
  },
});

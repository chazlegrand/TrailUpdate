var app = angular.module('ngTrailApp');

app.factory('adminModel', function($http){
  var service = {};

  service.getTrails = function() {
    return $http({
      method : 'GET',
      url : 'api/admin/trails'
    });
  };

  service.getReports = function() {
    return $http({
      method : 'GET',
      url : 'api/admin/reports'
    });
  };

  service.deleteReport = function(id) {
    return $http({
      method : 'DELETE',
      url : 'api/admin/reports/'+id
    });
  };

  return service;
});

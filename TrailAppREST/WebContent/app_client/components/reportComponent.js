var module = angular.module('ngTrailApp');

var reportController = function(authService) {
  var ctrl = this;

  ctrl.user = authService.currentUser();

  ctrl.owner = function(report){
    if (ctrl.user && ctrl.user.id === report.user.id) {
      return true;
    }
    else return false;
  };
};

module.component('reportComponent', {
  template : `
      <div class="reportComponent well">
        <h4 ng-hide="$ctrl.reportQuiet">{{$ctrl.report.heading}}</h4>
        <button class="btn btn-primary btn-lg" ng-show=$ctrl.owner($ctrl.report)
                ng-click="" >Edit</button>
          <div>
          <report-form-component report=$ctrl.report >loading....</report-form-component>
          </div>
        <p ng-hide="$ctrl.reportQuiet">comment: {{$ctrl.report.comment}}</p>
        <p>Last Updated: {{$ctrl.report.timestamp | date : 'medium' : '-1200' }}</p>
        <p ng-hide="$ctrl.reportQuiet">author: {{$ctrl.report.user.firstName}} {{$ctrl.report.user.lastName}}</p>
        <div class="">
          <ul class="list-inline">
            <li ng-repeat="status in $ctrl.report.tstatuses">
              {{status.statusType }} : <span class="label label-info">{{status.name}}</span>
            </li>
          </ul>
        </div>
      </div>
    `,

  controller : reportController,

  bindings : {
    report : '=',
    reportQuiet : '='
  }
});

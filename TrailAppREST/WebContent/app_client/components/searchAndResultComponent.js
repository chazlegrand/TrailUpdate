var module = angular.module('ngTrailApp');

var searchAndResultComponentController = function() {
  var ctrl = this;

};

module.component('searchAndResultComponent', {
  template : `
    <div class="">
      <h4>form</h4>
      <search-component trails="$ctrl.trails">Loading search form...</search-component>
      <!--
      <h4>partial</h4>
      <ng-include src="'app_client/templates/search.view.html'"></ng-include>
      -->
      <h4>list</h4>
      <trails-list trails="$ctrl.trails" report-quiet="true" trail-quiet="true">Loading results...</trails-list>
    </div>
    `,

  controller : searchAndResultComponentController,

  bindings : {
    trails : '=',
    reportQuiet : '=',
    trailQuiet : '=',
  }
});

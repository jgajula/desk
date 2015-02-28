var app = angular.module("LabelApp", []);

app.controller("LabelCtrl", function($scope, $http) {

    $http.get("/labels").success(function(data){
      var new_labels = $.map(data,function(entry){
        return {"name" : entry.data.name};
      });
      $scope.labels = new_labels;
    }).error(function(){
      alert("an unexpected error occured, please try again!");
    });

  $scope.filterFunction = function(element) {
    return element.name.match(/^Ma/) ? true : false;
  };

});
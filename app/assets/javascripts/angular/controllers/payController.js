repoPhone.controller('payController', ['$scope', 'globalFactory', function($scope, globalFactory){
    $scope.payInformation = {};

    $scope.doPayment = function(){
        globalFactory.savePayment($scope.payInformation.location, function(data, error){
            window.location.href = "/cart/success";
            globalFactory.cleanCart();
        });
    }
}]);
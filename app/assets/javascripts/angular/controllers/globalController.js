repoPhone.controller('globalController', ['$scope', 'globalFactory', function($scope, globalFactory){
    $scope.cartCount = 0;
    $scope.products = [];
    $scope.total = 0;

    $scope.refreshCount = function(){
        $scope.cartCount = globalFactory.getCountCart();
    }

    $scope.addItem = function(id){
        globalFactory.addItem(id);
        $scope.refreshCount();
        Materialize.toast('Producto agregado al carrito', 1000) 
    }

    $scope.refreshCount();

    $scope.getCartItems = function(){
        globalFactory.getItems(function(data, error){
            $scope.products = data;

            for(var i=0; i < data.length; i++){
                total = data.price * data.quantity;
            }

        });
    }

    $scope.addItemCheckOut = function(id){
        globalFactory.addItem(id);
        $scope.refreshCount();
        $scope.getCartItems();
    }

    $scope.removeItemCheckOut = function(id){
        
        $scope.getCartItems();
    }
}]);
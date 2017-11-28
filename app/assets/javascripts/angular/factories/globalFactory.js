repoPhone.factory('globalFactory', ['$http', function($http){
    getCart = function(){
        var cart = [];
        if(localStorage.getItem("cart"))
            cart = JSON.parse(localStorage.getItem("cart"));

        return cart;
    }
    return {
        getCountCart: function(){
            var count = 0;
            var cart = getCart();

            for(var i=0; i < cart.length; i++){
                count+= cart[i][1];
            }
            
            return count;
        },
        addItem: function(id){
            var cart = getCart();

            var found = false;
            for(var i=0; i < cart.length; i++){
                if(cart[i][0] == id){
                    found = true;
                    cart[i][1]+=1;
                    break;
                }
            }

            if(!found){
                cart.push([id, 1]);
            }

            localStorage.setItem("cart", JSON.stringify(cart));
        },
        getItems: function(callback){
            var cart = getCart();
            $http.post('/get-smartphones.json', {listSmartphones: cart})
            .then(function (resp) {
                if (resp) {
                    callback(resp.data, null);
                } else {
                    callback(null, { message: "No result." });
                }
            }, function (error) {
                callback(null, error);
            });
        },
        removeItem: function(id){
            var cart = getCart();
            
            for(var i=0; i < cart.length; i++){
                if(cart[i][0] == id){
                    if(cart[i][1] > 1)
                        cart[i][1]-=1;
                    else
                        cart.splice(i, 1);
                    break;
                }
            }
            localStorage.setItem("cart", JSON.stringify(cart));
        },
        deleteItem: function(id){
            var cart = getCart();
            
            for(var i=0; i < cart.length; i++){
                if(cart[i][0] == id){
                    cart.splice(i, 1);
                }
            }
            localStorage.setItem("cart", JSON.stringify(cart));
        },
        savePayment: function(location, callback){
            var cart = getCart();
            $http.post('/cart/save-payment.json', {listSmartphones: cart, location: location})
            .then(function (resp) {
                if (resp) {
                    callback(resp.data, null);
                } else {
                    callback(null, { message: "No result." });
                }
            }, function (error) {
                callback(null, error);
            });
        },
        cleanCart: function(){
            localStorage.setItem("cart", JSON.stringify([]));
        }
    };
}]);
define(['app-module'], function (app) {
    app.factory('loginService',['$resource', '$q', '$location', function ($resource, $q, $location) {

        var baseUrl = $location.protocol() + "://" + $location.host() + ":8180/auth/realms/UCOSPORTS/protocol/openid-connect/token";

        return $resource(baseUrl, {}, {
            send: {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/x-www-form-urlencoded'
                }
            }
        });

    }]);

});

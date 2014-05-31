(function() {
  'use strict';

  var app = angular.module('myApp', ["rails", "ngCookies", "ngRoute"]);
  app.factory('Emotion', ['railsResourceFactory', function(railsResourceFactory) {
    return railsResourceFactory({
      url: '/emotions',
      name: 'emotion'
    });
  }]).factory('Mindset', ['railsResourceFactory', function(railsResourceFactory) {
    return railsResourceFactory({
      url: '/mindsets',
      name: 'mindset'
    });
  }]).factory('tokenInterceptor', ['$cookies', function($cookies) {
    return {
      request: function (config) {
        var token = $cookies.token;
        config.headers.Authorization = 'Basic ' + token;
        return config;
      }
    };
  }]).controller('RootController', ['$cookies', '$location', function($cookies, $location) {
    if(!$cookies.token) {
      $location.path("/login");
    } else {
      $location.path("/selection");
    }
  }]).controller('LoginController', ['$scope', '$cookies', '$location', function($scope, $cookies, $location) {
    $scope.login = function() {
      $cookies.token = window.btoa($scope.email + ":" + $scope.password);
      $location.path('/selection');
    };
  }]).controller('SelectionController', ['$scope', 'Emotion', 'Mindset', function($scope, Emotion, Mindset) {
    $scope.emotions = [];
    $scope.successSave = false;

    $scope.postEmotion = function(emotion_id) {
      $scope.successSave = false;
      var mindset = new Mindset({
        emotion_id: emotion_id
      }).create().then(function() {
        $scope.successSave = true;
      });
    };

    Emotion.query().then(function(response) {
      $scope.emotions = response;
    });
  }]).config(['$routeProvider', '$httpProvider', function($routeProvider, $httpProvider) {
    $routeProvider
    .when('/', {
      template: '',
      'controller': 'RootController'
    })
    .when('/login', {
      'templateUrl': 'login.html',
      'controller': 'LoginController'
    })
    .when('/selection', {
      'templateUrl': 'selection.html',
      'controller': 'SelectionController'
    });

    $httpProvider.interceptors.push('tokenInterceptor');
  }]);
})();


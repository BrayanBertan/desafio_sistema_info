"use strict";

var app = angular.module("Homeapp", []);

app.controller("AngularController", function ($scope, $http, $window) {
    $scope.codigo = null;
    $scope.nome = '';
    $scope.cpf = '';
    $scope.endereco = '';
    $scope.telefone = '';
    $scope.usuario = '';
    $scope.senha = '';

    $scope.verificaLogin = function () {
        $http.get('home/verificaLogin?usuario=' + $scope.usuario + '&senha=' + $scope.senha).then(function (response) {
        }).then(function successCallback(response) {
            $window.location.href = "home/home";
        }, function errorCallback(response) {
            alert('Dados incorretos!');
        });
    }

    $scope.cadastrarUsuario = function () {
        $http.post('home/cadastrarUsuario').then(function (response) {
            print(response.data);
        }).then(function successCallback(response) {
            alert(response);
        }, function errorCallback(response) {
            alert(response);
        });
    }
});
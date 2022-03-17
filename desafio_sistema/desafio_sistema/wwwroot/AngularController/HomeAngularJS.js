"use strict";

var app = angular.module("Homeapp", []);

app.controller("AngularController", function ($scope, $http, $window) {
    
    $scope.codigo = 0;
    $scope.nome = '';
    $scope.cpf = '';
    $scope.endereco = '';
    $scope.telefone = '';
    $scope.usuario = '';
    $scope.senha = '';
    $scope.mensagemRetornoCadastro = '';

    $scope.verificaLogin = function () {
        $http.get('home/verificaLogin?usuario=' + $scope.usuario + '&senha=' + $scope.senha).then(function (response) {
        }).then(function successCallback(response) {
            $window.location.href = "home/geral";
        }, function errorCallback(response) {
            alert('Dados incorretos!');
        });
    }

    $scope.cadastrarUsuario = function () {
        var data = { 'Codigo': $scope.codigo, 'Nome': $scope.nome, 'Cpf': $scope.cpf, 'Endereco': $scope.endereco, 'Telefone': $scope.telefone };
        $http.post('cadastrarUsuario', JSON.stringify(data)).then(function (response) {
            $scope.mensagemRetornoCadastro = response.data;
        }).then(function successCallback(response) {
            alert($scope.mensagemRetornoCadastro);
            $scope.limparFormularioCadastro();
            $scope.getUsuarios();
        }, function errorCallback(response) {
            alert(response.data);
        });
    }

    $scope.getUsuarios = function () {
        $http.get('getUsuarios').then(function (response) {
            $scope.usuarios = response.data;
            print($scope.usuarios);
        }).then(function successCallback(response) {
        }, function errorCallback(response) {
            alert('Erro ao buscar usuarios!');
        });
    }
    $scope.limparFormularioCadastro = function () {
        $scope.codigo = 0;
        $scope.nome = '';
        $scope.cpf = '';
        $scope.endereco = '';
        $scope.telefone = '';
    }
});
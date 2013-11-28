"use strict"
app.factory("ConfirmBox", ($dialog) ->
  show: (opts) ->
    buttons = [
      result: "YES"
      label: "Yes"
      cssClass: "ok-button"
    ,
      result: "NO"
      label: "No"
      cssClass: "cancel-button"
    ]
    dialogOpts =
      backdrop: true
      keyboard: true
      backdropClick: true
      templateUrl: "../common/message.html"
      controller: "MessageBoxController"
      resolve:
        model: ->
          title: opts.title
          message: opts.message
          buttons: buttons
          id: opts.id

    $dialog.dialog(dialogOpts).open().then (result) ->
      if result is "NO"
        opts.onNo()  if opts.onNo
      else opts.onYes()  if opts.onYes  if result is "YES"

).factory("MessageBox", ($dialog) ->
  show: (opts) ->
    buttons = [
      result: "OK"
      label: "OK"
      cssClass: "ok-button"
    ]
    dialogOpts =
      backdrop: true
      keyboard: true
      backdropClick: true
      templateUrl: "../common/message.html"
      controller: "MessageBoxController"
      resolve:
        model: ->
          title: opts.title or "Mesaj"
          message: opts.message
          buttons: buttons
          id: opts.id

    $dialog.dialog(dialogOpts).open().then (result) ->

).controller "MessageBoxController", ["$scope", "dialog", "model", ($scope, dialog, model) ->
  $scope.title = model.title
  $scope.message = model.message
  $scope.buttons = model.buttons
  $scope.id = model.id
  $scope.close = (res) ->
    dialog.close res
]
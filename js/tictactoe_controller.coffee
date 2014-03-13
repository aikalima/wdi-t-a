ttt = ttt || {}

ttt.tttApp = angular.module "tttApp", []

ttt.TicTacToeController = ($scope) ->

  win_combos = [
    [0,1,2], [3,4,5], [6,7,8],              # horizontal wins
    [0,3,6], [1,4,7], [2,5,8],              # vertical wins
    [0,4,8], [2,4,6]                        # diagonal wins
  ];

  $scope.players = [
      name: "Ernie"
      marker: "X"
      img_url: "img/ernie.jpg"
    ,
      name: "Bert"
      marker: "O"
      img_url: "img/bert.jpg"
  ]

  $scope.tiles = [
    id: 0
    active: false
    marker: ""
  ,
    id: 1
    active: false
    marker: ""
  ,
    id: 2
    active: false
    marker: ""
  ,
    id: 3
    active: false
    marker: ""
  ,
    id: 4
    active: false
    marker: ""
  ,
    id: 5
    active: false
    marker: ""
  ,
    id: 6
    active: false
    marker: ""
  ,
    id: 7
    active: false
    marker: ""
  ,
    id: 8
    active: false
    marker: ""
  ]

  $scope.turns = 0
  $scope.currentPlayer = _.first $scope.players

  $scope.handleClick = (tile) ->

    return if tile.active

    tile.active = true
    $scope.turns++
    tile.marker = $scope.currentPlayer.marker

    if $scope.isWin()
      $scope.theEnd =
        message: $scope.currentPlayer.name + " won the game!"
        img_url: $scope.currentPlayer.img_url
    else if $scope.isTie()
      $scope.theEnd =
        message: "It's a tie!"
        img_url: "img/rubberduckie.jpg"
    else
      $scope.currentPlayer = $scope.players[$scope.turns % 2]

  $scope.isTie = () ->
    $scope.turns == $scope.tiles.length

  $scope.isWin = () ->
    currentPlayerBoardData = []
    _.each $scope.tiles, (tile, i) ->
      if tile.marker == $scope.currentPlayer.marker
        currentPlayerBoardData.push i

    matchFound = false
    _.each win_combos, (combo) ->
      if _.intersection(combo, currentPlayerBoardData).length == combo.length
        # show_combo(combo);
        matchFound = true

    return matchFound

  $scope.playAgain = () ->
    window.location.href = window.location.href;

ttt.tttApp.controller 'ttt.TicTacToeController', ttt.TicTacToeController

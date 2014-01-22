play1 = undefined
play2 = undefined
question = undefined
answer = undefined
points1 = 0
points2 = 0
points3 = 0
points4 = 0
operator = "+"
max= 0
teamCount = 0

randomInt = (min, max) ->
  return Math.floor(Math.random() * (max - min + 1) + min)

getTeams = ->
  $('.startup').css('display','none')
  $('.teams').css('display','inline-block')
  $('.two').click ->
    teamCount = 2
    playGame()
  $('.three').click ->
    teamCount = 3
    playGame()
  $('.four').click ->
    teamCount = 4
    playGame() 

setUp = ->
    if operator is "+"
      play1 = randomInt(1,max/2)
      play2 = randomInt(0,max/2)
      question = "#{play1} + #{play2}"
      answer = "#{play1+play2}"
    else if operator is "-"
      play1 = randomInt(max/2+1,max)
      play2 = randomInt(0,max/2)
      question = "#{play1} - #{play2}"
      answer = "#{play1-play2}"
    $('.question').append question
    switch operator
      when "+" then operator = "-"
      when "-" then operator = "+"

showAnswer = ->
  $('.question-section').css('display', 'none')
  $('.answer').append answer
  $('.answer-section').css('display', 'inline-block')

playAgain = ->
  $('.question').text ""
  $('.answer').text ""
  setUp()
  $('.answer-section').css('display', 'none')
  $('.question-section').css('display', 'inline-block')

playGame = ->
  setUp()
  $('.teams').css('display', 'none')
  $('main').css('display', 'inline-block')
  switch teamCount
    when 3
      $('.question-section').css('width','33%')
      $('h1').css('font-size','3em')
      $('.team1').css('float','left')
      $('.team3').css('float','right')
      $('.team3').css('display','inline-block')
    when 4
      $('.question-section').css('width','25%')
      $('h1').css('font-size','3em')
      $('button').css('font-size','2em')
      $('.team1').css('float','left')
      $('.team2').css('float','left')
      $('.team3').css('display','inline-block')
      $('.team4').css('display','inline-block')
  $('.submit').click ->
    showAnswer()
  $('.up1').click ->
    points1 = points1+1
    $('.points1').text points1
  $('.down1').click ->
    points1 = points1-1 unless points1 < 1
    $('.points1').text points1
  $('.up2').click ->
    points2 = points2+1
    $('.points2').text points2
  $('.down2').click ->
    points2 = points2-1 unless points2 < 1
    $('.points2').text points2
  $('.up3').click ->
    points3 = points3+1
    $('.points3').text points3
  $('.down3').click ->
    points3 = points3-1 unless points3 < 1
    $('.points3').text points3
  $('.up4').click ->
    points4 = points4+1
    $('.points4').text points4
  $('.down4').click ->
    points4 = points4-1 unless points4 < 1
    $('.points4').text points4
  $('.play-again').click ->
    playAgain()

$ ->
  $('.easy').click ->
    max = 20
    getTeams()
  $('.hard').click ->
    max = 100
    getTeams()
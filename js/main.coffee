play1 = undefined
play2 = undefined
question = undefined
answer = undefined
points1 = 0
points2 = 0
operator = "+"
max= 0

randomInt = (min, max) ->
  return Math.floor(Math.random() * (max - min + 1) + min)

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
  $('.startup').css('display', 'none')
  $('main').css('display', 'inline-block')
  $('.submit').click ->
    showAnswer()
  $('.up1').click ->
    points1 = points1+1
    $('.points1').text points1
  $('.up2').click ->
    points2 = points2+1
    $('.points2').text points2
  $('.down1').click ->
    points1 = points1-1 unless points1 < 1
    $('.points1').text points1
  $('.down2').click ->
    points2 = points2-1 unless points2 < 1
    $('.points2').text points2
  $('.play-again').click ->
    playAgain()

$ ->
  $('.easy').click ->
    max = 20
    playGame()
  $('.hard').click ->
    max = 100
    playGame()
play1 = undefined
play2 = undefined
question = undefined
answer = undefined
points1 = 0
points2 = 0

randomInt = (min, max) ->
  return Math.floor(Math.random() * (max - min + 1) + min)

setUp = ->
    play1 = randomInt(1,10)
    play2 = randomInt(0,10)
    question = "#{play1} + #{play2}"
    answer = "#{play1+play2}"
    $('.question').append question

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

$ ->
  setUp()
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
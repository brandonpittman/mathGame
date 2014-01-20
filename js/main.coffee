randomInt = (min, max) ->
  return Math.floor(Math.random() * (max - min + 1) + min)

play1 = randomInt(1,10)
play2 = randomInt(0,10)
question = "#{play1} + #{play2}"
answer = "#{play1+play2}"

$ ->
  $('.question').append question
  $('.submit').click ->
    $('.question-section').css('display', 'none')
    $('.answer').append answer
    $('.answer-section').css('display', 'inline-block')
  $('.play-again').click ->
    document.location.reload(true)
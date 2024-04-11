puts "limpando base de dados..."
Instrument.destroy_all
User.destroy_all

puts "criando instrumentos com suas respectivas perguntas e opções de respostas..."

20.times do |i|
  instrument = Instrument.create!(title: "Instrumento #{i}")

  5.times do |j|
    question = Question.create!(description: "Questão #{j}", instrument: instrument)

    ['A', 'B', 'C', 'D'].each do |option|
      Answer.create!(description: option, question: question)
    end
  end
end

puts "#{Instrument.count} instrumentos criados!"

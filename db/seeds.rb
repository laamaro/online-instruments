puts "limpando base de dados..."
Instrument.destroy_all
User.destroy_all

puts "criando instrumentos com suas respectivas perguntas e opções de respostas..."

20.times do |i|
  instrument = Instrument.create!(title: "Instrumento #{i + 1}")

  5.times do |j|
    question = Question.create!(description: "Questão #{j + 1}", instrument: instrument)

    ['A', 'B', 'C', 'D'].each_with_index do |option, index|
      score = case index
              when 0 then 3
              when 1 then 2
              when 2 then 1
              when 3 then 0
              end

      Answer.create!(description: option,
                     question: question,
                     position: index + 1,
                     score: score)
    end
  end
end

puts "#{Instrument.count} instrumentos criados!"

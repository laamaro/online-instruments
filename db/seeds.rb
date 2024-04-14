puts "limpando base de dados..."
Instrument.destroy_all
User.destroy_all

# ------- Criação de Instrumentos, Perguntas e Respostas
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

# --------------- Criação de dois psicólogos
puts "criando dois psicólogos como usuários..."

joao = User.create!(email: 'joao@psicologo.com',
                    password: '123123',
                    first_name: 'João',
                    last_name: 'Silva',
                    role: 0)

maria = User.create!(email: 'maria@psicologa.com',
                     password: '123123',
                     first_name: 'Maria',
                     last_name: 'Santos',
                     role: 0)

puts "#{joao.first_name} e #{maria.first_name} foram criados!"

# ------------------ Criando um paciente
puts "criando um paciente..."

paula = User.create!(email: 'paula@paciente.com',
                     password: '123123',
                     first_name: 'Paula',
                     last_name: 'Mendes',
                     role: 1,
                     registration_number: '00000000123',
                     birth_date: '12/8/1987'.to_date)

puts "#{paula.first_name} foi criada!"

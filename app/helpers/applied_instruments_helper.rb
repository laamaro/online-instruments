module AppliedInstrumentsHelper
  def translate_status(status)
    if status == 'pending'
      'Pendente'
    elsif status == 'finished'
      'Finalizado'
    end
  end
end

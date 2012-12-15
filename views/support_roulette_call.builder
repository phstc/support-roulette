xml.instruct! :xml, :version => "1.1"
xml.Response do
  xml.Dial callerId: @ranger.phone do
    xml.Number @ranger.phone
    xml.Pause length: 10
  end
  xml.Say "Transfering to #{@ranger.name}"
end


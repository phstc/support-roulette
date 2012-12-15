xml.instruct! :xml, :version => "1.1"
xml.Response do
  xml.Say "Welcome to Support Roulette! Please wait a minute while we transter your call to #{@ranger.name}", voice: "woman"
  xml.Dial callerId: @ranger.phone do
    xml.Number @ranger.phone
  end
end


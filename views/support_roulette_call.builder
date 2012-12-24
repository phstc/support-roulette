xml.instruct! :xml, :version => "1.1"
xml.Response do
  xml.Say "Welcome to Support Roulette! Please wait a minute while we transter your call to #{@agent.name}", 
    voice: "woman"
  xml.Dial do
    xml.Number @agent.phone
  end
end


def pinn_slumpare()
  return rand(10..18)
end

def start_slumpare(namn_1, namn_2)
  tal_1 = 0
  tal_2 = 1
  if rand(tal_1..tal_2) == tal_1
      return namn_1
  else 
      return namn_2   
  end
end

def byt_spelande(spelande, spelare_1, spelare_2)
  if spelande == spelare_1
      return spelare_2
  else
      return spelare_1
  end
end

def spelet(börjare, pinnar, spelare_1, spelare_2)
  puts "Spelet sker med #{pinnar} pinnar"
  spelande = börjare
  while pinnar > 1 
      puts spelande + ", var god välj hur många pinnar mellan 1-3 som ska plockas!" 
      bortplockade = gets.chomp.to_i
      if bortplockade <= 3 && bortplockade >= 1
          pinnar -= bortplockade
          puts "Det är nu #{pinnar} pinnar kvar"
      else
          #Byt inte spelare när detta sker!!!
          error_bortplock = "Felaktig input, skriv in siffra mellan 1-3!"
          puts error_bortplock
      end
      spelande = byt_spelande(spelande, spelare_1, spelare_2)
  end
  puts "Grattis #{spelande} du vann!"
end

def main()
  #Härifrån går man till alla hjälpfunktioner 
  #Här ska även själva spelet ske
  puts "Skriv in namnet på spelare 1"
  spelare_1 = gets.chomp
  puts "Skriv in namnet på spelare 2"
  spelare_2 = gets.chomp

  pinnar = pinn_slumpare()
  börjare = start_slumpare(spelare_1, spelare_2)

  spelet(börjare, pinnar, spelare_1, spelare_2)
  
end

#Startmeny 
def startmeny()
  #Problem med input. Nu kan man skriva in 1dyuavfuyaufg och gå in i spela
  #hej välkommen skriv in namn pls"
  puts "\nVälkommen till spelet Nim!"
  puts "-----------------------------"
  puts "För att spela, var god skriv in 1"
  puts "För att lära sig om spelet, var god skriv in 2"
  puts "För att donera till vår paypal, tryck 3!"
  puts "För att avsluta, tryck 4"
  user_input = gets.chomp.to_i
  if user_input == 1
      main()
  elsif user_input == 2
      spelet()
  elsif user_input == 3
      skaparna()
  elsif user_input == 4
      return 
  else 
      error = "Felaktig input, skriv in en siffra mellan 1-3!"
      puts error
  end
  #Visar info om spelet (om spelarna vill veta)
  startmeny()
end

startmeny()
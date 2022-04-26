#Detta program låter en eller två anvådare spela spelet nim. Spelet körs inom en input-loop där anvåndarna/användaren förväntas skriva in hur många pinnar de vill dra(mellan 1-3). Innan det ska spelarna ha skrivit in sina namn eller valt att spela mot en dator. Programmet skickar hela tiden ut antalet pinnar som är kvar och spelet avslutas när en person är tvungen att dra/medvetet drar sista pinnen. 

#Göra nästa lektion: 
#Dokumentera en funktion

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

def algoritm(pinnar) 
  dåliga = [1, 5, 9, 13, 17]
  i = 0
  while i < (dåliga.length-1)
    if pinnar - 1 == dåliga[i] 
      return 1
    elsif pinnar - 2 == dåliga[i]
      return 2
    elsif pinnar - 3 == dåliga[i]
      return 3
    end
    i += 1
  end
  return rand(1..3)
end

def spelet(börjare, pinnar, spelare_1, spelare_2)
  puts "Spelet sker med #{pinnar} pinnar"
  spelande = börjare
  while pinnar >= 1 
    if spelande == "dator"
      bortplockade = algoritm(pinnar)
      puts "datorn plockar "
    else
      puts spelande + ", var god välj hur många pinnar mellan 1-3 som ska plockas!" 
      bortplockade = gets.chomp.to_i
    end

    if bortplockade <= 3 && bortplockade >= 1
      pinnar -= bortplockade
      if pinnar > 0
        puts "Det är nu #{pinnar} pinnar kvar"
      end
      spelande = byt_spelande(spelande, spelare_1, spelare_2)
    else
      #Byt inte spelare när detta sker!!!
      error_bortplock = "Felaktig input, skriv in siffra mellan 1-3!"
      puts error_bortplock
    end
  end
  puts "\n Grattis #{spelande} du vann! \n"
end

def om_spelet()
  puts "Spelet bygger på att man börjar med ett antal pinnar, \n varefter man turas om att plocka bort 1-3 pinner. \n Målet är att inte vara den som plockar bort sista pinnen"
end

def onlyfans()
  system("start https://www.reddit.com/r/jakobwidebrant/comments/nh7rq3/jakob_widebrant/")
end

def main()
  #Härifrån går man till alla hjälpfunktioner 
  #Här ska även själva spelet ske
  puts "Skriv in namnet på spelare 1"
  spelare_1 = gets.chomp
  puts "Skriv in namnet på spelare 2, skriv 'dator' om du vill spela mot en dator "
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
  puts "----------------------------- "
  puts "För att spela, var god skriv in 1"
  puts "För att lära sig om spelet, var god skriv in 2"
  puts "För att komma till våran onlyfans, tryck 3!"
  puts "För att avsluta, tryck 4"
  user_input = gets.chomp.to_i
  if user_input == 1
      main()
  elsif user_input == 2
      om_spelet()
  elsif user_input == 3
      onlyfans()
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
# thp_s2_j4


Des fois quand ton code va sortir une erreur, tu peux lui dire, "hey ne plante pas, et à la place fais plutôt ceci". Voici les lignes pour faire ceci en Ruby :

'''ruby
begin
  do_something() #partie de code qui risque de produire une erreur
rescue => e
  puts "Oups petite erreur, mais c'est pas grave" #résultat que tu veux voir en lieu et place d'une erreur terminal
end
'''
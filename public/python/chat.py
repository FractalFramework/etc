#!/usr/bin/python
# -*- coding: latin-1 -*-
import socket
Discuter = socket.socket(socket.AF_INET,socket.SOCK_STREAM)
Hote = '127.0.0.1'
Port = 80
Port_de_reponse = 234
Discuter.connect((Hote,Port))       # Se connecte au programme ecoute.py
 
Reponse = socket.socket(socket.AF_INET,socket.SOCK_STREAM)
Reponse.bind((Hote,Port_de_reponse))
Reponse.listen(1)
client, adresse = Reponse.accept() # Creation du connecteur pour la reponse de ecoute.py
print ("L'adresse",adresse," vous a entendu et attend votre message.")
while 1:
        #msg = raw_input('>> ') # votre message ? 
        msg = bytes(input('>> '), 'mac_roman') #Python 3
        Discuter.send(msg)
        print ("Attente de la reponse...")
        #reponseaumessage = client.recv(255) # reception de la reponse, 255 caracteres max
        reponseaumessage = str(client.recv(255),'mac_roman') #Python 3
        if not reponseaumessage:
                break
        print ("\n",adresse,":",reponseaumessage,"\a\n") # affiche la reponse
 
client.close() # ferme la connexion lorsque le client quitte.
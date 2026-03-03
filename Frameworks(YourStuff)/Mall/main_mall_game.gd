extends Game

const all_players = ['drums', 'bass', 'piano', 'pisser']
var needed_players = []
var current_players = []

func _start_game():  
	for i in clamp(roundi(get_intensity()),0,all_players.size()): #the more intense it is the more people get selected
		needed_players += [all_players.pick_random()]#this function is automatically called when the scene transitions in

func _on_timer_timeout() -> void: end_game.emit((needed_players == current_players)) #okay dont follow this formating, i just did this cus it was funny its weird formatting

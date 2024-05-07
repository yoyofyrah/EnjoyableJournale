extends Control

func _on_save_pressed(): # saves the journal
	get_node("selectFolder").show()

func _on_select_folder_file_selected(path):
	var entry = PackedStringArray([
	get_node("describe").text,
	get_node("process").text,
	get_node("evaluate").text,
	get_node("analyze").text,
	get_node("conclude").text,
	get_node("plan").text
])
	var content =" ".join(entry)
	print("User entered:", content)
	var file = FileAccess.open(path, FileAccess.WRITE)
	file.store_string(content)

# func _on_load_pressed(): # loads the journal. unpack the variables to assign to nodes.
	# var describe_text = get_node("describe")
	# var user_text = describe_text.text
	# var file = FileAccess.open("user://journal.dat", FileAccess.READ)
	# file.store_string(entry)
	
func _hide_other_nodes(active_node_name):
		var overflow = ["describe", "process", "evaluate", "analyze", "conclude", "plan"]
		for node_name in overflow:
			if node_name != active_node_name:
				get_node(node_name).set_visible(false)

func _show_other_nodes(active_node_name):
		var overflow = ["describe", "process", "evaluate", "analyze", "conclude", "plan"]
		for node_name in overflow:
			if node_name != active_node_name:
				get_node(node_name).set_visible(true)

func _on_describe_focus_entered():
	_hide_other_nodes("describe")

func _on_describe_mouse_exited(): # describe all lines visible
	_show_other_nodes("describe")

func _on_process_focus_entered():
	_hide_other_nodes("process")

#func _on_process_mouse_entered(): # process line visible
	#_hide_other_nodes("process")

func _on_process_mouse_exited(): # process all lines visible
	_show_other_nodes("process")

#func _on_evaluate_mouse_entered(): # evaluate line visible
	#_hide_other_nodes("evaluate")
	
func _on_evaluate_focus_entered():
	_hide_other_nodes("evaluate")

func _on_evaluate_mouse_exited(): # eavluate all lines visible
	_show_other_nodes("evaluate")
	
func _on_analyze_focus_entered():
	_hide_other_nodes("analyze")

#func _on_analyze_mouse_entered(): # analyze line visible
	#_hide_other_nodes("analyze")

func _on_analyze_mouse_exited(): # analyze all lines visible
	_show_other_nodes("analyze")

func _on_conclude_focus_entered():
	_hide_other_nodes("conclude")

#func _on_conclude_mouse_entered(): # conclude line visible
	#_hide_other_nodes("conclude")

func _on_conclude_mouse_exited(): # conclude all lines visible
	_show_other_nodes("conclude")

func _on_plan_focus_entered():
	_hide_other_nodes("plan")

#func _on_plan_mouse_entered(): # plan line visible
	#_hide_other_nodes("plan")

func _on_plan_mouse_exited(): # plan all lines visible
	_show_other_nodes("plan")


vim9script

def myFunction(): string
	var innerVar: string = 'a string'
	return innerVar
enddef

export def ExportedFunction(): list<number>
	return def FnThatReturnsOne(): number
		return 1
		enddef
enddef

# g: is required for it to be a global def or var, otherwise script-local
var g:scriptLevelVar = 'string here'

# const makes both variable and value unchangeable
const constVar = 'string for a const var'

# final makes only the variable const, the value can be changed.
# const in ALL_CAPS is not required, just stylistic choice.
# final myList = [1, 2]
# myList = [3, 4] # Error!
# myList[0] = 9  # OK
final finalVar = 'string for a "final" var'

# space around = is required, we'll assume 1 or more [ \t]
var script_scope_var = 123 # 1+ space required for trailing comment

# no export, no ':' and no return type, accessing script level var
# from inside a function and, and assigning to function scope var.
def ScriptVar()
	var func_scope_var = script_scope_var
	return
enddef

# unpacking values from a list examples, '; _' syntax remains ignore rest,
# and '_' is used to ignore a list item
var [first_unpacked_var: list<number>, _, third_unpacked_var; _] = ReturnSomeValues()

# example of taking variable arguments
def VariableArgsFunc(...itemlist: list<any>)
	for item in itemlist
		# do stuff
	endfor
enddef

# example using default values
def DefaultArgFunc(one = 'one', last = 'last')
	# do stuff
enddef
# call: DefaultArgFunc(v:none, 'last var set to this string')
# v:none will trigger using 'one' for one argument, the default value.

# example global function, g: is required, otherwise it's script-local
# capital first letter required.
def g:GlobalFunc()
	# do stuff
enddef


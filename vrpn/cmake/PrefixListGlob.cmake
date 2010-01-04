# - For each given prefix in a list, glob using the prefix+pattern
#
#
# Original Author:
# 2009-2010 Ryan Pavlik <rpavlik@iastate.edu> <abiryan@ryand.net>
# http://academic.cleardefinition.com
# Iowa State University HCI Graduate Program/VRAC

function(prefix_list_glob var pattern)
	set(_out)
	set(_result)
	foreach(prefix ${ARGN})
		file(GLOB _globbed ${prefix}${pattern})
		if(_globbed)
			list(SORT _globbed)
			list(REVERSE _globbed)
		endif()
		list(APPEND _out ${_globbed})
	endforeach()
	foreach(_name "${_out}")
		get_filename_component(_name "${_name}" ABSOLUTE)
		list(APPEND _result "${_name}")
	endforeach()

	set(${var} "${_result}" PARENT_SCOPE)
endfunction()

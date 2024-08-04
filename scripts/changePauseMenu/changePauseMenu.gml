///@desc Change the DS Map key entry by the move value passed
///@_move	real	Which way to move the selection
///@_key	string	ds_map key for this selection
function changePauseMenu(_move, _key){
	// Get the allowed limit for this selection
	
	// Get map array
	var _mapArray = SET[? _key]
	
	// Get limit array
	var _limitArray = _mapArray[1]
	
	// Integer?
	if is_real(_limitArray[0]) {
		var _min = _limitArray[0]
		var _max = _limitArray[1]
	} else {
		var _min = 0
		var _max = array_length(_limitArray) - 1
	}
	
	// Move the selection
	_mapArray[@ 0] = clamp(_mapArray[0] + _move, _min, _max)
	
	return _mapArray[@ 0] / 100
}
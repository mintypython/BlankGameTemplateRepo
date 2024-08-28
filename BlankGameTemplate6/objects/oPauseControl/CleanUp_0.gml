// Destroy surfaces/systems when game is closed
if (surface_exists(pauseSurf)) surface_free(pauseSurf)
if (buffer_exists(pauseSurfBuffer)) buffer_delete(pauseSurfBuffer)

// Clear DS map
ds_map_destroy(SET)
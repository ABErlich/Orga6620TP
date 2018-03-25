#ifndef __FILE__
#define __FILE__
/**
 * Preconditions:
 *  - path must exist
 *  - name must exist
 *  - mp must exist
 *  - rows > 0
 *  - columns > 0
 */
void save_with_format_PGM(char* path, char* name, short **mp, int rows, int columns);


#endif // __FILE__



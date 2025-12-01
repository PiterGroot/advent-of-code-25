package main
import "core:fmt"
import "core:os"
import "core:strings"

main :: proc() 
{
    fmt.println("This is Day 1, Part 1.")
    
    data, succes := os.read_entire_file("example_input.txt", context.allocator);
	
	if !succes 
	{
		fmt.printfln("Could not read text file!");
		return
	}

	defer delete(data, context.allocator);

	currentDialValue : int = 50
	lines := strings.split_lines(string(data));

	for character in lines 
	{
			if character[0] == 'L'
			{
				fmt.println("left ")
			}
			else
			{
				fmt.println("right")
			}
	}

	for	i:= 0; i < len(lines); i+=1
	{

	}
}
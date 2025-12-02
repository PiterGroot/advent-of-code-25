package main
import "core:fmt"
import "core:os"
import "core:strings"
import "core:strconv"

main :: proc() 
{
    fmt.println("AdventOfCode25 | Day 1, part 1")
    
    data, succes := os.read_entire_file("input.txt", context.allocator);
	
	if !succes 
	{
		fmt.printfln("Could not read text file!");
		return
	}

	defer delete(data, context.allocator);

	currentDialValue:int = 50
	finalResult:int = 0

	lines := strings.split_lines(string(data));

 	for str in lines 
	{
        first_char := str[0:1]
        rest := str[1:]
        number, ok := strconv.parse_int(rest)
		
		if(first_char[0] == 'L')
		{
			currentDialValue -= number;
			if(currentDialValue < 0) do currentDialValue = abs(abs(currentDialValue) - 100);
		}
		else
		{
			currentDialValue += number;
			if(currentDialValue > 99) do currentDialValue -= 100;
		}

		if(currentDialValue == 0) do finalResult+=1;

        fmt.printf("%s -> first: %s, number: %d, current dial value: %i\n", str, first_char, number, currentDialValue);
    }
	
	fmt.printf("\nresult is: %i\n", finalResult)
}